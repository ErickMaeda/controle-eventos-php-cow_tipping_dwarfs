<div class="panel panel-default">
    <div class="panel panel-body">
        <div class="col-xs-12">
            <div class="row">      
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cidade</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$listcidade item="linha"}
                            <tr>                                                                
                                <td>{$linha.id_cidade}</td>
                                <td>{$linha.des_cidade}</td>
                                <td>{$linha.des_estado}</td>
                                <td> 
                                    <a href="/cidade/edit/id_cidade/{$linha.id_cidade}">Editar</a> | 
                                    <a href="/cidade/delete/id_cidade/{$linha.id_cidade}" class="del">Deletar</a>
                                </td>
                            </tr>
                        {foreachelse}
                            <tr><td colspan="100%">Tabela Vazia</td></tr>
                        {/foreach}          
                    </tbody>
                </table>
                {$paginador}
            </div>
        </div>
    </div>
</div>