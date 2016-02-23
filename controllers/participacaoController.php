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
        $this->smarty->assign('title', 'Participação');
        //call the smarty
        $this->smarty->display('participacao/index.tpl');
    }

    public function cliente_evento_insert() {
        $modelClienteEvento = new eventoClienteModel();
        $model = new model();
        $id_evento = $_POST['id_evento'];
        $id_cliente = $_POST['id_cliente'];
        $dados['id_evento'] = $_POST['id_evento'];
        $dados['id_cliente'] = $_POST['id_cliente'];
        $dados['dt_cadastro'] = date("Y-m-d H:i:s");

        $exists = $modelClienteEvento->getEventoCliente("id_evento = $id_evento AND id_cliente = $id_cliente AND stat <> 0");
        if ($exists) {
            $modelEvento = new eventoModel();
            $resEvento = $modelEvento->getEvento('stat<>0');
            $this->smarty->assign('title', 'Participação');
            $this->smarty->assign('evento', $resEvento);
            $this->smarty->assign('error', 'O cliente já participa deste evento!');
            $this->smarty->display('participacao/index.tpl');
        } else {
            $resProdutoEstoque = $model->readSQL("SELECT ep.id_evento, "
                    . "ep.qtd_produto, "
                    . "p.id_produto, "
                    . "p.qtd_produto as qtd_estoque "
                    . "FROM evento_produto ep "
                    . "LEFT JOIN produto p ON (ep.id_produto=p.id_produto)"
                    . "WHERE ep.id_evento = $id_evento");

            foreach ($resProdutoEstoque as $value) {
                $data['qtd_produto'] = $value['qtd_estoque'] - $value['qtd_produto'];
                $result = $model->update('produto', $data, "id_produto = '" . $value['id_produto'] . "'");
            }
            $resClienteEvento = $modelClienteEvento->setEventoCliente($dados);
            $id_evento_cliente = $resClienteEvento;
            $fill = $model->readSQL("SELECT "
                    . "ec.*, "
                    . "e.des_evento, "
                    . "c.nome_cliente "
                    . "FROM evento_cliente ec "
                    . "LEFT JOIN cliente c ON (c.id_cliente = ec.id_cliente) "
                    . "LEFT JOIN evento e ON (e.id_evento = ec.id_evento) "
                    . "WHERE id_evento_cliente = $id_evento_cliente");
            $this->smarty->assign('data', $fill[0]);
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

    function cancelarParticipacao() {
        $id_evento_cliente = $this->getParam('id_evento_cliente');
        $this->updateEventoCliente($id_evento_cliente);
        $this->updateEstoqueProduto($id_evento_cliente);

        header('Location: /participacao');
    }

    function updateEstoqueProduto($id_evento_cliente) {
        $model = new model();
        $resProdutoEstoque = $model->readSQL("SELECT "
                . "ep.id_evento, "
                . "ep.qtd_produto, "
                . "p.id_produto, "
                . "p.qtd_produto as qtd_estoque "
                . "FROM evento_cliente ec "
                . "LEFT JOIN evento_produto ep ON (ep.id_evento = ec.id_evento) "
                . "LEFT JOIN produto p ON (p.id_produto = ep.id_produto) "
                . "WHERE ec.id_evento_cliente = $id_evento_cliente");
        foreach ($resProdutoEstoque as $value) {
            $data['qtd_produto'] = $value['qtd_estoque'] - $value['qtd_produto'];
            $result = $model->update('produto', $data, "id_produto = '" . $value['id_produto'] . "'");
        }
    }

    function updateEventoCliente($id_evento_cliente) {
        $modelClienteEvento = new eventoClienteModel();
        $data['id_evento_cliente'] = $id_evento_cliente;
        $data['stat'] = 0;
        $modelClienteEvento->upEventoCliente($data);
    }

    public function uploadfoto() {
        $id = $_POST['id_evento_cliente'];
        $filepath = "files/images/" . date("YmdHis") . ".png";
        $imagem = str_replace('data:image/png;base64,', '', $_POST['imagem']);
        $this->base64_to_jpeg($imagem, $filepath);
        echo json_encode(array('imagem' => 1));
        $data['id_evento_cliente'] = $id;
        $data['caminho_file'] = $filepath;
        $model = new model();
        $model->insert("evento_fotos", $data);
    }

    public function uploadFile() {
        if (($_FILES["fileToUpload"]['name']['size'] == '')) {
            header('Location: /participacao');
            return;
        }
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
                $data['id_evento_cliente'] = $this->getParam('id_evento_cliente');
                $data['caminho_file'] = $target_file;
                $model = new model();
                $model->insert("evento_fotos", $data);

                header('Location: /participacao');
            } else {
                echo "Sorry, there was an error uploading your file.";
            }
        }
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

    function relatorio() {
        $session = new session();
        $session->sessao_valida();
        $model = new model();
        $this->smarty->assign('listacliente', null);

        if (isset($_POST['nome_cliente']) && isset($_POST['des_evento'])) {
            $sql = ""
                    . " SELECT "
                    . " ec . *,"
                    . " c.nome_cliente,"
                    . " e.des_evento"
                    . " FROM evento_cliente ec "
                    . " LEFT JOIN cliente c ON (c.id_cliente = ec.id_cliente) "
                    . " LEFT JOIN evento e ON (e.id_evento = ec.id_evento) "
                    . " WHERE ec.stat <> 0 ";

            if ($_POST['nome_cliente'] != '') {
                $nome_cliente = $_POST['nome_cliente'];
                $sql .= " AND c.nome_cliente LIKE '%$nome_cliente%'";
            } if ($_POST['des_evento'] != '') {
                $des_evento = $_POST['des_evento'];
                $sql .= " AND e.des_evento LIKE '%$des_evento%'";
            }
            $resBusca = $model->readSQL($sql);
            $this->smarty->assign('listacliente', $resBusca);
        }

        $this->smarty->assign('title', 'Participantes');
        $this->smarty->display('participacao/relatorio.tpl');
    }

}

?>
