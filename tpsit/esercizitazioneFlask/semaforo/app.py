from flask import Flask, render_template, redirect, url_for, request, make_response
import sqlite3
import hashlib
from datetime import datetime
import semaforo

app = Flask(__name__)
app.config["SECRET_KEY"] = "chiave_super_segreta"

s = semaforo.semaforo()
STATO = "attivo"
tempo_valore_verde = 2
tempo_valore_giallo = 2
tempo_valore_rosso = 1
primo_accesso = False

def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

@app.route('/login', methods=['GET', 'POST'])
def login():
    conn = sqlite3.connect("./semaforo.db")
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
    
        with conn:
            cur = conn.cursor()
            cur.execute("SELECT * FROM users WHERE username =?", (username,))
            userDb = cur.fetchone()
            print(userDb)

        if userDb and userDb[2] == hash_password(password):
            resp = make_response(redirect(url_for('home')))
            resp.set_cookie('username', username, max_age=3600)
            return resp
        
    return render_template('login.html')

######################PAGINA HOME#######################

@app.route('/home', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        global STATO
        global tempo_valore_giallo, tempo_valore_verde, tempo_valore_rosso
        global primo_accesso
        if request.form.get('action-salvataggio') == "Salva":
            tempo_valore_verde = int(request.form['action-verde'])
            tempo_valore_giallo = int(request.form['action-giallo'])
            tempo_valore_rosso = int(request.form['action-rosso'])
        elif request.form.get('action-spegnimento') == "Spegni semaforo":
            if primo_accesso == False:
                crea_tab_operazioni()
                primo_accesso = True
            if STATO == "attivo":
                STATO = "spento"
                salvaOperazione("Spegnimento", request.cookies.get('username'))
        elif request.form.get('action-attivazione') == "Riattiva semaforo":
            if primo_accesso == False:
                crea_tab_operazioni()
                primo_accesso = True
            if STATO == "spento":
                STATO = "attivo"
                salvaOperazione("Spegnimento", request.cookies.get('username'))
    return render_template('home.html')

#########################################################

def salvaOperazione(operazione, username):
    conn = sqlite3.connect("./semaforo.db")
    with conn:
        cur = conn.cursor()
        cur.execute("SELECT id FROM users WHERE username =?", (username,))
        id = cur.fetchone()[0]
        print(id)
        cur.execute("INSERT INTO operazioni (id_u, operazione, data) VALUES (?,?,?)", (id, operazione, datetime.now()))
        conn.commit()

def crea_tab_operazioni():
    conn = sqlite3.connect("./semaforo.db")
    with conn:
        cur = conn.cursor()
        cur.execute("""
            CREATE TABLE IF NOT EXISTS operazioni (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                id_u TEXT NOT NULL,
                operazione TEXT NOT NULL,
                data DATETIME NOT NULL,
                    FOREIGN KEY (id_u) REFERENCES users(id) ON DELETE RESTRICT ON UPDATE CASCADE
            )
        """)
        conn.commit()

@app.route('/', methods=['GET', 'POST'])
def index():
    username = request.cookies.get('username')
    if username:
        return redirect(url_for('home'))
    return redirect(url_for('login'))

#ESEMPIO di pagina di test
@app.route('/test')
def test():
    if STATO == "ATTIVO":
        #Esempio di sequenza con semaforo attivo. I tempi devono essere
        #modificabili dalla pagina di configurazione!
        s.rosso(tempo_valore_rosso)
        s.verde(tempo_valore_verde)
        s.giallo(tempo_valore_giallo)
    else:
        #Esempio di sequenza con semaforo spento. I tempi devono essere
        #modificabili dalla pagina di configurazione!
        for _ in range(3):
            s.giallo(1)
            s.luci_spente(1)
    return 'TEST ESEGUITO!'

if __name__ == '__main__':
    app.run(debug=True, host='localhost')
