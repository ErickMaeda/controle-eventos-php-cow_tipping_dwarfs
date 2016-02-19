<?php

include_once 'sessionController.php';

class participacao extends controller {

    public function index_action() {

        $session = new session();
        $session->sessao_valida();
        $modelEvento = new eventoModel();
        $resEvento = $modelEvento->getEvento('stat<>0');
        //send the records to template sytem
        $this->smarty->assign('evento', $resEvento);
        $this->smarty->assign('title', 'participacao');
        //call the smarty
        $this->smarty->display('participacao/index.tpl');
    }

    public function insert() {
        $this->smarty->assign('title', 'Novo participacao');
        $this->smarty->display('participacao/insert.tpl');
    }

    public function cliente_evento_insert() {
        $modelClienteEvento = new eventoClienteModel();
        $id_evento = $_POST['id_evento'];
        $id_cliente = $_POST['id_cliente'];
        $dados['id_evento'] = $_POST['id_evento'];
        $dados['id_cliente'] = $_POST['id_cliente'];
        $dados['dt_cadastro'] = date("Y-m-d H:i:s");

        $exists = $modelClienteEvento->getEventoCliente("id_evento = $id_evento AND id_cliente = $id_cliente");
        if ($exists) {
            $modelEvento = new eventoModel();
            $resEvento = $modelEvento->getEvento('stat<>0');
            $this->smarty->assign('title', 'participacao');
            $this->smarty->assign('evento', $resEvento);
            $this->smarty->assign('error', 'O cliente já participa deste evento!');
            $this->smarty->display('participacao/index.tpl');
        } else {
            $resClienteEvento = $modelClienteEvento->setEventoCliente($dados);
            $this->smarty->assign('data', $resClienteEvento);
            $this->smarty->assign('title', 'participacao');
            $this->smarty->display('participacao/insert.tpl');
        }
    }

    function base64_to_jpeg($base64_string, $output_file) {
        $ifp = fopen($output_file, "wb");
        fwrite($ifp, base64_decode($base64_string));
        fclose($ifp);
        return( $output_file );
    }

    function save_file() {
        die();
        $imagem = str_replace('data:image/png;base64,', '', $_POST['imagem']);
        base64_to_jpeg($imagem, "arquivos/". date("Y-m-d H:i:s").".png");
        echo json_encode(array('imagem' => 1));
    }

    public function save() {
        $modelparticipacao = new eventoClienteModel();
        $dados['des_participacao'] = $_POST['des_participacao'];
        $modelparticipacao->setparticipacao($dados);
        header('Location: /participacao');
    }

    public function update() {
        $id = $this->getParam('id_participacao');

        $modelparticipacao = new eventoClienteModel();
        $dados['id_participacao'] = $id;
        $dados['des_participacao'] = $_POST['des_participacao'];
        $modelparticipacao->updparticipacao($dados);
        header('Location: /participacao');
    }

    public function edit() {

        $id = $this->getParam('id_participacao');
        $modelparticipacao = new eventoClienteModel();
        $resparticipacao = $modelparticipacao->getparticipacao('id_participacao=' . $id);
        $this->smarty->assign('registro', $resparticipacao[0]);
        $this->smarty->assign('title', 'Atualizar participacao');
        $this->smarty->display('participacao/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_participacao');
        $modelparticipacao = new eventoClienteModel();
        $dados['id_participacao'] = $id;
        $dados['stat'] = 0;
        $modelparticipacao->updparticipacao($dados);
        header('Location: /participacao');
    }

    public function busca_cliente() {

        if ($this->getParam('id_cliente') != null) {
            $modelEvento = new eventoModel();
            $resEvento = $modelEvento->getEvento('stat<>0');
            $this->smarty->assign('evento', $resEvento);
            $this->smarty->assign('title', 'participacao');
            $this->smarty->assign('id_cliente', $this->getParam('id_cliente'));
            $this->smarty->display('participacao/index.tpl');
        } else {
            $this->smarty->assign('title', 'Busca Clientes');
            $this->smarty->assign('listacliente', null);
            if (isset($_POST['nome_cliente'])) {
                $modelCliente = new clienteModel();
                $nome_cliente = $_POST['nome_cliente'];
                $resCliente = $modelCliente->getCliente("nome_cliente like '%$nome_cliente%'");
                $this->smarty->assign('listacliente', $resCliente);
            }
            $this->smarty->display('participacao/busca_cliente.tpl');
        }
    }

}

?>
