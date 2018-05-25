#!/bin/bash
cat ../Patterns/Cart.txt > Carts.html
cat ../Patterns/cookies.txt > cookies.txt
for (( i=0; i<=70; i++ ))
do  
   	curl -b cookies.txt http://www.fxwebsolution.com/demo/arthi/multivendor/shopping-cart.php?cusid=$i -v  > html.txt # atsiunčiame puslapio turinį
	cat html.txt | grep "<h4 class='cart-product-description" | grep -v "Floral Print Buttoned" | sed 's~single_detail~http://www.fxwebsolution.com/demo/arthi/multivendor/single_detail~g' |  sed 's~<h4~<p~g' | sed 's~</h4>~</p>~g' > cart_info.txt

	if [ -s cart_info.txt ]
	then
		echo "<p> $i </p>" >> Carts.html
       		cat cart_info.txt >> Carts.html	
	fi
done
google-chrome Carts.html
rm html.txt
rm cart_info.txt
rm cookies.txt

