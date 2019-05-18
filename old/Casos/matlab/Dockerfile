# Matlab MCR Dockerfile
# Downloads and installs the Matlab Compiler Runtime version ${MATLAB_VER} on Debian
# build using:            docker build -t matlab:${MATLAB_VER} .
# run using:              docker run -it --rm -v $(pwd):/tmp matlab
FROM debian:jessie

MAINTAINER Jacob Söndergaard <jacob@nephics.com>

RUN apt-get update -yq && \
    apt-get install -yq libXmu6 unzip wget

ADD input.txt /mcr-install/input.txt

## ENV MATLAB_VER R2016a
## RUN cd /mcr-install && \
##     wget -nv http://www.mathworks.com/supportfiles/downloads/${MATLAB_VER}/deployment_files/${MATLAB_VER}/installers/glnxa64/MCR_${MATLAB_VER}_glnxa64_installer.zip && \
##     unzip MCR_${MATLAB_VER}_glnxa64_installer.zip && \
##     mkdir /opt/mcr && \
##     ./install -inputFile input.txt && \
##     cd / && \
##     rm -rf mcr-install

RUN cd /mcr-install && \
    wget -nv http://www.mathworks.com/supportfiles/downloads/R2016a/deployment_files/R2016a/installers/glnxa64/MCR_R2016a_glnxa64_installer.zip && \
    unzip MCR_R2016a_glnxa64_installer.zip && \
    mkdir /opt/mcr && \
    ./install -inputFile input.txt && \
    cd / && \
    rm -rf mcr-install
    
ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/opt/mcr/v901/runtime/glnxa64:/opt/mcr/v901/bin/glnxa64:/opt/mcr/v901/sys/os/glnxa64"

