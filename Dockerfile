FROM redhat/ubi8
LABEL maintainer="Eisen-Flugel:lynx.mondlicht@gmail.com"
LABEL description="gui application test with docker container"
RUN :
CMD ["/usr/sbin/tail", "-f", "/dev/null"]
