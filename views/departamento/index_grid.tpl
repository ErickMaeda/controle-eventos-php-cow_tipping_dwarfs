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
                        {foreach from=$listdepartamento item="linha"}
                            <tr>                                                                
                                <td>{$linha.id_departamento}</td>
                                <td>{$linha.des_departamento}</td>
                                <td>
                                    <a href="/departamento/edit/id_departamento/{$linha.id_departamento}">Editar</a> | 
                                    <a href="/departamento/delete/id_departamento/{$linha.id_departamento}" class="del">Deletar</a>
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