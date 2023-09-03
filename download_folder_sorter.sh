#!/bin/bash
# Written by hyenatown
# This script is meant to be modified to suit the user's needs,
# however I've provided many of the extensions I use to get started.
# I don't know the limits of doing this, but have at it (and let me know what happens).
if [ -x $HOME/Downloads ]; then
S_DIR=$HOME/Downloads
mkdir -p \
$S_DIR/Image_Files $S_DIR/Compressed_Files \   #i didn't need to do split the line like this
$S_DIR/Document_Files $S_DIR/Audio_Files \     #but i didn't like how wide this script looked
$S_DIR/Video_Files $S_DIR/Script_Files \       #simply add a new folder with "$S_DIR/path/to/"
$S_DIR/Comic_Files $S_DIR/Unknown_Files        #and be sure to create a matching regex expression
for FILE in $S_DIR/*.*; do
    R_IMG=$(if [[ "$FILE" =~ ^(.+\.jpg|.+\.png|.+\.gif|.+\.jpeg|.+\.apng|.+\.webp|.+\.tga|.+\.jxl)$ ]]; then echo 'Image_Files'; fi)
    R_ZIP=$(if [[ "$FILE" =~ ^(.+\.zip|.+\.7z|.+\.rar|.+\.gz|.+\.tar|.+\.xz)$ ]]; then echo 'Compressed_Files'; fi)
    R_DOC=$(if [[ "$FILE" =~ ^(.+\.pdf|.+\.doc|.+\.docx|.+\.rtf|.+\.txt|.+\.odf|.+\.csv)$ ]]; then echo 'Document_Files'; fi)
    R_AUD=$(if [[ "$FILE" =~ ^(.+\.mp3|.+\.aac|.+\.opus|.+\.flac|.+\.mid|.+\.midi|.+\.wma|.+\.wav|.+\.ogg|.+\.m4a)$ ]]; then echo 'Audio_Files'; fi)
    R_VID=$(if [[ "$FILE" =~ ^(.+\.mp4|.+\.mov|.+\.avi|.+\.mpg|.+\.mpeg|.+\.webm|.+\.mpv|.+\.mp2|.+\.wmv)$ ]]; then echo 'Video_Files'; fi)
    R_BSH=$(if [[ "$FILE" =~ ^(.+\.sh|.+\.bash|.+\.run|.+\.zsh|.+\.py|.+\.js)$ ]]; then echo 'Script_Files'; fi)
    R_CBZ=$(if [[ "$FILE" =~ ^(.+\.cbz|.+\.cbr|.+\.cb7)$ ]]; then echo 'Comic_Files'; fi)
    # ^^ a note regarding the above expressions ^^
    # it's wiser to wrap the entirety of new a expression in the anchor characters
    # as it prevents any possible issues with bash extended expression.
    # preferred format for each additional extension is ".+\.ext"
    REGEX_STRINGS=($R_IMG $R_ZIP $R_DOC $R_AUD $R_VID $R_BSH $R_CBZ)
    F_DATE=$(stat --format=%y "$FILE")                                  #stat the modification date
    F_DAY=${F_DATE:0:10}                                                #isolate the date; YYYY-MM-DD
    F_TYPE=$(for SEARCH in ${REGEX_STRINGS[@]}; do echo $SEARCH; done)  #run the current file through every expression to find the file type
    if [[ $F_TYPE == "" ]]; then F_TYPE='Unknown_Files'; fi             #if no expression matches, fall-back to 'unknown'
    F_TIME=${F_DATE:11:2}-${F_DATE:14:1}"0"                             #isolate modification time, round down to 10-minute intervals; HH-M0
    D_DIR="$S_DIR"/"$F_TYPE"/"$F_DAY"/"$F_TIME"
    mkdir -p $D_DIR
    mv "$FILE" $D_DIR
    unset R_IMG R_ZIP R_DOC R_AUD R_VID R_BSH R_CBZ                     #prevents old values from being used
done
echo '[Success] Finished sorting files. ( ・ω・)'
else
    echo "[Error] No downloads directory not found at $HOME/Downloads. Sorry."
    exit 2
fi
