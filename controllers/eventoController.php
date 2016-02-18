<?php

include_once 'sessionController.php';

class evento extends controller {

    public function index_action() {

        $session = new session();
        $session->sessao_valida();
        //list all records
        $model = new model();
        $res = $model->readSQL('SELECT e.*,c.des_cidade FROM evento e LEFT JOIN cidade c ON (c.id_cidade=e.id_cidade) WHERE e.stat<>0'); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listevento', $res);
        $this->smarty->assign('title', 'Eventos');
        //call the smarty
        $this->smarty->display('evento/index.tpl');
    }

    public function insert() {

        $eventoModel = new eventoModel();
        $cidadeModel = new cidadeModel();
        $res_evento = $eventoModel->getEvento('stat<>0');
        $res_cidade = $cidadeModel->getCidade('stat<>0');
        $this->smarty->assign('title', 'Novo Evento');
        $this->smarty->assign('cidade', $res_cidade);
        $this->smarty->display('evento/insert.tpl');
    }

    public function save() {
        $eventoModel = new eventoModel();
        $evento['id_cidade'] = $_POST['id_cidade'];
        $evento['des_evento'] = $_POST['des_evento'];
        $evento['status_evento'] = $_POST['status_evento'];
        $evento['dt_cadastro'] = date("Y-m-d H:i:s");
        $eventoModel->setEvento($evento);
        header('Location: /evento');
    }

    public function update() {
        $id = $this->getParam('id_evento');
        $eventoModel = new eventoModel();
        $evento['id_evento'] = $id;
        $evento['id_cidade'] = $_POST['id_cidade'];
        $evento['des_evento'] = $_POST['des_evento'];
        $evento['status_evento'] = $_POST['status_evento'];

        $eventoModel->updEvento($evento);

        header('Location: /evento');
    }

    public function detalhes() {
        $id = $this->getParam('id_evento');
        $eventoModel = new eventoModel();
        $cidadeModel = new cidadeModel();
        $res = $eventoModel->getEvento('id_evento=' . $id . ' AND stat<>0');
        $resCidade = $cidadeModel->getCidade('id_cidade=' . $res[0]['id_cidade']);

        $this->smarty->assign('registro', $res[0]);
        $this->smarty->assign('cidade', $resCidade[0]);
        $this->smarty->assign('title', 'Detalhes do evento');
        //call the smarty
        $this->smarty->display('evento/detail.tpl');
    }

    public function edit() {

        $cidadeModel = new cidadeModel();
        $id = $this->getParam('id_evento');
        $model = new model();
        $modelCidade = new cidadeModel();
        $resCidade = $modelCidade->getCidade('stat<>0');
        $res = $model->readSQL('SELECT e.*,c.des_cidade FROM evento e LEFT JOIN cidade c ON (c.id_cidade=e.id_cidade) WHERE e.stat<>0 AND e.id_evento=' . $id);
        $this->smarty->assign('evento', $res[0]);
        $this->smarty->assign('title', 'Atualizar evento');
        $this->smarty->assign('cidade', $resCidade);
        //call the smarty
        $this->smarty->display('evento/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_evento');
        $eventoModel = new eventoModel();
        $dados['id_evento'] = $id;
        $dados['stat'] = 0;
        $eventoModel->updEvento($dados);

        header('Location: /evento');
    }

}

?>
