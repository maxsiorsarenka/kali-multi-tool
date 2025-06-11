#!/bin/bash

# Zielony kolor
GREEN='\033[0;32m'
NC='\033[0m' # Brak koloru

# Czyści ekran
clear

# Nagłówek ASCII stylu lat 80.
echo -e "${GREEN}"
echo "╔════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                    ║"
echo "║   /$$      /$$           /$$   /$$     /$$       /$$$$$$$$                  /$$    ║"
echo "║  | $$$    /$$$          | $$  | $$    |__/      |__  $$__/                 | $$    ║"
echo "║  | $$$$  /$$$$ /$$   /$$| $$ /$$$$$$   /$$         | $$  /$$$$$$   /$$$$$$ | $$    ║"
echo "║  | $$ $$/$$ $$| $$  | $$| $$|_  $$_/  | $$         | $$ /$$__  $$ /$$__  $$| $$    ║"
echo "║  | $$  $$$| $$| $$  | $$| $$  | $$    | $$         | $$| $$  \ $$| $$  \ $$| $$    ║"
echo "║  | $$\  $ | $$| $$  | $$| $$  | $$ /$$| $$         | $$| $$  | $$| $$  | $$| $$    ║"
echo "║  | $$ \/  | $$|  $$$$$$/| $$  |  $$$$/| $$         | $$|  $$$$$$/|  $$$$$$/| $$    ║"
echo "║  |__/     |__/ \______/ |__/   \___/  |__/         |__/ \______/  \______/ |__/    ║"
echo "║                                                                                    ║"
echo "║                         KALI MULTI TOOL INTERFACE                                  ║"
echo "║                        Version 1.0 - Hacker Edition                                ║"
echo "╚════════════════════════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Menu opcji
while true; do
  echo -e "${GREEN}"
  echo "╔═══════════════════════ MENU ═══════════════════════╗"
  echo "║ 1) Wireshark                                       ║"
  echo "║ 2) Terminal                                        ║"
  echo "║ 3) Firefox                                         ║"
  echo "║ 4) Tor Browser                                     ║"
  echo "║ 5) nmap                                            ║"
  echo "║ 6) hydra                                           ║"
  echo "║ 7) Burp Suite                                      ║"
  echo "║ 8) sqlmap                                          ║"
  echo "║ 9) Metasploit Framework                            ║"
  echo "║ G) Mini gierka (ninvaders - Space Invaders)        ║"
  echo "║ 0) Wyjście                                         ║"
  echo "╚════════════════════════════════════════════════════╝"
  echo -e "${NC}"
  read -p ">> " opcja

  case $opcja in
    1) wireshark & ;;
    2) gnome-terminal & ;;
    3) firefox & ;;
    4) torbrowser-launcher & ;;
    5)
      read -p "Podaj IP/host do skanowania: " target
      gnome-terminal -- bash -c "nmap -A $target; exec bash" ;;
    6)
      echo "Przykład: hydra -l admin -P /usr/share/wordlists/rockyou.txt 192.168.1.1 http-get"
      gnome-terminal -- bash -c "hydra; exec bash" ;;
    7) burpsuite & ;;
    8)
      echo "Uruchamiam sqlmap interaktywnie..."
      gnome-terminal -- bash -c "sqlmap; exec bash" ;;
    9) gnome-terminal -- bash -c "msfconsole; exec bash" ;;
    G|g)
      if command -v ninvaders &> /dev/null; then
        gnome-terminal -- bash -c "ninvaders; exec bash"
      else
        echo "ninvaders nie jest zainstalowany. Instaluję..."
        sudo apt install ninvaders -y
        ninvaders
      fi ;;
    0)
      echo -e "${GREEN}╔═══[ Żegnaj, cyberwojowniku! ]═══╗"
      echo -e "║        Do zobaczenia!         ║"
      echo -e "╚═══════════════════════════════╝${NC}"
      exit ;;
    *) echo -e "${GREEN}Niepoprawny wybór. Spróbuj ponownie.${NC}" ;;
  esac
done
