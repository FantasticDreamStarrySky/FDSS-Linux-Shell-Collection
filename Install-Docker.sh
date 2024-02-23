#TRSS Docker 安装脚本 作者：🌃梦幻◎星空🌃
NAME=v1.0.0;VERSION=202402030
R="[1;31m" G="[1;32m" Y="[1;33m" C="[1;36m" B="[1;m" O="[m"
echo "
$B———————————————————————————
$R FDSS$Y Project$G Docker$C Script$O
    $G$NAME$C ($VERSION)$O
$B———————————————————————————
     $G作者：$C🌃梦幻◎星空🌃$O

$Y- 正在检查环境$O
"
DIR="${DIR:-$HOME/FDSS}"
CMD="${CMD:-tsab}"
CMDPATH="${CMDPATH:-/usr/local/bin}"
DKNAME="${DKNAME:-FDSS}"
DKURL="${DKURL:-docker.nju.edu.cn}"
abort() {
	echo "$R! $@$O"
	exit 1
}
mktmp() {
  TMP="$DIR/tmp" && rm -rf "$TMP" && mkdir -p "$TMP" || abort "缓存目录创建失败";
}
if type docker;
  then
    echo "$G- Docker 已安装$O"
elif type pacman &>/dev/null;
  then
    echo "$Y- 正在使用 pacman 安装 Docker$O"
	  pacman -Syu --noconfirm --needed --overwrite "*" docker || abort "Docker 安装失败"
elif type apt &>/dev/null;
  then
	  echo "$Y- 正在使用 apt 安装 Docker$O"
	  apt update && apt install -y docker.io || abort "Docker 安装失败"
else
	echo "$Y- 正在使用 官方脚本 安装 Docker$O"
	DOWNLOAD_URL="https://mirrors.ustc.edu.cn/docker-ce" bash <(curl -L get.docker.com) || abort "官方脚本 执行失败，请自行安装 Docker 后重试：https://docker.com"
fi
docker info || { systemctl enable --now docker || service docker start && docker info; } && echo "$G- Docker 已启动$O" || abort "Docker 启动失败"