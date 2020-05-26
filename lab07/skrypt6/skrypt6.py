#!/usr/bin/python3

# Skrypt nr 6
# Łączenie w jeden plików z listy, umieszczonej w pliku o zadanej nazwie (parametr
# wywołania skryptu. Kolejność, w jakiej pliki zostaną połączone - ściśle według listy. Treść
# każdego pliku powinna być poprzedzona nagłówkiem z jego nazwą. Plik wynikowy powinien
# mieć nazwę pliku pierwotnie zawierającego listę.

import os
import stat
from stat import *
import sys

if len(sys.argv) != 2:
    print("Niewystarczająca liczba argumentów.")
    print("Przykładowe użycie: ./skrypt6.py skrypt6_lista.txt")
    exit()

mode = os.stat(sys.argv[1]).st_mode
if S_ISREG(mode) == 0:
    print("Błąd, pierwszy parametr powinien być plikiem.")
    sys.exit()

file = open(sys.argv[1], "r")
files_in_file = []

for i in file:
    s = str(i).rstrip()
    if s != '':
        files_in_file.append(s)
print("Pliki na liście:     " + str(files_in_file))

files_in_dir = os.listdir(os.getcwd())
print("Pliki w katalogu:    " + str(files_in_dir))

my_file = open(sys.argv[1], "w")
for i in files_in_file:
    if i not in reversed(files_in_dir):
        open(i, "w")
    with open(i) as f:
        if i in reversed(files_in_dir):
            my_file.write(i)
            my_file.write("\n")
            content = f.readlines()
            content = [x.strip() for x in content]
            for k in content:
                my_file.write(k)
                my_file.write("\n")
        else:
            my_file.write(i)
            my_file.write("\n")

print("Został utworzony plik")
