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

                            <form role="form" action="/produto/save" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <br>
                                    <label for="name">Nome do Produto</label>

                                    <input type="input" class="form-control" id="des_produto" name="des_produto" required style="width: 250px">
                                    <br>
                                    
                                    <label for="name">Departamento</label><br>
                                    <select type="input" name=id_departamento id=id_departamento class="btn btn-default dropdown-toggle" >
                                        {foreach from=$departamento item=$linha}
                                            <option value="{$linha.id_departamento}">{$linha.des_departamento}</option>
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
