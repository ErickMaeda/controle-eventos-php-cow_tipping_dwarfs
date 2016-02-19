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
                                        <div class="col-md-4">
                                            <form role="form" action="/participacao/busca_cliente" method="POST" enctype="multipart/form-data">
                                                <input  class="form-control" type="text" placeholder="Cliente" required="true" name="nome_cliente" id="nome_cliente">
                                                <br>
                                                <button type="submit" class="btn btn-default"> BUSCAR </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel panel-body">
                                    <div class="col-xs-12">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Nome Cliente</th>
                                                    <th>Ação</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {foreach from=$listacliente item="linha"}
                                                    <tr>                                                                
                                                        <td>{$linha.id_cliente}</td>
                                                        <td>{$linha.nome_cliente}</td>
                                                        <td>
                                                            <a href="/participacao/busca_cliente/id_cliente/{$linha.id_cliente}">Selecionar</a>
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
                    </div>
                </div>
                <!-- /#page-content-wrapper -->
            </div>
            <!-- /#wrapper -->
            {include file="comum/footer.tpl"}
    </body>
</html>
