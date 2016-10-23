#Rice BG

Rice BG generates a json object with linux system info and passes that info
into a javascript file. We then use html/javascript to dynamically create
a background image using phantomjs. After the jpg is created we use feh to
set system background. 

#Requirments

-feh

-npm

#Instructions

After you download and cd into the directory do the following:

    sudo chmod +x install.sh makeHome.sh
    ./install.sh
    ./makehome.sh
