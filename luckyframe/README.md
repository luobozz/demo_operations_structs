# luckyframe全部环境依赖

* mysql数据库 
* docker
* docker-compose

# luckyframe搭建步骤

###  mysql数据库 
>**可以使用docker容器或者宿主机安装mysql**

1. **安装mysql**
2. **创建luckyframe数据库**
   - 命令行创建
        `CREATE DATABASE luckyframe`
   - navicat创建，右键连接内创建数据库即可
     
     ![](./readmeRes/img/创建数据库.png)

3. **创建luckframe用户**

        CREATE USER 'luckyframe'@'%' IDENTIFIED BY 'luckyframe';
  
        GRANT All privileges ON luckyframe.* TO 'luckyframe'@'%';

4. **初始化库结构 [LuckyFrameWeb](https://github.com/seagull1985/LuckyFrameWeb)**
    
    `在命令行或者任意sql工具(navicat)中执行脚本都行`

    >在服务端项目 LuckyFrameWeb的根目录下，有一个 mysqldb的文件夹，此文件夹中包含了2个子文件夹：

    >文件夹 **initialization**(create table) ：此目录是项目数据初始化的路径，如果你是第一次安装环境，那么可以进入到此路径下，此文件夹中包含了各种版本的初始化SQL文件，找到自己下载项目所属版本的SQL文件，去执行SQL即可。
        
    ![](/luckyframe/readmeRes/img/initialization.png)
        
    >文件夹  **update**(alter table) ：此目录是项目升级需要的SQL路径，如果你现在想把旧版本升级到最新版本，找到对应的更新SQL文件，执行即可。
    >注意： 不可跨级更新，比如你现在是2.4版本，想升级到2.6版本，那么你必须先执行【 V2.4 upgrade V2.5】中的文件，升级到V2.5版本的数据结构，再执行【 V2.5 upgrade V2.6】中的文件，升级到V2.6。

    ![](/luckyframe/readmeRes/img/sqldb-update.png)

    >从V2.X升级到V3.X由于是属于重构级别，所以不能直接升级，需要先执行V3.X版本的初始化SQL文件，再执行V2.7.2升级到V3.0的升级SQL文件，对数据进行迁移，具体操作可参照升级文章，后续会提供。

5. **打包项目客户端和服务端 [LuckyFrameOperations](https://github.com/luobozz/operations_structs/tree/master/luckyframe)**

    >由于编译环境复杂性，先自己分别到client和web的项目下自己通过各种方式编译出文件，需是标准maven target 输出

    >编辑depoly.bat文件更改`web_path`和`client_path` 分别是你环境中luckyframeweb和luckyframeclient的绝对路径

    >如果需要脚本scp则填写scp地址，并且不注释后面的scp行

    >执行depoly.bat(生成relases/luckyframe.tar)

6. **部署项目客户端和服务端 [LuckyFrameOperations](https://github.com/luobozz/operations_structs/tree/master/luckyframe)**
    
    >将depoly.bat生成好的.lbop/luckyframe.tar复制到服务器解压，或者使用public.sh脚本解压

    ```
        tar -xvf luckyframe.tar
        rm luckyframe.tar
    ```

    >到luckyframe目录内执行dockercompose命令部署容器，或者到luckyframe目录内执行./build.sh文件部署容器
    
    `dockercompose up -d`
    `sudo chmod +x ./build.sh & ./build.sh`
    
    >服务端端口:6680:80 客户端端口口:6633:6633

    >其他相关打包或者其他部署查看luckyframe相关部署文档
    - **[项目配置](http://www.luckyframe.cn/book/yhsc/xmpz-23.html)**
    - **[项目部署](http://www.luckyframe.cn/book/yhsc/xmbs-26.html)**
   
7. **相关资料**
   
   1. 端口
      - 服务端端口:6680:80
      - 客户端端口口:6633:6633
   2. 项目预览地址
      - http://服务端地址/login

### 常见问题
        
>Q: **建立好的数据库navicat或者luckyframe服务端无法访问到怎么办**

>A: 检查下你开放的端口(默认3306)

```
 
  1. 使用 telnet ${ip} ${port}的方式判断下在网络环境中3306的可访问性
     例如 telnet 192.168.1.8 8080
  
  2. 先检查mysql是否设置了仅本机访问，查看mysqld.cnf文件(apt安装默认目录/etc/mysql/mysql.conf.d/mysqld.cnf)，如果
  bind-address = 127.0.0.1 这行没有注释，那么注释他之后重启mysql服务
  
  3. 第二步不行的话检查下本机的防火墙设置
     ubuntu默认防火墙ufw的开启和关闭设置(https://www.jianshu.com/p/2d819f07c0b9)
      
```