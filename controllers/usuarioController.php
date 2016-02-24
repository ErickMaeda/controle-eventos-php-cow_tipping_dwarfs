<?php

include_once 'sessionController.php';

class usuario extends controller {

    public function index_action($pagina = 1) {
        $session = new session();
        $session->sessao_valida();
        $_SESSION['pagina'] = $pagina;
        $this->smarty->assign('paginador', $this->mostraGrid());
        $this->smarty->assign('title', 'Usuarios');
        $this->smarty->display('usuario/index.tpl');
    }

    public function paginacao() {
        $this->index_action($this->getParam('pagina'));
    }

    public function mostraGrid() {
        $total_reg = "10"; // número de registros por página
        $pagina = $_SESSION['pagina'];

        if (!$pagina) {
            $pc = "1";
        } else {
            $pc = $pagina;
        }
        $inicio = $pc - 1;
        $inicio = $inicio * $total_reg;

        $usuario_model = new usuarioModel();
        $qry_limitada = $usuario_model->getUsuario('stat<>0', $inicio . ',' . $total_reg); //Full table Scan :( or :)         

        $this->smarty->assign('listusuario', $qry_limitada);

        $model = new model();
        $qry_total = $model->readSQL("SELECT count(*)as total FROM usuario WHERE stat<>0");
        $total_registros = $qry_total[0]['total']; //pega o valor
        $html = $this->paginador($pc, $total_registros, 'usuario');
        return $html;
    }

    public function insert() {
        $this->smarty->assign('title', 'Novo Usuario');
        $this->smarty->display('usuario/insert.tpl');
    }

    public function save() {
        $email_usuario = $_POST['email_usuario'];
        $modelUsuario = new usuarioModel();
        if ($modelUsuario->getUsuario(" email_usuario = '$email_usuario' AND stat<>0 ")) {
            header('Location: /usuario/error/msg/usuario_existe');
            return;
        }
        if (isset($_POST['id_usuario_tipo'])) {
            $dados['id_usuario_tipo'] = $_POST['id_usuario_tipo'];
        }
        $dados['nome_usuario'] = $_POST['nome_usuario'];
        $dados['email_usuario'] = $_POST['email_usuario'];
        $dados['senha_usuario'] = $_POST['senha_usuario'];
        $modelUsuario->setUsuario($dados);
        header('Location: /usuario');
    }

    public function error() {
        $msg_erro = $this->getParam('msg');
        $modelUsuario = new usuarioModel();
        $this->smarty->assign('paginador', $this->mostraGrid());
        $this->smarty->assign('title', 'Usuarios');
        $this->smarty->assign('error', "Usuario já Existe");
        $this->smarty->display('usuario/index.tpl');
    }

    public function update() {
        $id = $this->getParam('id_usuario');
        $modelUsuario = new usuarioModel();
        $dados['id_usuario'] = $id;
        $dados['nome_usuario'] = $_POST['nome_usuario'];
        $dados['email_usuario'] = $_POST['email_usuario'];
        $dados['senha_usuario'] = $_POST['senha_usuario'];
        if (isset($_POST['id_usuario_tipo'])) {
            $dados['id_usuario_tipo'] = $_POST['id_usuario_tipo'];
        }
        $modelUsuario->updUsuario($dados);
        header('Location: /usuario');
    }

    public function edit() {
        $id = $this->getParam('id_usuario');
        $modelUsuario = new usuarioModel();
        $resUsuario = $modelUsuario->getUsuario('id_usuario=' . $id);
        $this->smarty->assign('registro', $resUsuario[0]);
        $this->smarty->assign('title', 'Atualizar Usuario');
        $this->smarty->display('usuario/update.tpl');
    }

    public function delete() {
        $id = $this->getParam('id_usuario');
        $modelUsuario = new usuarioModel();
        $dados['id_usuario'] = $id;
        $dados['stat'] = 0;
        $modelUsuario->delUsuario($dados);

        header('Location: /usuario');
    }

}

?>
