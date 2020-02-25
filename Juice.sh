#!/bin/bash
resize -s 56 100

cd ~/dat219g20v/assignments
echo -e '
Checking for updates on Bamboo:'
git pull

cd ~/Juice/
head=$(git rev-parse HEAD)
source VERSION.txt

echo -e '
Checking for updates on Juice:'
if [ $VERSION != $head ]
then
git pull
head=$(git rev-parse HEAD)
rm VERSION.txt

echo VERSION=$(git rev-parse HEAD) > VERSION.txt
fi
echo -e 'Already up to date.
'

./Program.sh

#end
