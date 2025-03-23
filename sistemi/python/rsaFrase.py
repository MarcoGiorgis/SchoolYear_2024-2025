"""
RSA

Algoritmo di crittografia
Utilizza numeri primi
minimo comune multiplo mcm(a,b) = ab / gcd(a,b)
massimo comune divesore math.gcd(a,b)
"""
import math
from sympy import prime
import numpy as np

def mcm(a, b):
    return (a * b) // math.gcd(a, b)

def tradAscii(f):
    lista_ascii = []
    for i in f:
        lista_ascii.append(ord(i))
    print(lista_ascii)
    return lista_ascii

def tradFrase(lista_ascii):
    stringa = ""
    for valore in lista_ascii:
        stringa += chr(valore)
    return stringa

def codifica(a, n, c):
    return (a**c) % n

def decodifica(b, d, n):
    return (b**d) % n

def main():
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

    frase = input("Inserire una frase: ")
    lista_ascii = tradAscii(frase)

    lista_cod = []
    lista_decod = []
    for i in lista_ascii:
        lista_cod.append(codifica(i, n, c))
    print(lista_cod)
    for k in lista_cod:
        lista_decod.append(decodifica(k, d, n))
    print(lista_decod)
    print(tradFrase(lista_decod))

if __name__ == "__main__":
    main()
