<?php

include_once 'sessionController.php';

class cliente extends controller {

    public function index_action($pagina = 1) {
        $session = new session();
        $session->sessao_valida();
        //list all records
        $_SESSION['pagina'] = $pagina;
        //send the records to template sytem
        $this->smarty->assign('title', 'Clientes');
        $this->smarty->assign('paginador', $this->mostraGrid());
        $this->smarty->display('cliente/index.tpl');
    }

    public function paginacao() {
        $this->index_action($this->getParam('pagina'));
    }

    public function insert() {

        $cidadeModel = new cidadeModel();
        $estadoModel = new estadoModel();
        $resCidade = $cidadeModel->getCidade('stat<>0');
        $resEstado = $estadoModel->getEstado('stat<>0');
        $this->smarty->assign('title', 'Novo Cliente');
        $this->smarty->assign('estado', $resEstado);
        $this->smarty->assign('cidade', $resCidade);
        $this->smarty->display('cliente/insert.tpl');
    }

    public function save() {
        $model_cliente = new clienteModel();
        $cliente['nome_cliente'] = $_POST['nome_cliente'];
        $cliente['codigo_uc'] = $_POST['codigo_uc'];
        $cliente['codigo_nis'] = $_POST['codigo_nis'];
        $cliente['cpf_cliente'] = $_POST['cpf_cliente'];
        $cliente['rg_cliente'] = $_POST['rg_cliente'];
        $cliente['endereco_cliente'] = $_POST['endereco_cliente'];
        $cliente['id_estado'] = $_POST['id_estado'];
        $cliente['id_cidade'] = $_POST['id_cidade'];
        $cliente['telefone_cliente'] = $_POST['telefone_cliente'];
        $cliente['dt_cadastro'] = date("Y-m-d H:i:s");
        $id_cliente = $model_cliente->setCliente($cliente);
        if (($_FILES["fileToUpload"]['name']['size'] == '')) {
            header('Location: /cliente');
            return;
        } else {
            $this->uploadFile($id_cliente);
        }
    }

    public function uploadFile($id_cliente) {
        $target_dir = "files/images/";
        $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
        $uploadOk = 1;
        $imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);
        // Check if image file is a actual image or fake image
        if (isset($_POST["submit"])) {
            $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
            if ($check !== false) {
                echo "File is an image - " . $check["mime"] . ".";
                $uploadOk = 1;
            } else {
                echo "File is not an image.";
                $uploadOk = 0;
            }
        }
        // Check if file already exists
        if (file_exists($target_file)) {
            echo "Sorry, file already exists.";
            $uploadOk = 0;
        }
        // Check file size
        if ($_FILES["fileToUpload"]["size"] > 50000000) {
            echo "Sorry, your file is too large.";
            $uploadOk = 0;
        }
        // Allow certain file formats
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
            echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
        }
        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            echo "Sorry, your file was not uploaded.";
            // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
                $data['id_cliente'] = $id_cliente;
                $data['caminho_foto'] = $target_file;
                $model = new model();
                $model->insert("cliente_foto", $data);

                header('Location: /participacao');
            } else {
                echo "Sorry, there was an error uploading your file.";
            }
        }
    }

    public function update() {
        $id = $this->getParam('id_cliente');
        echo 'id_cliente = ' . $id;
        $model_cliente = new clienteModel();
        $cliente['id_cliente'] = $id;
        $cliente['nome_cliente'] = $_POST['nome_cliente'];
        $cliente['codigo_uc'] = $_POST['codigo_uc'];
        $cliente['codigo_nis'] = $_POST['codigo_nis'];
        $cliente['cpf_cliente'] = $_POST['cpf_cliente'];
        $cliente['rg_cliente'] = $_POST['rg_cliente'];
        $cliente['endereco_cliente'] = $_POST['endereco_cliente'];
        $cliente['id_estado'] = $_POST['id_estado'];
        $cliente['id_cidade'] = $_POST['id_cidade'];
        $cliente['telefone_cliente'] = $_POST['telefone_cliente'];
        $model_cliente->updCliente($cliente);

        header('Location: /cliente');
    }

    public function detalhes() {
        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $model_estado = new estadoModel();
        $model_cidade = new cidadeModel();
        $res = $model_cliente->getCliente('id_cliente=' . $id . ' AND stat<>0');
        $resEstado = $model_estado->getEstado('id_estado=' . $res[0]['id_estado']);
        $resCidade = $model_cidade->getCidade('id_cidade=' . $res[0]['id_cidade']);

        $this->smarty->assign('registro', $res[0]);
        $this->smarty->assign('cidade', $resCidade[0]);
        $this->smarty->assign('estado', $resEstado[0]);
        $this->smarty->assign('title', 'Detalhe do Cliente');
        //call the smarty
        $this->smarty->display('cliente/detail.tpl');
    }

    public function edit() {

        $model_estado = new estadoModel();
        $model_cidade = new cidadeModel();
        $model = new clienteModel();
        $id = $this->getParam('id_cliente');
        $res = $model->getCliente('id_cliente=' . $id . ' AND stat<>0');
        $resEstado = $model_estado->getEstado('stat<>0');
        $resCidade = $model_cidade->getCidade('stat<>0');
        $this->smarty->assign('cliente', $res[0]);
        $this->smarty->assign('cidade', $resCidade);
        $this->smarty->assign('estado', $resEstado);
        $this->smarty->assign('id_choosen_cidade', $res[0]['id_cidade']);
        $this->smarty->assign('id_choosen_estado', $res[0]['id_estado']);
        $this->smarty->assign('title', 'Atualizar cliente');
        //call the smarty
        $this->smarty->display('cliente/update.tpl');
    }

    public function delete() {

        $id = $this->getParam('id_cliente');
        $model_cliente = new clienteModel();
        $dados['id_cliente'] = $id;
        $dados['stat'] = 0;
        $model_cliente->updCliente($dados);

        header('Location: /cliente');
    }

    public function relatorio() {

        $session = new session();
        $session->sessao_valida();
        $this->smarty->assign('title', 'Busca Clientes');
        $this->smarty->assign('listacliente', null);

        if (isset($_POST['nome_cliente']) && isset($_POST['cpf_cliente']) && isset($_POST['rg_cliente']) && isset($_POST['cracha_stat'])) {
            $modelCliente = new clienteModel();
            $nome_cliente = $_POST['nome_cliente'];
            $cpf_cliente = $_POST['cpf_cliente'];
            $rg_cliente = $_POST['rg_cliente'];
            $cracha_stat = $_POST['cracha_stat'];

            $where = "stat<>0";
            if ($nome_cliente != '') {
                $where.= " AND nome_cliente like '%$nome_cliente%' ";
            }
            if ($rg_cliente != '') {
                $where.= " AND rg_cliente like '%$rg_cliente%' ";
            }
            if ($cpf_cliente != '') {
                $where.= " AND cpf_cliente like '%$cpf_cliente%' ";
            }
            if ($cracha_stat != '') {
                $where.= " AND cracha_stat like '%$cracha_stat%' ";
            }
            $resCliente = $modelCliente->getCliente($where);
            $this->smarty->assign('listacliente', $resCliente);
        }
        $this->smarty->display('cliente/relatorio.tpl');
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
        $qry_limitada = $model->readSQL("SELECT * FROM cliente WHERE stat<>0 LIMIT $inicio,$total_reg");
        $this->smarty->assign('listcliente', $qry_limitada);

        // Total de Registros na tabela    
        $qry_total = $model->readSQL("SELECT count(*)as total FROM cliente WHERE stat<>0");
        $total_registros = $qry_total[0]['total']; //pega o valor
        $html = $this->paginador($pc, $total_registros, 'cliente');
        return $html;
    }

}

?>
