# Create JSON file with system info in json
echo '{"user": "'$USER'","ostype": "'$OSTYPE'"}' > content/system.json 
browserify content/js/scripts.js -o content/js/bundle.js
Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
WinSize=$Xaxis"px*"$Yaxis"px"
phantomjs scripts/rasterize.js content/index.html output/home.png $WinSize
feh --bg-fill output/home.png

