#!/bin/bash
a=$1
b=$2
c=$3
d=$4
xrayr_install(){
    bash <(curl -Ls https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh)
}

xrayr_config(){
    wget https://github.com/yuant2007/jc_script/raw/main/XrayR_template.yml -O /etc/XrayR/config.yml
    sed -i "s/{{!PanelType!}}/$a/g" /etc/XrayR/config.yml
    sed -i "s/{{!ApiHost!}}/$b/g" /etc/XrayR/config.yml
    sed -i "s#{{!ApiKey!}}#$c#g" /etc/XrayR/config.yml
    sed -i "s/{{!NodeType!}}/$d/g" /etc/XrayR/config.yml
    echo -n '请输入节点ID:'&&read id
    sed -i "s/{{!NodeID!}}/$id/g" /etc/XrayR/config.yml
    XrayR restart
}

xrayr_config
