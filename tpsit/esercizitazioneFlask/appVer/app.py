from flask import Flask, render_template, redirect, url_for, request, make_response
import sqlite3
import hashlib
from datetime import datetime

app = Flask(__name__)
app.config["SECRET_KEY"] = "chiave_super_segreta"

def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

@app.route('/login', methods=['GET', 'POST'])
def login():
    conn = sqlite3.connect("./db.db")
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
    
        with conn:
            cur = conn.cursor()
            cur.execute("SELECT * FROM users WHERE username =?", (username,))
            userDb = cur.fetchone()
            #conn.commit() -> per modifiche sul db
            print(userDb)

        if userDb and userDb[2] == hash_password(password):
            resp = make_response(redirect(url_for('home')))
            resp.set_cookie('username', username, max_age=60)
            return resp
        
    return render_template('login.html')

@app.route('/home', methods=['GET', 'POST'])
def home():
    resp = None
    if request.method == 'POST':
        if request.form.get('action-logout') == "logout": 
            resp = make_response(redirect(url_for('login')))
            resp.delete_cookie('username')
            return resp
        if request.form.get('action-invia') == "invia":
            numero = request.form['action-numero']
            print(numero)
    return render_template('home.html')

@app.route('/', methods=['GET', 'POST'])
def index():
    username = request.cookies.get('username')
    if username:
        return redirect(url_for('home'))
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True, host='localhost')


