<?php

class estado extends controller {

    public function index_action() {

        //list all records
        $model_colors = new estadoModel();
        $estado_res = $model_colors->getEstado('active<>0'); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listestado', $estado_res);
        $this->smarty->assign('title', 'Estados');
        //call the smarty
        $this->smarty->display('estado/index.tpl');
    }

    public function add() {
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
        $id = $this->getParam('id');
        
        $modelEstado = new estadoModel();
        $dados['id_estado'] = $id;
        $dados['des_estado'] = $_POST['des_estado'];
        $modelEstado->updEstado($dados);

        header('Location: /estado');
    }

    public function edit() {
       
        //die();
        $id = $this->getParam('id');
        $modelEstado = new estadoModel();
        $resEstado = $modelEstado->getEstado('id_estado=' . $id);
        $this->smarty->assign('registro', $resEstado[0]);
        $this->smarty->assign('title', 'Atualizar Estado');
        //call the smarty
        $this->smarty->display('estado/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id');
        $modelEstado = new estadoModel();
        $dados['id'] = $id;
        $modelEstado->delColor($dados);

        header('Location: /estado');
    }

}

?>
