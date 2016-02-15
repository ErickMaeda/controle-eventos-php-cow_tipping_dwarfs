<?php

class blank extends controller {

    public function index_action() {
        
    //Chama o Smarty
         $this->smarty->assign('title', 'Blank');
         $this->smarty->display('blank/index.tpl');
    }


}

?>
