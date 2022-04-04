#!/bin/bash

xrayr_install(){
    bash <(curl -Ls https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh)
}

xrayr_config(){
    echo $1
    wget https://github.com/yuant2007/jc_script/raw/main/XrayR_template.yml -O /etc/XrayR/config.yml
    sed -i "s/{{!PanelType!}}/$1/g" /etc/XrayR/config.yml
    sed -i "s/{{!ApiHost!}}/$2/g" /etc/XrayR/config.yml
    sed -i "s/{{!ApiKey!}}/$3/g" /etc/XrayR/config.yml
    sed -i "s/{{!NodeType!}}/$4/g" /etc/XrayR/config.yml
    echo -n '请输入节点ID:'&&read id
    sed -i "s/{{!NodeID!}}/$id/g" /etc/XrayR/config.yml
    XrayR restart
}

xrayr_config
