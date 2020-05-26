#!/usr/bin/python3.7

# Skrypt nr 11
# Porównanie zawartości zadanego katalogu z listą plików (nazwa katalogu i pliku z listą
# zadawana w argumentach skryptu). Należy wygenerować listę plików brakujących w
# katalogu i takich, które nie są na liście.

import os
import sys
import stat
from stat import *
import numpy as np

if len(sys.argv) != 3:
    print("Niewystarczająca liczba argumentów.")
    print("Przykładowe użycie: ./skrypt11.py skrypt11_kat skrypt11_lista.txt")
    sys.exit()

mode1 = os.stat(sys.argv[1]).st_mode
if S_ISDIR(mode1) == 0:
    print("Błąd, pierwszy parametr powinien być katalogiem.")
    sys.exit()
mode2 = os.stat(sys.argv[2]).st_mode
if S_ISREG(mode2) == 0:
    print("Błąd, drugi parametr powinien być plikiem.")
    sys.exit()

file = open(sys.argv[2], "r")
files_in_file = []

for i in file:
    s = str(i).rstrip()
    if s != '':
        files_in_file.append(s)
print("Pliki na liście:     " + str(files_in_file))


files_in_dir = os.listdir(sys.argv[1])
print("Pliki w katalogu:    " + str(files_in_dir))


print("Brak w katalogu:     " + str(np.setdiff1d(files_in_file, files_in_dir)))
print("Brak na liście:      " + str(np.setdiff1d(files_in_dir, files_in_file)))
