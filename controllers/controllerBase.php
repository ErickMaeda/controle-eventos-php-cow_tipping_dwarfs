<?php

class controllerBase {

    //put your code here
    public $smarty;

    public function __construct() {
        //Inicia sempre a sessao.
        session_start();
        /* Carregando Smarty */
        $this->smarty = new Smarty();
        $this->smarty->cache_lifetime = 120;
        $this->smarty->caching = false;
        $this->smarty->setTemplateDir('./view');
    }

    public function ShowMessage($mensagem = "") {
        $_SESSION['msg'] = $mensagem;
    }

    /**
     * 
     * @param type $pagina pagina
     * @param type $total total de registros
     * @return html da barra de navegacao
     */
    public function paginador($pagina = 1, $total = 0) {
        $html = '';
        //maximo de registros por tela
        $total_reg = 3;
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
            $link_primeiro = "<a href='?pagina=1'><<</a>";
        }
        //decide anterior 
        if ($pagina == 1)
            $link_anterior = " < ";
        else {
            $anterior = $pagina - 1;
            $link_anterior = "<a href='?pagina=" . $anterior . "'><</a>";
        }
        // decide proxima
        if ($maxpaginas == $pagina)
            $link_posterior = " > ";
        else {
            $link_posterior = "<a href='?pagina=" . ($pagina + 1) . "'> > </a>";
        }
        //decide ultima
        if ($maxpaginas == $pagina)
            $link_ultimo = " >> ";
        else {
            $link_ultimo = "<a href='?pagina=" . $maxpaginas . "'>>></a>";
        }
        $label_total = ' Total de Registros: ' . $total;
        // Monta a barra de Navegacao        
        $html .= $link_primeiro . "  |  " . $link_anterior . " | " . $link_posterior . " | " . $link_ultimo . " " . $label_total;

        return $html;
    }

}