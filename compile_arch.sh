#!/bin/bash

export _pkgrel=3

base=/home/sub77/mate-desktop

core="
mate-common
mate-desktop
"

main="
caja
eom
libmatekbd
libmatemixer
libmateweather
mate-menus
mate-panel
mate-applets
mate-indicator-applet
mate-settings-daemon
mate-polkit
mate-session-manager
mate-media
mate-netbook
mate-screensaver
mate-sensors-applet
mate-system-monitor
mate-user-share
mate-utils pluma
"

extra="
marco
mate-control-center
python-caja
"

test="
mate-common
"

excluded="
caja-extensions
mate-power-manager
"

#for pkgbase in ${core} ${main} ${extra}
for pkgbase in ${test}
 do
  cd "$base"/"$pkgbase"
   echo -e 'change dir -> '"$base/$pkgbase"
    makepkg -i -d
    cd $base
 done

