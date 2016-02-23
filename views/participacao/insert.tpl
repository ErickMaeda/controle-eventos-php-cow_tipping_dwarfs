<!DOCTYPE html>
<html lang="en">
    <head>
        {include file="comum/head.tpl"}
        <style>
            video { border: 1px solid #ccc; display: block; }
            #canvas { border: 1px solid #ccc; display: block; }
        </style>
    </head>
    <body>
        <div id="wrapper">
            {include file="comum/sidebar.tpl"}
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>{$title}</h1>                                                  
                            <br><br>
                            <div class="panel panel-default">
                                <div class="panel panel-body">
                                    <div class="col-xs-12">
                                        <div class="row">  
                                            <div class="col-md-4">
                                                <label for="name">Evento</label>
                                                <select type="input" name=id_evento id=id_evento class="btn btn-default dropdown-toggle form-control" >
                                                    <option value="{$data.id_evento}" selected="selected" disabled="true" >{$data.des_evento}</option>
                                                </select>     
                                            </div>
                                            <div class="col-md-4">
                                                <label for="name">Cliente</label>
                                                <input type="input" 
                                                       class="form-control "
                                                       id="id_cliente" 
                                                       name="id_cliente" 
                                                       value="{if isset($data.id_cliente)}{$data.id_cliente}{/if}" disabled="true" required>
                                            </div> 
                                            <div class="col-md-4">
                                                <a href="/participacao/cancelarParticipacao/id_evento_cliente/{$data.id_evento_cliente}" class="btn btn-default col-md-4">Cancelar</a>
                                            </div> 
                                        </div>  
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel panel-body">
                                    <div class="col-xs-12">
                                        <div class="col-md-6">
                                            <video id="video" width="640" height="480" autoplay></video>
                                        </div>
                                        <div class="col-md-5">
                                            <canvas id="canvas" width="640" height="480" ></canvas>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <br>
                                        <input type="hidden" name="id_evento_cliente" value="{$data.id_evento_cliente}" id="id_evento_cliente">
                                        <button class="btn btn-default" id="snap">Tirar Foto</button>
                                        <button class="btn btn-default" id="save">Salvar Foto</button>
                                    </div>
                                </div>
                            </div>
                            <form action="/participacao/uploadFile/id_evento_cliente/{$data.id_evento_cliente}" method="POST" enctype="multipart/form-data">
                                <div class="panel panel-default">
                                    <div class="panel panel-body">
                                        <div class="col-xs-12">
                                            <div >
                                                <label class="col-md-12" for="file">Selecione a imagem para upload: </label>
                                            </div>
                                            <div class="col-md-5">
                                                <input class="col-md-12" type="file" class="form-control" name="fileToUpload" id="fileToUpload">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-default col-md-12" type="submit" > FINALIZAR </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file="comum/footer.tpl"}    
        <script src="/files/js/color/index.js"></script>
        <script src="/files/js/jquery-1.12.0.min.js" type="text/javascript"></script>
        <script src="/files/js/fotoUtils.js" type="text/javascript"></script>
    </body>
</html>
