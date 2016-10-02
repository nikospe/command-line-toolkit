#!/bin/bash
PS3='Please enter the number if your choice: '
options=("Run a command for files" "Find files bigger than the size you will give" "See disk usage and free space" "Check your files with full path names" "Show files that modified today or the last hour" "quit")
select opt in "${options[@]}"
do
case $opt in
	"Run a command for files")
	   echo "Give a command"
	   read CMD
	   find . -type f|xargs $CMD 2> /dev/null
	   ;;
	"Find files bigger than the size you will give")
	   echo "Give the size in Mb"
	   read x
	   find / 2>/dev/null -type f -user $USER -size +$x"M"
	   ;;
	"See disk usage and free space")
           echo "Disk usage: "
	   du -sh /home/it21033 | awk '{print $1}'
           echo "Free Space: "
	   x=$(du -ks /home/it21033 | awk '{print $1}')
	   temp=$(( 5000000/$x ))
           echo $temp"%"
	   ;;
        "Check your files with full path names")
           ls -l $PWD/** | grep ^- | grep /home | awk '{print $9}'
           ;;
        "Show files that modified today or the last hour")
	   options1=("Day" "Hour" "quit")
	   select opt1 in "${options1[@]}"
	   do
	   case $opt1 in
		"Day")
           	  find / 2>/dev/null -mtime -1440m
	        ;;
		"Hour")
		  find / 2>/dev/null -mtime -60m
		;;
		"quit")
	         echo "you have exit succesfully"
	  	 break
	   	 ;;
		*) echo invalid option;;
	   esac
	   done
           ;;
	"quit")
	   echo "exit succesful"
	   break
	   ;;
	*) echo invalid option;;
esac
done
