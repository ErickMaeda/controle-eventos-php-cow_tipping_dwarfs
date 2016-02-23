<?php

include_once 'sessionController.php';

class login extends controller {

    public function index_action() {
        $session = new session();
        $session->sessao_limpa();
        $this->smarty->display('login/index.tpl');
    }

    function validaLogin() {
        $email = $_POST['email'];
        $senha = $_POST['senha'];
        echo '1';
        if (!isset($email) || !isset($senha)) {
            sessao_limpa();
        }
        echo '2';

        if (strlen(trim($email)) == 0 || strlen(trim($senha) == 0)) {
            header("Location: /login/error/msg/u_s");
        }
                echo '3';

        $model = new model();
        $query = "SELECT * FROM usuario WHERE email_usuario = '$email' AND senha_usuario = '$senha'";
        $result = $model->readSQL($query);
        $session = new session();

        if ($result) {
            $session->sessao_grava($result[0]['email_usuario'], $result[0]['id_usuario_tipo']);
            header("Location: /index");
        } else {
            $session->sessao_limpa();
            header("Location: /login/error/msg/u_s");
        }
    }

    public function error() {
        $this->smarty->assign('error', "Usuario e/ou Senha incorretos");
        $this->smarty->display('login/index.tpl');
    }

}
