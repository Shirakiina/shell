#!/bin/bash
t470=$(awk 'NR==1 {print}' ./store |awk -F"," '{print $2}')
g3=$(awk 'NR==2 {print}' ./store |awk -F"," '{print $2}')
mac=$(awk 'NR==3 {print}' ./store |awk -F"," '{print $2}')
p2416d=$(awk 'NR==4 {print}' ./store |awk -F"," '{print $2}')
store="./store"
recording="./recording"
####################################################################

function modify_store()
{
if [ $2 == "+" ]
	then
        	let result=${!1}+$3
        	sed -i "/${1}/s/${!1}/$result/g" ${store}
		echo "$(date '+%D') ${1} ${2}${3} ${result} 	${reason}" >> ${recording}
elif [ $2 == "-" ]
	then
        	let result=${!1}-$3
        	sed  -i "/${1}/s/${!1}/$result/g" ${store}
		echo "$(date '+%D') ${1} ${2}${3} ${result} 	${reason}" >> ${recording}
else
	echo "Wrong parameter!"
fi
}

###################################
echo "select which you want modify?"
select obj in t470 g3 mac p2416d;
do
	echo "select which math you want?"
	select math in + -;
		do
			read -p "input modify number: " num
			read -p "why modify this ? " "reason"
			modify_store ${obj} ${math} ${num} 
			break
		done
	break
done



