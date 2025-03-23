<?php
include_once("./templates/header.php");
?>

<div id="central" style="width: 100%; text-align: center;">
    
    <p class="titolo_dark">Inserisci i tuoi dati</p>
    <form method="POST" action="./php/registra_utente.php">
        <div style="margin-top: 20px">
            <label for="nome">Nome</label><br>
            <input type="text" id="nome" name="nome" pattern="{2,20}" required> <!--massimo 20 caratteri e obbligo di inserimento -->
        </div>
        <div style="margin-top: 20px">
            <label for="cognome">Cognome</label><br>
            <input type="text" id="cognome" name="cognome" pattern="{2,20}" required> <!--massimo 20 caratteri e obbligo di inserimento -->
        </div>
        <div style="margin-top: 20px">
            <label for="email">Email</label><br>
            <input type="email" id="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
        </div>
        <div style="margin-top: 20px">
            <label for="user">User per accesso</label><br>
            <input type="text" id="user" name="user" pattern="[a-z]{2,20}"required> <!--tutto minuscolo e massimo 20 caratteri e obbligo di inserimento -->
            <!-- pattern="[a-zA-Z0-9]{2,20}" solo lettere maiuscole e minuscole-->
        </div>

        <div style="margin-top: 20px">
            <label for="password">Password</label><br>
            <input type="password" id="psw" name="psw" pattern=".{8,}" required>
            <!-- con pattern completo per PASSWORD
            <input type="password" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
            -->
        </div>
       
        <div style="margin-top: 20px">
            <input type="submit" id="psw" value="Registra" class="buttonform">
        </div>
        <div style="margin-top: 20px">
        <?php if (isset($_GET['msg'])){
                    if ($_GET['msg']=='KO') echo "<p style=\"color: red\">ATTENZIONE! operazione non andata a buon fine!</p>";
                    elseif ($_GET['msg']=='OK') echo "<p style=\"color: blue\">REGISTRATO! Operazione avvenuta con sucesso
                                                      <br>ora puoi accedere al <a href=\"index.php\">LOGIN<a></p>";
                  }        
          ?>
         </div>

    </form>
</div>

<?php
include ("./templates/footer.php");
?>