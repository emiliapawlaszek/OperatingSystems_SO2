#!/bin/bash

# - w zadanym katalogu stworzy strukturę plików pozwalającą na przetestowanie zadania
# rm -r $1
mkdir $1
touch $1/test.txt
touch $1/plik3.test
touch $1/plik1.test
touch $1/plik4.test
touch $1/plik2.test
touch $1/plik5.jpg
touch $1/plik6.png
touch -t 201904011030.30 $1/plik7.png

# - a) znajdzie pliki, które w nazwie zawierają słowo "test" -
# posortuje je i wyświetli ograniczając ich liczbę do pierwszych trzech
echo "Zadanie 1a"
find $1 -name "*test*" -print | sort | head -n 3

# - b) znajdzie pliki z rozszerzeniem *.jpg lub *.png i z wykorzystaniem
# pętli while wyświetli ścieżki kanoniczne do tych plików zamieniając "/" na "|"
echo "Zadanie 1b"
find $1 \( -name "*.jpg" -o -name "*.png" \) | while read file
do
  echo `realpath $file` | tr '/' '|'
done

# - c) usunie (zanim zaczną państwo usuwać pliki proponuję je wyświetlić!) wszystkie
# pliki starsze niż 1 min - ograniczyć wyszukiwanie plików do 2 podkatalogów w głąb -
# wykorzystaj flagę exec
echo "Zadanie 1c"
find $1 ! -newermt '1 minute ago' -print -exec rm {} \;
