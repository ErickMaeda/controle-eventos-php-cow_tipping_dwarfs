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
                            <form role="form" action="/evento/update" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel panel-body">
                                        <div class="col-xs-12">
                                            <div class="row">
                                                <div class="col-md-2 " >
                                                    <label for="name">Cidade</label>
                                                    <select type="input" name=id_cidade id=id_cidade class="btn btn-default dropdown-toggle form-control" >
                                                        {foreach from=$cidade item=$linha}
                                                            <option value="{$linha.id_cidade}">{$linha.des_cidade}</option>
                                                        {/foreach}
                                                    </select> 
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="name">Descricao</label>
                                                    <input type="input" class="form-control " id="des_evento" name="des_evento" required>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="name">Status do evento</label>
                                                    <select type="input" name="status_evento" id="status_evento" class="btn btn-default dropdown-toggle form-control" >
                                                        <option value="1">ABERTO</option>
                                                        <option value="2">FECHADO</option>
                                                    </select> 
                                                </div>
                                                <br>
                                                <button type="submit" class="btn btn-default">Save</button>
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
