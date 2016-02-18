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
                                    <tr><td>ID</td>  <td>{$registro.id_cliente}</td></tr>
                                    <tr><td>NOME</td>  <td>{$registro.nome_cliente}</td></tr>
                                    <tr><td>CODIGO UC</td>  <td>{$registro.codigo_uc}</td></tr>
                                    <tr><td>CODIGO NIS</td>  <td>{$registro.codigo_nis}</td>  </tr>        
                                    <tr><td>CPF</td>  <td>{$registro.cpf_cliente}</td>  </tr>                                
                                    <tr><td>RG</td>  <td>{$registro.rg_cliente}</td>  </tr>      
                                    <tr><td>ENDERECO</td>  <td>{$registro.endereco_cliente}</td>  </tr>                                
                                    <tr><td>CIDADE</td>  <td>{$cidade.des_cidade}</td>  </tr>                                
                                    <tr><td>ESTADO</td>  <td>{$estado.des_estado}</td>  </tr>                                
                                    <tr><td>DATA CADASTRO</td>  <td>{$registro.dt_cadastro}</td>  </tr>                                

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
