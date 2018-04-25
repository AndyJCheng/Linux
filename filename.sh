var="test.txt"
# test
echo ${var%.*}
# txt
echo ${var#.*}

# batch rename file
count=1
for img in `find -iname '*.png' -o -iname '*.jpg' -type f -maxdepth 1`
do 
  new=img-$count.${img##.*}
  mv "$img" "$new"
  let count++
done
