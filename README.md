# operations

#### 介绍
快速运维资源

#### 依赖
所有依赖有网环境下可直接安装,无网环境下需离线安装
- 宿主依赖
    1. docker
    2. python-pip3
    3. docker-compose
    4. git(非必须)
    
- 镜像依赖
    1. java:8
    2. nginx:latest
    3. redis:latest
    4. mysql:latest


#### 安装教程

1. docker
  - 有网环境

    ```apt install docker```
    
  - 无网环境
    
    ```(https://blog.csdn.net/xiaoxiangzi520/article/details/111151924)```

2. python-pip3  
  - 有网环境
    
    ```apt install python-pip3```
    
  - 无网环境
    
    ```待补充```

3. docker-compose

  - 有网环境
    
    ```pip install docker-compose```
    
  - 无网环境
    
    ```(https://blog.csdn.net/qq_40047848/article/details/110918291)```
    
  - 猜测问题

    ```
    q:Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-BQFEJY/cryptography/
    a:pip3 install --upgrade pip
    ```

4. git 
  - 有网环境
    
    ```yum install git```
    
  - 无网环境
    
    ```无网环境不需要git，提前准备好上诉安装包和本项目运维文件以及所需全部镜像```

#### 开始部署

  - 有网环境
    
    ```
    cd /home

    mkdir operations

    cd /operations

    git clone ${项目 ssh||http||o}

    #luobo指代应用、项目名
    cd /luobo/docker

    sh q-dc.sh

    ```
    
  - 无网环境
    
    ```
    待补充
    ```
    
  - 猜测问题

    ```
    待补充
    ```

  

#### 参与贡献

