<?php

include_once 'sessionController.php';

class usuario extends controller {

    public function index_action() {

        $session = new session();
        $session->sessao_valida();
//list all records
        $usuario_model = new usuarioModel();
        $usuario_res = $usuario_model->getUsuario('stat<>0'); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listusuario', $usuario_res);
        $this->smarty->assign('title', 'Usuarios');
        //call the smarty
        $this->smarty->display('usuario/index.tpl');
    }

    public function insert() {
        $this->smarty->assign('title', 'Novo Usuario');
        $this->smarty->display('usuario/insert.tpl');
    }

    public function save() {
        $modelUsuario = new usuarioModel();
        $dados['nome_usuario'] = $_POST['nome_usuario'];
        $dados['email_usuario'] = $_POST['email_usuario'];
        $dados['senha_usuario'] = $_POST['senha_usuario'];
        $modelUsuario->setUsuario($dados);

        header('Location: /usuario');
    }

    public function update() {
        $id = $this->getParam('id_usuario');

        $modelUsuario = new usuarioModel();
        $dados['id_usuario'] = $id;
        $dados['nome_usuario'] = $_POST['nome_usuario'];
        $dados['email_usuario'] = $_POST['email_usuario'];
        $dados['senha_usuario'] = $_POST['senha_usuario'];
        $modelUsuario->updUsuario($dados);

        header('Location: /usuario');
    }

    public function edit() {


        //die();
        $id = $this->getParam('id_usuario');
        $modelUsuario = new usuarioModel();
        $resUsuario = $modelUsuario->getUsuario('id_usuario=' . $id);
        $this->smarty->assign('registro', $resUsuario[0]);
        $this->smarty->assign('title', 'Atualizar Usuario');
        //call the smarty
        $this->smarty->display('usuario/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_usuario');
        $modelUsuario = new usuarioModel();
        $dados['id_usuario'] = $id;
        $modelUsuario->delUsuario($dados);


        header('Location: /usuario');
    }

}

?>
