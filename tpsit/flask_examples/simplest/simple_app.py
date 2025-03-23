#flask associa url a funzioni python

from flask import Flask

app = Flask(__name__)

@app.route('/') #decoratori
def index():
    return 'Ciao!'

@app.route('/pagina/')
def index2():
    return 'pagina!'

if __name__ == '__main__':
    app.run(debug=True, host='localhost') #debug true modifica in automatico senza eseguirlo nuovamente