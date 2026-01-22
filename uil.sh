#!/bin/bash
#Logging suite named after the dutch word for owl.
#uil log "This is a log"

	#Sources the outernet Config file. 
source /etc/outernet/outernet.conf || {
	echo "Failed to load config file from /etc/outernet/outernet.conf">&2
	exit 1
}


# Returns the current timestamp in YYYY-MM-DD HH:MM:SS format
  get_timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
  }



case "$1" in

  "log" )
    echo "[$(get_timestamp)] - $2" >> $INSTALL_LOG_LOCATION
  ;;

  "echo" )
	echo $2
    echo "[$(get_timestamp)] - $2" >> $INSTALL_LOG_LOCATION
  ;;

  "error" )
	echo $2
    echo "[$(get_timestamp)] -ERROR- $2" >> $INSTALL_LOG_LOCATION
  ;;

  "help" )
    echo "log  -  Logs informaion to the default log."
  ;;


  *) 
    echo "The arg '$1' is not a valid command. use help"
  ;;

esac
