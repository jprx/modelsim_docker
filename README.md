# modelsim_docker
Dockerfile and libs necessary for Modelsim ASE on Ubuntu 18.04

This repo contains a Dockerfile that allows you to run Modelsim. It contains a patch for the `linux_rh60` bug in Modelsim, as
well as the specific deb packages for libfreetype and libpng required by Modelsim to run.

When launched with ./start.sh, the Docker container will run with the executing user's UID and GID, allowing for direct
connection to X11 through /tmp/.X11-unix. The user's home directory is also mounted in the container as RW, allowing for
easy access to files from Modelsim.
