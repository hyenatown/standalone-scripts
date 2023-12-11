#!/bin/bash
yt-dlp \
-o "~/Downloads/YT-Music/%(artist)s/%(album)s/%(playlist_index)s %(track)s.%(ext)s" \
-f "ba" \
--ignore-config \
--write-thumbnail \
--min-sleep-interval 3 \
--max-sleep-interval 3 \
--concurrent-fragments 2 \
--cookies "~/.config/yt-dlp/cookies.txt" \
--progress \
--ignore-errors \
--newline \
-a ~/Downloads/playlist.txt
