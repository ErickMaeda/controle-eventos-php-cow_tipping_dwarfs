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
                            <h1>Cliente</h1>
                            
                            <a href="/cliente/insert" class="btn btn-default" id="btn_novo">Novo Cliente</a>
                            <br><br>
                            {include file="cliente/index_grid.tpl"}
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
