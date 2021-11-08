mkdir /var/log/luckyframe
nohup java -jar /luckyFrame/LuckyFrameWeb.jar >> /var/log/luckyframe/web.log &
nohup /luckyFrame/LuckyFrameClient/start_service.sh >> /var/log/luckyframe/client.log &
tail -f /var/log/luckyframe/client.log