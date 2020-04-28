# @jprx
# Start modelsim_docker for mac
# Requires XQuartz

# References:
# See: https://medium.com/@mreichelt/how-to-show-x11-windows-within-docker-on-mac-50759f4b65cb
# See: https://sourabhbajaj.com/blog/2017/02/07/gui-applications-docker-mac/
# See: https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285

# Instructions:
# 1. Open XQuartz (can be downloaded with brew cask install xquartz)
# 2. Go to ZQuartz -> Preferences -> Security and check Allow remote connections
# 3. Restart XQuartz
# 4. Run ./mac_start.sh (this file)
# 5. When done using Modelsim, run ./mac_stop.sh and then uncheck Allow remote connections from XQuartz
# 6. Quit XQuartz

# The directory to mount from mac:
MAC_DIR=""

# Where to find your mac directory from Modelsim:
MAC_DIR_MOUNTPOINT="/mac"

# This isn't very secure, so after using modelsim make sure to disable this with ./mac_stop.sh:
/usr/X11/bin/xhost + ${hostname}

docker run -it \
    -e DISPLAY=${HOSTNAME}:0 \
    --volume="$MAC_DIR:/$MAC_DIR_MOUNTPOINT:rw" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    modelsim
