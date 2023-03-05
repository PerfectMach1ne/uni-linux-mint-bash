#!/bin/bash

cd "$(dirname "$0")"

echo "Zasoby z obecnego katalogu:"
ls -p | grep -v /

z=1;
while [ $z -le 40 ]
do
 echo -n "="
 z=$[z+1]
done
echo

echo "Wybierz numer polecenia i wcisnij ENTER"

CZYTAJ()
{
  if [ -f "$1" ]; then cat < "$1"
  elif [ -r "$1" ]; then echo "Brak uprawnien dostepu"
  else echo "Podany plik nie istnieje"
  fi
}

function LISTA
{
 ls -p | grep -v /
}

select s in CZYTAJ LISTA KONIEC
do
 case $s in
  CZYTAJ)
   echo "Podaj nazwe pliku"
   read plik
   CZYTAJ $plik;;
  LISTA) LISTA;;
  KONIEC) exit;;
  *) echo "Niepoprawne polecenie";;
 esac
done