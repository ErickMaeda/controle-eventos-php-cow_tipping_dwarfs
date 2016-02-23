<?php

class session extends controller {

    function sessao_grava($email, $usuario_tipo) {
        $_SESSION['usuario']['email'] = $email;
        $_SESSION['usuario']['id_usuario_tipo'] = $usuario_tipo;
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
