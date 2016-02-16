<?php

class cliente extends controller {

    public function index_action() {

        //list all records
        $model_cliente = new clienteModel();
        $clientes = $model_cliente->getCliente('active<>0'); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listcliente', $clientes);
        $this->smarty->assign('title', 'Colors');
        //call the smarty
        $this->smarty->display('cliente/index.tpl');
    }

    public function add() {
        $this->smarty->assign('title', 'New Color');
        $this->smarty->display('color/new.tpl');
    }

    public function save() {
        $model_cliente = new clienteModel();
        $dados['name'] = $_POST['name'];
        $dados['created'] = date("Y-m-d H:i:s");
        $dados['active'] = 1;
        $model_cliente->setCliente($dados);

        header('Location: /cliente');
    }

    public function update() {
        $id = $this->getParam('id');

        $model_cliente = new clienteModel();
        $dados['id'] = $id;
        $dados['name'] = $_POST['name'];
        $dados['created'] = $_POST['created'];
        $dados['active'] = $_POST['active'];
        $modelcolor->updColor($dados);

        header('Location: /color');
    }

    public function detalhes() {
        $id = $this->getParam('id');
        $model_cliente = new clienteModel();
        $rescolor = $modelcolor->getColor('id=' . $id);
        $this->smarty->assign('registro', $rescolor[0]);
        $this->smarty->assign('title', 'Colors Details');
        //call the smarty
        $this->smarty->display('color/detail.tpl');
    }

    public function edit() {
       
        //die();
        $id = $this->getParam('id');
        $model_cliente = new clienteModel();
        $rescliente = $model_cliente->getColor('id=' . $id);
        $this->smarty->assign('registro', $rescliente[0]);
        $this->smarty->assign('title', 'Colors Details');
        //call the smarty
        $this->smarty->display('color/edit.tpl');
    }

    public function delete() {

        $id = $this->getParam('id');
        $model_cliente = new clienteModel();
        $dados['id'] = $id;
        $modelcolor->delColor($dados);

        header('Location: /color');
    }

}

?>
