<?php

include_once 'sessionController.php';

class cidade extends controller {

    public function index_action($pagina = 1) {

        $session = new session();
        $session->sessao_valida();

        $_SESSION['pagina'] = $pagina;
        //list all records
        $cidade_model = new cidadeModel();
        //send the records to template sytem
        $this->smarty->assign('title', 'Cidades');
        $this->smarty->assign('paginador', $this->mostraGrid());
        //call the smarty
        $this->smarty->display('cidade/index.tpl');
    }    

    public function paginacao() {
        $this->index_action($this->getParam('pagina'));
    }
    
    public function insert() {
        $estado_model = new estadoModel();
        $estado_res = $estado_model->getEstado('stat<>0');
        $this->smarty->assign('title', 'Nova Cidade');
        $this->smarty->assign('estado', $estado_res);
        $this->smarty->display('cidade/insert.tpl');
    }

    public function save() {
        $modelCidade = new cidadeModel();
        $dados['des_cidade'] = $_POST['des_cidade'];
        $dados['id_estado'] = $_POST['id_estado'];
        $modelCidade->setCidade($dados);

        header('Location: /cidade');
    }

    public function update() {
        $id = $this->getParam('id_cidade');

        $modelCidade = new cidadeModel();
        $dados['id_cidade'] = $id;
        $dados['des_cidade'] = $_POST['des_cidade'];
        $dados['id_estado'] = $_POST['id_estado'];
        $modelCidade->updCidade($dados);

        header('Location: /cidade');
    }

    public function edit() {

        //die();
        $id = $this->getParam('id_cidade');
        $modelCidade = new cidadeModel();
        $resCidade = $modelCidade->getCidade('id_cidade=' . $id);
        $estado_model = new estadoModel();
        $estado_res = $estado_model->getEstado('stat<>0');
        $this->smarty->assign('registro', $resCidade[0]);
        $this->smarty->assign('estado', $estado_res);
        $this->smarty->assign('id_choosen', $resCidade[0]['id_estado']);
        $this->smarty->assign('title', 'Atualizar Cidade');
        //call the smarty
        $this->smarty->display('cidade/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_cidade');
        $modelCidade = new cidadeModel();
        $dados['id_cidade'] = $id;
        $dados['stat'] = 0;
        $modelCidade->updCidade($dados);


        header('Location: /cidade');
    }

    public function mostraGrid() {
        $total_reg = "10"; // número de registros por página
        $pagina = $_SESSION['pagina'];

        if (!$pagina) {
            $pc = "1";
        } else {
            $pc = $pagina;
        }
        $inicio = $pc - 1;
        $inicio = $inicio * $total_reg;
        //Busca os registros para o Grid
        $cidadeModel = new cidadeModel();
        $qry_limitada = $cidadeModel->getCidadeEstado("SELECT id_cidade,des_cidade,e.id_estado,des_estado FROM cidade c inner join estado e on (c.id_estado=e.id_estado AND c.stat<>0) LIMIT $inicio,$total_reg");
        $this->smarty->assign('listcidade', $qry_limitada);

        // Total de Registros na tabela    
        $qry_total = $cidadeModel->readSQL("SELECT count(*)as total FROM cidade WHERE stat<>0");
        $total_registros = $qry_total[0]['total']; //pega o valor
        $html = $this->paginador($pc, $total_registros, 'cidade');
        return $html;
    }

}

?>
