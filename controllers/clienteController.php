<?php

class cliente extends controller {

    public function index_action() {

        //list all records
        $model_cliente = new clienteModel();
        $clientes = $model_cliente->getCliente('stat<>0',"10"); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listcliente', $clientes);
        $this->smarty->assign('title', 'Clientes');
        //call the smarty
        $this->smarty->display('cliente/index.tpl');
    }

    public function insert() {

        $cidadeModel = new cidadeModel();
        $estadoModel = new estadoModel();
        $resCidade = $cidadeModel->getCidade('stat<>0');
        $resEstado = $estadoModel->getEstado('stat<>0');
        $this->smarty->assign('title', 'Novo Cliente');
        $this->smarty->assign('estado', $resEstado);
        $this->smarty->assign('cidade', $resCidade);
        $this->smarty->display('cliente/insert.tpl');
    }

    public function save() {
        $model_cliente = new clienteModel();
        $cliente['nome_cliente'] = $_POST['nome_cliente'];
        $cliente['codigo_uc'] = $_POST['codigo_uc'];
        $cliente['codigo_nis'] = $_POST['codigo_nis'];
        $cliente['cpf_cliente'] = $_POST['cpf_cliente'];
        $cliente['rg_cliente'] = $_POST['rg_cliente'];
        $cliente['endereco_cliente'] = $_POST['endereco_cliente'];
        $cliente['id_estado'] = $_POST['id_estado'];
        $cliente['id_cidade'] = $_POST['id_cidade'];
        $cliente['telefone_cliente'] = $_POST['telefone_cliente'];
        $cliente['dt_cadastro'] = date("Y-m-d H:i:s");
        $id_cliente = $model_cliente->setCliente($cliente);

        header('Location: /cliente');
    }

    public function update() {
        $id = $this->getParam('id_cliente');
echo 'id_cliente = '.$id;
        $model_cliente = new clienteModel();
        $cliente['id_cliente'] = $id;
        $cliente['nome_cliente'] = $_POST['nome_cliente'];
        $cliente['codigo_uc'] = $_POST['codigo_uc'];
        $cliente['codigo_nis'] = $_POST['codigo_nis'];
        $cliente['cpf_cliente'] = $_POST['cpf_cliente'];
        $cliente['rg_cliente'] = $_POST['rg_cliente'];
        $cliente['endereco_cliente'] = $_POST['endereco_cliente'];
        $cliente['id_estado'] = $_POST['id_estado'];
        $cliente['id_cidade'] = $_POST['id_cidade'];
        $cliente['telefone_cliente'] = $_POST['telefone_cliente'];

        
        $model_cliente->upCliente($cliente);

        header('Location: /cliente');
    }

    public function detalhes() {
        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $model_estado = new estadoModel();
        $model_cidade = new cidadeModel();
        $res = $model_cliente->getCliente('id_cliente=' . $id . ' AND stat<>0');
        $resEstado = $model_estado->getEstado('id_estado=' . $res[0]['id_estado']);
        $resCidade = $model_cidade->getCidade('id_cidade=' . $res[0]['id_cidade']);

        $this->smarty->assign('registro', $res[0]);
        $this->smarty->assign('cidade', $resCidade[0]);
        $this->smarty->assign('estado', $resEstado[0]);
        $this->smarty->assign('title', 'Detalhe do Cliente');
        //call the smarty
        $this->smarty->display('cliente/detail.tpl');
    }

    public function edit() {

        $model_estado = new estadoModel();
        $model_cidade = new cidadeModel();
        $model = new clienteModel();
        $id = $this->getParam('id_cliente');
        $res = $model->getCliente('id_cliente=' . $id . ' AND stat<>0');
        $resEstado = $model_estado->getEstado();
        $resCidade = $model_cidade->getCidade();
        $this->smarty->assign('cliente', $res[0]);
        $this->smarty->assign('cidade', $resCidade);
        $this->smarty->assign('estado', $resEstado);
        $this->smarty->assign('title', 'Atualizar cliente');
        //call the smarty
        $this->smarty->display('cliente/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $dados['id_cliente'] = $id;
        $model_cliente->delCliente($dados);

        header('Location: /cliente');
    }

}

?>
