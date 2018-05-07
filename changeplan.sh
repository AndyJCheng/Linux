#!/bin/bash -x
confluenceurl=https://alm-confluence.systems.uk.hsbc/confluence/rest/api/content/
content='<table\nclass=\"relative-table\nwrapped\"\nstyle=\"width:\n546.0px;\"><colgroup><col\nstyle=\"width:\n0.0px;\"\n/><col\nstyle=\"width:\n0.0px;\"\n/><col\nstyle=\"width:\n0.0px;\"\n/><col\nstyle=\"width:\n0.0px;\"\n/></colgroup><tbody><tr><th\ncolspan=\"4\"\nstyle=\"text-align:\ncenter;\">CXP\ndetails</th></tr><tr><th\nclass=\"highlight-grey\"\ndata-highlight-colour=\"grey\"><p>artifact</p></th><th><strong>Executor</strong></th><th\ncolspan=\"1\"><pre\nclass=\"console-output\"><strong>Package\nVersion</strong></pre></th><th\nclass=\"highlight-grey\"\ncolspan=\"1\"\ndata-highlight-colour=\"grey\"><p><strong>Deployment</strong></p><p><strong>Time</strong></p></th></tr><tr><td\ncolspan=\"1\">collection</td><td\ncolspan=\"1\">ANDY</td><td\ncolspan=\"1\">1.0.0</td><td\ncolspan=\"1\">2018</td></tr></tbody></table>'
titlename=`date +%Y-%m-%d`
data='{"type":"page","title":"'$titlename'","space":{"key":"GBB"},"ancestors":[{"id":160030315}],"body":{"storage":{"value":"'$content'","representation":"storage"}}}'

curl -k -u $userPwd -X POST -H 'Content-Type: application/json' $confluenceurl  -d$data | python -mjson.tool > response.json
if grep '400' response.json;
then
 echo "the page existed"
 url="https://alm-confluence.systems.uk.hsbc/confluence/rest/api/content?title=2018-05-07&spaceKey=GBB&expand=body.storage"
 curl -k -u $userPwd -X GET  $url | python -mjson.tool > data.json
 value=`python -c "import sys,json; print(json.load(sys.stdin)['results'][0]['body']['storage']['value'])" < data.json`
# formatvalue=`echo -e $value | sed 's/ /\\n/g'`
 echo "$value"
 #addcontent=`echo $content | grep -E -o '<tr>.*?</tr>' | sed 's/<\/tr>/<\/tr>\n/g' | sed -n '3p'`
 addcontent="<tr><td colspan=\"1\">collection</td><td colspan=\"1\">ANDY</td><td colspan=\"1\">1.0.0</td><td colspan=\"1\">2018</td></tr>"
 echo "$addcontent"
 newcontent=`echo $value | sed "s%<\/tbody>%$addcontent<\/tbody>%" | sed "s/' '/\\\n/g"`
 lastcontent=`echo $newcontent | sed 's/ /\\\n/g' | sed 's/"/\\\"/g'`
 echo $lastcontent
 newdata='{"type":"page","title":"'$titlename'","space":{"key":"GBB"},"ancestors":[{"id":160030315}],"body":{"storage":{"value":"'$lastcontent'","representation":"storage"}}}'
 pageid=`python -c "import sys,json; print(json.load(sys.stdin)['results'][0]['id'])" < data.json`
 curl -u $userPwd -X DELETE https://alm-confluence.systems.uk.hsbc/confluence/rest/api/content/$pageid | python -mjson.tool
 curl -k -u $userPwd -X POST -H 'Content-Type: application/json' $confluenceurl  -d$newdata | python -mjson.tool

else
 echo "update success"
fi
