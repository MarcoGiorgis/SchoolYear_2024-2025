<?php
//con il require riporto il codice di connessione ad DB
require("../conf/db_config.php");

//PROCEDURA ESEGUIRE QUERY (rimando al materiale presente su classroom)
$stmt = $conn->prepare("INSERT INTO utenti VALUES (NULL,?,?,?,?,?)");
$stmt->bind_param("sssss", $_POST['nome'], $_POST['cognome'],$_POST['email'], $_POST['user'], $_POST['psw']);
if ($stmt->execute()){
    header("location: ../registra_utente_form.php?msg=OK");
}else{
    header("location: ../registra_utente_form.php?msg=KO");
}

//chiudo la connessione
$conn->close();



?>