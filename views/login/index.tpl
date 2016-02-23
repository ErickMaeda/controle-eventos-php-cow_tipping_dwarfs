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
                            <h1>BEM VINDO AO CONTROLE DE EVENTOS!</h1>
                            <p>VENHAM SE DIVERTIR MAS PRIMEIRO É PRECISO REALIZAR O LOGIN</p>
                            <br>
                            <br>
                            <br>
                            <form role="form" action="/login/validaLogin" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-body">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <input type="text" class="form-control col-md-4" id="email" name="email" placeholder="Email" required="Email é obrigatório">
                                        </div>
                                        <div class="col-md-3">
                                            <input type="password" class="form-control col-md-4" id="senha" name="senha" placeholder="Senha" required="Senha é obrigatória">
                                        </div>
                                    </div>                 
                                    <br>
                                    {if isset($error)}
                                        <div class="row">
                                            <div class="col-md-3">
                                                <p style="color: red">
                                                    Usuario e/ou Senha incorretas
                                                </p>
                                            </div>
                                        </div>
                                    {/if}

                                    <div class="row">
                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-default col-md-4">ENTRAR</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <p><img src="/files/logos/calendar.jpg"></p>     
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
