#!/bin/bash
name='luckyframe'
imagesName='java:8'

echo -e "\\n========DOCKER RES EXISTS CHECKING============="
exitContainer=`sudo docker ps -aqf name=$name`
exitImages=`sudo docker images -q $imagesName`
if [ "$exitContainer" != "" ]; then
    echo -e "container [$name $exitContainer] is exists"
    sudo docker rm -f $name
    echo -e "remove container [$name $exitContainer] success\\n"
else
    echo -e "container [$name] is clear"
fi
if [ "$exitImages" == "" ]; then
    echo -e "images [$imagesNameTag $exitImages] is not exists"
    sudo docker pull $imagesName
else
    echo -e "images [$imagesName] is exists"
fi
echo -e "====================================\\n"

echo -e "\\n========DOCKER RUN============="
sudo docker run -d \
                -p 6680:80 \
                -p 6633:6633 \
                -v /home/operations/luckyframe/lib:/luckyFrame \
                --name=$name \
                $imagesName \
                sh /luckyFrame/start.sh
echo -e "\\n"
sudo docker ps -a
echo -e "====================================\\n"


# sudo docker exec -it $name /bin/bash
