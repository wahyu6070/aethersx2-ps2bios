base=/sdcard/alarms

rm -rf $base/m
mkdir -p $base/m

input=$base/b.html
while IFS= read -r line
do

if echo "$line" | grep -q "name="; then
NAME=`echo "$line" |  head -n1 | cut -d = -f 2`
F=$base/m/${NAME}.md
echo "$NAME"
echo "---" > "$F"
echo "type : game" >> "$F"
echo "title : $NAME" >> "$F"
echo "genre : " >> "$F"
echo "region : asia" >> "$F"
echo "format : chd" >> "$F"
echo "link : " >> "$F"

elif echo "$line" | grep -q "size="; then
Z=`echo "$line" | head -n1 | cut -d = -f 2`
echo "size : ${Z}B" >> "$F"
echo "---" >> "$F"
fi

done < "$input"

