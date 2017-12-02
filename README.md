# 在Centos 7系统中安装洋葱节点 #

### 所需的环境 ###
Centos 7.
因为我是在Vultr的机器上做的测试，所以建议使用这家的VPS，可以用支付宝付款，比较方便。其他家的VPS只要是Centos 7应该也可以。

### 安装步骤 ###
*   安装Git,如果已经有了可以忽略
    > yum -y install git

*   下载安装包
    > git clone https://github.com/Kurrahee/CNDONode.git

*   安装
    > ./CNDONode/install.sh

### 查看服务启动情况 ###
安装完之后，服务就已经启动了，可以用下面这个命令查看

        systemctl status DeepOniond DOProxy

如果出现如下的提示，则表示服务已经在运行。
![Aaron Swartz](https://github.com/Kurrahee/CNDONode/blob/master/img/service-status.png)

### 启动和停止 ###
*   启动
    > ./CNDONode/start.sh
*   停止
    > ./CNDONode/stop.sh

### 配置文件的路径 ###
        ~/.DeepOnion/DeepOnion.conf

### 最大连接数 ###
缺省的最大连接数是200，可以在~/.DeepOnion/DeepOnion.conf中修改maxconnections参数

### 防火墙设置 ###
需要开启17571端口

        firewall-cmd --permanent --zone=public --add-port=17571/tcp
        systemctl restart firewalld

### 在本地钱包的配置文件中加入这个节点 ###
打开本地计算机上的钱包配置文件DeepOnion.conf, 加入

        addNode=207.246.xx.xx:17571

其中207.246.xx.xx是你的VPS的IP地址