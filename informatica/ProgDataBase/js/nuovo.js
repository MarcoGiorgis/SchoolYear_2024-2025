// Variabile globale per salvare i dati
let datiJson = [];
let reparti = {
    "informatica": {
        "nomeResponsabile": "Giacinto Pinto",
        "cellResponsabile": "366 6616216"
    },
    "telefonia": {
        "nomeResponsabile": "Mario Rossi",
        "cellResponsabile": "375 9482941"
    },
    "grandi elettrodomestici": {
        "nomeResponsabile": "Silvano Soloperto",
        "cellResponsabile": "339 1157273"
    }
};

// Funzione per caricare i dati iniziali
async function caricaDati() {
    try {
        const response = await fetch('../json/magazzino.json'); // Assicurati che il file sia nella stessa cartella
        if (!response.ok) throw new Error('Network response was not ok');
        data = await response.json();
        datiJson = data; // Salva i dati in datiJson
        console.log('Dati iniziali:', datiJson); // Mostra i dati nel console log
    } catch (error) {
        console.error('Si è verificato un errore:', error);
    }
}

document.getElementById('salvaButton').addEventListener('click', () => {
    console.log("ciao");
    // se sono stati letti dei dati corretti        
    if (data != null) {

        // creazione oggetto FILE
        const jsonFile = new File([JSON.stringify(data)], // array contenente il contenuto del file
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

        console.log('file salvato')
        //document.getElementById('outputArea').innerText = 'File salvato';
    } else {
        console.log('errore')
        //document.getElementById('outputArea').innerText = 'Dati non corretti o nulli.';
    }
});

// Funzione per popolare la select dei reparti
function popolaReparti() {
    const selectReparto = document.getElementById("reparto");
    selectReparto.innerHTML = '<option value="" disabled selected>Seleziona un reparto</option>';
    for (const key in reparti) {
        const option = document.createElement("option");
        option.value = key;
        option.text = key.charAt(0).toUpperCase() + key.slice(1);
        selectReparto.appendChild(option);
    }
}

// Funzione per precompilare i campi del responsabile
function precompilaResponsabile() {
    const repartoSelezionato = document.getElementById("reparto").value;
    const nomeResponsabile = document.getElementById("nomeResponsabile");
    const cellResponsabile = document.getElementById("cellResponsabile");

    if (repartoSelezionato && reparti[repartoSelezionato]) {
        nomeResponsabile.value = reparti[repartoSelezionato].nomeResponsabile;
        cellResponsabile.value = reparti[repartoSelezionato].cellResponsabile;
    } else {
        nomeResponsabile.value = "";
        cellResponsabile.value = "";
    }
}

// Funzione per aggiungere un prodotto
function aggiungiProdotto(event) {
    event.preventDefault();
    const codiceProd = document.getElementById("codiceProd").value;
    const reparto = document.getElementById("reparto").value;
    const tipoProdotto = document.getElementById("tipoProdotto").value;
    const marca = document.getElementById("marca").value;
    const modelloNome = document.getElementById("modelloNome").value;
    const prezzo = parseFloat(document.getElementById("prezzo").value);
    const quantita = parseInt(document.getElementById("quantita").value);
    const nomeResponsabile = document.getElementById("nomeResponsabile").value;
    const cellResponsabile = document.getElementById("cellResponsabile").value;
    const fornitore1 = document.getElementById("fornitore1").value;
    const costo1 = parseFloat(document.getElementById("costo1").value);
    const fornitore2 = document.getElementById("fornitore2").value;
    const costo2 = parseFloat(document.getElementById("costo2").value);
    const iva = parseInt(document.getElementById("iva").value);

    // Creazione dell'oggetto prodotto
    const nuovoProdotto = {
        codiceProd,
        reparto,
        tipoProdotto,
        marca,
        modelloNome,
        qt: quantita,
        prezzo,
        Nominativo_responsabile: nomeResponsabile,
        cell_resp: cellResponsabile,
        fornitore1,
        costo1,
        fornitore2,
        costo2,
        IVA: iva
    };

    // Aggiungi il nuovo prodotto a datiJson
    datiJson.push(nuovoProdotto);
    mostraRisultato(nuovoProdotto);
    document.getElementById("addForm").reset();
    precompilaResponsabile(); // Riporta i campi responsabili a valori vuoti dopo l'aggiunta
}

// Funzione per mostrare il risultato dell'aggiunta
function mostraRisultato(prod) {
    const risultato = document.getElementById("risultato");
    risultato.innerHTML = `<h4>Prodotto Aggiunto:</h4>
                               <p>Codice: ${prod.codiceProd}</p>
                               <p>Reparto: ${prod.reparto}</p>
                               <p>Tipo: ${prod.tipoProdotto}</p>
                               <p>Marca: ${prod.marca}</p>
                               <p>Modello: ${prod.modelloNome}</p>
                               <p>Prezzo: €${prod.prezzo.toFixed(2)}</p>
                               <p>Quantità: ${prod.qt}</p>
                               <p>Responsabile: ${prod.Nominativo_responsabile}</p>
                               <p>Cellulare: ${prod.cell_resp}</p>
                               <p>Fornitore 1: ${prod.fornitore1}</p>
                               <p>Costo Fornitore 1: €${prod.costo1.toFixed(2)}</p>
                               <p>Fornitore 2: ${prod.fornitore2}</p>
                               <p>Costo Fornitore 2: €${prod.costo2.toFixed(2)}</p>
                               <p>IVA: ${prod.IVA}%</p>`;
    risultato.style.display = "block"; // Mostra il risultato
}

// Funzione per aggiungere un nuovo reparto
function aggiungiReparto(event) {
    event.preventDefault();
    const nuovoReparto = document.getElementById("nuovoReparto").value.toLowerCase();
    const nomeResponsabileReparto = document.getElementById("nomeResponsabileReparto").value;
    const cellResponsabileReparto = document.getElementById("cellResponsabileReparto").value;

    // Aggiungi il nuovo reparto all'oggetto reparti
    reparti[nuovoReparto] = {
        nomeResponsabile: nomeResponsabileReparto,
        cellResponsabile: cellResponsabileReparto
    };

    // Ripopola la select dei reparti
    popolaReparti();

    // Resetta il form
    document.getElementById("addRepartoForm").reset();
    alert("Nuovo reparto aggiunto con successo!");
}

// Aggiunge eventi
document.getElementById("btnAggiungiProdotto").addEventListener("click", function () {
    document.getElementById("formProdotto").style.display = "block";
    document.getElementById("formReparto").style.display = "none";
});

document.getElementById("btnAggiungiReparto").addEventListener("click", function () {
    document.getElementById("formReparto").style.display = "block";
    document.getElementById("formProdotto").style.display = "none";
});

document.getElementById("reparto").addEventListener("change", precompilaResponsabile);
document.getElementById("addForm").addEventListener("submit", aggiungiProdotto);
document.getElementById("addRepartoForm").addEventListener("submit", aggiungiReparto);

// Popola la select dei reparti all'avvio
popolaReparti();

// Carica i dati all'avvio
caricaDati();