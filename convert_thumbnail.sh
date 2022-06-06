#! /bin/bash 
# to use, put .jpg files into images/raw and run with ./convert_thumbnail
# This will create a thumbnail in images/thumbs and move the file to images/fulls

# Sets the desired thumbnail width
WIDTH=500
cd images/raw/
# Loops through all jpg files in current folder
for i in *.jpg
do
    # Stores the width of the current file
    iwidth=`identify -format "%w" $i`
    # Stores filename without extension
    filename=`basename -s .jpg $i`
    # Creates thumbnail and adds -thumb to end of new file
    convert -thumbnail ${WIDTH}x $i "../thumbs/$filename.jpg"
    mv $i "../fulls/$filename.jpg"
    echo "processed file " $i
done