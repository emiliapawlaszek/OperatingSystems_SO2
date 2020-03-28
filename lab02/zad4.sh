#!/bin/bash

# Numerowanie wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do
# których mamy ustawione prawo wykonywania („execute”), przez dodanie dodatkowego
# członu rozszerzenia o postaci .<numer kolejny>. Numeracja powinna przebiegać według
# wielkości plików.


i=1
for file in `ls -S $1` # -S segreguje według rozmiarów plików
do
  if [ -x $1/$file ]
  then
    echo Zmiana nazwy $i
    mv $1/$file $1/$file.$i
    i = `expr $i + 1`
  fi
done

# jak stworzyc plik execute???
