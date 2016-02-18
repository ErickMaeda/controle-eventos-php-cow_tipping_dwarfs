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
                            <form role="form" action="/usuario/save" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel panel-body">
                                        <div class="col-xs-12">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-md-12 " >
                                                        <label for="name">Nome</label>
                                                        <input type="input" class="form-control" id="nome_usuario" name="nome_usuario" style="width: 250px">
                                                    </div>

                                                    <div class="col-md-12">
                                                        <label for="name">E-mail</label>
                                                        <input type="email" class="form-control" id="email_usuario" name="email_usuario" required style="width: 250px">
                                                    </div>

                                                    <div class="col-md-12">
                                                        <label for="name">Senha</label>
                                                        <input type="password" class="form-control" id="senha_usuario" name="senha_usuario" minlength="4" required style="width: 250px">
                                                    </div>
                                                </div>   
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                    <button type="submit" class="btn btn-default" style="width: 85px">Salvar</button>
                    <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Cancelar</button>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
        <!-- /#wrapper -->
    {include file="comum/footer.tpl"}

</body>

</html>
