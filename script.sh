#!/bin/bash

#DECLARACAO DE VARIAVEIS

CAMINHO=Projects/shell_script/wpaper_chan_weather/imagens
M_FRIO=$HOME/$CAMINHO/muito_frio.jpg
FRIO=$HOME/$CAMINHO/frio.jpg
NORMAL=$HOME/$CAMINHO/normal.jpg
QUENTE=$HOME/$CAMINHO/quente.jpg
M_QUENTE=$HOME/$CAMINHO/muito_quente.jpg
TEMPO=$(curl wttr.in/sao-paulo?format=3 | cut -d'+' -f2 | cut -c 1,2)
HORA=$(date)

#CRIACAO DO LOG

echo $TEMPO >> $HOME/$CAMINHO/../log.txt
echo $HORA >> $HOME/$CAMINHO/../log.txt


#VERIFICACAO DO TEMPO ATUAL E APLICACAO DO WALLPAPER

if [ $TEMPO -lt 10 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$M_FRIO
    echo "gsettings set org.gnome.desktop.background picture-uri file://$M_FRIO" >> $HOME/$CAMINHO/../log.txt
elif [ $TEMPO -lt 20 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$FRIO
    echo "gsettings set org.gnome.desktop.background picture-uri file://$FRIO" >> $HOME/$CAMINHO/../log.txt
elif [ $TEMPO -lt 25 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$NORMAL
    echo "gsettings set org.gnome.desktop.background picture-uri file://$NORMAL" >> $HOME/$CAMINHO/../log.txt
elif [ $TEMPO -lt 29 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$QUENTE
    echo "gsettings set org.gnome.desktop.background picture-uri file://$QUENTE" >> $HOME/$CAMINHO/../log.txt
else
    gsettings set org.gnome.desktop.background picture-uri file://$M_QUENTE
    echo "gsettings set org.gnome.desktop.background picture-uri file://$M_QUENTE" >> $HOME/$CAMINHO/../log.txt
fi

exit