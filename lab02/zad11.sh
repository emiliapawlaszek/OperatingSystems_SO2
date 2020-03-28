#!/bin/bash

# Porównanie zawartości zadanego katalogu z listą plików (nazwa katalogu i pliku z listą
# zadawana w argumentach skryptu). Należy wygenerować listę plików brakujących w
# katalogu i takich, które nie są na liście.

BRAK=$1/brak
touch brak

echo Brak na liscie >> $BRAK
for file in `ls $1`
do
  found=0
  for element in `cat $2`
  do
    if [ $file = $element ]
    then
      found=1
    fi
  done
  if [ $found -eq 0 -a $file != brak ]
  then
    echo $file >> $BRAK
  fi
done

echo Brak w katalogu >> $BRAK
for element in `cat $2`
do
  found=0
  for file in `ls $1`
  do
    if [ $element = $file ]
    then
      found=1
    fi
  done
  if [ $found -eq 0 ]
  then
    echo $element >> $BRAK
  fi
done

# wywołanie: ./zad11.sh ./example ./example/listaPlikowZad11
