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
                                            <form role="form" action="/cidade/update/id_cidade/{$registro.id_cidade}" method="POST" enctype="multipart/form-data">
                                                <input type="hidden" class="form-control" id="id_cidade" name="id_cidade" value="{$registro.id_cidade}" >
                                                <br>
                                                <div class="form-group">
                                                    <label for="name">Descrição</label>
                                                    <input required="true" type="input" class="form-control" id="des_cidade" name="des_cidade" value="{$registro.des_cidade}" required style="width: 250px">
                                                </div> 
                                                <label for="name">Estado</label><br>
                                                <select type="input" name=id_estado id=id_estado class="btn btn-default dropdown-toggle" style="width: 250px">
                                                    {foreach from=$estado item=$linha}
                                                        {if $linha.id_estado == $id_choosen}
                                                            <option value="{$linha.id_estado}" selected="selected">{$linha.des_estado}</option>
                                                        {else}
                                                            <option value="{$linha.id_estado}" >{$linha.des_estado}</option>
                                                        {/if}
                                                    {/foreach}
                                                </select>
                                                <br>
                                                <br>
                                                <button type="submit" class="btn btn-default" style="width: 85px">Atualizar</button>
                                                <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
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
