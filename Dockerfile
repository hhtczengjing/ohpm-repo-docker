FROM node:18

ENV VERSION=5.0.5.0
ENV TZ=Asia/Shanghai
ENV USER_NAME=ohpm
ENV USER_HOME=/home/ohpm
ENV OHPM_PATH=/home/ohpm/ohpm-repo
ENV OHPM_REPO_DEPLOY_ROOT=/home/ohpm/ohpm-repo

EXPOSE 8088

RUN adduser --disabled-password --gecos '' $USER_NAME

COPY ohpm-repo-$VERSION $OHPM_PATH
COPY start.sh $USER_HOME

RUN chown -R ohpm:ohpm $OHPM_PATH \
    && chmod +x $OHPM_PATH/bin/ohpm-repo \
    && chmod +x $USER_HOME/start.sh

USER $USER_NAME

ENV PATH=$OHPM_PATH/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR $USER_HOME

RUN mkdir -p $OHPM_REPO_DEPLOY_ROOT/uplink \
    && mkdir -p $OHPM_REPO_DEPLOY_ROOT/logs \
    && mkdir -p $OHPM_REPO_DEPLOY_ROOT/storage \
    && mkdir -p $OHPM_REPO_DEPLOY_ROOT/db

VOLUME ["$OHPM_REPO_DEPLOY_ROOT/uplink", "$OHPM_REPO_DEPLOY_ROOT/logs", "$OHPM_REPO_DEPLOY_ROOT/storage", "$OHPM_REPO_DEPLOY_ROOT/db"]

CMD ["./start.sh"]