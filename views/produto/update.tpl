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

                                            <form role="form" action="/produto/update/id_produto/{$registro.id_produto}" method="POST" enctype="multipart/form-data">
                                                <input type="hidden" class="form-control" id="id_produto" name="id_produto" value="{$registro.id_produto}">
                                                <label for="name">Descrição</label>

                                                <div class="row">
                                                    <div class="input-group">
                                                        <input required="true" type="input" class="form-control" id="des_produto" name="des_produto" value="{$registro.des_produto}" required style="width: 250px">
                                                    </div> 
                                                </div><br>
                                                <label for="name">Departamento</label>
                                                <div class="row">
                                                    <select type="input" name=id_departamento id=id_departamento class="btn btn-default dropdown-toggle" style="width: 250px">
                                                        {foreach from=$departamento item=$linha}
                                                            {if $linha.id_departamento == $id_choosen}
                                                                <option value="{$linha.id_departamento}" selected="selected">{$linha.des_departamento} </option>
                                                            {else}
                                                                <option value="{$linha.id_departamento}" >{$linha.des_departamento}</option>
                                                            {/if}
                                                        {/foreach}
                                                    </select>
                                                </div><br>
                                                <label for="name">Quantidade Estoque</label>
                                                <div class="row">
                                                    <div class="input-group">
                                                        <input required="true" type="input" class="form-control" id="qtd_produto" name="qtd_produto" value="{$registro.qtd_produto}" required style="width: 250px">
                                                    </div> 
                                                </div><br>
                                                <div class="row">
                                                    <button type="submit" class="btn btn-default" style="width: 85px">Atualizar</button>
                                                    <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Cancelar</button>
                                                </div>
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
