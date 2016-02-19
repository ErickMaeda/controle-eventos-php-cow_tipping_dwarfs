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
                               name="id_cliente" 
                               value="{if isset($id_cliente)}{$id_cliente}{/if}" readonly="true" required> <a href="/participacao/busca_cliente">Buscar Cliente</a>
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
