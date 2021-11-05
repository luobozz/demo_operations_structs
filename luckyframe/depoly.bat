@ECHO OFF

@REM 填写当前环境中LuckyFrameWeb项目的位置
set web_path=E:\code\gitCode\w\LuckyFrameWeb
set client_path=E:\code\gitCode\w\LuckyFrameClient
set op_path=%cd%

@echo %op_path%

@REM 打包web
cd %web_path%
call mvn clean package
md %op_path%\.lbop\lib\
copy %web_path%\target\LuckyFrameWeb.jar %op_path%\.lbop\lib\

@REM 打包docker-compose
copy %op_path%\builder\* %op_path%\.lbop\

@REM 压缩
7z a -ttar %op_path%\.lbop\service.tar %op_path%\.lbop\*