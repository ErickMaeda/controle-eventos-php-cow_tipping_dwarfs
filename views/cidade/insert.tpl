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

                            <form role="form" action="/cidade/save" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <br>
                                    <label for="name">Nome da Cidade</label>

                                    <input type="input" class="form-control" id="des_cidade" name="des_cidade" required style="width: 250px">
                                    <br>
                                    
                                    <label for="name">Estado</label><br>
                                    <select type="input" name=id_estado id=id_estado class="btn btn-default dropdown-toggle" >
                                        {foreach from=$estado item=$linha}
                                            <option value="{$linha.id_estado}">{$linha.des_estado}</option>
                                        {/foreach}
                                    </select>

                                </div>                                                                
                                <button type="submit" class="btn btn-default">Salvar</button>
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
