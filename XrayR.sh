#!/bin/bash
a=$1
b=$2
c=$3
d=$4
xrayr_install(){
    wget -N https://raw.githubusercontents.com/Misaka-blog/XrayR-script/master/install.sh && bash install.sh
}

xrayr_config(){
    wget https://github.com/yuant2021/jc_script/raw/main/XrayR_template.yml -O /etc/XrayR/config.yml
    sed -i "s/{{!PanelType!}}/$a/g" /etc/XrayR/config.yml
    sed -i "s#{{!ApiHost!}}#$b#g" /etc/XrayR/config.yml
    sed -i "s/{{!ApiKey!}}/$c/g" /etc/XrayR/config.yml
    sed -i "s/{{!NodeType!}}/$d/g" /etc/XrayR/config.yml
    echo -n '请输入节点ID:'&&read id
    sed -i "s/{{!NodeID!}}/$id/g" /etc/XrayR/config.yml
    XrayR restart
}
xrayr_install
xrayr_config
