#!/bin/bash
# 2024-06-03 svelue 
# This is a version of 20winns but the computer winns every time.


spielstand=1

# Rundenschleife
while true; do
    echo "Copmuter sagt: $spielstand"
    # neuer Spieler-Versuch einlesen
    while true; do
        read -p "Ihre Versuch: " versuch
        if [[ $versuch -gt 20 ]]; then
            echo "Dein Versuch ist zu gross!"
        elif [[ $versuch -eq $(($spielstand+1)) ]] \
          || [[ $versuch -eq $(($spielstand +2)) ]]; then
            break
        else
            echo "Falscher Versuch, try again"
        fi
    done
    spielstand=$versuch
    if [[ $spielstand -eq 20 ]]; then
       echo "Wow, du hast gewonnen. Tolle Leistung!"
       exit 0
    fi


 # Computer ist am Zug
    if (( ($spielstand - 1) % 3 == 0 )); then
        spielstand=$((spielstand + 1))
    else
        spielstand=$((spielstand + 2))
    fi
    echo "Der Computer sagt $spielstand."
    if [[ $spielstand -eq 20 ]]; then
       echo "Computer gewann. Es wurde 20 genannt."
       exit 1
    fi
done
