FROM alpine:edge
ARG ARG_IN_DOCKER_FILE=ARG_FROM_DOCKER_FILE
ARG HOGE
ARG FUGA=FUGA_GET_OVERWRITTEN
ENV DOCKERFILE=FROM_DOCKER_FILE
RUN echo -e "\e[32m### ON BUILD ###########################\e[m" && \
    env && \
    echo -e "\e[32m########################################\e[m"
ENTRYPOINT echo -e "\e[31m### ON DEPLOY ##########################\e[m" && \
           env && \
           echo -e "\e[31m########################################\e[m"
