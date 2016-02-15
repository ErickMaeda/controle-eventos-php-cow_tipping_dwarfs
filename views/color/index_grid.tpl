<table class="table table-striped">
    <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>Created</th>
            <th>Active</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$listcolor item="linha"}
            <tr>                                                                
                <td>{$linha.id}</td>
                <td>{$linha.name}</td>
                <td>{$linha.created}</td>
                <td>{if $linha.active eq 1} Enabled{/if}{if $linha.active eq 0} Disabled{/if}</td>  
                 <td><a href="/color/detalhes/id/{$linha.id}">Details</a> | 
                     <a href="/color/edit/id/{$linha.id}">Edit</a> | 
                     <a href="/color/delete/id/{$linha.id}" class="del">Delete</a></td>
            </tr>
        {foreachelse}
            <tr><td colspan="100%">Empty Table</td></tr>
        {/foreach}          
    </tbody>
</table>