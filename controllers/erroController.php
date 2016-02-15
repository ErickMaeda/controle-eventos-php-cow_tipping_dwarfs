<?php

class erro extends controller {

    public function index_action() {
        $msg = isset($_SESSION['erro']['msg']) ? $_SESSION['erro']['msg'] : null;
        $this->smarty->assign('title', 'Oops!');
        $this->smarty->assign('msg', $msg);
        $this->smarty->display('erros/index.tpl');
    }

}

?>
