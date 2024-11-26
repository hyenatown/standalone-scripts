#!/bin/sh
# original "kapi.bat" by em essex
menu(){
    echo "          //__//"
    echo "   i'm   /   -   \______________ "
    echo "  here  /                        \ "
    echo "   to  | Y                        \ "
    echo "  help  \____/ |                  | "
    echo "   ...     __/  \   /___    _     \ "
    echo "          //___/ | |    \   | \   / "
    echo "                ///     // /  // / "
    printf "\033[30;47mLET'S ENCODE VARIOUS FILES FOR WEB SHARING\033[0m\n"
    printf "\033[30;46mADD f TO ANY SELECTION TO PROCESS A FOLDER\033[0m\n"
    echo
    printf "\033[37;44m=== WITH AUDIO===\033[0m\n"
    printf "\033[0;33;40m[1]\033[0m h264 NVENC MP4 (max 1280x720px, ~2mbps)\n"
    printf "\033[0;33;40m[2]\033[0m h264 NVENC MP4 (max 1280x720px, ~5mbps)\n"
    echo
    printf "\033[37;44m=== WITHOUT AUDIO ===\033[0m\n"
    printf "\033[0;33;40m[3]\033[0m h264 NVENC MP4 (max 1280x720px, ~2mbps)\n"
    printf "\033[0;33;40m[4]\033[0m h264 NVENC MP4 (max 1280x720px, ~5mbps)\n"
    echo
    printf "\033[37;44m=== AUDIO TOOLS ===\033[0m\n"
    printf "\033[0;33;40m[5]\033[0m DUMP AUDIO AS *.WAV\n"
    printf "\033[0;33;40m[6]\033[0m REMOVE AUDIO\n"
    echo
    printf "\033[37;44m=== SPECIAL USE ===\033[0m\n"
    printf "\033[0;33;40m[7]\033[0m AUDIO + IMAGE TO h264 MP4 (2fps, CPU encoding, cue-points > chapters)\n"
    printf "    >> matches audio file with cover.* image\n"
    printf "    >> falls back on audio > image name match\n"
    printf "\033[0;33;40m[8]\033[0m xdd\n"
    echo
    read option
}
clear
menu
while [ $option != '' ]
    do
    if [ $option = '' ]; then
      exit;
    else
      case $option in
        # [1] h264 NVENC MP4 (max 1280x720px, ~2mbps)
        1) clear; for i in *; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 2M -maxrate 2M -bufsize 512K -acodec aac -b:a 192k -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "${i%.*}_encode.mp4"; done; exit 0;;
       1f) clear; mkdir -p output; for i in *.{m4v,mkv,mp4,mov,avi,mxf,asf,ts,vob,3gp,3g2,f4v,flv,ogv,ogx,wbm,divx}; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 2M -maxrate 2M -bufsize 512K -acodec aac -b:a 192k -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "output/${i%.*}_encode.mp4"; done; exit 0;;
        # [2] h264 NVENC MP4 (max 1280x720px, ~5mbps)
        2) clear; for i in *; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 5M -maxrate 5M -bufsize 512K -acodec aac -b:a 192k -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "${i%.*}_encode.mp4"; done; exit 0;;
       2f) clear; mkdir -p output; for i in *.{m4v,mkv,mp4,mov,avi,mxf,asf,ts,vob,3gp,3g2,f4v,flv,ogv,ogx,wbm,divx}; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 5M -maxrate 5M -bufsize 512K -acodec aac -b:a 192k -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "output/${i%.*}_encode.mp4"; done; exit 0;;
        # [3] h264 NVENC MP4 (max 1280x720px, ~2mbps)
        3) clear; for i in *; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 2M -maxrate 2M -bufsize 512K -an  -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "${i%.*}_encode.mp4"; done; exit 0;;
       3f) clear; mkdir -p output; for i in *.{m4v,mkv,mp4,mov,avi,mxf,asf,ts,vob,3gp,3g2,f4v,flv,ogv,ogx,wbm,divx}; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 2M -maxrate 2M -bufsize 512K -an  -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "output/${i%.*}_encode.mp4"; done; exit 0;;
        # [4] h264 NVENC MP4 (max 1280x720px, ~5mbps)
        4) clear; for i in *; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 5M -maxrate 5M -bufsize 512K -an -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "${i%.*}_encode.mp4"; done; exit 0;;
       4f) clear; mkdir -p output; for i in *.{m4v,mkv,mp4,mov,avi,mxf,asf,ts,vob,3gp,3g2,f4v,flv,ogv,ogx,wbm,divx}; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 5M -maxrate 5M -bufsize 512K -an -vf "scale='min(1280,iw)':min'(720,ih)':force_original_aspect_ratio=decrease" "output/${i%.*}_encode.mp4"; done; exit 0;;
        # [5] DUMP AUDIO AS *.WAV
        5) clear; for i in *; do ffmpeg -i "$i" -ac 2 -f wav "${i%.*}.wav"; done; exit 0;;
       5f) clear; mkdir -p output; for i in *.{m4v,mkv,mp4,mov,avi,mxf,asf,ts,vob,3gp,3g2,f4v,flv,ogv,ogx,wbm,divx}; do ffmpeg -i "$i" -ac 2 -f wav "output/${i%.*}.wav"; done; exit 0;;
        # [6] REMOVE AUDIO
        6) clear; for i in *; do ffmpeg -i "$i" -c copy -an "${i%.*}_noSound.${i##*.}"; done; exit 0;;
       6f) clear; mkdir -p output; for i in *.{m4v,mkv,mp4,mov,avi,mxf,asf,ts,vob,3gp,3g2,f4v,flv,ogv,ogx,wbm,divx}; do ffmpeg -i "$i" -c copy -an "output/${i%.*}_noSound.${i##*.}"; done; exit 0;;

        # [7] AUDIO + IMAGE TO h264 MP4 (2fps, CPU encoding, cue-points > chapters)
        # >> matches audio file with cover.* image\n"
        # >> falls back on audio > image name match\n"
        7) clear;
            if [ ! -f cover.* ]; then
              for i in *; do
                for a in *.{jpeg,jpg,png,gif,bmp,tiff}; do
                  if [ ]; then #FIXME: parameter missing
                    ffmpeg -loop 1 -framerate 2 -i $a - $i -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a aac -b:a 256k -shortest -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "${i%.*}.mp4"
                    else
                      for i in *; do
                        for a in cover.*; do
                          ffmpeg -loop 1 -framerate 2 -i $a -i $i -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a aac -b:a 256k -shortest -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "${i%.*}.mp4"
                      done
                    done
                  fi
                done
              done
            fi; exit 0;;

       7f) clear;
            if [ ! -f cover.* ]; then
                mkdir output
                for i in *.{wav,mp3,flac,ogg,opus,wma,aiff,aif,m4a,aac}; do
                  for a in *.{jpeg,jpg,png,gif,bmp,tiff}; do
                    if [ ]; then #FIXME: parameter missing
                      ffmpeg -loop 1 -framerate 2 -i $a - $i -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a aac -b:a 256k -shortest -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "output/${i%.*}.mp4"
                      else
                        for i in *.{wav,mp3,flac,ogg,opus,wma,aiff,aif,m4a,aac}; do
                          for a in cover.*; do
                            ffmpeg -loop 1 -framerate 2 -i $a -i $i -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a aac -b:a 256k -shortest -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "output/${i%.*}.mp4"
                        done
                      done
                    fi
                  done
                done
            fi; exit 0;;
        # [8] xdd
        8) clear; for i in *; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 48K -maxrate 96K -bufsize 64K -acodec aac -b:a 16k -vf "framerate=fps=8,scale='min(320,iw)':min'(240,ih)',unsharp=5:5:2" "${i%.*}_xdd.mp4" -filter_complex "acrusher=level_in=8:level_out=16:bits=8:mode=log:aa=1,alimiter=level_in=1:level_out=0.7:limit=0.3:attack=1:release=1:level=disabled"; done; exit 0;;
       8f) clear; mkdir -p output; for i in *.{m4v,mkv,mp4,mov,avi,mxf,asf,ts,vob,3gp,3g2,f4v,flv,ogv,ogx,wbm,divx}; do ffmpeg -i "$i" -vcodec h264_nvenc -b:v 48K -maxrate 96K -bufsize 64K -acodec aac -b:a 16k -vf "framerate=fps=8,scale='min(320,iw)':min'(240,ih)',unsharp=5:5:2" "${i%.*}_xdd.mp4" -filter_complex "acrusher=level_in=8:level_out=16:bits=8:mode=log:aa=1,alimiter=level_in=1:level_out=0.7:limit=0.3:attack=1:release=1:level=disabled"; done; exit 0;;
        x) exit;;
       \n) exit;;
        *) echo "NOT VALID"; exit 1;;
      esac
    fi
done
