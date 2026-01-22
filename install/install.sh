#! /bin/bash
#Installs Uil bash script. 

ORIGINAL_USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)

# Check if the script is being run with sudo
if [ -z "$SUDO_USER" ]; then
    echo "This script must be run with sudo."
    exit 1
fi

	#Sources the outernet Config file. 
source /etc/outernet/outernet.conf && echo "Loaded Config" || {
	echo "Failed to load config file from /etc/outernet/outernet.conf">&2
	exit 1
}


case "$1" in

  "install" )

    echo "Installing Uil Module"
  
    mkdir -p /var/log/outernet

    echo "	Moving files"

    if mv -f $ORIGINAL_USER_HOME/outernet/install/logs/files/* /var/log/outernet/; then
      echo "	Logs: success."
    else
      echo "	Error: log files could not be moved."
      exit 1
    fi

    if mv -f $ORIGINAL_USER_HOME/outernet/install/logs/bash/* /usr/local/bin/; then
      echo "	Uil: success."
      chmod +x /usr/local/bin/uil
    else
      echo "	Error: Uil Logging suite could not be moved."
      exit 1
    fi

    echo "	Uil Install Complete!"
    exit 0
  ;;


  "uninstall" )
    echo "Removing Uil Logging suite"
    rm /etc/outernet -r
    rm /usr/local/bin/uil
	echo "Uil uninstalled"
  ;;


  *) 
    echo "Invalid options: $1, $2. use option --help to see more options"
  ;;

esac
