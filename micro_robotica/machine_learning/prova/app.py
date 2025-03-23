from flask import Flask, request, render_template
import joblib
import numpy as np

app = Flask(__name__)

# Caricamento del modello e dei trasformatori
model = joblib.load("./my_mlp.joblib")
feature_scaler = joblib.load("./feature_scaler.joblib")
target_encoder = joblib.load("./target_encoder.joblib")

@app.route("/", methods=["GET", "POST"])
def predict_species():
    prediction = None
    if request.method == "POST":
        try:
            # Recupera i dati dal modulo
            beak_length = float(request.form["beak_length"])
            beak_depth = float(request.form["beak_depth"])
            flipper_length = float(request.form["flipper_length"])
            body_mass = float(request.form["body_mass"])
            
            # Prepara i dati per il modello
            pinguino_test = np.array([[beak_length, beak_depth, flipper_length, body_mass]])
            scaled_features = feature_scaler.transform(pinguino_test)
            specie_num = model.predict(scaled_features)
            prediction = target_encoder.inverse_transform(specie_num)[0]
        except Exception as e:
            prediction = f"Errore nella previsione: {e}"

    return render_template("index.html", prediction=prediction)

if __name__ == "__main__":
    app.run(debug=True)
