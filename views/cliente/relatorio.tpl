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
                                            <form role="form" action="/cliente/relatorio" method="POST" enctype="multipart/form-data">
                                                <input  class="form-control" type="text" placeholder="Cliente" name="nome_cliente" id="nome_cliente"><br>
                                                <input  class="form-control" type="number" placeholder="RG" name="rg_cliente" id="rg_cliente"><br>
                                                <input  class="form-control" type="number" placeholder="CPF" name="cpf_cliente" id="cpf_cliente"><br>
                                                <input  class="form-control" type="number" placeholder="Cracha Status (1 = Emitido 0 = Não Emitido)" name="cracha_stat" id="cracha_stat"><br>
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
                                                    <th>RG</th>
                                                    <th>CPF</th>
                                                    <th>Telefone</th>
                                                    <th>Status do Crachá</th>
                                                    <th>Data Cadastro</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {foreach from=$listacliente item="linha"}
                                                    <tr>                                                                
                                                        <td>{$linha.id_cliente}</td>
                                                        <td>{$linha.nome_cliente}</td>
                                                        <td>{$linha.rg_cliente}</td>
                                                        <td>{$linha.cpf_cliente|default:"-"}</td>
                                                        <td>{$linha.telefone_cliente}</td>
                                                        <td>{if $linha.cracha_stat == 1}
                                                            <p style="color:red">Emitido</p>
                                                            {else}
                                                                <p>Não Emitido</p>
                                                            {/if}</td>
                                                        <!-- <td>$linha.cracha_stat}</td> -->
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
