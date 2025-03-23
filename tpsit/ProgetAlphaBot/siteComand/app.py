from flask import Flask, render_template, redirect, url_for, request, make_response, jsonify
import sqlite3
import jwt
import datetime
import hashlib

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'

# Funzione per hashare la password con SHA-256
def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

# Funzione per validare username e password
def validate(username, password):
    con = sqlite3.connect('./db.db')
    with con:
        cur = con.cursor()
        cur.execute("SELECT * FROM Users WHERE username = ?", (username,))
        row = cur.fetchone()
        if row:
            hashed_password_from_db = row[1]  # La password nel DB
            hashed_password_input = hash_password(password)  # La password che l'utente sta inserendo
            print(f"Password nel DB: {hashed_password_from_db}")
            print(f"Password inserita (hash): {hashed_password_input}")
            
            if hashed_password_from_db == hashed_password_input:
                return True
        print("Username non trovato o password non corretta")
    return False

@app.route("/token")
def generate_token(resp, username):
    payload = {
        "user": username,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)
    }
    token = jwt.encode(payload, app.config["SECRET_KEY"], algorithm="HS256")
    resp.set_cookie('token', token, max_age=60*60*24)
    return resp

# Decoratore per proteggere le rotte con JWT
def token_required(f):
    def decorator(*args, **kwargs):
        token = request.cookies.get('token')
        if not token:
            return redirect(url_for('login'))
        try:
            data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=['HS256'])
            request.username = data['username']
        except jwt.ExpiredSignatureError:
            return redirect(url_for('login'))
        except jwt.InvalidTokenError:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorator

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = ""
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if validate(username, password):
            resp = make_response(redirect(url_for('movement')))
            return generate_token(resp, username)
        else:
            error = "Username o password non corretti"
    return render_template('login.html', error=error)

@app.route('/', methods=['GET', 'POST'])
@token_required
def movement():
    print("Dentro la rotta movimento")  # Debug print per confermare che la rotta viene chiamata
    if request.method == 'POST':
        action = None
        if request.form.get('action1') == 'avanti':
            action = "avanti"
        elif request.form.get('action2') == 'indietro':
            action = "indietro"
        elif request.form.get('action3') == 'destra':
            action = "destra"
        elif request.form.get('action4') == 'sinistra':
            action = "sinistra"
        elif request.form.get('action5') == 'stop':
            action = "stop"
        elif request.form.get('action6') == 'log-out':
            resp = make_response(redirect(url_for('login')))
            resp.delete_cookie('token')
            return resp
        else:
            action = "Unknown"
        print(action)

    return render_template('index.html')


@app.route('/create_account', methods=['GET', 'POST'])
def create_account():
    error = ""
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        try:
            con = sqlite3.connect('./db.db')
            with con:
                cur = con.cursor()
                cur.execute("SELECT * FROM Users WHERE username = ?", (username,))
                if cur.fetchone():
                    error = "Username già in uso"
                else:
                    hashed_password = hash_password(password)  # Hashiamo la password prima di salvarla
                    cur.execute("INSERT INTO Users (username, password) VALUES (?, ?)", (username, hashed_password))
                    con.commit()
                    return redirect(url_for('login'))
        except sqlite3.Error as e:
            error = f"Errore nel database: {e}"

    return render_template('createAccount.html', error=error)

if __name__ == '__main__':
    app.run(debug=True, host='localhost')