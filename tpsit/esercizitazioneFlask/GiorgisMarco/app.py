from flask import Flask, render_template, redirect, url_for, request, make_response
import sqlite3
import random

app = Flask(__name__) #istanza della classe Flask
app.config["SECRET_KEY"] = "chiave_super_segreta"

@app.route('/login', methods=['GET', 'POST']) 
def login(): #gestione pagina di login
    conn = sqlite3.connect("./social.db")

    if request.method == 'POST':
        username = request.form['username'] #acquisizione dati
        password = request.form['password']
    
        with conn: #apertura connessione
            cur = conn.cursor()
            cur.execute("SELECT * FROM users WHERE username =?", (username,))
            userDb = cur.fetchone()
            #print(userDb)

        if userDb and userDb[2] == password:
            resp = make_response(redirect(url_for('home')))
            resp.set_cookie('username', username, max_age=60)
            return resp
        
    return render_template('login.html')

def visualizzaStato():
    conn = sqlite3.connect("./social.db")
    attuale = request.cookies.get('username')

    with conn: 
        cur = conn.cursor()
        cur.execute("SELECT * FROM stato s, users u WHERE u.id = s.id_u AND u.username != ?", (str(attuale),))
        stato = cur.fetchall()

        if stato:
            statoScelto = random.choice(stato)
            idStato = statoScelto[0]
            cur.execute("SELECT username FROM stato s, users u WHERE u.id = s.id_u AND s.id_stato = ?", (idStato,))
            userScelto = cur.fetchone()[0]
            userScelto = str(userScelto)
            stato = statoScelto[2]
        else:
            userScelto = "Nessun nome salvato"
            stato = "Nessun commento"

    return userScelto, stato

@app.route('/home', methods=['GET', 'POST']) #gestione pagina home
def home():
    resp = None
    userScelto, statoScelto = visualizzaStato()
    conn = sqlite3.connect("./social.db")

    if request.method == 'POST':
        # tasto logout
        if request.form.get('action-logout') == "logout": 
            resp = make_response(redirect(url_for('login')))
            resp.delete_cookie('username')
            return resp
        
        # tasto stato
        if request.form.get('action-invia') == "invia stato":
            stato = request.form['action-stato']
            #print(stato)
            user = request.cookies.get('username')
            with conn:
                #print(len(stato))
                if len(stato) > 80:
                    stato = stato[:80]
                cur = conn.cursor()
                cur.execute("SELECT id FROM users WHERE username =?", (user,))
                id_user = cur.fetchone()[0]
                cur.execute("INSERT INTO stato (id_u, contenuto) VALUES(?, ?)", (id_user, stato))
                conn.commit()
 
    return render_template('home.html', user=userScelto, stato=statoScelto)

@app.route("/", methods=["GET", "POST"])
def index():
    username = request.cookies.get("username")
    if username: # se già presente username con cookie reindirizza alla pagina home
        return redirect(url_for("home"))
    return redirect(url_for("login"))

if __name__ == '__main__':
    app.run(debug=True, host='localhost')