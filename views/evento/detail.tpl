<!DOCTYPE html>
<html lang="en">

    <head>

        {include file="comum/head.tpl"}

    </head>

    <body>

        <div id="wrapper">

            <!-- Sidebar -->
            {include file="comum/sidebar.tpl"}
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-lg-12">
                            <h1>{$title}</h1>

                            <div class="panel panel-default">
                                <div class="panel panel-body">
                                    <div class="col-xs-12">
                                        <div class="row">
                                            <table class="table table-striped">                        
                                                <tbody>
                                                    <tr><td>ID</td>  <td>{$registro.id_evento}</td></tr>
                                                    <tr><td>Cidade</td>  <td>{$cidade.des_cidade}</td></tr>
                                                    <tr><td>Descrição</td>  <td>{$registro.des_evento}</td></tr>
                                                    <tr><td>Status do Evento</td>
                                                        <td>{if $registro.status_evento == 1}
                                                            <p style="color:limegreen; font-weight: bold" >Aberto</p>
                                                            {else}
                                                            <p style="color:red; font-weight: bold" >Fechado</p>    
                                                            {/if}
                                                        </td>
                                                    </tr>        
                                                    <tr><td>Data de Cadastro</td>  <td>{$registro.dt_cadastro|date_format:"%d/%m/%Y %H:%M:%S"}</td>                               
                                                </tbody>
                                            </table> 

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>

                <div class="container-fluid">
                    <div class="row">

                        <div class="col-lg-12">
                            <h1>{$title_produto}</h1>

                            <div class="panel panel-default">
                                <div class="panel panel-body">
                                    <div class="col-xs-12">
                                        <div class="row">
                                            <table class="table table-striped">   
                                                <thead>
                                                    <tr>
                                                        <th>PRODUTO</th>
                                                        <th>QUANTIDADE</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {foreach from=$produto item=$linha}
                                                        <tr>
                                                            <td>{$linha.des_produto}</td>
                                                            <td>{$linha.qtd_produto}</td>
                                                            <td>                 
                                                                <a href="/evento/produto_delete/id_evento/{$linha.id_evento}/id_produto/{$linha.id_produto}" class="del">Deletar</a>
                                                            </td>
                                                        </tr> 
                                                    {foreachelse}
                                                        <tr><td colspan="100%">Tabela Vazia</td></tr>
                                                    {/foreach}
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Voltar</button>

                        </div>


                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        {include file="comum/footer.tpl"}

    </body>

</html>
