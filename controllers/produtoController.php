<?php

include_once 'sessionController.php';

class produto extends controller {

    public function index_action() {

        $session = new session();
        $session->sessao_valida();
        //list all records
        $produto_model = new produtoModel();
        $produto_res = $produto_model->getProdutoDepartamento("SELECT id_produto,des_produto,e.id_departamento,des_departamento, qtd_produto FROM produto c inner join departamento e on (c.id_departamento=e.id_departamento AND e.stat<>0) WHERE c.stat<>0");
        $this->smarty->assign('listproduto', $produto_res);
        $this->smarty->assign('title', 'Produtos');
        $this->smarty->display('produto/index.tpl');
    }

    public function insert() {
        $departamento_model = new departamentoModel();
        $departamento_res = $departamento_model->getDepartamento('stat<>0');
        $this->smarty->assign('title', 'Novo Produto');
        $this->smarty->assign('departamento', $departamento_res);
        $this->smarty->display('produto/insert.tpl');
    }

    public function save() {
        $modelProduto = new produtoModel();
        $dados['des_produto'] = $_POST['des_produto'];
        $dados['id_departamento'] = $_POST['id_departamento'];
        $dados['qtd_produto'] = $_POST['qtd_produto'];
        $modelProduto->setProduto($dados);

        header('Location: /produto');
    }

    public function update() {
        $id = $this->getParam('id_produto');

        $modelProduto = new produtoModel();
        $dados['id_produto'] = $id;
        $dados['des_produto'] = $_POST['des_produto'];
        $dados['qtd_produto'] = $_POST['qtd_produto'];
        $dados['id_departamento'] = $_POST['id_departamento'];
        $modelProduto->updProduto($dados);

        header('Location: /produto');
    }

    public function edit() {

        $id = $this->getParam('id_produto');
        $modelProduto = new produtoModel();
        $resProduto = $modelProduto->getProduto('id_produto=' . $id);
        $departamento_model = new departamentoModel();
        $departamento_res = $departamento_model->getDepartamento('stat<>0');
        $this->smarty->assign('registro', $resProduto[0]);
        $this->smarty->assign('departamento', $departamento_res);
        $this->smarty->assign('id_choosen', $resProduto[0]['id_departamento']);
        $this->smarty->assign('title', 'Atualizar Produto');
        //call the smarty
        $this->smarty->display('produto/update.tpl');
    }

    public function delete() {
        $id = $this->getParam('id_produto');
        $modelProduto = new produtoModel();
        $dados['id_produto'] = $id;
        $dados['stat'] = 0;
        $modelProduto->updProduto($dados);
        header('Location: /produto');
    }
}

?>
<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

