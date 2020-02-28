FROM ubuntu
LABEL "Maintainer"="ZHUZHA"
WORKDIR /SBCL
ARG VER="2.0.1"
ARG ARCH="sbcl-${VER}-x86-64-linux-binary.tar.bz2"
RUN apt-get update && apt-get upgrade -y \
                   && apt-get install vim wget make -yq && \
                   wget -q \
                   https://github.com/roswell/sbcl_bin/releases/download/${VER}/sbcl-${VER}-x86-64-linux-binary.tar.bz2 \
                   && bzip2 -cd ${ARCH} | tar xvf - \
                   && cd sbcl-${VER}-x86-64-linux && sh install.sh \
                   && rm -f sbcl-${VER}-x86-64-linux-binary.tar.bz2 && rm -rf *

#HEALTHCHECK --interval=8m --timeout=4s CMD wget -qO- 0.0.0.0:8888 || exit 1
#EXPOSE 8888
STOPSIGNAL SIGTERM
ENTRYPOINT ["bash"]
#CMD ["bash"]
