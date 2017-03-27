boxes=false

while getopts 'bh' flag; do
  case "${flag}" in
    b) boxes='true' ;;
    h) echo "usage:"
       echo "./makeHome image.jpg"
       echo ""
       echo "options:"
       echo "-h, --help                show brief help"
       echo '-b                        add black boxes for monjaro i3-wm'
       exit
       ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done
shift "$((OPTIND - 1))"

# Copy image input into content images folder
cp $1 content/img/bg.jpg;

# Create JSON file with system info in json

JSON='{'
JSON+='"user": "'$USER'"'
JSON+=', "ostype": "'$OSTYPE'"'
JSON+=', "boxes": "'$boxes'"'
JSON+='}'

echo $JSON > content/system.json 
# Bundle javascript, so we can use some node.js syntax
browserify content/js/scripts.js -o content/js/bundle.js
# Get the screen size
Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
WinSize=$Xaxis"px*"$Yaxis"px"
# Convert the html/js into a jpg image.
phantomjs scripts/rasterize.js content/index.html output/home.jpg $WinSize
# Set the image as background using feh
feh --bg-fill output/home.jpg
