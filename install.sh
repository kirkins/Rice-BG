# Check if feh is installed
hash feh &> /dev/null
if [ $? -eq 1 ]; then
  echo >&2 "feh not found. Please google how to install feh on your OS."
  exit
fi

# Check if npm is installed
hash npm &> /dev/null
if [ $? -eq 1 ]; then
  echo >&2 "npm not found. Install npm and try again."
else
  # install required node packages
  npm install -g phantomjs browserify
fi

