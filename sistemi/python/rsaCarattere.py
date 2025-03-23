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

def codifica(n, c):
    while True:
        a = input("Inserire un valore: ")
        a = int(a)
        if 0 <= a < n:
            break
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
    
    b = codifica(n, c)
    print(f"Testo codificato: {b}")

    a_decodificato = decodifica(b, d, n)
    print(f"Testo decodificato: {a_decodificato}")


if __name__ == "__main__":
    main()
