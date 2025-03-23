let magazzino = [];  // Variabile per mantenere i dati del magazzino in memoria
let prodottoTrovato = null;  // Prodotto attualmente trovato

// Selezione degli elementi del DOM
const codice = document.getElementById("codiceProd");
const productForm = document.getElementById("search");
const modificaDiv = document.getElementById("modificaDiv");
const nuovoPrezzo = document.getElementById("nuovoPrezzo");
const nuovaQt = document.getElementById("nuovaQt");
const modificaPrezzo = document.getElementById("modificaPrezzo");
const modificaQt = document.getElementById("modificaQt");
const erroreDiv = document.getElementById("errore");
const prodottoTrovatoDiv = document.getElementById("prodottoTrovato");
const mostraProdotto = document.getElementById("mostraProdotto");
const datiProdottoDiv = document.getElementById("datiProdotto");
const detCodice = document.getElementById("detCodice");
const detMarca = document.getElementById("detMarca");
const detModello = document.getElementById("detModello");
const detPrezzo = document.getElementById("detPrezzo");
const detQt = document.getElementById("detQt");

// Carica il magazzino una sola volta al caricamento della pagina
fetch('../json/magazzino.json')
    .then(response => response.json())
    .then(dati => {
        magazzino = dati;  // Salva i dati nel magazzino
        console.log("Magazzino caricato correttamente:", magazzino);
    })
    .catch(error => console.error("Errore nel caricamento del file JSON:", error));

// Gestione della ricerca del prodotto
productForm.addEventListener("click", function (event) {
    event.preventDefault();

    const codiceInserito = codice.value.trim();
    prodottoTrovato = magazzino.find(riga => riga.codiceProd === codiceInserito);

    if (prodottoTrovato) {
        prodottoTrovatoDiv.innerHTML = `Prodotto trovato: ${prodottoTrovato.marca} ${prodottoTrovato.modelloNome}`;
        modificaDiv.style.display = "block";
        erroreDiv.innerHTML = "";
    } else {
        erroreDiv.innerHTML = "Prodotto non trovato";
        modificaDiv.style.display = "none";
    }
});

// Modifica prezzo
modificaPrezzo.addEventListener("click", function () {
    if (prodottoTrovato && nuovoPrezzo.value) {
        const nuovoPrezzoValue = parseFloat(nuovoPrezzo.value);
        if (!isNaN(nuovoPrezzoValue) && nuovoPrezzoValue > 0) {
            prodottoTrovato.prezzo = nuovoPrezzoValue;  // Modifica prezzo localmente
            prodottoTrovatoDiv.innerHTML = "Prezzo modificato con successo!";
        } else {
            alert("Inserisci un prezzo valido.");
        }
    } else {
        alert("Nessun prodotto selezionato o prezzo mancante.");
    }
});

// Modifica quantità
modificaQt.addEventListener("click", function () {
    if (prodottoTrovato && nuovaQt.value) {
        const nuovaQtValue = parseInt(nuovaQt.value);
        if (!isNaN(nuovaQtValue) && nuovaQtValue >= 0) {
            prodottoTrovato.qt = nuovaQtValue;  // Modifica quantità localmente
            prodottoTrovatoDiv.innerHTML = "Quantità modificata con successo!";
        } else {
            alert("Inserisci una quantità valida.");
        }
    } else {
        alert("Nessun prodotto selezionato o quantità mancante.");
    }
});

// Visualizza il prodotto aggiornato
mostraProdotto.addEventListener("click", function () {
    if (prodottoTrovato) {
        datiProdottoDiv.style.display = "block";
        detCodice.innerHTML = `<strong>Codice Prodotto:</strong> ${prodottoTrovato.codiceProd}`;
        detMarca.innerHTML = `<strong>Marca:</strong> ${prodottoTrovato.marca}`;
        detModello.innerHTML = `<strong>Modello:</strong> ${prodottoTrovato.modelloNome}`;
        detPrezzo.innerHTML = `<strong>Prezzo:</strong> €${prodottoTrovato.prezzo}`;
        detQt.innerHTML = `<strong>Quantità:</strong> ${prodottoTrovato.qt}`;
    }
});

// Salvataggio del file JSON aggiornato
document.getElementById('salvaButton').addEventListener('click', () => {
    if (magazzino.length > 0) {
        const jsonFile = new File([JSON.stringify(magazzino)], 'magazzino.json', { type: 'application/json' });

        const fileUrl = URL.createObjectURL(jsonFile);
        const link = document.createElement('a');
        link.href = fileUrl;
        link.download = jsonFile.name;
        link.click();

        URL.revokeObjectURL(fileUrl);
        document.getElementById('outputArea').innerText = 'File salvato con successo.';
    } else {
        document.getElementById('outputArea').innerText = 'Errore nel salvataggio: dati non disponibili.';
    }
});