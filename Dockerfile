FROM ubuntu:18.04

LABEL maintainer="jprx"

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install build-essential

RUN apt-get install -y binutils libc6:i386 libncurses5:i386 libxtst6:i386 libxft2:i386 libc6:i386 libncurses5:i386 \
    libstdc++6:i386 libc6-dev-i386 libxft2 lib32z1 lib32ncurses5 wget xauth

RUN apt-get install -y gcc-multilib g++-multilib \
lib32z1 lib32stdc++6 lib32gcc1 \
expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 libgtk-3-0:i386 \
libcanberra0:i386 libice6:i386 libsm6:i386 libncurses5:i386 zlib1g:i386 \
libx11-6:i386 libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \
libxt6:i386 libxtst6:i386 
#libpng12-0:i386

COPY modelsim_setup.run /modelsim/install.run

# Install Modelsim unattended
RUN modelsim/install.run --mode unattended --installdir /modelsim/ --unattendedmodeui none --accept_eula 1

# Patch linux_rh60 bug in vsim:
RUN cd /modelsim/modelsim_ase && ln -s linux linux_rh60

# Copy in the .deb files for libfreetype and libpng
# See: https://askubuntu.com/questions/1121815/how-do-i-run-mentor-modelsim-questa-in-ubuntu-18-04
COPY libfreetype6_2.6.1-0.1ubuntu2_amd64.deb /modelsim_libs/libfreetype_amd64.deb
COPY libfreetype6_2.6.1-0.1ubuntu2_i386.deb /modelsim_libs/libfreetype_i386.deb
COPY libpng12-0_1.2.54-1ubuntu1.1_amd64.deb /modelsim_libs/libpng_amd64.deb
COPY libpng12-0_1.2.54-1ubuntu1.1_i386.deb /modelsim_libs/libpng_i386.deb
RUN cd /modelsim_libs/ && dpkg -i *

# Run modelsim
CMD /modelsim/modelsim_ase/bin/vsim
