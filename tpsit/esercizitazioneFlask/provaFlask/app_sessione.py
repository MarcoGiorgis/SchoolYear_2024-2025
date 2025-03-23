import semaforo
from flask import Flask, render_template, request, redirect, url_for, session
import sqlite3
import datetime

app = Flask(__name__)
app.secret_key = "chiave_super_segreta"  # Sostituisci con una chiave più sicura

s = semaforo.semaforo()
durata_rosso = 2
durata_giallo = 1
durata_verde = 2
STATO = "ATTIVO"  # "SPENTO"

@app.route("/")
def index():
    if 'email' in session:
        return redirect(url_for('controllo'))
    return redirect(url_for('login'))


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        email = request.form['e-mail']
        password = request.form['password']
        if validate(email, password):
            session['email'] = email 
            return redirect(url_for('controllo'))
        else:
            error = 'Invalid Credentials. Please try again.'
    return render_template('login.html', error=error)


# Funzione per validare le credenziali
def validate(email, password):
    con = sqlite3.connect('./databse/db_utenti.db')
    cur = con.cursor()
    cur.execute("SELECT password FROM utenti WHERE email = ?", (email,))
    row = cur.fetchone()
    con.close()
    if row:
        return row[0] == password
    return False


@app.route('/controllo', methods=['GET'])
def controllo():
    if 'email' not in session:  # Controllo corretto della sessione
        return redirect(url_for('login'))
    return render_template('controllo_semaforo.html', email=session['email'])


@app.route('/configura_rosso', methods=['POST'])
def configura_rosso():
    global durata_rosso
    durata_rosso = int(request.form['rosso'])
    return redirect(url_for('controllo'))


@app.route('/configura_giallo', methods=['POST'])
def configura_giallo():
    global durata_giallo
    durata_giallo = int(request.form['giallo'])
    return redirect(url_for('controllo'))


@app.route('/configura_verde', methods=['POST'])
def configura_verde():
    global durata_verde
    durata_verde = int(request.form['verde'])
    return redirect(url_for('controllo'))


@app.route('/spegnere_semaforo', methods=['POST'])
def spegnere_semaforo():
    global STATO
    STATO = "SPENTO"
    registra_operazione("Spegnimento")
    return redirect(url_for('controllo'))


@app.route('/attivare_semaforo', methods=['POST'])
def attivare_semaforo():
    global STATO
    STATO = "ATTIVO"
    registra_operazione("Riattivazione")
    return redirect(url_for('controllo'))

def registra_operazione(operazione):
    con = sqlite3.connect('./log_operazioni.db')
    cur = con.cursor()
    cur.execute("INSERT INTO operazioni (operazione, data_ora) VALUES (?, ?)", 
                (operazione, datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")))
    con.commit()
    con.close()


# Creazione database per registrare spegnimento e riattivazione
def setup_database():
    con = sqlite3.connect('./log_operazioni.db')
    cur = con.cursor()
    cur.execute('''CREATE TABLE IF NOT EXISTS operazioni (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    operazione TEXT NOT NULL,
                    data_ora TEXT NOT NULL)''')
    con.commit()
    con.close()

setup_database()

@app.route('/logout')
def logout():
    session.pop('email', None)
    return redirect(url_for('login'))


# ESEMPIO di pagina di test
@app.route('/test')
def test():
    if STATO == "ATTIVO":
        # Esempio di sequenza con semaforo attivo
        s.rosso(durata_rosso)
        s.verde(durata_verde)
        s.giallo(durata_giallo)
    else:
        # Esempio di sequenza con semaforo spento
        for _ in range(3):
            s.giallo(1)
            s.luci_spente(1)
    return 'TEST ESEGUITO!'

if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1')
