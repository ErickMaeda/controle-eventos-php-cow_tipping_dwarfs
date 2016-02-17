<?php

class cliente extends controller {

    public function index_action() {

        //list all records
        $model_cliente = new clienteModel();
        $clientes = $model_cliente->getCliente("10"); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listcliente', $clientes);
        $this->smarty->assign('title', 'Clientes');
        //call the smarty
        $this->smarty->display('cliente/index.tpl');
    }

    public function insert() {
        $this->smarty->assign('title', 'Novo Cliente');
        $this->smarty->display('cliente/insert.tpl');
    }

    public function save() {
        $model_cliente = new clienteModel();
        $cliente['nome_cliente'] = $_POST['nome_cliente'];
        $cliente['codigo_uc'] = $_POST['codigo_uc'];
        $cliente['codigo_nis'] = $_POST['codigo_nis'];
        $cliente['cpf_cliente'] = $_POST['cpf_cliente'];
        $cliente['rg_cliente'] = $_POST['rg_cliente'];
        $cliente['dt_cadastro'] = date("Y-m-d H:i:s");
        $id_cliente = $model_cliente->setCliente($cliente);

        $clienteEndereco[$id_cliente];
        $clienteEndereco[$_POST['id_cidade'] == 0 ? null : $_POST['id_cidade']];
        $clienteEndereco[$_POST['id_estado'] == 0 ? null : $_POST['id_estado']];
        $clienteEndereco[strlen($_POST['rua_cliente']) == 0 ? null : $_POST['rua_cliente']];
        $clienteEndereco[strlen($_POST['bairro_cliente']) == 0 ? null : $_POST['bairro_cliente']];
        $clienteEndereco[strlen($_POST['numero_cliente']) == 0 ? null : $_POST['numero_cliente']];
        if ($clienteEndereco['id_cidade'] != null ||
                $clienteEndereco['id_estado'] != null ||
                $clienteEndereco['rua_cliente'] != null ||
                $clienteEndereco['bairro_cliente'] != null ||
                $clienteEndereco['numero_cliente'] != null) {

            $model_cliente->setClienteEndereco($cliente);
        }

        header('Location: /cliente');
    }

    public function update() {
        $id = $this->getParam('id_cliente');

        $model_cliente = new clienteModel();
        $dados['id_cliente'] = $id;
        $dados['name'] = $_POST['name'];
        $dados['created'] = $_POST['created'];
        $dados['active'] = $_POST['active'];
        $modelcolor->updColor($dados);

        header('Location: /color');
    }

    public function detalhes() {
        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $rescolor = $modelcolor->getColor('id_cliente=' . $id);
        $this->smarty->assign('registro', $rescolor[0]);
        $this->smarty->assign('title', 'Colors Details');
        //call the smarty
        $this->smarty->display('color/detail.tpl');
    }

    public function edit() {

        //die();
        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $rescliente = $model_cliente->getCliente('id_cliente=' . $id);
        $this->smarty->assign('registro', $rescliente[0]);
        $this->smarty->assign('title', 'Colors Details');
        //call the smarty
        $this->smarty->display('color/edit.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $dados['id'] = $id;
        $modelcolor->delColor($dados);

        header('Location: /color');
    }

}

?>
