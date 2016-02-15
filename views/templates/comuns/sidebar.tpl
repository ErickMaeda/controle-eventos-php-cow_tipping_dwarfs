<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a class="navbar-brand" href="/dashboard"><img src="/files/images/logo-fox-menor.png"> {$smarty.const.NOME_APLICACAO}</a>            
        </div>        
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">   
        
        {if isset($smarty.session.user.nome)}
             <ul class="nav navbar-nav side-nav">     
                 {$smarty.session.user.menu_sidebar}
{*                 <li class="active"><a href="/dashboard"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                <li><a href="/geolocalizacao">Geo Localização</a></li>
                <li><a href="/reclamacao"><i class="fa fa-desktop"></i> SAC - Reclamações</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> Relatorios<b class="caret"></b></a>
                    <ul class="dropdown-menu"> 
                        <li><a href="/log/relatorio001_pre"><i class="fa fa-bar-chart-o"></i>Logs</a></li>
                        <li><a href="/parceiros_relatorio/rel_pre_cid_atd"><i class="fa fa-bar-chart-o"></i>Cidades Atendidas</a></li>
                        <li><a href="/rota_status/relatorio001_pre_rota_status"><i class="fa fa-bar-chart-o"></i>Rota de Status</a></li>
                        <li><a href="/menu/relatoriomenu_pre"><i class="fa fa-bar-chart-o"></i> Menus</a></li>
                        <li><a href="/unidadeconsumidora/relatorio001_pre_unidadeconsumidora"><i class="fa fa-bar-chart-o"></i>Unidade Consumidora</a></li>
                        <li><a href="/log_tipo/relatorio001_pre_log_tipo"><i class="fa fa-bar-chart-o"></i> Tipos de Logs</a></li>
                        <li><a href="/documento/relatorio001_pre_documento"><i class="fa fa-bar-chart-o"></i> Documentos</a></li>
                        <li><a href="/documento_tipo/relatorio001_pre_documento_tipo"><i class="fa fa-bar-chart-o"></i> Tipos de Documentos</a></li>
                        <li><a href="/municipio/relatorio001_pre_municipio"><i class="fa fa-bar-chart-o"></i> Municipios</a></li>
                        <li><a href="/motorista/relatorioMotorista001_pre"><i class="fa fa-bar-chart-o"></i> Motoristas</a></li>
                        <li><a href="/perfil/relatorioperfil_pre"><i class="fa fa-bar-chart-o"></i> Perfil</a></li>
                        <li><a href="/unidadeconsumidora/relatorio001_pre_unidadeconsumidora"><i class="fa fa-bar-chart-o"></i> Unidade Consumidora</a></li>
                        <li><a href="/rota/relatorio001_pre"><i class="fa fa-bar-chart-o"></i> Rotas</a></li>
                        <li><a href="/rota/relatorio001_pre"><i class="fa fa-bar-chart-o"></i> Rotas</a></li>
                        <li><a href="/acompanhamento/visualizarAcompanhamento"><i class="fa fa-bar-chart-o"></i> Acompanhamentos</a></li>
                        <li><a href="/ajudante/ajudante_rel_pre"><i class="fa fa-bar-chart-o"></i> Ajudante</a></li>
                        <li><a href="/manufatura_reversa/manufatura_reversa_tab"><i class="fa fa-edit"></i> Manufatura Reversa</a></li>                   
                    </ul>
                </li> 
                <li><a href="/importar"><i class="fa fa-desktop"></i> Enviar Nova Base</a></li>
                <li><a href="/importarFox"><i class="fa fa-desktop"></i> Integrar Nova Base</a></li>
                <li><a href="/cronograma"><i class="fa fa-desktop"></i> Cronograma</a></li>
                <li><a href="/reclamacao"><i class="fa fa-desktop"></i> Comprovações</a></li> -->
                {include file="comuns/sidebar_fox.tpl"}
*}                  
             </ul>        
             <ul class="nav navbar-nav navbar-right navbar-user">
                 <li><a href="/dashboard">Dashboard</a></li>
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> {if isset($smarty.session.user.nome)}{$smarty.session.user.nome}{/if} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/profile"><i class="fa fa-user"></i> Perfil</a></li>                                                
                        <li class="divider"></li>
                        <li><a href="/trocar_senha/troca_senha"><i class="fa fa-user"></i>Trocar Senha</a></li>
                        <li class="divider"></li>
                        <li><a href="/login/logout"><i class="fa fa-power-off"></i> Sair</a></li>
                    </ul>
                </li>
             </ul>
        {else}
             <ul class="nav navbar-nav side-nav">
                <li class="active"><a href="/login"><i class="fa fa-dashboard"></i> Login</a></li>
             </ul>
        {/if}
    </div><!-- /.navbar-collapse -->
</nav>