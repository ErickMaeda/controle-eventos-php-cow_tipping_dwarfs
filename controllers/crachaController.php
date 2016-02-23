<?php

include_once 'sessionController.php';

class cracha extends controller {

    public function index_action() {

        $session = new session();
        $session->sessao_valida();
        $modelEvento = new eventoModel();
        $resEvento = $modelEvento->getEvento('stat<>0');
        //send the records to template sytem
        $this->smarty->assign('evento', $resEvento);
        $this->smarty->assign('title', 'Emissão de Crachá');
        $this->smarty->assign('listacliente', null);
        //call the smarty
        $this->smarty->display('cracha/index.tpl');
    }

    public function insert() {
        $this->smarty->assign('title', 'Novo participacao');
        $this->smarty->display('cracha/index.tpl');
    }

    public function save() {
        $modelparticipacao = new eventoClienteModel();
        $dados['des_participacao'] = $_POST['des_participacao'];
        $modelparticipacao->setparticipacao($dados);
        header('Location: cracha/index.tpl');
    }

    public function update() {
        $id = $this->getParam('id_participacao');

        $modelparticipacao = new eventoClienteModel();
        $dados['id_participacao'] = $id;
        $dados['des_participacao'] = $_POST['des_participacao'];
        $modelparticipacao->updparticipacao($dados);
        header('Location: cracha/index.tpl');
    }

    public function edit() {

        $id = $this->getParam('id_participacao');
        $modelparticipacao = new eventoClienteModel();
        $resparticipacao = $modelparticipacao->getparticipacao('id_participacao=' . $id);
        $this->smarty->assign('registro', $resparticipacao[0]);
        $this->smarty->assign('title', 'Atualizar participacao');
        $this->smarty->display('cracha/index.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_participacao');
        $modelparticipacao = new eventoClienteModel();
        $dados['id_participacao'] = $id;
        $dados['stat'] = 0;
        $modelparticipacao->updparticipacao($dados);
        header('Location: cracha/index.tpl');
    }

    public function buscar_cliente() {
        if (isset($_POST['nome_cliente'])) {
            $modelCliente = new clienteModel();
            $nome_cliente = $_POST['nome_cliente'];
            $resCliente = $modelCliente->getCliente("nome_cliente like '%$nome_cliente%' AND stat<>0");
            $this->smarty->assign('title', 'Emissao de Crachas');
            $this->smarty->assign('listacliente', $resCliente);
            $this->smarty->display('cracha/index.tpl');
        }
    }

    public function emissao() {
        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $model_estado = new estadoModel();
        $model_cidade = new cidadeModel();
        $res = $model_cliente->getCliente('id_cliente=' . $id . ' AND stat<>0');
        $resEstado = $model_estado->getEstado('id_estado=' . $res[0]['id_estado']);
        $resCidade = $model_cidade->getCidade('id_cidade=' . $res[0]['id_cidade']);

        $this->smarty->assign('registro', $res[0]);
        $this->smarty->assign('dt_emissao', date("d/m/Y H:i:s"));

        $this->smarty->assign('cidade', $resCidade[0]);
        $this->smarty->assign('estado', $resEstado[0]);
        $this->smarty->assign('title', 'Credencial de Participante');
        //call the smarty
        $this->smarty->display('cracha/emissao.tpl');
    }

}

?>
