#!/bin/bash

#DECLARACAO DE VARIAVEIS

CAMINHO=Projects/shell_script/wpaper_chan_weather
M_FRIO=$HOME/$CAMINHO/imagens/muito_frio.jpg
FRIO=$HOME/$CAMINHO/imagens/frio.jpg
NORMAL=$HOME/$CAMINHO/imagens/normal.jpg
QUENTE=$HOME/$CAMINHO/imagens/quente.jpg
M_QUENTE=$HOME/$CAMINHO/imagens/muito_quente.jpg
TEMPO=`curl wttr.in/sao-paulo?format=3 | cut -d'+' -f2 | cut -c 1,2`
HORA=$(date)

#VERIFICACAO DO TEMPO ATUAL E APLICACAO DO WALLPAPER

if [ $TEMPO -lt 10 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$M_FRIO
    echo $TEMPO >> $HOME/$CAMINHO/log.txt
    echo $HORA >> $HOME/$CAMINHO/log.txt
    echo "gsettings set org.gnome.desktop.background picture-uri file://$M_FRIO" >> $HOME/$CAMINHO/log.txt
elif [ $TEMPO -lt 20 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$FRIO
    echo $TEMPO >> $HOME/$CAMINHO/log.txt
    echo $HORA >> $HOME/$CAMINHO/log.txt
    echo "gsettings set org.gnome.desktop.background picture-uri file://$FRIO" >> $HOME/$CAMINHO/log.txt
elif [ $TEMPO -lt 25 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$NORMAL
    echo $TEMPO >> $HOME/$CAMINHO/log.txt
    echo $HORA >> $HOME/$CAMINHO/log.txt
    echo "gsettings set org.gnome.desktop.background picture-uri file://$NORMAL" >> $HOME/$CAMINHO/log.txt
elif [ $TEMPO -lt 29 ];then
    gsettings set org.gnome.desktop.background picture-uri file://$QUENTE
    echo $TEMPO >> $HOME/$CAMINHO/log.txt
    echo $HORA >> $HOME/$CAMINHO/log.txt
    echo "gsettings set org.gnome.desktop.background picture-uri file://$QUENTE" >> $HOME/$CAMINHO/log.txt
else
    gsettings set org.gnome.desktop.background picture-uri file://$M_QUENTE
    echo $TEMPO >> $HOME/$CAMINHO/log.txt
    echo $HORA >> $HOME/$CAMINHO/log.txt
    echo "gsettings set org.gnome.desktop.background picture-uri file://$M_QUENTE" >> $HOME/$CAMINHO/log.txt
fi