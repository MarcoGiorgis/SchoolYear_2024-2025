"""
server che genera chiavi le manda a client
client riceve chaivi e chiede in input la frase la codifica la manda al server 
server la decodifica
"""
import socket
import threading

SERVER_ADDRESS = ("127.0.0.1", 9000)
BUFFER_SIZE = 4096

class threadClient(threading.Thread):
    def __init__(self, s):
        super().__init__()
        self.s = s

    def run(self):
        message = self.s.recv(BUFFER_SIZE)
        valori = message.decode()
        print(valori)
        chiavi = valori.split("-")
        while True:
            frase = input("Inserire una frase: ")
            fraseAscii = tradAscii(frase)

            fraseCod = creazioneFraseCodificata(fraseAscii, chiavi[0], chiavi[1])
            print(fraseCod)
            self.s.sendall(str(fraseCod).encode())

def creazioneFraseCodificata(fraseAscii, n, c):
    lista_cod = []
    for i in fraseAscii:
        lista_cod.append(codifica(i, int(n), int(c)))
    return lista_cod

def tradAscii(f):
    lista_ascii = []
    for i in f:
        lista_ascii.append(ord(i))
    return lista_ascii

def codifica(a, n, c):
    return (a**c) % n

def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(SERVER_ADDRESS)
    while True:
        thread = threadClient(s)
        thread.start()

if __name__ == "__main__":
    main()