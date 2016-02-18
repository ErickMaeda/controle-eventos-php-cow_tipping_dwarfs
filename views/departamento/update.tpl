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

                                            <form role="form" action="/departamento/update/id_departamento/{$registro.id_departamento}" method="POST" enctype="multipart/form-data">
                                                <input type="hidden" class="form-control" id="id_departamento" name="id_departamento" value="{$registro.id_departamento}">

                                                <div class="form-group">
                                                    <label for="name">Descrição</label>
                                                    <input required="true" type="input" class="form-control" id="des_departamento" name="des_departamento" value="{$registro.des_departamento}" style="width: 250px">
                                                </div>  
                                                <button type="submit" class="btn btn-default" style="width: 85px">Atualizar</button>
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
