<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Produto</th>
            <th>Departamento</th>

        </tr>
    </thead>
    <tbody>
        {foreach from=$listproduto item="linha"}
            <tr>                                                                
                <td>{$linha.id_produto}</td>
                <td>{$linha.des_produto}</td>
                <td>{$linha.des_departamento}</td>

                 <td> 
                     <a href="/produto/edit/id_produto/{$linha.id_produto}">Editar</a> | 
                     <a href="/produto/delete/id_produto/{$linha.id_produto}" class="del">Deletar</a>
                 </td>
            </tr>
        {foreachelse}
            <tr><td colspan="100%">Tabela Vazia</td></tr>
        {/foreach}          
    </tbody>
</table>