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
            $resClienteUser = $modelCliente->readSQL(""
                    . "SELECT c.* FROM cliente c "
                    . "LEFT JOIN evento_cliente ec ON (ec.id_cliente = c.id_cliente AND ec.stat<>0) "
                    . "WHERE ec.id_evento_cliente is null "
                    . "AND c.nome_cliente like '%$nome_cliente%' "
                    . "AND c.stat<>0 ");


            $this->smarty->assign('listacliente', $resClienteUser);
            $this->smarty->assign('title', 'Emissão de Credencias');
            $this->smarty->display('cracha/index.tpl');
        }
    }

    public function emissao() {
        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $dados['cracha_stat'] = 1;
        $dados['id_cliente'] = $id;
        $model_cliente->updCliente($dados);
        $res = $model_cliente->getCliente('id_cliente=' . $id . ' AND stat<>0');

        $resFotoCliente = $model_cliente->readSQL('SELECT caminho_foto FROM cliente_foto WHERE id_cliente = ' . $id);
        if ($resFotoCliente) {
            $this->smarty->assign('caminho_foto', '/'.$resFotoCliente[0]['caminho_foto']);
        }
        $this->smarty->assign('registro', $res[0]);
        $this->smarty->assign('dt_emissao', date("d/m/Y H:i:s"));
        $this->smarty->assign('title', 'Credencial de Participante');
        //call the smarty
        $this->smarty->display('cracha/emissao.tpl');
    }

}

?>
