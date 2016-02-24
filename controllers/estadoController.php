<?php

include_once 'sessionController.php';

class estado extends controller {

    public function index_action($pagina = 1) {

        $session = new session();
        $session->sessao_valida();
        
        $_SESSION['pagina'] = $pagina;
        $this->smarty->assign('paginador', $this->mostraGrid());
        $this->smarty->assign('title', 'Estados');
        //call the smarty
        $this->smarty->display('estado/index.tpl');
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
        
        
        //list all records
        $estado_model = new estadoModel();
        $model = new model();
        $qry_limitada = $estado_model->getEstado('stat<>0', $inicio.','.$total_reg); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listestado', $qry_limitada);

        // Total de Registros na tabela    
        $qry_total = $model->readSQL("SELECT count(*)as total FROM estado WHERE stat<>0");
        $total_registros = $qry_total[0]['total']; //pega o valor
        $html = $this->paginador($pc, $total_registros, 'estado');
        return $html;
    }
    
    public function paginacao() {
        $this->index_action($this->getParam('pagina'));
    }

    public function insert() {
        $this->smarty->assign('title', 'Novo Estado');
        $this->smarty->display('estado/insert.tpl');
    }

    public function save() {
        $modelEstado = new estadoModel();
        $dados['des_estado'] = $_POST['des_estado'];
        $modelEstado->setEstado($dados);

        header('Location: /estado');
    }

    public function update() {
        $id = $this->getParam('id_estado');

        $modelEstado = new estadoModel();
        $dados['id_estado'] = $id;
        $dados['des_estado'] = $_POST['des_estado'];
        $modelEstado->updEstado($dados);

        header('Location: /estado');
    }

    public function edit() {


        //die();
        $id = $this->getParam('id_estado');
        $modelEstado = new estadoModel();
        $resEstado = $modelEstado->getEstado('id_estado=' . $id);
        $this->smarty->assign('registro', $resEstado[0]);
        $this->smarty->assign('title', 'Atualizar Estado');
        //call the smarty
        $this->smarty->display('estado/update.tpl');
    }

    public function delete() {
        
        $id = $this->getParam('id_estado');
        $modelEstado = new estadoModel();
        $dados['id_estado'] = $id;
        $dados['stat'] = 0;
        $modelEstado->updEstado($dados);

        
        header('Location: /estado');
    }

}

?>
