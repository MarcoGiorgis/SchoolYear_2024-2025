from flask import Flask, render_template, request
import joblib
import numpy as np

# Caricamento dei modelli e degli encoder
model = joblib.load("./my_mlp.joblib")
leModel = joblib.load("./leModel.joblib")
leTransmission = joblib.load("./leTransmission.joblib")

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    prediction = None
    if request.method == 'POST':
        try:
            # Recupera i dati dal form
            macchinaTest = [
                leModel.transform([request.form["model"]])[0],  # Encoding del modello
                float(request.form["engine_power"]),
                leTransmission.transform([request.form["transmission"]])[0],  # Encoding della trasmissione
                float(request.form["age_in_days"]),
                float(request.form["km"]),
                float(request.form["previous_owners"]),
                float(request.form["lat"]),
                float(request.form["lon"])
            ]
            
            # Converti in un array numpy e fai la predizione
            macchinaTest = np.array([macchinaTest])  # Deve essere un array bidimensionale
            prediction = model.predict(macchinaTest)[0][0]  # Estrai il valore dalla lista
        except Exception as e:
            prediction = f"Errore: {e}"
        
    return render_template('index.html', prediction=f"prezzo in euro:{prediction}")

if __name__ == '__main__':
    app.run(debug=True)
