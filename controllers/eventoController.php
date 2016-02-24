<?php

include_once 'sessionController.php';

class evento extends controller {

    public function index_action($pagina = 1) {
        $session = new session();
        $session->sessao_valida();
        $_SESSION['pagina'] = $pagina;

        $this->smarty->assign('paginador', $this->mostraGrid());
        $this->smarty->assign('title', 'Eventos');
        $this->smarty->display('evento/index.tpl');
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
        //Busca os registros para o Grid
        $model = new model();
        $qry_limitada = $model->readSQL("SELECT "
                . "e.*,"
                . "c.des_cidade "
                . "FROM evento e "
                . "LEFT JOIN cidade c ON (c.id_cidade=e.id_cidade)"
                . " WHERE e.stat<>0 LIMIT $inicio,$total_reg");
        $this->smarty->assign('listevento', $qry_limitada);

        // Total de Registros na tabela    
        $qry_total = $model->readSQL("SELECT count(*)as total FROM evento WHERE stat<>0");
        $total_registros = $qry_total[0]['total']; //pega o valor
        $html = $this->paginador($pc, $total_registros, 'evento');
        return $html;
    }

    public function insert() {
        $eventoModel = new eventoModel();
        $cidadeModel = new cidadeModel();
        $res_evento = $eventoModel->getEvento('stat<>0');
        $res_cidade = $cidadeModel->getCidade('stat<>0');
        $this->smarty->assign('title_produto', 'Evento Produto');
        $this->smarty->assign('title', 'Novo Evento');
        $this->smarty->assign('cidade', $res_cidade);
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
        $eventoModel->updEvento($evento);

        header('Location: /evento');
    }

    public function detalhes() {
        $id = $this->getParam('id_evento');
        $eventoModel = new eventoModel();
        $cidadeModel = new cidadeModel();
        $res = $eventoModel->getEvento('id_evento=' . $id . ' AND stat<>0');
        $resCidade = $cidadeModel->getCidade('id_cidade=' . $res[0]['id_cidade']);

        $model = new model();
        $produto = $model->readSQL('SELECT ep.id_evento, ep.id_produto, ep.qtd_produto, p.des_produto, e.des_evento 
            FROM evento_produto ep 
            LEFT JOIN produto p ON (p.id_produto = ep.id_produto)
            LEFT JOIN evento e ON (e.id_evento = ep.id_evento) WHERE ep.id_evento=' . $id . ' AND ep.stat<>0'); //Full table Scan :( or :) 
        $this->smarty->assign('registro', $res[0]);
        $this->smarty->assign('cidade', $resCidade[0]);
        $this->smarty->assign('title', 'Detalhe do evento');
        $this->smarty->assign('produto', $produto);
        $this->smarty->assign('title_produto', 'Evento Produto');
        //call the smarty
        $this->smarty->display('evento/detail.tpl');
    }

    public function edit() {

        $cidadeModel = new cidadeModel();
        $id = $this->getParam('id_evento');
        $model = new model();
        $modelCidade = new cidadeModel();
        $resCidade = $modelCidade->getCidade('stat<>0');
        $res = $model->readSQL('SELECT e.*,c.des_cidade FROM evento e LEFT JOIN cidade c ON (c.id_cidade=e.id_cidade) WHERE e.stat<>0 AND e.id_evento=' . $id);
        $this->smarty->assign('evento', $res[0]);
        $this->smarty->assign('title', 'Atualizar evento');
        $this->smarty->assign('cidade', $resCidade);
        //call the smarty
        $this->smarty->display('evento/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_evento');
        $eventoModel = new eventoModel();
        $dados['id_evento'] = $id;
        $dados['stat'] = 0;
        $eventoModel->updEvento($dados);

        header('Location: /evento');
    }

    public function produto_save() {

        $model = new model();
        $id = $this->getParam('id_evento');
        $produto_evento['id_evento'] = $id;
        $produto_evento['id_produto'] = $_POST['id_produto'];
        $produto_evento['qtd_produto'] = $_POST['qtd_produto'];
        $model->insert('evento_produto', $produto_evento);
        header('Location: /evento');
    }

    public function produto_grid() {

        $id = $this->getParam('id_evento');
        $produto_model = new produtoModel();
        $resProduto = $produto_model->getProduto();
        $model = new model();
        $produto = $model->readSQL('
            SELECT ep.id_evento, ep.id_produto, ep.qtd_produto, p.des_produto, e.des_evento 
            FROM evento_produto ep 
            LEFT JOIN produto p ON (p.id_produto = ep.id_produto)
            LEFT JOIN evento e ON (e.id_evento = ep.id_evento)
            WHERE ep.stat<>0 AND ep.id_evento=' . $id); //Full table Scan :( or :)
        $this->smarty->assign('produto_evento', $produto);
        $this->smarty->assign('title_produto', 'Evento Produto');
        $this->smarty->assign('produto', $resProduto);
        $this->smarty->assign('id_evento', $id);
        $this->smarty->assign('title', 'Cadastrar Produto');
        $this->smarty->display('evento/produto_grid.tpl');
    }

    public function produto_delete() {

        $id_evento = $this->getParam('id_evento');
        $id_produto = $this->getParam('id_produto');
        $dados['id_evento'] = $id_evento;
        $dados['id_produto'] = $id_produto;
        $dados['stat'] = 0;
        $model = new model();
        $model->update("evento_produto", $dados, "id_produto=$id_produto AND id_evento=$id_evento AND stat<>0");

        header('Location: /evento');
    }

}

?>
