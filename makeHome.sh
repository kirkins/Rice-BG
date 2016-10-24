# Create JSON file with system info in json
echo '{"user": "'$USER'","ostype": "'$OSTYPE'"}' > content/system.json 
# Bundle javascript, so we can use some node.js syntax
browserify content/js/scripts.js -o content/js/bundle.js
# Get the screen size
Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
WinSize=$Xaxis"px*"$Yaxis"px"
# Convert the html/js into a png image.
phantomjs scripts/rasterize.js content/index.html output/home.jpg $WinSize
# Set the image as background using feh
feh --bg-fill output/home.jpg

