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
                            <form role="form" action="/cliente/save" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel panel-body">
                                        <div class="col-xs-12">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label for="name">Nome</label>
                                                    <input type="input" class="form-control" id="nome_cliente" name="nome_cliente" required>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="name">CPF</label>
                                                    <input type="input" class="form-control" id="cpf_cliente" name="cpf_cliente" required>    
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="name">RG</label>
                                                    <input type="input" class="form-control" id="rg_cliente" name="rg_cliente" required>  
                                                </div>                      
                                            </div>  
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label for="name">UC</label>
                                                    <input type="input" class="form-control" id="codigo_uc" name="codigo_uc" required>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="name">NIS</label>
                                                    <input type="input" class="form-control" id="codigo_nis" name="codigo_nis" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label for="name">Rua</label>
                                                    <input type="input" class="form-control" id="rua_cliente" name="rua_cliente" required>         
                                                </div>
                                                <div class="col-md-1">
                                                    <label for="name">Número</label>
                                                    <input type="input" class="form-control" id="numero_cliente" name="numero_cliente" required>  
                                                </div> 
                                                <div class="col-md-2">
                                                    <label for="name">Bairro</label>
                                                    <input type="input" class="form-control" id="bairro_cliente" name="bairro_cliente" required> 
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="name">Cidade</label>
                                                    <input type="input" class="form-control" id="id_cidade" name="id_cidade" required>  
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="name">Estado</label>
                                                    <input type="input" class="form-control" id="id_estado" name="id_estado" required>  
                                                </div>

                                            </div>
                                            <br>
                                            <button type="submit" class="btn btn-default">Save</button>
                                        </div>
                                    </div>
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
