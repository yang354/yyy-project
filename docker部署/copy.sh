#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}



# copy html
echo "begin copy html "
cp -r ../yyy-ui/dist/** ./nginx/html/dist


# copy jar
echo "begin copy yyy-gateway "
cp ../yyy-gateway/target/yyy-gateway.jar ./yyy/gateway/jar

echo "begin copy yyy-auth "
cp ../yyy-auth/target/yyy-auth.jar ./yyy/auth/jar

echo "begin copy yyy-visual "
cp ../yyy-visual/yyy-visual-monitor/target/yyy-visual-monitor.jar  ./yyy/visual/monitor/jar

echo "begin copy yyy-modules-system "
cp ../yyy-modules/yyy-modules-system/target/yyy-modules-system.jar ./yyy/modules/system/jar

#echo "begin copy yyy-modules-file "
#cp ../yyy-modules/yyy-file/target/yyy-modules-file.jar ./yyy/modules/file/jar

echo "begin copy yyy-modules-job "
cp ../yyy-modules/yyy-modules-job/target/yyy-modules-job.jar ./yyy/modules/job/jar

echo "begin copy yyy-modules-gen "
cp ../yyy-modules/yyy-modules-gen/target/yyy-modules-gen.jar ./yyy/modules/gen/jar

