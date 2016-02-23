<div class="panel panel-default">
    <div class="panel panel-body">
        <div class="col-xs-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome Cliente</th>
                        <th>Status do Crachá</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$listacliente item="linha"}
                        <tr>                                                                
                            <td>{$linha.id_cliente}</td>
                            <td>{$linha.nome_cliente}</td>
                            <td>
                                {if $linha.cracha_stat == 0}
                                    <a href="/cracha/emissao/id_cliente/{$linha.id_cliente}">Emitir</a>
                                {else $linha.cracha_stat == 1}
                                    <p style="color:red" >Emitido</p>
                                {/if}
                                    <!--
                                else
                                    <a style="color:black">Não participante de evento.</a>
                                /if
                                 Aqui vai o IF ELSE para o info: Emitir, Emitido, Sem Evento-->
                            </td>
                        </tr>
                    {foreachelse}
                        <tr><td colspan="100%">Tabela Vazia</td></tr>
                    {/foreach}          
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="/files/js/util.js"></script>
