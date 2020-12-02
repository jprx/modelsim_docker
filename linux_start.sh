# Startup script for the docker image
# Allow X-forwarding:
# See: http://wiki.ros.org/docker/Tutorials/GUI
# See: https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15
# This is using "Option 2" running as the local user uid and gid
# The user's home directory is also mounted inside the container so Modelsim can access files
# Running as the local user also lets us access the X11 daemon
. config.sh

docker run -it \
	--user=$(id -u):$(id -g) \
	--env="DISPLAY" \
	--volume="$HOST_DIR:/$CONTAINER_DIR_MOUNTPOINT:rw" \
	--volume="/etc/group:/etc/group:ro" \
	--volume="/etc/passwd:/etc/passwd:ro" \
	--volume="/etc/shadow:/etc/shadow:ro" \
	--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	modelsim
