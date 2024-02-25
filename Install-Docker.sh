#!/bin/bash
#TRSS Docker 安装脚本 作者：🌃梦幻◎星空🌃
NAME=v1.0.0
VERSION=202402030
R="[1;31m" G="[1;32m" Y="[1;33m" C="[1;36m" B="[1;m" O="[m"
echo "
$B———————————————————————————
$R FDSS$Y Project$G Docker$C Script$O
    $G$NAME$C ($VERSION)$O
$B———————————————————————————
    $G作者：$C🌃梦幻◎星空🌃$O
"
echo "$Y- 正在检查环境$O"
if type docker; then
  echo "$G- Docker 已安装$O"
else
  echo "$Y- 正在使用 官方脚本 安装 Docker$O"
  if curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun; then
    echo "$G- Docker 安装成功$O"
  else
    echo "$R- Docker 安装失败，请自行安装 Docker 后重试：https://docker.com"
  fi
fi
