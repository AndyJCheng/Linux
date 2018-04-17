#update value in json
sed -i 's/"title":.*$/"title":'$datetime'/' data.json

MODEL_NAME=`python -c "import sys, json; print(json.load(sys.stdin)['name'])" < bower.json`

MODEL_VERSION=`grep -oP '"version":[ ]*"\K([^"]+)' bower.json || true`

find . | grep -E "model\.xml$" | xargs perl -n -e'/name>([^<]*)/ && print "$1\n"'

sed -i "/trade/{n;s/1.5.0-SNAPSHOT/1.5.0-RELEASE/}" pom.xml



date '+%Y%m%d%H%M'

git branch -r | grep -e 'release-1.3.*' | awk -F '[-.]' '{print $4}' | sort -n -r | head -1

/dev/null 2>&1

ifconfig eth0 | awk -F'[ :]+' 'NR==2 {print $4}'  look ip address



sed -n '/regexp/{g;1!p;};h'
sed -n '/re/{n;p;}'

找出含有关键字的文件
find -type f -name *.properties*  -print |  xargs  grep "password" | awk -F':' {'print $1}' | uniq -c
find -type f -name *.properties*  -print |  xargs  grep "password" | awk '{gsub(":"," ");print $1}' | uniq -c




sed -i 's/"title":.*$/"title":'$datetime'/' data.json
