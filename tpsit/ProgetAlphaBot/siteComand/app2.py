from flask import Flask, render_template, redirect, url_for, request, make_response
import sqlite3

app = Flask(__name__)

def validate(username, password):
    con = sqlite3.connect('./db.db')
    with con:
        cur = con.cursor()
        cur.execute("SELECT * FROM Users WHERE username = ?", (username,))
        row = cur.fetchone()
        if row and check_password(row[1], password): 
            return True
    return False

def check_password(hashed_password, user_password):
    return hashed_password == user_password

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = ""
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if validate(username, password):
            resp = make_response(redirect(url_for('movement')))
            resp.set_cookie('username', username, max_age=60*60*24) #durata 24 ore
            return resp
        else:
            error = "Username o password non corretti"
    return render_template('login.html', error=error)

@app.route('/movement', methods=['GET', 'POST'])
def movement():
    if request.method == 'POST':
        action = None
        if request.form.get('action1') == 'avanti':
            action = "avanti"
            # alphaBot.forward()
        elif request.form.get('action2') == 'indietro':
            action = "indietro"
            # alphaBot.backward()
        elif request.form.get('action3') == 'destra':
            action = "destra"
            # alphaBot.right()
        elif request.form.get('action4') == 'sinistra':
            action = "sinistra"
            # alphaBot.left()
        elif request.form.get('action5') == 'stop':
            action = "stop"
            # alphaBot.stop()
        elif request.form.get('action6') == 'log-out':
            resp = make_response(redirect(url_for('login')))
            resp.delete_cookie('username')
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
                    cur.execute("INSERT INTO Users (username, password) VALUES (?, ?)", (username, password))
                    con.commit()
                    return redirect(url_for('login'))
        except sqlite3.Error as e:
            error = f"Errore nel database: {e}"

    return render_template('createAccount.html', error=error)

@app.route('/')
def index():
    username = request.cookies.get('username')
    if username:
        return redirect(url_for('movement'))
    return redirect(url_for('login')) 

if __name__ == '__main__':
    app.run(debug=True, host='localhost')
