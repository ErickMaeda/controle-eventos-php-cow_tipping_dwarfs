{foreach from=$dados_menu item="menu_principal"}
    {if {$menu_principal.filhos|count}==0}    
        <li><a href="{$menu_principal.link}"><i class="fa fa-bar-chart-o"></i> {$menu_principal.descricao}</a></li>
    {else}
        <li class="dropdown">        
            <a href="{$menu_principal.link}" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> {$menu_principal.descricao}<b class="caret"></b></a>        
            {foreach from=$menu_principal.filhos item="itens_menu"}            
                <ul class="dropdown-menu">
                    <li>                       
                        <a href="{$itens_menu.link}"><i class="fa fa-bar-chart-o"></i> {$itens_menu.descricao}</a>
                    </li>             
                </ul>            
            {/foreach}  
        </li>                    
    {/if} 
{/foreach}