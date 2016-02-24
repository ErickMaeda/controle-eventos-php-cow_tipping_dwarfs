<div class="panel panel-default">
    <div class="panel panel-body">
        <div class="col-xs-12">
            <div class="row">

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descrição</th>

                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$listestado item="linha"}
                            <tr>                                                                
                                <td>{$linha.id_estado}</td>
                                <td>{$linha.des_estado}</td>
                                <td>
                                    <a href="/estado/edit/id_estado/{$linha.id_estado}">Editar</a> | 
                                    <a href="/estado/delete/id_estado/{$linha.id_estado}" class="del">Deletar</a>
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