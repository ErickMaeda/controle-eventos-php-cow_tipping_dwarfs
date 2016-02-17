<?php

class cidade extends controller {

    public function index_action() {

        //list all records
        $cidade_model = new cidadeModel();
        $cidade_res = $cidade_model->getCidadeEstado("SELECT id_cidade,des_cidade,e.id_estado,des_estado FROM cidade c left join estado e on (c.id_estado=e.id_estado)");         
        //send the records to template sytem
        $this->smarty->assign('listcidade', $cidade_res);
        $this->smarty->assign('title', 'Cidades');
        //call the smarty
        $this->smarty->display('cidade/index.tpl');
    }

    public function insert() { 
        $estado_model = new estadoModel();
        $estado_res = $estado_model->getEstado();
//        var_dump($estado_res);
        $this->smarty->assign('title', 'Nova Cidade');
        $this->smarty->assign('estado',$estado_res);
        $this->smarty->display('cidade/insert.tpl');
    }

    public function save() {
        $modelCidade = new cidadeModel();
        $dados['des_cidade'] = $_POST['des_cidade'];
        $dados['id_estado'] = $_POST['id_estado'];
        $modelCidade->setCidade($dados);

        header('Location: /cidade');
    }

    public function update() {
        $id = $this->getParam('id_cidade');
        $modelCidade = new cidadeModel();
        $dados['id_cidade'] = $id;
        $dados['des_cidade'] = $_POST['des_cidade'];
        $dados['id_estado'] = $_POST['id_estado'];
        $modelCidade->updCidade($dados);

        header('Location: /cidade');
    }

    public function edit() {
       
        //die();
        $id = $this->getParam('id_cidade');
        $modelCidade = new cidadeModel();
        $resCidade = $modelCidade->getCidade('id_cidade=' . $id);
        $this->smarty->assign('registro', $resCidade[0]);
        $this->smarty->assign('title', 'Atualizar Cidade');
        //call the smarty
        $this->smarty->display('cidade/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_cidade');
        $modelCidade = new cidadeModel();
        $dados['id_cidade'] = $id;
        $modelCidade->delCidade($dados);

        header('Location: /cidade');
    }

}

?>
