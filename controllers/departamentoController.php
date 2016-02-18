<?php

include_once 'sessionController.php';

class departamento extends controller {

    public function index_action() {

        $session = new session();
        $session->sessao_valida();

        //list all records
        $departamento_model = new departamentoModel();
        $departamento_res = $departamento_model->getDepartamento('stat<>0'); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listdepartamento', $departamento_res);
        $this->smarty->assign('title', 'Departamentos');
        //call the smarty
        $this->smarty->display('departamento/index.tpl');
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


        //die();
        $id = $this->getParam('id_departamento');
        $modelDepartamento = new departamentoModel();
        $resDepartamento = $modelDepartamento->getDepartamento('id_departamento=' . $id);
        $this->smarty->assign('registro', $resDepartamento[0]);
        $this->smarty->assign('title', 'Atualizar Departamento');
        //call the smarty
        $this->smarty->display('departamento/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_departamento');
        $modelDepartamento = new departamentoModel();
        $dados['id_departamento'] = $id;
        $dados['stat'] = 0;
        $modelDepartamento->updDepartamento($dados);


        header('Location: /departamento');
    }

}

?>
