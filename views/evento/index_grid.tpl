<div class="panel panel-default">
    <div class="panel panel-body">
        <div class="col-xs-12">
            <div class="row">              
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cidade</th>
                            <th>Descrição</th>
                            <th>Status do Evento</th>
                            <th>Data de Cadastro</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$listevento item="linha"}
                            <tr>                                                                
                                <td>{$linha.id_evento}</td>
                                <td>{$linha.des_cidade}</td>
                                <td>{$linha.des_evento}</td>
                                
                                <td>{if $linha.status_evento == 1}
                                    <p style="color:limegreen; font-weight: bold" align="center">Aberto</p>
                                    {else}
                                        <p style="color:red; font-weight: bold" align="center">Fechado</p>
                                        {/if}</td>
                                <td>{$linha.dt_cadastro|date_format:"%d/%m/%Y %H:%M:%S"}</td>
                                        <td>                   
                                            <a href="/evento/produto_grid/id_evento/{$linha.id_evento}">Adicionar Produto</a> |
                                            <a href="/evento/detalhes/id_evento/{$linha.id_evento}">Detalhes</a> |
                                            <a href="/evento/edit/id_evento/{$linha.id_evento}">Editar</a> | 
                                            <a href="/evento/delete/id_evento/{$linha.id_evento}" class="del">Deletar</a>
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
