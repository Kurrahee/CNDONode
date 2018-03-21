# Setup GFW-free DeepOnion Nodes ([中文](https://github.com/Kurrahee/CNDONode/blob/master/README_en.md))
GFW is big barrier for DeepOnion users from China to sync the wallet in a convenient manner. 
This repo provides a solution of how to setup DO node which can bypass the block of GFW.  

### Requirements ###
Centos 7 is all the thing you need. I rent VPS from [Vultr](https://www.vultr.com/?ref=7229179) to do all the following setup and test. 
So vultr VPS is highly recommended. It should work on other Centos 7 variants. 

### Step ###
*   Install Git, skip if you already have it

        yum -y install git

*   Download the setup package

        git clone https://github.com/Kurrahee/CNDONode.git

*   Installation

        ./CNDONode/install.sh

*   Firewall setup, need open 17571 TCP port

        firewall-cmd --permanent --zone=public --add-port=17571/tcp
        systemctl restart firewalld

### Check DeepOniond Service ###
After installation, the DeepOniond and proxy daemons should be running in the background. Use the following command to check.

        systemctl status DeepOniond DOProxy


If you got the same screen as below, everything is good!
![Aaron Swartz](https://github.com/Kurrahee/CNDONode/blob/master/img/service-status.png)

### Start and Stop ###
*   Start command

        ./CNDONode/start.sh

*   Stop command

        ./CNDONode/stop.sh

### Path of the DeepOniond Configuration file ###
        ~/.DeepOnion/DeepOnion.conf

### Max connection number ###
THe default max connection number is 200. It can be set accordingly from the configuration file: ~/.DeepOnion/DeepOnion.conf

### Add this node in your wallet configuation file ###
Add the following line in you wallet configration file

        addNode=207.246.xx.xx:17571

which 207.246.xx.xx is the IP address of your VPS

Then open onion wallet without any proxy or VPN, the wallet should connect to the onion network right away, enjoy!
![Aaron Swartz](https://github.com/Kurrahee/CNDONode/blob/master/img/wallet-ok.png)