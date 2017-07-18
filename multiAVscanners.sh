#!/bin/sh

ajuda()	{
	echo "$0 - Faltou argumento..."
	echo
	echo "Uso:"
	echo "$0 \"arquivo a ser varrido\"... OU..."
	echo "$0 update"
	echo
	exit 1
}

[ "$#" -eq 0 ] && ajuda;

daemonStart() {
### Inicia daemons ###

# Clamav
sudo service clamav-daemon status > /dev/null; [ "$?" -ne 0 ] && sudo service clamav-daemon start
sudo service clamav-freshclam status > /dev/null; [ "$?" -ne 0 ] && sudo service clamav-freshclam start

# avast
sudo service avast status > /dev/null; [ "$?" -ne 0 ] && sudo service avast start

# AVG
# avgd

# F-Prot
# não tem daemon

# Comodo
sudo service cmdavd status > /dev/null; [ "$?" -ne 0 ] && sudo service cmdavd start
sudo service iodined status > /dev/null; [ "$?" -ne 0 ] && sudo service iodined start

# Zoner
sudo service zavd status > /dev/null; [ "$?" -ne 0 ] && sudo service zavd start

# Sophos
sudo service sav-protect status > /dev/null; [ "$?" -ne 0 ] && sudo service sav-protect start

# Kaspersky
sudo service kav4fs-supervisor status > /dev/null; [ "$?" -ne 0 ] && sudo service kav4fs-supervisor start

# BitDefender
# bd 

# Avira
sudo service avguard status > /dev/null; [ "$?" -ne 0 ] && sudo service avguard start

}

daemonStop()	{
sudo service clamav-daemon stop
sudo service clamav-freshclam stop
sudo service avast stop
sudo service cmdavd stop
sudo service iodined stop
sudo service zavd stop
sudo service sav-protect stop
sudo service kav4fs-supervisor stop
sudo service avguard stop
}

atualiza()	{	
	# clamav
	sudo freshclam
		if [ "$?" -eq 0 ]; then
			echo -e '\033[43;34m Clamav \033[m'
			echo -e "\033[43;31;1;5m Update Ok\033[m"
		else 
			echo -e '\033[43;34m Clamav \033[m'
			echo -e "\033[43;31;1;5m Update Falhou\033[m"
		fi
	# avast
	sudo foobar
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Avast \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Avast \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# avg
	sudo avgupdate
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m AVG \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m AVG \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# f-prot
	sudo foobar
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m F-prot \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m F-prot \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# comodo
	sudo foobar
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Comodo \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Comodo \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Zoner
	sudo /etc/init.d/zavd update
	sudo /etc/init.d/zavd restart
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Zoner \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Zoner \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Sophos
        sudo foobar
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Sophos \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Sophos \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Kaspersky
	sudo foobar
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Kaspersky \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Kaspersky \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# BitDefender
	sudo /opt/BitDefender-scanner/bin/bdscan --update
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m BitDefender \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m BitDefender \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
	# Avira
	sudo /usr/lib/AntiVir/guard/avupdate-guard --product=Guard
                if [ "$?" -eq 0 ]; then
                        echo -e '\033[43;34m Avira \033[m'
                        echo -e "\033[43;31;1;5m Update Ok\033[m"
                else
                        echo -e '\033[43;34m Avira \033[m'
                        echo -e "\033[43;31;1;5m Update Falhou\033[m"
                fi
}

varredura()	{
# Scan
	# clamav
	RETORNO=$(sudo clamscan "$1")
	echo -e '\033[43;34m Clamav \033[m'
	echo -e "\033[43;31;1;5m $RETORNO \033[m"
	unset RETORNO
	echo
	# avast
        RETORNO=$(sudo scan "$1")
        echo -e '\033[43;34m Avast \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# avg
        RETORNO=$(sudo avgscan "$1")
        echo -e '\033[43;34m AVG \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# f-prot
        RETORNO=$(sudo /opt/f-prot/fpscan -r "$1")
        echo -e '\033[43;34m F-prot \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# comodo
        RETORNO=$(sudo /opt/COMODO/cmdscan -v -s "$(pwd)/$1")
        echo -e '\033[43;34m Comodo \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# zoner
        RETORNO=$(sudo zavcli "$1")
        echo -e '\033[43;34m Zoner \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# sophos
        RETORNO=$(sudo /opt/sophos-av/bin/savscan -sc -f -rec "$1")
        echo -e '\033[43;34m Sophos \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# kaspersky
        RETORNO=$(sudo /opt/kaspersky/kav4fs/bin/kav4fs-control --scan-file "$1")
        echo -e '\033[43;34m Kaspersky \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# bitdefender
        RETORNO=$(sudo /opt/BitDefender/bin/bdconsole -f "$1")
        echo -e '\033[43;34m BitDefender \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
	# avira
        RETORNO=$(sudo /usr/lib/AntiVir/guard/avscan --quarantine-dir=/tmp --heur-level=3 -V "$1")
        echo -e '\033[43;34m Avira \033[m'
        echo -e "\033[43;31;1;5m $RETORNO \033[m"
        unset RETORNO
        echo
}	

daemonStart

# Scan ou Update...

# Update
if [ $1 = update ]; then 
	atualiza
else
	varredura
fi

daemonStop