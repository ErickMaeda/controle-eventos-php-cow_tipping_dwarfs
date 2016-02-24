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
                            <form role="form" action="/cliente/update/id_cliente/{$cliente.id_cliente}" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel panel-body">
                                        <div class="col-xs-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label for="name">Nome</label>
                                                    <input type="input" class="form-control" id="nome_cliente" value="{$cliente.nome_cliente}" name="nome_cliente" required>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="name">CPF</label>
                                                    <input type="number" class="form-control obg" id="cpf_cliente" value="{$cliente.cpf_cliente}" name="cpf_cliente" minlength="8" required>    
                                                </div>
                                            </div>  
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label for="name">RG</label>
                                                    <input type="number" class="form-control obg" id="rg_cliente" value="{$cliente.rg_cliente}" name="rg_cliente" minlength="6" required>  
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="name">UC</label>
                                                    <input type="number" class="form-control obg" id="codigo_uc" value="{$cliente.codigo_uc}" name="codigo_uc" required>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="name">NIS</label>
                                                    <input type="number" class="form-control obg" id="codigo_nis" value="{$cliente.codigo_nis}" name="codigo_nis" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label for="name">Telefone</label>
                                                    <input type="number" class="form-control" id="telefone_cliente" value="{$cliente.telefone_cliente}" name="telefone_cliente" minlength="8" required>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="name">Endereco</label>
                                                    <input type="input" class="form-control" id="endereco_cliente" value="{$cliente.endereco_cliente}" name="endereco_cliente">         
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="name">Cidade</label>
                                                    <select type="input" name=id_cidade id=id_cidade class="btn btn-default dropdown-toggle form-control" >
                                                        {foreach from=$cidade item=$linha}
                                                            {if $linha.id_cidade == $id_choosen_cidade}
                                                                <option value="{$linha.id_cidade}" selected="selected">{$linha.des_cidade}</option>
                                                            {else}
                                                                <option value="{$linha.id_cidade}" >{$linha.des_cidade}</option>
                                                            {/if}
                                                        {/foreach}
                                                    </select> 
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="name">Estado</label>
                                                    <select type="input" name=id_estado id=id_estado class="btn btn-default dropdown-toggle form-control" >
                                                        {foreach from=$estado item=$linha}
                                                            {if $linha.id_estado == $id_choosen_estado}
                                                                <option value="{$linha.id_estado}" selected="selected">{$linha.des_estado}</option>
                                                            {else}
                                                                <option value="{$linha.id_estado}" >{$linha.des_estado}</option>
                                                            {/if}
                                                        {/foreach}
                                                    </select> 
                                                </div>
                                            </div>
                                            <br>
                                            <button type="submit" class="btn btn-default" style="width: 85px">Atualizar</button>
                                            <button type="reset" class="btn btn-default" onclick="window.history.back();" style="width: 85px">Cancelar</button>
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
