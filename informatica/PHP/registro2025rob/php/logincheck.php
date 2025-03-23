<?php
//con il require riporto il codice di connessione ad DB
require("../conf/db_config.php");

//PROCEDURA ESEGUIRE QUERY (rimando al materiale presente su classroom)
$stmt = $conn->prepare("SELECT * FROM utenti WHERE user = ? AND psw = ?");
$stmt->bind_param("ss", $_POST['user'], $_POST['psw']);
$stmt->execute();

//Salvo i dati della query: lavoro su una SINGOLA RIGA
$result = $stmt->get_result();
$row = $result->fetch_assoc();

//chiudo la connessione
$conn->close();

if (($_POST['user']==$row['user'])&&($_POST['psw']==$row['psw'])){
    /*se il login è corretto rimanda alla pagina HOME salvando nella SESSION i dati principali dell'utente*/
    session_start();
    $_SESSION['login']='ok';
    $_SESSION['id_utente']= row['id'];
    $_SESSION['nome']=$row['nome'];
    $_SESSION['cognome']=$row['cognome'];    
    header("location: ../home.php");
}else{
    //rimando alla pagina del FORM di login una variabile "msg" che verrà letto in
    //$_GET[] per stampare l'errore nella index.php
    header("location: ../index.php?msg=ERR_ACCESSO");
}

?>