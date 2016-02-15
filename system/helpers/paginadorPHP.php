<?php
/*
 * Desenvolvido por Fabio Alvaro Pereira
 * use as variaveis nos templates smarty
 *  $smarty.session.paginacao.botoes.primeiro = link para o Primeiro Registro
 *  $smarty.session.paginacao.botoes.meio = LI de itens de paginas
 *  $smarty.session.paginacao.botoes.ultimo = link para o Ultimo Registro
 *  $smarty.session.paginacao.atual = Pagina Atual
 *  $smarty.session.paginacao.total_paginas = Total de Paginas
 *  $smarty.session.paginacao.total_registros = Registros Disponiveis.
 * Exemplos:
 *               <div class="col-lg-6">                       
                        <ul class="pager">
                            <li class="previous  {if ($smarty.session.paginacao.atual==1)}disabled{/if}">{$smarty.session.paginacao.botoes.anterior}</li>
                            <li class="next {if $smarty.session.paginacao.atual==$smarty.session.paginacao.total_paginas}disabled{/if}">{$smarty.session.paginacao.botoes.proximo}</li>
                        </ul>
                    </div>              
                    <ul class="pagination">
                        <li>{$smarty.session.paginacao.botoes.primeiro}</li>
                            {$smarty.session.paginacao.botoes.meio} 
                        <li>{$smarty.session.paginacao.botoes.ultimo}</li>
                    </ul>  
 */

class paginadorPHP {

    public $limite;
    public $url;
    private $pagina_atual;
    public $TotalDeRegistros;

    function __construct() {
       // $_SESSION["paginacao"]["botoes"]["meio"]=null;
        //$this->pagina_atual=1;
    }
    
    //Define pagina atual
    public function setPaginaAtual($pagina=1){
        $this->pagina_atual=$pagina;
        $_SESSION["paginacao"]["atual"]=$this->pagina_atual;
    }
    //Define pagina atual
    public function getPaginaAtual(){
      return  $this->pagina_atual; 
    }    

    public function gerar() {
        //Calcula Paginas
        $_SESSION["paginacao"]["botoes"]["meio"] = null;
        $_SESSION["paginacao"]["limite"] = $this->limite;
        $_SESSION["paginacao"]["url"] = $this->url;
        $_SESSION["paginacao"]["total_registros"] = $this->TotalDeRegistros;
        $_SESSION["paginacao"]["total_paginas"] = round($_SESSION["paginacao"]["total_registros"] / $_SESSION["paginacao"]["limite"], 0);


        for ($index = 1; $index < $_SESSION["paginacao"]["total_paginas"] + 1; $index++) {
            $ativa = ($_SESSION["paginacao"]["atual"] == ($index)) ? 'class="active"' : '';
            $link = $_SESSION["paginacao"]["url"] . '/pagina/' . ($index);
            $_SESSION["paginacao"]["botoes"]["meio"].="<li " . $ativa . "><a href='" . $link . "'>" . ($index) . "</a></li> ";
        }

        // configura botoes    
        if (($_SESSION["paginacao"]["atual"] - 1) > 0) {
            $_SESSION["paginacao"]["botoes"]["anterior"] = "<a href='" . $_SESSION["paginacao"]["url"] . "/pagina/" . ($_SESSION["paginacao"]["atual"] - 1) . "'>Anterior</a>";
        } else {
            $_SESSION["paginacao"]["botoes"]["anterior"] = "<a href='#'>Anterior</a>";
        }

        $_SESSION["paginacao"]["botoes"]["primeiro"] = "<a href='" . $_SESSION["paginacao"]["url"] . "/pagina/1'>Primeiro botao</a>";
        $_SESSION["paginacao"]["botoes"]["ultimo"] = "<a href='" . $_SESSION["paginacao"]["url"] . "/pagina/" . $_SESSION["paginacao"]["total_paginas"] . "'>Ultimo botao</a>";

        if (($_SESSION["paginacao"]["atual"] + 1) < $_SESSION["paginacao"]["total_paginas"]) {
            $_SESSION["paginacao"]["botoes"]["proximo"] = "<a href='" . $_SESSION["paginacao"]["url"] . "/pagina/" . ($_SESSION["paginacao"]["atual"] + 1) . "'>Proximo</a>";
        } else {
            $_SESSION["paginacao"]["botoes"]["proximo"] = "<a href='#'>Proximo</a>";
        }
    }

}

?>
