#!/bin/bash

# Zmiana nazw wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do
# których mamy ustawione prawo zapisu, przez dopisanie dodatkowego członu .old. Wcześniej
# należy skasować wszystkie pliki, które już mają takie rozszerzenie.

#   $0 - adres komendy
#   $# - liczba przekazanych argumentow, bez 0
#   $@ i $* - wszystkie argumenty skryptu. w cudzysłowach
#   (argumenty jako lista wyrazow, jako pojedynczy wyraz)

# SPRAWDZANIE ARGUMENTOW:
# (a) sprawdzenie czy liczba otrzymanych argumentów jest co najmniej
# taka sama jak wymagana liczba argumentów,
# (b) sprawdzenie czy argumenty, które mają być plikami są istniejącymi
# plikami odpowiednich typów.

# OPERATORY:
# -f - true jeśli ścieżka file wskazuje na isniejący plik regularny
# -eq =, -gt >, -ge >=, -a AND, -o OR,
# wynik komendy = 0 - TRUE, inne niż 0 - FALSE
# $ chmod +x hello_world.sh

# dobra stronka: https://devhints.io/bash


for file in $1/*.old
do
	rm $file
done


for file in $1/*
do
	mv $file $file.old
done
