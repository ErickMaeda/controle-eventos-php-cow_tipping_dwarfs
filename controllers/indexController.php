<?php

class index extends controller {

    public function index_action() {
        if (isset($_SESSION['usuario']['email'])) {
            $this->smarty->display('index/index.tpl');
        }  else {
            $this->smarty->display('login/index.tpl');
        }
    }

}
