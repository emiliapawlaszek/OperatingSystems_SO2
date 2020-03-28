#!/bin/bash

#zad1
rm -r $1

mkdir $1
mkdir $1/A
mkdir $1/A/B
mkdir $1/A/C
mkdir $1/A/C/D
mkdir $1/E

echo "Test1" > $1/A/plik1.txt
echo "Test2" > $1/A/B/plik2.txt
echo "Test3" > $1/A/C/D/plik3.txt
echo "Test4" > $1/E/plik4.txt

ln -s `realpath $1/A/plik1.txt` $1/E/link_bez_plik1
ln -s `realpath $1/E/plik4.txt` $1/E/link_bez_plik4

ln -s ../../A/plik1.txt $1/A/B/link_plik1
ln -s ../A/B/plik2.txt $1/E/link_plik2
ln -s ../A/C/D/plik3.txt $1/E/link_plik3
ln -s ../../../E/plik4.txt $1/A/C/D/link_plik4


#zad2
cp -av $1/E/link_bez_plik1 $1/A/C/
cp -av $1/E/link_plik3 $1/A/C/
# link_plik3 nie działa ponieważ jest stworzony z wykorzystaniem ścieżki wzgędnej,
# a ta ścieżka działa tylko w odpowiednim katalogu

# czy tu jest błąd? Nie ma ./E/link_bez_plik2
cp -l $1/E/link_bez_plik4 $1/A/C/
# znajdzie wszystkie dowiązania do pliku
ls -la -R | grep "/plik1.txt"
# wyświetlenie jako ścieżki kanonicznej
readlink -f "$1/A/B/link_plik1"
readlink -f "$1/E/link_bez_plik1"
readlink -f "$1/A/C/link_bez_plik1"
