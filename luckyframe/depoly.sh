#!/bin/bash
# 用来发布当前环境到服务器的脚本
app_name="luckyframe"
# 填写当前环境中LuckyFrameWeb项目的位置
web_path="/mnt/e/code/gitCode/w/LuckyFrameWeb"
client_path="/mnt/e/code/gitCode/w/LuckyFrameClient"
# 按照scp命令填写服务器部署位置
scp_od="shtf@192.168.1.42:/home/operations/luckyframe/"

op_path=`pwd`
# echo $op_path

rm -rf $op_path/.lbop/lib/
mkdir -p $op_path/.lbop/lib/
# 打包web
cd $web_path
cp $web_path/target/LuckyFrameWeb.jar $op_path/.lbop/lib

# 打包client
mkdir -p $op_path/.lbop/lib/LuckyFrameClient/
cd $client_path
cp -r $client_path/target/classes/* $op_path/.lbop/lib/LuckyFrameClient/

# 打包其他依赖
cp -r $op_path/builder/* $op_path/.lbop/

rm $op_path/.lbop/$app_name.tar
# 压缩
cd $op_path/.lbop/
tar -cf $app_name.tar *

rm $op_path/.lb_releases/$app_name.tar
cp $op_path/.lbop/$app_name.tar $op_path/.lb_releases/

# scp行
scp $op_path/.lb_releases/$app_name.tar $scp_od