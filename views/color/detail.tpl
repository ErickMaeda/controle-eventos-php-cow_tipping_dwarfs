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
                             <h1>Color Details</h1>
                            <table class="table table-striped">                        
                                <tbody>
                                    <tr><td>id</td>  <td>{$registro.id}</td></tr>
                                    <tr><td>name</td>  <td>{$registro.name}</td></tr>
                                    <tr><td>created</td>  <td>{$registro.created}</td></tr>
                                    <tr><td>active</td>  <td>{$registro.active}</td>  </tr>                                
                                </tbody>
                            </table>                            


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
