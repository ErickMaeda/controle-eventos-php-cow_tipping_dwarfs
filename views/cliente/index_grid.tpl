<div class="panel panel-default">
    <div class="panel panel-body">
        <div class="col-xs-12">
            <div class="row">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Cadastrado em</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$listcliente item="linha"}
                            <tr>                                                                
                                <td>{$linha.id_cliente}</td>
                                <td>{$linha.nome_cliente}</td>
                                <td>{$linha.dt_cadastro|date_format:"%d/%m/%Y %H:%M:%S"}</td>

                                <td>                   
                                    <a href="/cliente/detalhes/id_cliente/{$linha.id_cliente}">Detalhes</a> |
                                    <a href="/cliente/edit/id_cliente/{$linha.id_cliente}">Editar</a> | 
                                    <a href="/cliente/delete/id_cliente/{$linha.id_cliente}" class="del">Deletar</a>
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