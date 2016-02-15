<?php

function email() {
    $this->enviaemail('fabio.alvaro@gmail.com', 'asdasd asd asd asd ', 'Assunto ASDASDSAD');
}

function enviaemail($para = "", $texto = "", $assunto = "") {
    //  require_once('system/libs/phpmailer/class.phpmailer.php');
    //header('Content-Type: text/html; charset=utf-8');
    $mail = new PHPMailer();

    $mail->IsSMTP();                                      // set mailer to use SMTP
    $mail->Host     = SMTPHOST;  // specify main and backup server
    $mail->SMTPAuth = true;     // turn on SMTP authentication
    $mail->Username = SMTPUSER;  // SMTP username
    $mail->Password = SMTPPASS; // SMTP password
    $mail->Port     = SMTPPORT;

    $mail->From     = SMTPFROM;
    $mail->FromName = SMTPFROMNAME;
    //$mail->AddAddress("josh@example.net", "Josh Adams");
    $mail->AddAddress($para);                  // name is optional
    $mail->AddReplyTo(SMTPFROMNAME, "Information Fox");

    $mail->WordWrap = 50;                                 // set word wrap to 50 characters
    //$mail->AddAttachment("/var/tmp/file.tar.gz");         // add attachments
    //$mail->AddAttachment("/tmp/image.jpg", "new.jpg");    // optional name
    $mail->IsHTML(true);                                  // set email format to HTML

    $mail->Subject = $assunto;
    $mail->Body = $texto;
    // $mail->AltBody = "This is the body in plain text for non-HTML mail clients";

    if (!$mail->Send()) {
        //echo "Message could not be sent. <p>";
        //echo "Mailer Error: " . $mail->ErrorInfo;
        $util = new util();
        $util->debug_no_log('Erro ao enviar o email '.$mail->ErrorInfo);                       
        exit;
    }

    // echo "Message has been sent";
}
