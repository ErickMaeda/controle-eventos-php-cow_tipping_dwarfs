<?php
require __DIR__ . '/vendor/autoload.php';

$redirecionar = false;

define('URL_PRODUCAO', 'www.fabioalvaro.com.br');
define('URL_LOCALHOST', 'localhost.fabioalvaro.com.br');
define("ROOT_APP",__DIR__);

switch ($_SERVER['SERVER_NAME']) {
    case URL_LOCALHOST: $redirecionar = true;
        break;
    case URL_PRODUCAO:$redirecionar = true;
        break;
    default: $redirecionar = false;
        break;
}

if ($redirecionar){
    header('Location: '.URL_PRODUCAO);
    die;
}

date_default_timezone_set('America/Sao_Paulo');

setlocale(LC_ALL, NULL);
setlocale(LC_ALL, 'pt_BR');

session_name('chayote_session');
session_start();

define('CONTROLLERS', 'controllers/');
define('VIEWS', 'views/');
define('MODELS', 'models/');
define('TEMPLATE', 'template/');
define('HELPERS', 'system/helpers/');

require_once('config.php');
require_once('system/system.php');
require_once('system/controller.php');
require_once('system/model.php');


require_once("vendor/smarty/smarty/libs/Smarty.class.php");

// autoload models and helpers
function autoload($file) {

    if (file_exists(MODELS . $file . '.php')) {
        require_once(MODELS . $file . '.php');
    } elseif (file_exists(HELPERS . $file . '.php')) {
        require_once(HELPERS . $file . '.php');
    } elseif (file_exists(TEMPLATE . $file . '.php')) {
        require_once(TEMPLATE . $file . '.php');
    } else {
        return true;
    }
}

spl_autoload_register('autoload');

if ($_POST and !get_magic_quotes_gpc()) {
    foreach ($_POST as $field => $value) {
        if (!is_array($_POST[$field])) {
            $_POST[$field] = addslashes($value);
        }
    }
}


$start = new System;


$start->run();
