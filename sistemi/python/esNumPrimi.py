"""
dato n trovare i fattori primi che moltiplicati danno n
"""
import math

def isPrimi(n):
    div = True
    for i in range(2, n-1):
        if n%i == 0:
            div = False
            break
    return div


def main():
    n = 5
    print(isPrimi(14))
    for i in range(2, int(math.sqrt(n)+1), 2):
        if isPrimi(i):
            c = n//i
            if isPrimi(c) and c*i == n:
                print(f"{c} * {i} = {n}")

if __name__ == "__main__":
    main()