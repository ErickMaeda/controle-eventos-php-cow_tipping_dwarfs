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

                                            <table class="table table-striped">                        
                                                <tbody>
                                                    <tr><td>ID</td>  <td>{$registro.id_cliente}</td></tr>
                                                    <tr><td>Nome</td>  <td>{$registro.nome_cliente}</td></tr>
                                                    <tr><td>Código UC</td>  <td>{$registro.codigo_uc}</td></tr>
                                                    <tr><td>Código NIS</td>  <td>{$registro.codigo_nis}</td>  </tr>        
                                                    <tr><td>CPF</td>  <td>{$registro.cpf_cliente}</td>  </tr>                                
                                                    <tr><td>RG</td>  <td>{$registro.rg_cliente}</td>  </tr>      
                                                    <tr><td>Endereço</td>  <td>{$registro.endereco_cliente}</td>  </tr>                                
                                                    <tr><td>Cidade</td>  <td>{$cidade.des_cidade}</td>  </tr>                                
                                                    <tr><td>Estado</td>  <td>{$estado.des_estado}</td>  </tr>                                
                                                    <tr><td>Data de Cadastro</td>  <td>{$registro.dt_cadastro|date_format:"%d/%m/%Y %H:%M:%S"}</td>  </tr>                                

                                                </tbody>
                                            </table>  
                                            <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Voltar</button>

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
