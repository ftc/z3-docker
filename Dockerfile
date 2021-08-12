FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y gcc make sudo cmake apt-transport-https software-properties-common binutils g++
RUN apt-get install -y wget apt-transport-https gnupg python


## Microsoft z3
ENV Z3_VERSION "4.8.10"
# install debian packages
RUN apt-get update -qq -y \
 && apt-get install binutils g++ make ant -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \

# download, compile and install Z3
 && Z3_DIR="$(mktemp -d)" \
 && cd "$Z3_DIR" \
 && wget -qO- https://github.com/Z3Prover/z3/archive/z3-${Z3_VERSION}.tar.gz | tar xz --strip-components=1 \
 && python scripts/mk_make.py\
 && cd build \
 && make \
 && sudo make install \
 && cd / \
 && rm -rf "$Z3_DIR"

RUN useradd -m user && \
    echo user:user | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo 'user  ALL=(root) NOPASSWD: ALL' >> /etc/sudoers
USER user
WORKDIR /home/user
RUN mkdir /home/user/mnt

CMD ["/bin/bash"]
