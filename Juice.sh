#!/bin/bash
resize -s 56 100

cd ~/dat219g20v/assignments
echo -e '
Checking for updates on Bamboo:'
git pull

cd ~/Juice/
head=$(git rev-parse Master)
source VERSION.txt

echo -e '
Checking for updates on Juice:'
if [ $VERSION != $head ]
then
git pull
#head=$(git rev-parse Master)
number=$NUMBER
let "number+=1"
rm VERSION.txt

echo VERSION=$(git rev-parse Master) \
NUMBER=$number > VERSION.txt
echo -e 'Updated'
fi


./Program.sh

#end
