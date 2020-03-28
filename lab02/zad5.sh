#!/bin/bash

# Łączenie w jeden wszystkich plików należących do zadanego katalogu (parametr wywołania
# skryptu), o zadanym rozszerzeniu (drugi parametr skryptu). Kolejność, w jakiej pliki zostaną
# połączone - nieistotna. Treść każdego pliku powinna być poprzedzona nagłówkiem z jego
# nazwą.


PLIK=$1/nowyplik$2
touch $PLIK

for file in $1/*
do
	echo Zapisywanie $file
	echo $file >> $PLIK
	cat $file >> $PLIK
	echo "" >> $PLIK
done
