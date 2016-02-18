<?php

class evento extends controller {

    public function index_action() {

        //list all records
        $model_evento = new eventoModel();
        $res = $model_evento->getEvento('stat<>0'); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listevento', $res);
        $this->smarty->assign('title', 'Eventos');
        //call the smarty
        $this->smarty->display('evento/index.tpl');
    }

    public function insert() {

        $eventoModel = new eventoModel();
        $res_evento->getEvento('stat<>0');
        $this->smarty->assign('title', 'evento');
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

        $eventoModel->upEvento($evento);

        header('Location: /evento');
    }

    public function detalhes() {
        $id = $this->getParam('id_evento');
        $eventoModel = new eventoModel();
        $res = $eventoModel->getEvento('id_evento=' . $id . ' AND stat<>0');
        $resCidade = $model_cidade->getCidade('id_cidade=' . $res[0]['id_cidade']);

        $this->smarty->assign('registro', $res[0]);
        $this->smarty->assign('cidade', $resCidade[0]);
        $this->smarty->assign('title', 'Detalhe do evento');
        //call the smarty
        $this->smarty->display('evento/detail.tpl');
    }

    public function edit() {

        $eventoModel = new eventoModel();
        $id = $this->getParam('id_evento');
        $res = $eventoModel->getEvento('id_evento=' . $id . ' AND stat<>0');
        $resCidade = $model_cidade->getCidade();
        $this->smarty->assign('evento', $res[0]);
        $this->smarty->assign('cidade', $resCidade);
        $this->smarty->assign('title', 'Atualizar evento');
        //call the smarty
        $this->smarty->display('evento/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_evento');
        $eventoModel = new eventoModel();
        $dados['id_evento'] = $id;
        $eventoModel->delEvento($dados);

        header('Location: /evento');
    }

}

?>
