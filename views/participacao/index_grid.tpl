<div class="panel panel-default">
    <div class="panel panel-body">
        <div class="col-xs-12">
            <form role="form" action="/participacao/cliente_evento_insert" method="POST" enctype="multipart/form-data">
                <div class="row">  
                    <div class="col-md-4">
                        <label for="name">Evento</label>
                        <select type="input" name=id_evento id=id_evento class="btn btn-default dropdown-toggle form-control" >
                            {foreach from=$evento item=$linha}
                                <option value="{$linha.id_evento}" >{$linha.des_evento}</option>
                            {/foreach}
                        </select>     
                    </div>
                    <div class="col-md-4">
                        <label for="name">Cliente</label>
                        <input type="input" 
                               class="form-control "
                               id="id_cliente" 
                               required="required"
                               name="id_cliente"
                               value="{if isset($id_cliente)}{$id_cliente}{/if}" readonly="true"> <a href="/participacao/busca_cliente">Buscar Cliente</a>
                    </div> 
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-default">INSERIR</button>
                    </div>  
                </div> 

                <div class="row">
                    <div class="col-md-4">
                        <h4>{if isset($error)}{$error}{/if}</h4>
                    </div>  
                </div> 
            </form>
        </div>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel panel-body">
        <div class="col-xs-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Evento</th>
                        <th>Cliente</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$listevento item="linha"}
                        <tr>                                                                
                            <td>{$linha.id_evento_cliente}</td>
                            <td>{$linha.des_evento}</td>
                            <td>{$linha.nome_cliente}</td>
                            <td>                   
                                <a href="/participacao/cancelarParticipacao/id_evento_cliente/{$linha.id_evento_cliente}" class="del">Deletar</a>
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
