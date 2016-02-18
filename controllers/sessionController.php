<?php

class session extends controller{

    function sessao_grava($email) {
        $_SESSION['usuario']['email'] = $email;
    }

    function sessao_valida() {
        $retorno = false;
        if (isset($_SESSION['usuario'])) {
            $retorno = true;
        } else {
            header('Location: /login');
        }
        return $retorno;
    }

    function sessao_limpa() {
        unset($_SESSION['usuario']);
    }

}
