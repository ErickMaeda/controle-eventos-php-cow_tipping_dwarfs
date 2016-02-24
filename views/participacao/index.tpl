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
                            <br><br>
                            {include file="participacao/index_grid.tpl"}
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
