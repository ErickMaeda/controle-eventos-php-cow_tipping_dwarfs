<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap Core CSS -->
        <link href="/files/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="/files/css/simple-sidebar.css" rel="stylesheet">
        
    </head>
    <body>
        <div>
            <div class="panel panel-body">
                <div class="col-xs-12">
                    <div class="row">
                        <table border="1" width="200px" class="table table-striped"
                               >
                            <tbody>
                                <tr>
                                    <td colspan="2" align="center"> <h3>{$title}</h3> </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"> <h1>FOTO</h1> </td>
                                </tr>
                                <tr>
                                    <td><b>Nome: </b>{$registro.nome_cliente}</td>
                                    <td><b>ID: </b>{$registro.id_cliente}</td>
                                </tr>
                                <tr>
                                    <td><b>RG: </b>{$registro.rg_cliente}</td>
                                    <td><b>CPF: </b>{$registro.cpf_cliente}</td>
                                </tr>
                                <tr>
                                    <td><b>Cadastrado em: </b>{$registro.dt_cadastro}</td>
                                    <td><b>Emitido em: </b>{$dt_emissao}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>

        <script src="/files/js/util.js"></script>
    </body>
</html>
