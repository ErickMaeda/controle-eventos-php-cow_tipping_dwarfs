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

                                            <form role="form" action="/produto/save" method="POST" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <label for="name">Nome do Produto</label>

                                                        <input type="input" class="form-control" id="des_produto" name="des_produto" required style="width: 250px">
                                                    </div>
                                                    <div class="row">
                                                        <label for="name">Departamento</label><br>
                                                        <select type="input" name=id_departamento id=id_departamento class="btn btn-default dropdown-toggle" style="width: 250px">
                                                            {foreach from=$departamento item=$linha}
                                                                <option value="{$linha.id_departamento}">{$linha.des_departamento}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>

                                                    <div class="row">
                                                        <label for="name">Quantidade Estoque</label><br>
                                                        <input type="input" class="form-control" id="qtd_produto" name="qtd_produto" required style="width: 250px">
                                                    </div>
                                                </div>                                                                
                                                <button type="submit" class="btn btn-default" style="width: 85px">Salvar</button>
                                                <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Cancelar</button>
                                            </form>

                                        </div>
                                    </div>
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
