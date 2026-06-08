#!/bin/bash
#Logging suite named after the dutch word for owl.
#uil log "This is a log"

APPLICATION_NAME="Uil Default"
CONFIG_FILE="/etc/uil/uil.conf"
LOG_FILE_LOCATION=""


	#Sources the outernet Config file. 
source ${CONFIG_FILE} || {
	echo "Failed to load config file from ">&2
	exit 1
}


# Returns the current timestamp in YYYY-MM-DD HH:MM:SS format
  get_timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
  }



case "$1" in

	"log" )
	echo "[$(get_timestamp)] - $2" >> $LOG_FILE_LOCATION
	;;

  "echo" )
	echo $2
    echo "[$(get_timestamp)] - $2" >> $LOG_FILE_LOCATION
  ;;

  "error" )
	echo $2
    echo "[$(get_timestamp)] -ERROR- $2" >> $LOG_FILE_LOCATION
  ;;

	#-- System Journal Commands
	"jinfo" )
		systemd-cat --identifier=${} --priority=6 echo $2
	;;
	
	"jwarn" )
		systemd-cat --identifier=${} --priority=6 echo $2
	;;
	
	"jcrit" )
		systemd-cat --identifier=${} --priority=2 echo $2
	;;
	
	"jdbug" )
		systemd-cat --identifier=${} --priority=7 echo $2
	;;
	


  "help" )
    echo "log  -  Logs informaion to the default log."
  ;;


  *) 
    echo "The arg '$1' is not a valid command. use help"
  ;;

esac
