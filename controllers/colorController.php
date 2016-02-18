<?php

include_once 'sessionController.php';

class color extends controller {

    public function index_action() {

        if (isset($_SESSION['usuario']['email'])) {
            $this->smarty->display('index/index.tpl');
        } else {
            $this->smarty->display('login/index.tpl');
        }
        //list all records
        $model_colors = new colorModel();
        $colors_res = $model_colors->getColor('active<>0'); //Full table Scan :( or :)         
        //send the records to template sytem
        $this->smarty->assign('listcolor', $colors_res);
        $this->smarty->assign('title', 'Colors');
        //call the smarty
        $this->smarty->display('color/index.tpl');
    }

    public function add() {
        $this->smarty->assign('title', 'New Color');
        $this->smarty->display('color/new.tpl');
    }

    public function save() {
        $modelcolor = new colorModel();
        $dados['name'] = $_POST['name'];
        $dados['created'] = date("Y-m-d H:i:s");
        $dados['active'] = 1;
        $modelcolor->setColor($dados);

        header('Location: /color');
    }

    public function update() {
        $id = $this->getParam('id');



        $modelcolor = new colorModel();
        $dados['id'] = $id;
        $dados['name'] = $_POST['name'];
        $dados['created'] = $_POST['created'];
        $dados['active'] = $_POST['active'];
        $modelcolor->updColor($dados);

        header('Location: /color');
    }

    public function detalhes() {
        $id = $this->getParam('id');
        $modelcolor = new colorModel();
        $rescolor = $modelcolor->getColor('id=' . $id);
        $this->smarty->assign('registro', $rescolor[0]);
        $this->smarty->assign('title', 'Colors Details');
        //call the smarty
        $this->smarty->display('color/detail.tpl');
    }

    public function edit() {

        //die();
        $id = $this->getParam('id');
        $modelcolor = new colorModel();
        $rescolor = $modelcolor->getColor('id=' . $id);
        $this->smarty->assign('registro', $rescolor[0]);
        $this->smarty->assign('title', 'Colors Details');
        //call the smarty
        $this->smarty->display('color/edit.tpl');
    }

    public function delete() {

        $id = $this->getParam('id');
        $modelcolor = new colorModel();
        $dados['id'] = $id;
        $modelcolor->delColor($dados);

        header('Location: /color');
    }

}

?>
