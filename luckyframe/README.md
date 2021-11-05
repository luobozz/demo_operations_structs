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

5. **部署项目客户端和服务端 [LuckyFrameOperations](https://github.com/luobozz/operations_structs/tree/master/luckyframe)**
    
    >复制本项目builder目录到服务器，执行dockercompose命令部署容器即可
    
    `dockercompose up -d`
    
    >其他相关打包或者其他部署查看luckyframe相关部署文档
    - **[项目配置](http://www.luckyframe.cn/book/yhsc/xmpz-23.html)**
    - **[项目部署](http://www.luckyframe.cn/book/yhsc/xmbs-26.html)**
   
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