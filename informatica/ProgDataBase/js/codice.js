let magazzino = [];
const searchValue = document.getElementById("labelRicerca");
const listaProdotti = document.getElementById("listaProdotti");
const erroreDiv = document.getElementById("errore");

fetch('./json/magazzino.json')
  .then(response => response.json())
  .then(dati => {
    searchValue.addEventListener("keydown", function (event) {
      if (event.key === "Enter") {
        event.preventDefault();
        if (magazzino.length === 0) {
          magazzino = dati;
        }

        const valoreRicerca = searchValue.value.toLowerCase();

        const risultati = magazzino.filter(prodotto => {
          if (prodotto['codiceProd']) {
            return prodotto['codiceProd'].toLowerCase().includes(valoreRicerca);
          }
          return false;
        });

        erroreDiv.innerHTML = "";

        if (risultati.length <= 0) {
          listaProdotti.innerHTML = "";
          erroreDiv.innerHTML = "Nessun prodotto trovato.";
        } else {
          mostraRisultati(risultati);
        }
      }
    });


    function mostraRisultati(prodotti) {
      listaProdotti.innerHTML = "";  // Pulisce i risultati precedenti
      prodotti.forEach(prodotto => {
        const divProdotto = document.createElement("div");
        divProdotto.classList.add("card");
        divProdotto.innerHTML = `
      <div class="prodotto-info">
        <strong>Codice Prodotto:</strong> ${prodotto.codiceProd}<br>
        <strong>Marca:</strong> ${prodotto.marca}<br>
        <strong>Modello:</strong> ${prodotto.modelloNome}<br>
        <strong>Prezzo:</strong> €${prodotto.prezzo}<br>
        <strong>Quantità:</strong> ${prodotto.qt}<br>
        <strong>Tipo Prodotto:</strong> ${prodotto.tipoProdotto}<br>
        <strong>Reparto:</strong> ${prodotto.reparto}
      </div>
    `;
        listaProdotti.appendChild(divProdotto);
      });
    }
    
    document.getElementById('salvaButton').addEventListener('click', () => {
      console.log("ciao")
      //se sono stati letti dei dati corretti        
      if (dati !== null) {

        //pulisco area output
        //document.getElementById('outputArea').innerText = '';

        //creazione oggetto FILE
        const jsonFile = new File([JSON.stringify(dati)], //array contenente il contenuto del file
          'magazzino.json',  //nome file
          { type: 'application/json' });  //tipo file

        // Crea un oggetto URL per il File
        const fileUrl = URL.createObjectURL(jsonFile);

        // Crea un elemento <a> nascosto per fare il download
        const link = document.createElement('a');
        link.href = fileUrl;
        link.download = jsonFile.name; //specifica che il link deve fare un download


        // Simulare un clic sul link per avviare il download e permettere di scegliere il nome del file
        // (se è stato impostato nel browser di scegliere la destinazione dei download, altrimenti sarà
        // scaricato/salvato in download)
        link.click();
        // Elimina l'URL creato
        URL.revokeObjectURL(fileUrl);

        document.getElementById('outputArea').innerText = 'File salvato';
      } else {
        document.getElementById('outputArea').innerText = 'Dati non corretti o nulli.';
      }
    });
  })
  .catch(error => console.error("Errore nel caricamento del file JSON:", error));