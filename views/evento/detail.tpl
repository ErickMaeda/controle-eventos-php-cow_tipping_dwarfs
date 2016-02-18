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
                                    <tr><td>Cidade</td>  <td>{$cidade.des_cidade}</td></tr>
                                    <tr><td>Descrição</td>  <td>{$registro.des_evento}</td></tr>
                                    <tr><td>Status do Evento</td>  <td>{$registro.status_evento}</td>  </tr>        
                                    <tr><td>Data de Cadastro</td>  <td>{$registro.dt_cadastro}</td>                               
                                </tbody>
                            </table>  
                            <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Voltar</button>


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
