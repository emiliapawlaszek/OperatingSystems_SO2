#!/bin/bash

# Przesuwanie wszystkich plików z ustawionym prawem wykonywania z jednego katalogu do
# drugiego. Pozostałe pliki w katalogu nie powinny być ruszane. Nazwy katalogów,
# źródłowego i docelowego, zadawane jako parametry skryptu.

for file in $1/*
do
	if [ -x $file ]
	then
		mv $1/$file $2/
	fi
done

# nie działa nie wiem czemu
