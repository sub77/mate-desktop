#!/bin/bash

export _pkgrel=3

base=/home/sub77/mate-desktop

source mate-repositories.sh

for pkgbase in ${core} ${main} ${extra}
 do
  cd "$base"/"$pkgbase"
  echo -e 'change dir -> '"$base/$pkgbase"
  if [ -f "$base/$pkgbase"/src/$pkgbase*/configure ]; then
    makepkg -C -c -s --noprepare;
  else
    makepkg -C -c -s
  fi
    cd $base
 done

