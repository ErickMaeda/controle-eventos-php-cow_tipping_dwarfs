<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Usuário</th>

        </tr>
    </thead>
    <tbody>
        {foreach from=$listusuario item="linha"}
            <tr>                                                                
                <td>{$linha.id_usuario}</td>
                <td>{$linha.nome_usuario}</td>
                <td>
                    <a href="/usuario/edit/id_usuario/{$linha.id_usuario}">Editar</a> | 
                    <a href="/usuario/delete/id_usuario/{$linha.id_usuario}" class="del">Deletar</a>
                </td>
            </tr>
        {foreachelse}
            <tr><td colspan="100%">Tabela Vazia</td></tr>
        {/foreach}          
    </tbody>
</table>