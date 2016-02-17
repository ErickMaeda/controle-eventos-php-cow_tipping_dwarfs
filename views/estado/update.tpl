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
                            <form role="form" action="/estado/update/id_estado/{$registro.id_estado}" method="POST" enctype="multipart/form-data">
                                <input type="hidden" class="form-control" id="id_estado" name="id_estado" value="{$registro.id_estado}">

                                <div class="form-group">
                                    <label for="name">Descrição</label>
                                    <input required="true" type="input" class="form-control" id="des_estado" name="des_estado" value="{$registro.des_estado}">
                                </div>  
                                <button type="submit" class="btn btn-default">Atualizar</button>
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
