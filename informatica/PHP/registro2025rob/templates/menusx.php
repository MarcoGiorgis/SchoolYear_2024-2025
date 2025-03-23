<div id="menusx">
        <div>
            <?php
                if (($_SESSION['tipo'])=='amm'){
                        echo "<div><button type=\"button\" onClick=\"location.href='./inseriscistudente.php'\" class=\"buttonform menubutton\">INSERISCI STUDENTE</button></div>";
                        echo "<div><button type=\"button\" onClick=\"location.href='./ricercastudente.php'\" class=\"buttonform menubutton\">RICERCA STUDENTE</button></div>";
                }elseif (($_SESSION['tipo'])=='stu'){
                        echo "<div><button type=\"button\" onClick=\"location.href='./stud_assenze.php'\" class=\"buttonform menubutton\">VISUALIZZA ASSENZE</button></div>";
                }
            ?>
        </div>
</div>