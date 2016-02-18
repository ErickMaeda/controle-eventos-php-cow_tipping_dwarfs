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
                            <table class="table table-striped">                        
                                <tbody>
                                    <tr><td>ID</td>  <td>{$registro.id_evento}</td></tr>
                                    <tr><td>CIDADE</td>  <td>{$cidade.des_cidade}</td></tr>
                                    <tr><td>DESCRICAO</td>  <td>{$registro.des_evento}</td></tr>
                                    <tr><td>STATUS DO EVENTO</td>  <td>{$registro.status_evento}</td>  </tr>        
                                    <tr><td>DATA CADASTRO</td>  <td>{$registro.dt_cadastro}</td>                               
                                </tbody>
                            </table>  
                            <input class="btn btn-default" type="reset" value="VOLTAR" name="btnnao" onclick="window.history.back();"/>



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
