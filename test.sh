#!/bin/bash

textbisher='prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}
'

dazu=' und dies ist das Ende der zweiten Zeile'

textneu=$(echo "$textbisher" | sed "3s/$/$dazu/")

echo "$textneu"
