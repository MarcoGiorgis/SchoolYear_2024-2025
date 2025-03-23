<?php

include_once("./templates/header_riservata.php");
?>

<div id="central" style="width: 100%;margin-left:50px">
    <h2>HOME</h2>
    
    <?php
    //print_r($_GET);

    //STAMPO i dati che ricevo dall'URL creata in logincheck.php riga 20
    echo "<h3>Benvenuto ".$_SESSION['nome']." ".$_SESSION['cognome']."</h3>";



    //STAMPA delle VERIFICHE ancora da svolgere
    require("./conf/db_config.php");

    $stmt = $conn->prepare("SELECT * FROM verifiche");
    //$stmt->bind_param    **** non ci sono parametri
    $stmt->execute();
    
    //estrazione multi-riga
	$result = $stmt->get_result();
    $rows = $result->fetch_all(MYSQLI_ASSOC);

    //************************************************************
    //****************STAMPO IL RISULTATO DELLA QUERY (MULTIRIGHE)
	echo "<table class=\"table\">
    <tr>
    <td><b>Data</td>
    <td><b>Materia</td>
    <td><b>Tipo</td>
    <td><b>Argomento</td>
    </tr><tbody>";

    //ciclo FOREACH che scorre tutte le righe del risultato delle query
    foreach($rows as $row){
        $date = date_create($row['data_verifica']);
        echo "<tr>
            <td>".date_format($date,'d-m-Y')."</td>
            <td>".$row['materia']."</td>
            <td>".$row['tipo']."</td>
            <td>".$row['argomento']."</td>
            </tr>";
    }
    echo "</tbody></table>";

?>
</div>

<?php
include_once("./templates/footer.php");
?>


