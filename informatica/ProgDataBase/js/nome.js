let magazzino = [];
const searchValue = document.getElementById("labelRicerca");
const listaProdotti = document.getElementById("listaProdotti");
const erroreDiv = document.getElementById("errore");

searchValue.addEventListener("keydown", function (event) {
  if (event.key === "Enter") {
    event.preventDefault();
    fetch('../json/magazzino.json')
      .then(response => response.json())
      .then(dati => {
        if (magazzino.length === 0) {
          magazzino = dati;
        }

        const valoreRicerca = searchValue.value.toLowerCase();

        const risultati = magazzino.filter(prodotto => {
          if (prodotto[ 'modelloNome']) {
            return prodotto[ 'modelloNome'].toLowerCase().includes(valoreRicerca);
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
      })
      .catch(error => console.error("Errore nel caricamento del file JSON:", error));
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