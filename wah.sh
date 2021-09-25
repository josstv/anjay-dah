#!/bin/bash
cd ~/scripts
httrack -i https://m.vidio.com/live/205-indosiar
cd m.vidio.com/live/205-indosiar
echo "" > IPTV.m3u
echo "#EXTM3U" >> IPTV.m3u
i=1
for x in [player]*.html; do
  var=$(cat $x | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*.[0-9]" | sort -u | head -1; echo "\n")
  echo "#EXTINF:-1, Channel $i" >> IPTV.m3u
  echo $var >> IPTV.m3u
  i=$((i+1))
done

cp IPTV.m3u ../../
cp IPTV.m3u ~/Development/Github/anjay-dah
cd ~/Development/Github/anjay-dah

git add .
git commit -m "Added Updated IPTV.m3u"
git push origin master
