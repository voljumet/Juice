#!/bin/bash
printf '\e[8;56;100t'

cd ~/dat219g20v/assignments
echo -e '
Checking for updates on Bamboo:'
git pull

cd ~/Juice/
git fetch
head=$(git rev-parse Master)
source VERSION.txt

echo -e '
Checking for updates on Juice:'
if [ $VERSION != $head ]
then
git pull
number=$NUMBER
let "number+=1"
rm VERSION.txt

echo VERSION=$(git rev-parse Master) \
NUMBER=$number > VERSION.txt
echo -e 'Updated'
fi

./Program.sh

#end
