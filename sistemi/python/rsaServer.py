import socket
import threading
import math
from sympy import prime
import numpy as np

MY_ADDRESS = ("127.0.0.1", 9000)
BUFFER_SIZE = 4096


class GestoreClient(threading.Thread):
    def __init__(self, connection, address):
        super().__init__()
        self.connection = connection
        self.address = address
        self.running = True

    def run(self):
        d, n = generaInvioChiavi(self.connection)
        while self.running:
            try:
                messaggio = self.connection.recv(BUFFER_SIZE)
                if not messaggio:
                    print(f"Client {self.address} disconnesso.")
                    break
                valori = messaggio.decode()
                print(f"Messaggio da {self.address}: {valori}")
            except ConnectionResetError:
                print(f"Connessione con {self.address} persa.")
                break
            lista_cod = eval(valori)
            lista_decod = []
            for k in lista_cod:
                lista_decod.append(decodifica(k, d, n))
            print(tradFrase(lista_decod))

        self.connection.close()

def tradFrase(lista_ascii):
    stringa = ""
    for valore in lista_ascii:
        stringa += chr(valore)
    return stringa

def mcm(a, b):
    return (a * b) // math.gcd(a, b)

def decodifica(b, d, n):
    return (b**d) % n

def generaInvioChiavi(connessione):
    p = prime(np.random.randint(1, 20))
    q = prime(np.random.randint(1, 20))
    n = p * q
    m = mcm(p - 1, q - 1)

    for i in range(2, m):
        if math.gcd(i, m) == 1:
            c = i
            break

    for k in range(1, m):
        if (c * k) % m == 1:
            d = k
            break

    print(f"Chiavi pubbliche: n = {n}, c = {c}")
    print(f"Chiave privata: m = {m}, d = {d}")

    connessione.sendall(f"{n}-{c}".encode())
    return d, n

def main():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(MY_ADDRESS)
    server_socket.listen()

    while True:
        connessione, indirizzo_client = server_socket.accept()
        print(f"Client {indirizzo_client} connesso.")
        
        thread_client = GestoreClient(connessione, indirizzo_client)
        thread_client.start()

if __name__ == "__main__":
    main()
