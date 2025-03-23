from sympy import prime
import numpy as np

#meccanismo che permette lo scambio di chiave in un algoritmo simmetrico
#alternativa a rsa nella crittografia ibrida

def main():
    N = prime(np.random.randint(1, 20))
    g = np.random.randint(1, N)
    a = 10
    A = g**a % N
    b = 5
    B = g**b % N
    resultA = B**a % N
    resultB = A**b % N
    print(resultA)
    print(resultB)

if __name__ == "__main__":
    main()