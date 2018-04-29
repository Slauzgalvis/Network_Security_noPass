#!/bin/bash
cd Phyton
python3 get_cookies.py
cp cookies.txt ../Patterns/cookies.txt
cd ..
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
