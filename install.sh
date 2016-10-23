# Check if feh is installed
hash feh &> /dev/null
if [ $? -eq 1 ]; then
  echo >&2 "feh not found."
  exit
fi

# Check if npm is installed
hash npm &> /dev/null
if [ $? -eq 1 ]; then
  echo >&2 "npm not found."
else
  # install required node packages
  npm install -g phantomjs browserify
fi

