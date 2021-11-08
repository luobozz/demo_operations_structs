#!/bin/bash
# 用来发布当前环境到服务器的脚本
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

rm $op_path/.lbop/luckyframe.tar
# 压缩
cd $op_path/.lbop/
tar -cf luckyframe.tar *

rm $op_path/releases/luckyframe.tar
cp $op_path/.lbop/luckyframe.tar $op_path/releases/

# scp行
scp $op_path/releases/luckyframe.tar $scp_od