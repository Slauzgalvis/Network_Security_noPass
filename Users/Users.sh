#!/bin/bash
cat ../Patterns/Users.txt > Users.html
cat ../Patterns/cookies.txt > cookies.txt
	
for (( i=0; i<=70; i++ ))
do  
   	curl -b cookies.txt http://www.fxwebsolution.com//demo/arthi/multivendor/seller-view.php?usid=$i -v > html.txt
	cat html.txt | grep -o -P '(?<=user-info">).*(?=/p>)' | awk '{ printf "<td>"; print }' | awk '{print $0"/td>"}' > user_data.txt

	if cmp -s user_data.txt ../Patterns/empty_check.txt ; then
		echo "same"
	else
	    	echo "<tr>" >> Users.html
		echo "<td> $i </td>" >> Users.html
		cat user_data.txt >> Users.html
		echo "</tr>" >> Users.html
	fi
	
done
google-chrome Users.html
rm user_data.txt
rm html.txt
rm cookies.txt



