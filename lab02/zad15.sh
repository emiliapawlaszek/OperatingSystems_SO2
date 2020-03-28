#!/bin/bash

# Policzenie wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do których
# ustawione jest prawo dostępu do wykonania („execute”).

COUNTER=0
for file in $1/*
do
  if [ -x $file ]
  then
    COUNTER = `expr $COUNTER + 1`
  fi
done
echo $COUNTER
