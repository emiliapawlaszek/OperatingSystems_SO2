# Zmiana nazw wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do
# których mamy ustawione prawo zapisu, przez dopisanie dodatkowego członu .old. Wcześniej
# należy skasować wszystkie pliki, które już mają takie rozszerzenie.

#!/bin/bash
if [ ! $# -eq 1 ]
then
echo "wrong arguments"
exit 0
fi

rm *.old


for var in $(ls $1)
do
if [ -w $var ]
then echo "file writable"
mv $1'/'$var $1'/'$var'.old'
fi
done
