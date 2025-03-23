const deleteForm = document.getElementById("delete");
const codiceProd = document.getElementById("codiceProd");
const risultatoDiv = document.getElementById("risultato");
const messaggioDiv = document.getElementById("messaggio");
const erroreDiv = document.getElementById("errore");
const prodottoEliminatoDiv = document.getElementById("prodottoEliminato");

const detCodice = document.getElementById("detCodice");
const detMarca = document.getElementById("detMarca");
const detModello = document.getElementById("detModello");
const detPrezzo = document.getElementById("detPrezzo");
const detQt = document.getElementById("detQt");

// Variabile che tiene traccia dei prodotti eliminati
let prodottiEliminati = [];

// Variabile globale per il magazzino, visibile ovunque
let magazzino = null;

// Carica i dati dal file JSON
fetch('../json/magazzino.json')
    .then(response => response.json())
    .then(data => {
        // Assegna i dati del magazzino alla variabile globale
        magazzino = data;

        // Gestione dell'eliminazione del prodotto
        deleteForm.addEventListener("click", function (event) {
            console.log("ciao")
            event.preventDefault();
            // Rimuove spazi vuoti dal codice inserito
            const codiceInserito = codiceProd.value.trim();

            // Verifica se il prodotto è già stato eliminato
            if (prodottiEliminati.includes(codiceInserito)) {
                erroreDiv.innerHTML = `Il prodotto con codice ${codiceInserito} è già stato eliminato.`;
                prodottoEliminatoDiv.style.display = "none";
                risultatoDiv.style.display = "none";
                return;
            }

            // Trova l'indice del prodotto
            const indiceProdotto = magazzino.findIndex(prodotto => prodotto.codiceProd === codiceInserito);

            if (indiceProdotto !== -1) {
                const prodottoEliminato = magazzino[indiceProdotto];  // Memorizza il prodotto prima di eliminarlo
                magazzino.splice(indiceProdotto, 1);  // Rimuovi il prodotto con splice

                // Aggiunge il prodotto all'elenco degli eliminati
                prodottiEliminati.push(codiceInserito);

                // Mostra il messaggio di eliminazione
                messaggioDiv.innerHTML = `Prodotto con codice ${codiceInserito} eliminato con successo!`;
                erroreDiv.innerHTML = "";
                risultatoDiv.style.display = "block";

                // Mostra le caratteristiche del prodotto eliminato
                detCodice.innerHTML = `<strong>Codice Prodotto:</strong> ${prodottoEliminato.codiceProd}`;
                detMarca.innerHTML = `<strong>Marca:</strong> ${prodottoEliminato.marca}`;
                detModello.innerHTML = `<strong>Modello:</strong> ${prodottoEliminato.modelloNome}`;
                detPrezzo.innerHTML = `<strong>Prezzo:</strong> €${prodottoEliminato.prezzo}`;
                detQt.innerHTML = `<strong>Quantità:</strong> ${prodottoEliminato.qt}`;

                prodottoEliminatoDiv.style.display = "block";  // Mostra il div con le caratteristiche
            } else {
                erroreDiv.innerHTML = "Prodotto non trovato.";
                risultatoDiv.style.display = "none";
                prodottoEliminatoDiv.style.display = "none";
            }
        });
    })
    .catch(error => {
        console.error("Errore nel caricamento del file JSON:", error);
        erroreDiv.innerHTML = "Errore nel caricamento dei dati.";
        risultatoDiv.style.display = "none";
        prodottoEliminatoDiv.style.display = "none";
    });

// Funzione di salvataggio
document.getElementById('salvaButton').addEventListener('click', () => {
    console.log("ciao");
    // se sono stati letti dei dati corretti        
    if (magazzino !== null) {

        // creazione oggetto FILE
        const jsonFile = new File([JSON.stringify(magazzino)], // array contenente il contenuto del file
            'magazzino.json',  // nome file
            { type: 'application/json' });  // tipo file

        // Crea un oggetto URL per il File
        const fileUrl = URL.createObjectURL(jsonFile);

        // Crea un elemento <a> nascosto per fare il download
        const link = document.createElement('a');
        link.href = fileUrl;
        link.download = jsonFile.name; // specifica che il link deve fare un download

        // Simulare un clic sul link per avviare il download e permettere di scegliere il nome del file
        link.click();

        // Elimina l'URL creato
        URL.revokeObjectURL(fileUrl);

        document.getElementById('outputArea').innerText = 'File salvato';
    } else {
        document.getElementById('outputArea').innerText = 'Dati non corretti o nulli.';
    }
});