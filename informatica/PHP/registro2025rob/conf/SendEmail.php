<?php
/*
Gestione SICUREZZA gestione account google

- Entro in "Gestisci il tuo account google"
- click su SICUREZZA nel menu di sinistra
- cliccare su "ON" per attivare "ACCESSO APP MENO SICURE"

*/

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require_once 'PHPMailer/src/Exception.php';
require_once 'PHPMailer/src/PHPMailer.php';
require_once 'PHPMailer/src/SMTP.php';



$email = "edwin.ferrua@itiscuneo.eu";
$oggetto = "prova prova";
$messaggio = "messaggio di prova";


//invia la mail
$mail = new PHPMailer();
$mail->IsSMTP(); // Utilizzo della classe SMTP al posto del comando php mail()
$mail->SMTPAuth = true; // Autenticazione SMTP
$mail->Host = "smtp.gmail.com";
$mail->Port = 465;
$mail->SMTPSecure = 'ssl'; 
$mail->Username = "edwin.ferrua@itiscuneo.eu"; // Nome utente SMTP autenticato
$mail->Password = "x"; // Password account email con SMTP autenticato
$mail->Priority    = 1; // Highest priority - Email priority (1 = High, 3 = Normal, 5 = low)
$mail->From     = "edwin.ferrua@itiscuneo.eu";
$mail->FromName = "E-mail di prova - server custom";
$mail->AddAddress($email);
$mail->IsHTML(true); 
$mail->Subject  =  $oggetto;
$mail->Body     =  $messaggio;
$mail->AltBody  =  "";
/*$mail->AddAttachment($path_allegato);  */
if(!$mail->Send()){
        echo "errore nell'invio della mail: ".$mail->ErrorInfo;
        return false;
}else{
        return true;
}


?>