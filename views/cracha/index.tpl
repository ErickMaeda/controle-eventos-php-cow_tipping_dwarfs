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
                                            <form role="form" action="/cracha/buscar_cliente" method="POST" enctype="multipart/form-data">
                                                <input  class="form-control" type="text" placeholder="Cliente" required="true" name="nome_cliente" id="nome_cliente">
                                                <br>
                                                <button type="submit" class="btn btn-default"> Buscar Cliente </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {include file="cracha/index_grid.tpl"}
                        </div>
                    </div>
                </div>
                <!-- /#page-content-wrapper -->
            </div>
            <!-- /#wrapper -->
            {include file="comum/footer.tpl"}
    </body>
</html>
