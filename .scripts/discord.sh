#!/bin/sh

pgrep Discord &> /dev/null || exec firejail /bin/discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy $@
