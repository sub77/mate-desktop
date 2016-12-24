#!/bin/bash

export _pkgrel=3

base=/home/sub77/mate-desktop

source mate-repositories.sh

for pkgbase in `find . -type f -name "$pkgbase"`; do echo "$pkgbase" ; done



