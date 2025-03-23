import hashlib
m = hashlib.sha256()
m.update(b"Nobody inspects") #rende la stringa in formato binario
m.update(b"the spammish repetition")
print(m.digest())
print(m.hexdigest())

valori = input("inserire un valore: ")
ris = hashlib.sha256()
ris.update(f"{valori}".encode())
print(ris.digest())
print(ris.hexdigest())

fileName = "./prova.txt"
with open(fileName, "r") as file:
    file = file.read()
print(file)

risF = hashlib.sha256()
risF.update(f"{file}".encode())
print(risF.digest())
print(risF.hexdigest())