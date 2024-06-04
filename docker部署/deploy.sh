#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [port|base|modules|stop|rm]"
	exit 1
}

# 开启所需端口
port(){
	firewall-cmd --add-port=80/tcp --permanent
	firewall-cmd --add-port=8080/tcp --permanent
	firewall-cmd --add-port=8848/tcp --permanent #nacos配置  不是集群的话就不用下面开启
	firewall-cmd --add-port=9848/tcp --permanent #nacos
	firewall-cmd --add-port=9849/tcp --permanent #nacos
	firewall-cmd --add-port=6379/tcp --permanent
	firewall-cmd --add-port=3306/tcp --permanent
	firewall-cmd --add-port=9100/tcp --permanent
	firewall-cmd --add-port=9200/tcp --permanent
	firewall-cmd --add-port=9201/tcp --permanent
	firewall-cmd --add-port=9202/tcp --permanent
	firewall-cmd --add-port=9203/tcp --permanent
	firewall-cmd --add-port=9300/tcp --permanent  #文件模块，已移除，转公共模块
	firewall-cmd --add-port=15672/tcp --permanent
	firewall-cmd --add-port=5672/tcp --permanent
	service firewalld restart
}

# 启动基础环境（必须）
base(){
	docker-compose up -d yyy-mysql yyy-redis
}

nacos(){
	docker-compose up -d yyy-nacos
}

rabbitmq(){
	docker-compose up -d yyy-rabbitmq
}


# 启动程序模块（必须）
modules(){
	docker-compose up -d yyy-nginx yyy-gateway yyy-auth yyy-modules-system
}

# 自定义迭代更新在这里写，重新打版
update(){
	docker-compose up -d yyy-auth yyy-modules-system
}

# 关闭所有环境/模块
stop(){
	docker-compose stop
}

# 删除所有环境/模块
rm(){
	docker-compose rm
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"port")
	port
;;
"base")
	base
;;
"nacos")
	nacos
;;
"rabbitmq")
	rabbitmq
;;
"update")
	update
;;
"modules")
	modules
;;
"stop")
	stop
;;
"rm")
	rm
;;
*)
	usage
;;
esac
