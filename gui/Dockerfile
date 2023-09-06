FROM alpine:edge
ARG UID
ENV UID=${UID:-1000}
ARG GID
ENV GID=${GID:-1000}
ARG USER
ENV USER=${USER:-test}
RUN apk add --no-cache xeyes && \
    addgroup -g ${GID} ${USER} && \
    adduser -D -u ${UID} -G ${USER} ${USER}
USER ${USER}
