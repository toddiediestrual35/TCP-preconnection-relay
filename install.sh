#!/bin/bash
set -e
echo "Installing TCP-preconnection-relay v1.2..."
apt update
apt install -y nano
apt install -y build-essential
curl -L -o /root/tcp_pool.c \
https://raw.githubusercontent.com/Xeloan/TCP-preconnection-relay/main/tcp_pool.c
gcc -O2 -pthread -march=native -o /root/tcp_pool /root/tcp_pool.c
mkdir -p /etc/tcp_pool

cat > /etc/tcp_pool/relays.conf <<EOF
#REQUIRED
#转发标识，中括号内填写标签，比如US,HK1,HK2
[]
#本地ip，如果监听v4网卡就填写0.0.0.0。如果是v6则为俩英文冒号::。只监听本机某个特定网卡ip就填那个ip就行，比如127.0.0.0，38.175.100.122。
LOCAL_IP=
#本地端口，记得ufw或者服务商的防火墙打开
LOCAL_PORT=
#远端ip，你转发的目标服务器，现在支持v6和域名
REMOTE_IP=
#远端的接收TCP的端口
REMOTE_TCP_PORT=
#远端的接收UDP的端口（如果你的服务端UDP和TCP跑在一个端口的，填写一样就行）
REMOTE_UDP_PORT=

#样例，看懂了删掉就行(ctrl k 快速一行行清除，小小白白可能不知道)。现在支持单文件多配置，格式就是标签加上后面一坨东西。
[US]
LOCAL_IP=0.0.0.0
LOCAL_PORT=11451
REMOTE_IP=38.125.91.68
REMOTE_TCP_PORT=8888
REMOTE_UDP_PORT=9999

[HK]
LOCAL_IP=::
LOCAL_PORT=11451
REMOTE_IP=域名.com
REMOTE_TCP_PORT=8888
REMOTE_UDP_PORT=9999
EOF

cat > /etc/systemd/system/tcp-pool@.service <<EOF
[Unit]
Description=High Performance TCP Connection Pool (C Version)
After=network.target xray.service

[Service]
ExecStart=/root/tcp_pool

EnvironmentFile=/etc/tcp_pool/%i.conf

Nice=-10
LimitNOFILE=65535

Restart=always
RestartSec=3
User=root
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

true

echo ""
echo "========================================"
echo " Install completed!"
echo "========================================"
echo "先复制一份配置文件，例如："
echo "cp /etc/tcp_pool/default.conf /etc/tcp_pool/us.conf，这个us用来区分不同转发，就是你可以写hk，jp，us01，us02等，代表不同的落地，用于创建多个转发"
echo "用nano /etc/tcp_pool/us.conf编辑配置文件，nano我装好了，us改成你上面自己写的hk或者jp"
echo "然后填写好配置文件"
echo "写好了就systemctl restart tcp-pool@us，记得us改成你自己的"
echo "要开机自启的话就systemctl enable tcp-pool@us，记得us改成你自己的"
echo "然后看日志journalctl -u tcp-pool@us -f，记得us改成你自己的，如果看到一坨Preconnect +1说明通了"
