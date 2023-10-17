#! /bin/bash
echo ''
echo "Welcome `tput setaf 1`@$USER`tput sgr0`"
echo "`tput setaf 5``tput bold`

    _          _         _                   _          _______ _           _
   | |        | |       | |                 (_)        (_______|_)         | |`tput setaf 6`
    \ \  _   _| | _   _ | | ___  ____   ____ _ ____     _____   _ ____   _ | | ____  ____
     \ \| | | | || \ / || |/ _ \|    \ / _  | |  _ \   |  ___) | |  _ \ / || |/ _  )/ ___)
 _____) ) |_| | |_) | (_| | |_| | | | ( ( | | | | | |  | |     | | | | ( (_| ( (/ /| |`tput setaf 5`
(______/ \____|____/ \____|\___/|_|_|_|\_||_|_|_| |_|  |_|     |_|_| |_|\____|\____)_|
`tput sgr0`"
echo "`tput setaf 5``tput sitm`This tool will help you to find subdomains of a Target.`tput sgr0`"
echo ""
if ! command -v assetfinder >/dev/null || ! command -v httprobe > /dev/null; then
 echo "`tput setaf 4``tput bold`Required tool doesn't exist`tput sgr0`" 
 if  ! command -v assetfinder >/dev/null ; then
  echo "`tput setaf 1``tput bold``tput blink`Installing assetfinder...`tput sgr0`"
   sudo apt install assetfinder
 fi
 if ! command -v httprobe >/dev/null ; then
  echo "`tput setaf 1``tput bold``tput blink`Installing httprobe...`tput sgr0`"
   sudo apt install httprobe
 fi
 read -p"`tput setaf 6``tput bold` Enter your Target Domain: `tput sgr0`" target
 echo "`tput setaf 3`Please wait it may take some time depending on the number of Subdomains`tput blink`......`tput sgr0`"
 assetfinder $target > sub.txt
 cat sub.txt |httprobe > live.txt
 sort -u live.txt > subs.txt
 cat subs.txt
 rm sub.txt
 rm live.txt
 echo "`tput sitm``tput setaf 4` Thank you for using Subdomain Finder `tput sgr0` "
else 
 read -p"`tput setaf 6``tput bold` Enter your Target Domain: `tput sgr0`" target
 echo "`tput setaf 3`Please wait it may take some time depending on the number of  Subdomains`tput blink`......`tput sgr0`"
 assetfinder $target > sub.txt
 cat sub.txt |httprobe > live.txt
 sort -u live.txt > subs.txt
 cat subs.txt
 rm sub.txt
 rm live.txt
 echo "`tput sitm``tput setaf 4` Thank you for using Subdomain Finder `tput sgr0` "
fi
