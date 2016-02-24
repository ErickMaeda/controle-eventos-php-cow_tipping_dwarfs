<?php

class controller extends System {

    public $smarty;
    public $mail;
    public $trail;
    public $template;
    public $path_root;

    protected function view($name, $vars = NULL) {
        if (is_array($vars) && count($vars) > 0) {
            extract($vars, EXTR_PREFIX_ALL, 'view');
        }
        return require_once(VIEWS . $name . '.php');
    }

    public function __construct() {
        
        parent::__construct();
        $this->path_root = HTTP_ROOT;

        /* Carregando Smarty */
        $this->smarty = new Smarty;
        $this->smarty->debugging = false;
        $this->smarty->force_compile = true;
        $this->smarty->caching = true;
        $this->smarty->template_dir = SMARTYDIR;
        $this->smarty->compile_dir = ROOT_APP . "/tmp/";
        $this->smarty->config_dir = SMARTYDIR . "/configs/";
        $this->smarty->cache_dir = ROOT_APP . "/tmp/cache/";
        $this->smarty->assign('HTTP_ROOT', HTTP_ROOT);
        $this->template = new template($this->smarty);
    }

    public function paginador($pagina = 1, $total = 0, $controler) {
        $html = '';
        //maximo de registros por tela
        $total_reg = 10;
        //calcula quantas telas
        $maxpaginas = intval($total / $total_reg);
        //adiciona mais uma tela em caso de divisao com quebra
        $temmod = $total % $total_reg;
        if ($temmod)
            $maxpaginas = $maxpaginas + 1;
        // decide primeira
        if ($pagina == 1)
            $link_primeiro = " << ";
        else {
            $link_primeiro = "<a href='/$controler/paginacao/pagina/1'><<</a>";
        }
        //decide anterior 
        if ($pagina == 1)
            $link_anterior = " < ";
        else {
            $anterior = $pagina - 1;
            $link_anterior = "<a href='/$controler/paginacao/pagina/" . $anterior . "'><</a>";
        }
        // decide proxima
        if ($maxpaginas == $pagina)
            $link_posterior = " > ";
        else {
            $link_posterior = "<a href='/$controler/paginacao/pagina/" . ($pagina + 1) . "'> > </a>";
        }
        //decide ultima
        if ($maxpaginas == $pagina)
            $link_ultimo = " >> ";
        else {
            $link_ultimo = "<a href='/$controler/paginacao/pagina/" . $maxpaginas . "'>>></a>";
        }
        $label_total = ' Total de Registros: ' . $total;
        // Monta a barra de Navegacao        
        $html .= $link_primeiro . "  |  " . $link_anterior . " | " . $link_posterior . " | " . $link_ultimo . " " . $label_total;

        return $html;
    }

}
