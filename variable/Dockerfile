FROM alpine:edge
ARG ARG_HOGE=from_dockerfile
ARG ARG_FUGA=get_overwritten
ARG ARG_PIYO
ENV ENV_FOO=from_dockerfile
ENV ENV_BAR=get_overwritten
RUN env > ENV_in_image
ENTRYPOINT echo -e "\e[32m### ON BUILD ###########################\e[m" && \
           cat ENV_in_image && \
           echo -e "\e[32m########################################\e[m" && \
           echo -e "\e[31m### ON DEPLOY ##########################\e[m" && \
           env && \
           echo -e "\e[31m########################################\e[m"
