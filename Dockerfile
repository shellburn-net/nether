FROM ubuntu:22.04

# -- some variables --
ARG user

SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  iproute2 \
  dnsutils \
  curl \
  telnet

# just a reference to check that any changes to .env result in a built container
COPY .env.checksum /tmp/

ADD init /init
RUN chmod +x /init

RUN echo "user: ${user}" && useradd -s /bin/bash -u 1000 -m ${user}

USER ${user}
ADD scripts /home/${user00}/scripts
WORKDIR /home/${user}/scripts

ADD dot_files/dot_bashrc /home/${user}/.bashrc

CMD ["/init"]

