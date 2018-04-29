#!/bin/bash
cat ../Patterns/Chart.txt > Wish_lists.html
cat ../Patterns/cookies.txt > cookies.txt
for (( i=0; i<=70; i++ ))
do  
   	curl -b cookies.txt http://www.fxwebsolution.com/demo/arthi/multivendor/my_wishlist.php?fid=$i -v > html.txt # atsiunčiame puslapio turinį
	cat html.txt | grep '<div class="product-name"' | sed 's~single_detail~http://www.fxwebsolution.com/demo/arthi/multivendor/single_detail~g' > wish_info.txt

	if [ -s wish_info.txt ]
	then
		echo "<p> $i </p>" >> Wish_lists.html
       		cat wish_info.txt >> Wish_lists.html	
	fi
done
google-chrome Wish_lists.html
rm html.txt
rm wish_info.txt
rm cookies.txt
