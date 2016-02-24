<?php

include_once 'sessionController.php';

class departamento extends controller {

    public function index_action($pagina = 1) {

        $session = new session();
        $session->sessao_valida();
        $_SESSION['pagina'] = $pagina;
        $this->smarty->assign('paginador', $this->mostraGrid());
        $this->smarty->assign('title', 'Departamentos');
        $this->smarty->display('departamento/index.tpl');
    }

    public function paginacao() {
        $this->index_action($this->getParam('pagina'));
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
        $model = new model();
        $qry_limitada = $model->readSQL("SELECT * FROM departamento WHERE stat<>0 LIMIT $inicio,$total_reg");
        $this->smarty->assign('listdepartamento', $qry_limitada);

        // Total de Registros na tabela    
        $qry_total = $model->readSQL("SELECT count(*)as total FROM departamento WHERE stat<>0");
        $total_registros = $qry_total[0]['total']; //pega o valor
        $html = $this->paginador($pc, $total_registros, 'departamento');
        return $html;
    }

    public function insert() {
        $this->smarty->assign('title', 'Novo Departamento');
        $this->smarty->display('departamento/insert.tpl');
    }

    public function save() {
        $modelDepartamento = new departamentoModel();
        $dados['des_departamento'] = $_POST['des_departamento'];
        $modelDepartamento->setDepartamento($dados);
        header('Location: /departamento');
    }

    public function update() {
        $id = $this->getParam('id_departamento');
        $modelDepartamento = new departamentoModel();
        $dados['id_departamento'] = $id;
        $dados['des_departamento'] = $_POST['des_departamento'];
        $modelDepartamento->updDepartamento($dados);
        header('Location: /departamento');
    }

    public function edit() {
        $id = $this->getParam('id_departamento');
        $modelDepartamento = new departamentoModel();
        $resDepartamento = $modelDepartamento->getDepartamento('id_departamento=' . $id);
        $this->smarty->assign('registro', $resDepartamento[0]);
        $this->smarty->assign('title', 'Atualizar Departamento');
        $this->smarty->display('departamento/update.tpl');
    }

    public function delete() {
        $id = $this->getParam('id_departamento');
        $modelDepartamento = new departamentoModel();
        $dados['id_departamento'] = $id;
        $modelDepartamento->delDepartamento($dados);
        $modelDepartamento->updDepartamento($dados);
        header('Location: /departamento');
    }

}

?>
