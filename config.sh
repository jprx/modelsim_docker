# The directory to mount from the host side:
HOST_DIR=""

# Where to find your directory from within Modelsim container:
CONTAINER_DIR_MOUNTPOINT="/mac"

if [[ $HOST_DIR == "" ]]; then
    echo ""
    echo "Host directory is empty; please choose a host directory in config.sh"
    exit
fi
