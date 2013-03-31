#!/bin/sh

slow_type() {
    echo $1 | pv -qL 10;
}

control_c()
{
	exit $?;
}

trap control_c SIGINT

show_file() {
    clear;
    cat $1;
}

clear;
slow_type "Forms FORM-29827281-12"
slow_type "Test Assessment Report"
echo ""

while read line; 
do 
	(say -v Vicki $line &);
	if [[ $line != '.' ]] 
	    then 
	        echo $line | grep 'Aperture Science' && show_file ./aperture_logo.txt;	        
		echo $line | grep -i 'black mesa' && show_file ./black_mesa_logo.txt;
		echo $line | grep -i 'cake' && show_file ./cake.txt
		echo $line | grep -i 'heart' && show_file ./heart.txt
 	        slow_type "$line";
	    else
	        sleep 1;
	    fi;
done < ./still_alive.txt 
