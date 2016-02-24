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
                            <form role="form" action="/evento/produto_save/id_evento/{$id_evento}" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel panel-body">
                                        <div class="col-xs-12">
                                            <div class="row">
                                                <div class="col-md-2 " >
                                                    <label for="name">Produto</label>
                                                    <select type="input" name=id_produto id=id_produto class="btn btn-default dropdown-toggle form-control" >
                                                        {foreach from=$produto item=$linha}
                                                            <option value="{$linha.id_produto}">{$linha.des_produto}</option>
                                                        {/foreach}
                                                    </select> 
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="name">Quantidade</label>
                                                    <input type="number" class="form-control " id="qtd_produto" name="qtd_produto" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-default" style="width: 85px">Salvar</button>
                                <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Cancelar</button>
                            </form>
                        </div>
                    </div>
                </div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Evento</th>
                            <th>Produto</th>
                            <th>Quantidade</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$produto_evento item="linha"}
                            <tr>                                                                
                                <td>{$linha.des_evento}</td>
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
            <!-- /#page-content-wrapper -->
        </div>
        <!-- /#wrapper -->
        {include file="comum/footer.tpl"}
    </body>
</html>
