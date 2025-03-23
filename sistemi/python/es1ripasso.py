#esercizio di ripasso 13/09/2024

lista = ["4o", "4o-mini", "o1-preview", "o1-mini"]

#c style
for e in range(0, len(lista)):
    print("ChatGPT - " + lista[e])

#py style
for versione in lista:
    print(f"ChatGPT - {versione}")

for indice, versione in enumerate(lista):
    print(f"La versione {indice + 1} di ChatGPT è {versione}")

nomi = ["Ciola", "Sbrundi", "Erman", "Sandro"]
for nome, versione in zip(nomi, lista):  #il ciclo termina sulla lista più corta NON DA ERRRORE
    print(f"{nome} usa ChatGPT {versione}")

nomi.append("Pisso")
print(nomi[0]) #primo
print(nomi[-1]) #ultimo
print(nomi[-2]) #penultimo
print(nomi[0:2]) #stampa indici da 0 a 2 (escluso)
print(nomi[0:-1]) #ultimo escluso
#lo 0 inziale si può sempre omettere
print(nomi[-2:]) #stampa gli ultimi due
print(nomi[0::2]) #stampa solo gli indici pari