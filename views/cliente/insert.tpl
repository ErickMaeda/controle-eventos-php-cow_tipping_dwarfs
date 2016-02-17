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
                                <div class="form-group">
                                    <div class="form-inline">
                                        <label for="name">Nome</label>
                                        <input type="input" class="form-control" id="nome_cliente" name="nome_cliente" required>
                                        <label for="name">UC</label>
                                        <input type="input" class="form-control" id="codigo_uc" name="codigo_uc" required>
                                        <label for="name">NIS</label>
                                        <input type="input" class="form-control" id="codigo_nis" name="codigo_nis" required>
                                        <label for="name">CPF</label>
                                        <input type="input" class="form-control" id="cpf_cliente" name="cpf_cliente" required>                            
                                        <label for="name">RG</label>
                                        <input type="input" class="form-control" id="rg_cliente" name="rg_cliente" required>  
                                    </div>  

                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="form-inline">
                                            <label for="name">Rua</label>
                                            <input type="input" class="form-control" id="rua_cliente" name="rua_cliente" required>                
                                            <label for="name">Cidade</label>
                                            <input type="input" class="form-control" id="id_cidade" name="id_cidade" required>                   
                                            <label for="name">Estado</label>
                                            <input type="input" class="form-control" id="id_estado" name="id_estado" required>                   
                                            <label for="name">Bairro</label>
                                            <input type="input" class="form-control" id="bairro_cliente" name="bairro_cliente" required>                   
                                            <label for="name">Número</label>
                                            <input type="input" class="form-control" id="numero_cliente" name="numero_cliente" required>                   
                                        </div>
                                    </div>
                                </div>                                
                                <button type="submit" class="btn btn-default">Save</button>
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
