#!/bin/bash

cd Python
python3 get_cookies.py
cd ..

original=`awk '{print $7}' Patterns/cookies.txt`
new=`awk '{print $1}' Python/cookies.txt`
sed -i "s/$original/$new/g" Patterns/cookies.txt

cd Wish_lists
chmod +x Wish_lists.sh
./Wish_lists.sh
cd ..
cd Charts
chmod +x Charts.sh
./Charts.sh
cd ..
cd Users
chmod +x Users.sh
./Users.sh
cd ..
