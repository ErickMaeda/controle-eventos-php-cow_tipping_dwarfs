<?php

/**
 * Description of template
 *
 * @author dcaetano
 */
class template {

    protected $title;
    protected $css = array();
    protected $js = array();
    protected $path_root;
    protected $settings;
    public $smarty;
    public $public_pages = array();
    public $permissoes;

    public function __construct($objSmarty) {
        $this->smarty = $objSmarty;
        $this->public_pages = array('login', 'erro');
 
    }

    public function setTitle($title = NOME_SITE) {
        $this->title = $title;
    }

    public function fetchCSS($css) {
        $this->css[] = $this->path_root . $css;
    }

    public function fetchJS($js) {
        $this->js[] = $this->path_root . $js;
    }

    public function top() {
        // $top = $this->smarty->fetch("comuns/top.html");
        // $this->smarty->assign('top', $top);
    }

    public function header() {
        $this->smarty->assign('path_root', $this->path_root);
        $this->smarty->assign('title', $this->title);
        $this->smarty->assign('css', $this->css);
        $this->smarty->assign('js', $this->js);

        // $head = $this->smarty->fetch("comuns/head.html");
        // $this->smarty->assign('head', $head);
    }

    public function footer() {
        //$rodape = $this->smarty->fetch("comuns/footer.html");
        // $this->smarty->assign('rodape', $rodape);
    }

    public function run() {
        //$this->permissoes->check_login($this->public_pages);
        //$this->top();
        $this->header();
        $this->footer();
    }

}

?>
