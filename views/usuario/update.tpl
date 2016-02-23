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
                            <form role="form" action="/usuario/update/id_usuario/{$registro.id_usuario}" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel panel-body">
                                        <div class="col-xs-12">
                                            <div class="row">

                                                <input type="hidden" class="form-control" id="id_usuario" name="id_usuario" value="{$registro.id_usuario}">
                                                <br>

                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <label for="name">Nome</label>
                                                        <input type="input" class="form-control" id="nome_usuario" name="nome_usuario" value="{$registro.nome_usuario}" minlength="3" style="width: 250px">                        
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="row">
                                                        <label for="name">E-mail</label>
                                                        <input type="email" class="form-control" id="email_usuario" name="email_usuario" value="{$registro.email_usuario}" required style="width: 250px">

                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="row">
                                                        <label for="name">Senha</label>
                                                        <input type="password" class="form-control" id="senha_usuario" name="senha_usuario" value="" minlength="4" required style="width: 250px">
                                                    </div>
                                                </div>
                                            </div>   

                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-default" style="width: 85px">Atualizar</button>
                                <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Cancelar</button>
                            </form>
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
