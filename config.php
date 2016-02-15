<?php

//Configuracao do Ambiente
define('PATH_ROOT', $_SERVER['DOCUMENT_ROOT'] . '/');
define('SMARTYDIR', PATH_ROOT . 'views');
define('LIBS', 'system/libs');
define('HTTP_ROOT', 'http://' . $_SERVER['HTTP_HOST']);
define('MEUDIR', dirname(__FILE__));
define('SERVIDOR_ALTERNATIVO','http://fabioalvaro.s3.amazonaws.com');

if($_SERVER["HTTP_HOST"]=='homologacao.fabioalvaro.com.br'){
    @define('STORAGE_ROOT','storage/');    //homologacao
}else
    @define('STORAGE_ROOT','/storage/');    //local


define('DEBUG_APP',false);
define('TEMPO_LIMITE', 1800); //Tempo limite da Sessao Expirar em Segundos
define('NOME_APLICACAO', 'Chayote PHP');

define('EMAIL_SAC_FOX', 'sistema@fabioalvaro.com.br');//Responsavel pelo SAC FOX

/*
 * Configuração do Banco de Dados
 */

define('DBHOST', 'localhost');
define('DBPORT', '3306');
define('DBUSER', 'root');
define('DBPASS', 'toor');
define('DBNAME', 'chayotedb');
define('DBENCODING', 'utf8');

define('SMTPHOST', 'smtp.fabioalvaro.com');
define('SMTPAUTH', true);
#define('SMTPSECURE'  , 'ssl');
define('SMTPPORT', '587');
define('SMTPUSER', 'sistema@trocainteligentefox.com.br');
define('SMTPPASS', 'senhafake2');
define('SMTPFROM', 'mamae@fabioalvaro.com.br');
define('SMTPFROMNAME', 'sistema@fabioalvaro.com.br');
define('HTML', true);



?>