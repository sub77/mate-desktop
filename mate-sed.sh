#!/bin/bash

export _pkgrel=3

base=/home/sub77/mate-desktop

source mate-repositories.sh

#for pkgbase in ${test}

for pkgbase in ${core} ${main} ${extra} ${test}
 do
  mkdir  "$base"/"$pkgbase"
   echo -e 'mkdir -> '"$base/$pkgbase"
    ###cp /home/sub77.arch0/base/"$pkgbase"/PKGBUILD "$base"/"$pkgbase"
    sed -i '/pkgrel=/s/[0-9]/${_pkgrel}/g' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/provides=/s/provides/#provides/g' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/conflicts=/s/conflicts/#conflicts/g' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/source=/d' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/prepare()/i source=(${_pkgbase}-${pkgver}::git+http://github.com/mate-desktop/${_pkgbase}#branch=master)' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/md5sums=/d' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/source=/i md5sums=('SKIP')' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/cd/s/"${srcdir}\/${_pkgbase}"/"${srcdir}\/${_pkgbase}-${pkgver}"/g' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/cd/s/"${srcdir}\/${pkgbase}"/"${srcdir}\/${_pkgbase}-${pkgver}"/g' "$base"/"$pkgbase"/PKGBUILD
    sed -i '/NOCONFIGURE/d' "$base"/"$pkgbase"/PKGBUILD
    sed -i 's/^prepare.*$/prepare() {\n    cd "${srcdir}\/\${_pkgbase}-${pkgver}"\n    NOCONFIGURE=1 \/usr\/bin\/mate-autogen/' "$base"/"$pkgbase"/PKGBUILD
    cd $base
 done


