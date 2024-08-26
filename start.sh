#!/bin/bash

ohpm-repo -v

# Check if config.yaml exists before copying
if [ -f config.yaml ]; then
  # 实例启动后会直接更改 config.yaml 配置文件，导致文件很难辨认，增加个拷贝，让它改动拷贝的文件
  mkdir -p $OHPM_PATH/conf/
  cp -f config.yaml $OHPM_PATH/conf/config.yaml
  echo "copy config.yaml to $OHPM_PATH/conf/config.yaml"
else
  echo "config.yaml 文件不存在 ，请把文件映射到 /home/ohpm/config.yaml"
fi

ohpm-repo install

ohpm-repo start

echo "==== ohpm-repo 启动成功，请访问 http://127.0.0.1:8088/ 开始使用 ===="