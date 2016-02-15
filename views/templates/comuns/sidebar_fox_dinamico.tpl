{foreach from=$dados_pai item="menu_pai"}  
    <!--<ul class="nav navbar-nav side-nav"> -->
        <li class="dropdown">
        <li><a href="{$menu_pai.link}" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> {$menu_pai.descricao}<b class="caret"></b></a></li>    
        <ul class="dropdown-menu">            
              {foreach from=$dados_filho item="menu_filho" } 
                {if ($menu_filho.id_pai==$menu_pai.id)}                
                    <li>                       
                        <a href="{$menu_filho.link}"><i class="fa fa-bar-chart-o"></i>{$menu_filho.descricao}</a>
                    </li>
                {/if}
            {/foreach} 
          
        </ul>
        </li>
        <!-- /.nav-second-level -->  
    <!--</ul> -->     
{/foreach}