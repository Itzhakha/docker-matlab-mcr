#
# Matlab MCR Dockerfile
# downloads and installs the Matlab Compiler Runtime and dependencies on Ubuntu
# version R2013a
#

FROM colinrhodes/base

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

RUN apt-get install -yq xorg unzip wget

ADD input.txt /mcr-install/input.txt

# Did this all in one line to avoid bloating the image

RUN cd /mcr-install && \
    wget -nv http://uk.mathworks.com/supportfiles/downloads/R2015a/deployment_files/R2015a/installers/glnxa64/MCR_R2015a_glnxa64_installer.zip && \
    unzip MCR_R2015a_glnxa64_installer.zip && \
    mkdir /opt/mcr && \
    ./install -inputFile input.txt && \
    cd / && \
    rm -rf mcr-install
