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
                                            <form role="form" action="/participacao/relatorio" method="POST" enctype="multipart/form-data">
                                                <input  class="form-control" type="text" placeholder="Cliente" name="nome_cliente" id="nome_cliente"><br>
                                                <input  class="form-control" type="text" placeholder="Evento" name="des_evento" id="des_evento"><br>
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
                                                    <th>Evento</th>
                                                    <th>Cliente</th>
                                                    <th>Data do Cadastro</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {foreach from=$listacliente item="linha"}
                                                    <tr>                                                                
                                                        <td>{$linha.des_evento}</td>
                                                        <td>{$linha.nome_cliente}</td>
                                                        <td>{$linha.dt_cadastro|date_format:"%d/%m/%Y %H:%M:%S"}</td>
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
