#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh setName.sh"
	exit 1
}

##########################如果当前文件是bootstrap.yml.prod时 打开下面使用这种##########################
echo "begin setName yyy-auth "
mv ../yyy-auth/src/main/resources/bootstrap.yml ../yyy-auth/src/main/resources/bootstrap.yml.dev

echo "begin setName yyy-gateway "
mv ../yyy-gateway/src/main/resources/bootstrap.yml ../yyy-gateway/src/main/resources/bootstrap.yml.dev

echo "begin setName yyy-modules-gen "
mv ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml.dev

echo "begin setName yyy-modules-job "
mv ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml.dev

echo "begin setName yyy-modules-rabbit "
mv ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml.dev

echo "begin setName yyy-modules-system "
mv ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml.dev

echo "begin setName yyy-modules-test "
mv ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml.dev

echo "begin setName yyy-visual-monitor "
mv ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml.dev



echo "begin setName yyy-auth "
mv ../yyy-auth/src/main/resources/bootstrap.yml.prod ../yyy-auth/src/main/resources/bootstrap.yml

echo "begin setName yyy-gateway "
mv ../yyy-gateway/src/main/resources/bootstrap.yml.prod ../yyy-gateway/src/main/resources/bootstrap.yml

echo "begin setName yyy-modules-gen "
mv ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml.prod ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml

echo "begin setName yyy-modules-job "
mv ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml.prod ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml

echo "begin setName yyy-modules-rabbit "
mv ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml.prod ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml

echo "begin setName yyy-modules-system "
mv ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml.prod ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml

echo "begin setName yyy-modules-test "
mv ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml.prod ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml

echo "begin setName yyy-visual-monitor "
mv ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml.prod ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml


##########################如果当前文件是bootstrap.yml.dev时 打开下面使用这种##########################
#echo "begin setName yyy-auth "
#mv ../yyy-auth/src/main/resources/bootstrap.yml ../yyy-auth/src/main/resources/bootstrap.yml.prod
#
#echo "begin setName yyy-gateway "
#mv ../yyy-gateway/src/main/resources/bootstrap.yml ../yyy-gateway/src/main/resources/bootstrap.yml.prod
#
#echo "begin setName yyy-modules-gen "
#mv ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml.prod
#
#echo "begin setName yyy-modules-job "
#mv ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml.prod
#
#echo "begin setName yyy-modules-rabbit "
#mv ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml.prod
#
#echo "begin setName yyy-modules-system "
#mv ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml.prod
#
#echo "begin setName yyy-modules-test "
#mv ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml.prod
#
#echo "begin setName yyy-visual-monitor "
#mv ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml.prod
#
#
#
#echo "begin setName yyy-auth "
#mv ../yyy-auth/src/main/resources/bootstrap.yml.dev ../yyy-auth/src/main/resources/bootstrap.yml
#
#echo "begin setName yyy-gateway "
#mv ../yyy-gateway/src/main/resources/bootstrap.yml.dev ../yyy-gateway/src/main/resources/bootstrap.yml
#
#echo "begin setName yyy-modules-gen "
#mv ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml.dev ../yyy-modules/yyy-modules-gen/src/main/resources/bootstrap.yml
#
#echo "begin setName yyy-modules-job "
#mv ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml.dev ../yyy-modules/yyy-modules-job/src/main/resources/bootstrap.yml
#
#echo "begin setName yyy-modules-rabbit "
#mv ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml.dev ../yyy-modules/yyy-modules-rabbit/src/main/resources/bootstrap.yml
#
#echo "begin setName yyy-modules-system "
#mv ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml.dev ../yyy-modules/yyy-modules-system/src/main/resources/bootstrap.yml
#
#echo "begin setName yyy-modules-test "
#mv ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml.dev ../yyy-modules/yyy-modules-test/src/main/resources/bootstrap.yml
#
#echo "begin setName yyy-visual-monitor "
#mv ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml.dev ../yyy-visual/yyy-visual-monitor/src/main/resources/bootstrap.yml
#
