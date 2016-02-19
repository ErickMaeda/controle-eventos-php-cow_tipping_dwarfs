<?php

include_once 'sessionController.php';

class cracha extends controller {

    public function index_action() {

        $session = new session();
        $session->sessao_valida();
        //list all records
        $cracha_model = new crachaModel();
        $cracha_res = $cracha_model->getCrachaDepartamento("SELECT id_cracha,des_cracha,e.id_departamento,des_departamento FROM cracha c inner join departamento e on (c.id_departamento=e.id_departamento AND e.stat<>0) WHERE c.stat<>0");

        $this->smarty->assign('listcracha', $cracha_res);
        $this->smarty->assign('title', 'Crachas');
        $this->smarty->display('cracha/index.tpl');
    }

    public function insert() {
        $departamento_model = new departamentoModel();
        $departamento_res = $departamento_model->getDepartamento('stat<>0');
        $this->smarty->assign('title', 'Novo Cracha');
        $this->smarty->assign('departamento', $departamento_res);
        $this->smarty->display('cracha/insert.tpl');
    }

    public function save() {
        $modelCracha = new crachaModel();
        $dados['des_cracha'] = $_POST['des_cracha'];
        $dados['id_departamento'] = $_POST['id_departamento'];
        $dados['qtd_cracha'] = $_POST['qtd_cracha'];
        $modelCracha->setCracha($dados);

        header('Location: /cracha');
    }

    public function update() {
        $id = $this->getParam('id_cracha');

        $modelCracha = new crachaModel();
        $dados['id_cracha'] = $id;
        $dados['des_cracha'] = $_POST['des_cracha'];
        $dados['qtd_cracha'] = $_POST['qtd_cracha'];
        $dados['id_departamento'] = $_POST['id_departamento'];
        $modelCracha->updCracha($dados);

        header('Location: /cracha');
    }

    public function edit() {

        $id = $this->getParam('id_cracha');
        $modelCracha = new crachaModel();
        $resCracha = $modelCracha->getCracha('id_cracha=' . $id);
        $departamento_model = new departamentoModel();
        $departamento_res = $departamento_model->getDepartamento('stat<>0');
        $this->smarty->assign('registro', $resCracha[0]);
        $this->smarty->assign('departamento', $departamento_res);
        $this->smarty->assign('id_choosen', $resCracha[0]['id_departamento']);
        $this->smarty->assign('title', 'Atualizar Cracha');
        //call the smarty
        $this->smarty->display('cracha/update.tpl');
    }

    public function delete() {
        $id = $this->getParam('id_cracha');
        $modelCracha = new crachaModel();
        $dados['id_cracha'] = $id;
        $dados['stat'] = 0;
        $modelCracha->updCracha($dados);
        header('Location: /cracha');
    }
}
