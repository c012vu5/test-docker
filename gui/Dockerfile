FROM docker.io/library/archlinux
LABEL maintainer="Eisen Flugel:lynx.mondlicht@gmail.com"
LABEL description="gui application test with docker container"
ARG UID
ENV UID ${UID:-1000}
ARG GID
ENV GID ${GID:-1000}
RUN pacman -Syu --noconfirm sudo \
                            which \
                            xorg-xeyes && \
    groupadd -g ${GID} user && \
    useradd -ms `which bash` -u ${UID} -g ${GID} user && \
    echo "user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/user
USER user
