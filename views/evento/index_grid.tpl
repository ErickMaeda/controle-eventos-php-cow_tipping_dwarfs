<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>CIDADE</th>
            <th>DESCRICAO</th>
            <th>STATUS DO EVENTO</th>
            <th>DATA DE CADASTRO</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$listevento item="linha"}
            <tr>                                                                
                <td>{$linha.id_evento}</td>
                <td>{$cidade.des_cidade}</td>
                <td>{$linha.des_evento}</td>
                <td>{$linha.status_evento}</td>
                <td>{$linha.dt_cadastro}</td>

                <td>                   
                    <a href="/evento/detalhes/id_evento/{$linha.id_evento}">Detalhes</a> |
                    <a href="/evento/edit/id_evento/{$linha.id_evento}">Editar</a> | 
                    <a href="/evento/delete/id_evento/{$linha.id_evento}" class="del">Deletar</a>
                </td>
            </tr>
        {foreachelse}
            <tr><td colspan="100%">Empty Table</td></tr>
        {/foreach}          
    </tbody>
</table>