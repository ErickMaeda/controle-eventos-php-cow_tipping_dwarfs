function showMessage(errorText, time, type, redirect) {

    if (time === null)
        time = 4000;
    if (type === null)
        type = 'error';

    redirect = redirect || null;

    $().toastmessage('showToast', {
        text: errorText,
        sticky: false,
        stayTime: time,
        position: 'middle-center',
        type: type,
        close: function() {
            if (redirect !== null)
                window.location = redirect
        }
    });
}


function valida_cnpj(cnpj) {
    var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
    digitos_iguais = 1;
    if (cnpj.length != 14)
        return false;
    for (i = 0; i < cnpj.length - 1; i++)
        if (cnpj.charAt(i) != cnpj.charAt(i + 1)) {
            digitos_iguais = 0;
            break;
        }
    if (!digitos_iguais) {
        tamanho = cnpj.length - 2
        numeros = cnpj.substring(0, tamanho);
        digitos = cnpj.substring(tamanho);
        soma = 0;
        pos = tamanho - 7;
        for (i = tamanho; i >= 1; i--) {
            soma += numeros.charAt(tamanho - i) * pos--;
            if (pos < 2)
                pos = 9;
        }
        resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
        if (resultado != digitos.charAt(0))
            return false;
        tamanho = tamanho + 1;
        numeros = cnpj.substring(0, tamanho);
        soma = 0;
        pos = tamanho - 7;
        for (i = tamanho; i >= 1; i--) {
            soma += numeros.charAt(tamanho - i) * pos--;
            if (pos < 2)
                pos = 9;
        }
        resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
        if (resultado != digitos.charAt(1))
            return false;
        return true;
    }
    else
        return false;
}

/*
 Mensagem Padrao do Bootstrap Fox
 type = alert-danger
 type = alert-success     
 type = alert-info
 */
function mensagem_dock(texto, type) {
    if (type === null)
        type = 'alert-success';
    var caixa = '';
    caixa += '<div class="alert alert-dismissable ' + type + '">';
    caixa += '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
    caixa += texto;
    caixa += '</div>';
    $("#mensagem-dock").html(caixa);
}

function valida_data(valor) {

    var date = valor;
    var ardt = new Array;
    var ExpReg = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");

    ardt = date.split("/");    

    var erro = false;

    if (date.search(ExpReg) === -1) {
        erro = true;
    } else if (((ardt[1] === '04') || (ardt[1] === '06') || (ardt[1] === '09') || (ardt[1] === '11')) && (ardt[0] > '30')) {
        erro = true;
    } else if (ardt[1] === '02') {
        if ((ardt[0] > '28') && ((ardt[2] % 4) !== 0)) {
            erro = true;
        }
        if ((ardt[0] > '29') && ((ardt[2] % 4) === 0)) {
            erro = true;
        }
    }

    if (erro) {
        return false;
    }

    return true;
}