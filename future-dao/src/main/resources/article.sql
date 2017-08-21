INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-dubbo-admin的安装配置', 'linux', '系统运维', '## 上传本地dubbo-admin到Ubuntu服务器
```
$ scp dubbo-admin.war root@121.40.66.176:/root/soft/
```

## 解压dubbo-monitor到tomcat/webapps/ROOT/目录下
```
$ unzip dubbo-admin.war -d /root/install/apache-tomcat-8.5.6/webapps/ROOT/
```

<!-- more -->

## 配置
修改`webapps/ROOT/WEB-INF/dubbo.properties`中`dubbo.registry.address`的值：

```
dubbo.registry.address=zookeeper://121.40.66.176:2181?backup=139.196.28.125:2181
```

修改tomcat的server.xml：

```
<Connector port="9090" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" ></Connector>
```

## 启动
```
$ sh bin/startup.sh
```

## 停止
```
$ sh bin/shutdown.sh
```

## 访问
http://localhost:9090/

', 0, '2017-04-11 09:58:47', '2017-04-12 17:30:30');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-dubbo-monitor2.5.3的安装配置', 'linux', '系统运维', '
## 下载[dubbo-monitor2.5.3](http://download.csdn.net/detail/liweifengwf/7864009)到本地

## 上传本地dubbo-monitor到Ubuntu服务器
```
$ scp dubbo-monitor-simple-2.5.3-assembly.tar.gz root@121.40.66.176:/root/soft/
```

## 解压dubbo-monitor到指定目录
```
$ tar -zxvf dubbo-monitor-simple-2.5.3-assembly.tar.gz -C /root/install/
```

## 配置
修改`conf/dubbo.properties`中`dubbo.registry.address`的值：

```
dubbo.registry.address=zookeeper://121.40.66.176:2181?backup=139.196.28.125:2181
```

<!-- more -->

## 启动
```
# ./bin/start.sh
```

## 停止
```
$ ./bin/stop.sh
```

## 重启
```
$ ./bin/restart.sh
```

## 访问
http://localhost:8080/

', 0, '2017-04-11 10:04:11', '2017-08-08 07:04:47');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-git1.9.1的安装配置', 'linux', '系统运维', '
## 更新apt-get
```
$ apt-get update
```

## 下载git
```
$ apt-get install git
```

## 测试git是否生效
```
$ git --version
```', 0, '2017-04-11 10:07:03', '2017-08-07 23:49:27');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-jdk1.8的安装配', 'linux', '系统运维', '
## 下载[jdk1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)到本地

## 上传本地jdk到Ubuntu服务器
```
$ scp jdk-8u111-linux-x64.tar.gz root@121.40.66.176:/root/soft/
```

## 解压jdk到指定目录
```
$ tar -zxvf jdk-8u111-linux-x64.tar.gz -C /root/install/
```

## 配置jdk的环境变量
在`/etc/profile`文件尾追加下面的配置:

```
export JAVA_HOME=/root/install/jdk1.8.0_111
export JRE_HOME=/root/install/jdk1.8.0_111/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
```

<!-- more -->

之后，重新加载配置，让配置生效:

```
$ source profile
```

## 测试环境变量是否生效
```
$ java -version
```



', 0, '2017-04-11 10:12:39', '2017-07-25 08:29:06');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-jenkins的安装配置', 'linux', '系统运维', '
## 下载[jenkins](jenkins.io/index.html)到本地

## 上传本地jenkins到Ubuntu服务器

```
$ scp jenkins.war root@121.40.66.176:/root/soft/
```

## 直接把war包放入tomcat的webapps目录下并重启tomcat即可

<!-- more -->

## 安装maven插件
去这个地址[http://updates.jenkins-ci.org/download/plugins/](http://updates.jenkins-ci.org/download/plugins/)下载maven插件到本地

然后在jenkins-->系统管理-->管理插件-->高级-->上传插件-->选择maven插件(maven-plugin.hpi)-->上传-->重启

## jenkins执行shell重启tomcat无效
需要在Post steps中执行`export BUILD_ID=BUILD_BLOG`,如:

```
export BUILD_ID=BUILD_BLOG
sh /home/kyg/shell/deploy-blog.sh
```

## 构建时， 需要指定maven配置
如果没指定， 会使用默认配置，会联网下载依赖到.m2文件夹下，所以需要指定`settings.xml`配置文件的位置, 如下图:

![jenkins-maven](https://kangyonggan.com/upload/20170101020115076.png)




', 0, '2017-04-11 10:18:35', '2017-06-23 12:45:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-maven3.3.9', 'linux', '系统运维', '
## 下载[maven3.3.9](http://maven.apache.org/download.cgi)到本地

## 上传本地maven到Ubuntu服务器
```
$ scp apache-maven-3.3.9-bin.tar.gz root@121.40.66.176:/root/soft/
```

## 解压maven到指定目录
```
$ tar -zxvf apache-maven-3.3.9-bin.tar.gz -C /root/install/
```

## 配置maven的环境变量
在`/etc/profile`文件尾追加下面的配置:

```
export M2_HOME=/root/install/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin
```

<!-- more -->

之后，重新加载配置，让配置生效:

```
$ source profile
```

## 5. 测试环境变量是否生效
```
$ mvn -version
```

## 6. 配置本地仓库路径
在`/root/install/apache-maven-3.3.9/conf/settings.xml`文件中配置:

```
<localRepository>/root/data/repository</localRepository>
```

', 0, '2017-04-11 10:20:21', '2017-06-16 21:23:10');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-mysql5.6的安装配置', 'linux', '系统运维', '

## 安装
```
$ apt-get install mysql-server-5.6
```

## 启动
```
$ /etc/init.d/mysql start
```

## 停止
```
$ /etc/init.d/mysql stop
```

## 重启
```
$ /etc/init.d/mysql restart
```

## 调整内存
修改`/etc/mysql/my.cnf`,在`[mysqld]`后面追加

```
performance_schema_max_table_instances=200
table_definition_cache=200
table_open_cache=128
```


', 0, '2017-04-11 10:22:18', '2017-08-16 07:43:22');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-nexus3.1.0的安装配置', 'linux', '系统运维', '

## 下载[nexus3.1.0](https://www.sonatype.com/download-oss-sonatype)到本地

## 上传本地nexus到Ubuntu服务器
```
$ scp nexus-3.1.0-04-unix.tar.gz root@121.40.66.176:/root/soft/
```

## 解压nexus到指定目录
```
$ tar -zxvf nexus-3.1.0-04-unix.tar.gz -C /root/install/
```

## 启动
```
$ ./nexus start
```

<!-- more -->

## 停止
```
$ ./nexus stop
```

## 访问
http://localhost:8081/

- 用户名:admin
- 密码:admin123

## 使用

配置`settings.xml`

```
<servers>
    <server>
      <id>releases</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
    <server>
      <id>snapshots</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
  </servers>
```

配置`pom.xml`

```
<distributionManagement>
    <repository>
        <id>releases</id>
        <name>nexus releases</name>
        <url>http://kangyonggan.com:8081/repository/maven-releases/</url>
    </repository>

    <snapshotRepository>
        <id>snapshots</id>
        <name>nexus snapshots</name>
        <url>http://kangyonggan.com:8081/repository/maven-snapshots/</url>
    </snapshotRepository>
</distributionManagement>
```

', 0, '2017-04-11 10:23:48', '2017-04-12 07:06:19');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-tomcat8.5.6的安装配置', 'linux', '系统运维', '
## 下载[tomcat8.5.6](http://tomcat.apache.org/download-80.cgi)到本地

## 上传本地tomcat到Ubuntu服务器
```
$ scp apache-tomcat-8.5.6.tar.gz root@121.40.66.176:/root/soft/
```

## 解压tomcat到指定目录
```
$ tar -zxvf apache-tomcat-8.5.6.tar.gz -C /root/install/
```

## 启动
```
$ sh startup.sh
```

## 停止
```
$ sh shutdown.sh
```



', 0, '2017-04-11 10:25:19', '2017-07-25 11:26:45');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-zookeeper3.4.9的安装配置', 'linux', '系统运维', '
## 下载[zookeeper3.4.9](http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.9/)到本地

## 上传本地zookeeper到Ubuntu服务器
```
$ scp zookeeper-3.4.9.tar.gz root@121.40.66.176:/root/soft/
```

## 解压zookeeper到指定目录

```
$ mkdir /root/install/server1
$ tar zxvf zookeeper-3.4.9.tar.gz -C /root/install/server1/
```

<!-- more -->

## 配置（集群）
在`server1`目录下创建两个目录，分别是`data`和`logs`

```
$ cd /root/install/server1/
$ mkdir data
$ mkdir logs
```

此时，server1目录下有三个文件

```
root@iZ23ldh8kudZ:~/install/server1# pwd
/root/install/server1
root@iZ23ldh8kudZ:~/install/server1# ll
total 20
drwxr-xr-x  5 root root 4096 Dec 17 15:43 ./
drwxr-xr-x  8 root root 4096 Dec 17 15:39 ../
drwxr-xr-x  2 root root 4096 Dec 17 15:43 data/
drwxr-xr-x  2 root root 4096 Dec 17 15:43 logs/
drwxr-xr-x 10 1001 1001 4096 Aug 23 15:42 zookeeper-3.4.9/
```

在`data`目录下创建文件`myid`,其内容为`1`

```
vi /data/myid
内容为1
```

复制配置文件`zookeeper-3.4.9/conf/zoo_sample.cfg`到`zookeeper-3.4.9/conf/zoo.cfg`, 并修改其内容:

```
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/root/install/server1/data
dataLogsDir=/root/install/server1/logs
clientPort=2181

server.1=121.40.66.176:2888:3888
server.2=139.196.28.125:2888:3888
```

> 每台服务器都要有类似的配置

## 环境变量

在`/etc/profile`文件最后追加:

```
export PATH=$PATH:/root/install/server1/zookeeper-3.4.9/bin
```

立即生效

```
$ source /etc/profile
```

## 启动

```
$ zkServer.sh start
```

## 查看是否启动

```
root@iZ23ldh8kudZ:~/install/server1/zookeeper-3.4.9# jps
7096 QuorumPeerMain
7114 Jps
```

看到`QuorumPeerMain`就说明启动成功了

## 停止

```
$ zkServer.sh stop
```


', 0, '2017-04-11 10:27:02', '2017-06-19 06:45:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.04下配置ftp服务器', 'linux', '系统运维', '
## 下载并安装
```
apt-get install vsftpd
```

## ftp服务器启动和重启
- 启动:`/etc/init.d/vsftpd start`
- 重启:`/etc/init.d/vsftpd restart`

<!-- more -->

## 创建ftp用户
ftp用户需满足下面条件：

- 此用户只是用来使用ftp服务的
- 此用户不可登录服务器
- 此用户不能访问ftp指定文件夹之外的文件

## 创建用户
```
useradd -d /home/ftp0 -m ftp0
passwd ftp0
```

## 修改ftp配置
修改`/etc/vsftpd.conf`的几个关键配置:

```
anonymous_enable=NO cal_user=YES# 只能访问自身的目录，此处有坑，需加上下面一行
allow_writeable_chroot=YES# 允许写自身发目录
```

## 让用户不能登录
```
usermod -s /sbin/nologin ftp0
```

注意，ubuntu下还需要在`/etc/shells`最后加上：`/sbin/nologin`

> 最后需要重启ftp服务器

## 测试
```
ftp> open 192.168.1.100
user:ftp0
pwd:xxxxx
success!
```

## 附javaftp上传代码
```
package com.kangyonggan.api.biz;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import java.io.File;
import java.io.FileInputStream;

/**
 * @author kangyonggan
 * @since 2016/12/25
 */
public class TestFtp {

    private FTPClient ftp;

    /**
     * @param path     上传到ftp服务器哪个路径下
     * @param addr     地址
     * @param port     端口号
     * @param username 用户名
     * @param password 密码
     * @return
     * @throws Exception
     */
    private boolean connect(String path, String addr, int port, String username, String password) throws Exception {
        boolean result = false;
        ftp = new FTPClient();
        int reply;
        ftp.connect(addr, port);
        ftp.login(username, password);
        ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
        reply = ftp.getReplyCode();
        if (!FTPReply.isPositiveCompletion(reply)) {
            ftp.disconnect();
            return result;
        }
        ftp.changeWorkingDirectory(path);
        result = true;
        return result;
    }

    /**
     * @param file 上传的文件或文件夹
     * @throws Exception
     */
    private void upload(File file) throws Exception {
        if (file.isDirectory()) {
            ftp.makeDirectory(file.getName());
            ftp.changeWorkingDirectory(file.getName());
            String[] files = file.list();
            for (int i = 0; i < files.length; i++) {
                File file1 = new File(file.getPath() + "\\" + files[i]);
                if (file1.isDirectory()) {
                    upload(file1);
                    ftp.changeToParentDirectory();
                } else {
                    File file2 = new File(file.getPath() + "\\" + files[i]);
                    FileInputStream input = new FileInputStream(file2);
                    ftp.storeFile(file2.getName(), input);
                    input.close();
                }
            }
        } else {
            File file2 = new File(file.getPath());
            FileInputStream input = new FileInputStream(file2);
            ftp.storeFile(file2.getName(), input);
            input.close();
        }
    }

    public static void main(String[] args) throws Exception {
        TestFtp t = new TestFtp();
        t.connect("/home/ftp0/", "192.168.1.100", 21, "ftp0", "123456");
        File file = new File("/Users/kyg/Downloads/blog.sql");
        t.upload(file);
    }

}
```



', 0, '2017-04-11 10:29:15', '2017-08-09 11:53:16');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.04从命令行启动', 'linux', '系统运维', '
## 修改配置 /etc/default/grub
- 注释此行：`#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`
- `GRUB_CMDLINE_LINUX=""` 改为 `GRUB_CMDLINE_LINUX="text"`
- `#GRUB_TERMINAL=console` 的注释干掉

## 更新配置
```
update-grub
```

## 重启
不出意外会从命令行启动， 意外会发生在ubuntu16.04上
', 0, '2017-04-11 10:29:57', '2017-07-25 18:00:21');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.04盒盖不休眠', 'linux', '系统运维', '

## 修改配置 /etc/systemd/logind.conf
然后将其中的：`#HandleLidSwitch=suspend` 改成： `HandleLidSwitch=ignore`

## 然后重启服务：
```
sudo restart systemd-logind
```

', 0, '2017-04-11 10:30:32', '2017-06-21 02:04:20');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu14.0.4安装及配置系列-redis3.2.0的安装配置', 'linux', '系统运维', '
## 下载[redis3.2](https://redis.io/)到本地

## 上传本地redis到Ubuntu服务器
```
$ scp redis-3.2.0.tar.gz root@121.40.66.176:/root/soft/
```

## 解压redis到指定目录
```
$ tar -zxvf redis-3.2.0.tar.gz -C /root/install/
```

## 安装
```
make & make install
```

<!-- more -->

## 配置
在`/root/install/redis-3.2.0/redis.conf`后面追加下面的配置:

```
requirepass 123456
```

## 启动
```
$ redis-server redis.conf &
```

## 测试

```
$ redis-cli -a 123456
> ping
```

输出:`PONG`

## 停止
```
$ redis-cli -a 123456 shutdown
```

## 清空所有缓存
```
$ redis-cli -a 123456 KEYS "*" | xargs redis-cli -a 123456 DEL
```


', 0, '2017-04-11 10:32:14', '2017-04-12 15:15:46');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu16.0.4启动zookeeper报错', 'linux', '系统运维', '

## 报错信息
```
bin/zkServer.sh: 81: /home/kyg/install/server1/zookeeper-3.4.9/bin/zkEnv.sh: Syntax error: "(" unexpected (expecting "fi")
```

## 解决方案
```
ls -l /bin/sh
lrwxrwxrwx 1 root root 4 12月 24 17:22 /bin/sh -> dash
ls -l /bin/sh
lrwxrwxrwx 1 root root 4 12月 24 20:01 /bin/sh -> bash
```


', 0, '2017-04-11 10:33:00', '2017-04-11 10:33:48');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu下mysql数据库恢复', 'linux', '系统运维', '


前端时间我在玩主从库的时候， 一不小心把mysql数据库玩坏了， 连服务都启动不了了， 经过一番修复后还是不行， 可怜我的博客都在库里, 不过我却在庆幸， 因为这叫置之死地而后生，我又能学到牛逼技术了...

## 备份数据
mysql数据是放在/var/lib/mysql下面的，需要备份的内容有：

- ibdata1
- performance_schema
- blog文件夹 （对应数据库blog）
- 其他你需要恢复的数据库

<!-- more -->

## 重装mysql
重装教程网上一堆， 这里就不再赘述。

## 恢复
把备份的几个文件， 替换回去， 然后重启mysql， 这时候会报错， 查看mysql日志后发现是权限不足导致。

原因是：备份与恢复数据的用户一般都需要比较高的权限才能操作， 比如root，所以替换后的文件的所有者是root， 而不再是mysql， 因此需要改变文件拥有者和赋权：

```
cd /var/lib/mysql
chown mysql *

chmod 700 blog;
chmod 700 ibdata1;
chmod 700 performance_schema;
```

必要时还需要删除这两个日志文件`ib_logfile0`和`ib_logfile1`：

```
rm ib_logfile*
```

重启， 不出意外应该是可以登录mysql了， `show databases`能看到已经恢复的blog数据库了， `use blog;show tables`能看见article表了。

但是，在查询article表的时候，又会报权限不足的错， 道理是相同的， 我们去`/var/lib/mysql/blog`目录下，重新改变拥有者:

```
cd /var/lib/mysql/blog
chown mysql *
```

重启，验证， 成功！



', 0, '2017-04-11 10:33:40', '2017-04-13 04:45:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu下方向键不好使的解决方案', 'linux', '系统运维', '
## 先卸载vim-tiny

```
$ sudo apt-get remove vim-common
```

## 再安装vim full：

```
$ sudo apt-get install vim
```

', 0, '2017-04-11 10:34:24', '2017-08-06 17:48:50');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu下防火墙的一些简单使用', 'linux', '系统运维', '


## 摘要
公司的很多项目都是放在Linux机器上的，因此安装防火墙还是很有必要的...

## 安装防火墙
```
apt-get install firewalld
```

<!-- more -->

## 查看开放的端口
```
firewall-cmd --list-all
```

## 把一个端口开放
```
firewall-cmd --permanent --add-port=8080/tcp
```

## 端口开放之后要重新加载
```
firewall-cmd --reload
```

## 移除一个开放的端口
```
firewall-cmd --permanent --remove-port=8080/tcp
```

', 0, '2017-04-11 10:35:21', '2017-07-18 09:48:39');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Ubuntu配置DNS服务器', 'linux', '系统运维', '


## 实验目的
在ubuntu 14.04上搭建一个自己的dns服务器，并实现重新解析baidu.com到自定义服务器。

## 安装并配置

```
kyg@kyg-Latitude-5450:~$ sudo apt-get bind9
```

<!-- more -->

检查是否安装成功

```
kyg@kyg-Latitude-5450:~$ cd /etc/bind/
kyg@kyg-Latitude-5450:/etc/bind$ ll
total 68
drwxr-sr-x   2 root bind  4096  2月 19 12:25 ./
drwxr-xr-x 129 root root 12288  2月 19 12:25 ../
-rw-r--r--   1 root root  2389  2月 16 00:33 bind.keys
-rw-r--r--   1 root root   237  2月 16 00:33 db.0
-rw-r--r--   1 root root   271  2月 16 00:33 db.127
-rw-r--r--   1 root root   237  2月 16 00:33 db.255
-rw-r--r--   1 root root   353  2月 16 00:33 db.empty
-rw-r--r--   1 root root   270  2月 16 00:33 db.local
-rw-r--r--   1 root root  3048  2月 16 00:33 db.root
-rw-r--r--   1 root bind   463  2月 16 00:33 named.conf
-rw-r--r--   1 root bind   490  2月 16 00:33 named.conf.default-zones
-rw-r--r--   1 root bind   165  2月 16 00:33 named.conf.local
-rw-r--r--   1 root bind   890  2月 19 12:25 named.conf.options
-rw-r-----   1 bind bind    77  2月 19 12:25 rndc.key
-rw-r--r--   1 root root  1317  2月 16 00:33 zones.rfc1918
```

在实验之前先ping一下百度，好做个对比

```
kyg@kyg-Latitude-5450:~$ ping baidu.com
PING baidu.com (123.125.114.144) 56(84) bytes of data.
64 bytes from 123.125.114.144: icmp_seq=1 ttl=54 time=33.4 ms
64 bytes from 123.125.114.144: icmp_seq=2 ttl=54 time=42.4 ms
64 bytes from 123.125.114.144: icmp_seq=3 ttl=54 time=37.3 ms
```

可以看到dns把baidu.com解析成的ip是123.125.114.144
现在我就搭建一个简单的dns，让自己的dns把baidu.com解析成192.168.2.112
这是自己的服务器，然后就可以把xxx展现给用户了。

配置dns：

```
kyg@kyg-Latitude-5450:~$ sudo vim /etc/bind/named.conf.local
添加如下内容:

zone "baidu.com" { type master; file "/etc/bind/db.baidu.com"; };
```

修改db的配置文件:

```
kyg@kyg-Latitude-5450:~$ cd /etc/bind/
kyg@kyg-Latitude-5450:/etc/bind# sudo cp db.local db.baidu.com
kyg@kyg-Latitude-5450:/etc/bind# vi db.baidu.com

内容如下：

;
; BIND data file for local loopback interface
;
$TTL604800
@INSOAlocalhost. root.localhost. (
o      2; Serial
o 604800; Refresh
o  86400; Retry
o2419200; Expire
o 604800 ); Negative Cache TTL
;
@INNSlocalhost.
@INA192.168.2.112
@INAAAA::1
```

最后重启服务！

```
kyg@kyg-Latitude-5450:/etc/bind# sudo /etc/init.d/bind9 restart
 * Stopping domain name service... bind9                                                waiting for pid 5141 to die
                                                                                 [ OK ]
 * Starting domain name service... bind9
```

如果启动失败，可以运行`named -g`查看错误原因.

## 测试
```
kyg@kyg-Latitude-5450:/etc/bind$ ping baidu.com
PING baidu.com (192.168.2.112) 56(84) bytes of data.
64 bytes from 192.168.2.112: icmp_seq=1 ttl=63 time=4.73 ms
64 bytes from 192.168.2.112: icmp_seq=2 ttl=63 time=2.12 ms
64 bytes from 192.168.2.112: icmp_seq=3 ttl=63 time=2.22 ms
64 bytes from 192.168.2.112: icmp_seq=4 ttl=63 time=5.15 ms
64 bytes from 192.168.2.112: icmp_seq=5 ttl=63 time=18.8 ms
64 bytes from 192.168.2.112: icmp_seq=6 ttl=63 time=2.11 ms
64 bytes from 192.168.2.112: icmp_seq=7 ttl=63 time=2.81 ms
64 bytes from 192.168.2.112: icmp_seq=8 ttl=63 time=2.79 ms
```

## 感悟
其实在我们没有安装DNS服务之前，可以将/etc/hosts文件比作一个DNS服务配置文件，因为它实现和DNS类似。

之所以会独立出DNS服务，是因为因特网主机多，如果每个主机都靠/etc/hosts文件来维护主机名到ip的映射，那么工作量非常大，对本地更新、网络资源占用都很浪费，所以出现了DNS。




', 0, '2017-04-11 10:36:48', '2017-04-11 10:36:55');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('高并发架构的优化方案', 'other', '综合', '
应用情景：12306抢票，春运期间，一票难求！票的数量是有限的，但也罩不住中国出门打工的人多啊，如果放任所有请求去读库，哪个数据库能扛得住？

## 优化草案
### 将请求尽量拦截在上游
如果将所有的请求都落到数据层，数据读写时锁冲突严重，并发响应就会很慢，用户体验就会很差。所以可以让系统中的每一层都做些事情，不要只做一个`过渡者`，尽量拦截下一些无效的请求，给数据库减压。

<!-- more -->

### 利用缓存
12306抢票是一个典型的`读多写少`的应用场景，比如一个班次的票有2000张，有200w人抢票，刷票时就是读，抢到票就要写，读写比是1000:1, 是非常适合用缓存的，其实大多数企业应用都是读多写少，都可以用缓存。

## 系统架构
下面是一个常见的站点架构图，高并发的优化就从这张图说起。

![frame.png](https://kangyonggan.com/upload/20170227213203585.png)

- 浏览器: 与用户交互，会执行js
- 站点层: 会访问服务层，返给浏览器界面
- 服务层: 复杂的业务
- 数据层: 封装访问数据的复杂，访问数据库

## 各层优化
### 客户端优化（浏览器、App）
- 可以做防重复提交，按钮点击后置灰
- 可以用js限制x秒内只能提交一次请求

这样可以挡住普通用户，但是挡不住一些黄牛的for循环，好的是99%的都是普通用户，最起码能拦截下80%的无效请求。

### 站点层优化
客户端防重复提交也只能拦住普通用户，在黄牛盛行的今天，我们是很有必要连黄牛的请求也一并拦截！那么怎么样来拦截黄牛的for循环呢？其实也是类似客户端的防重复提交，对于每次请求，我们都能拿到用户ID，结合业务我们可以对请求进行计数，判断x秒内只能透过一次请求，这个计数可以放在session中，这样就能裆下黄牛99%的for循环请求。

但是有些黄牛手里有N(=10w)个肉鸡，N个账户，同时请求。站点层的拦截就挡不住了！

### 服务层优化
不管怎么样，搞死不让请求落到数据库，那么我怎么拦截肉鸡的高并发请求呢？利用队列！
比如，有2000张票，有20w用户想要下单购买，请求已经到了服务层，这时候可以把请求加入队列，如果队列长度大于2000（或者大于余票）就把其他请求拦截下来。

### 数据层
客户端拦截了80%，站点层拦截了99%，服务层又有队列控制，数据库基本无压。

### 业务优化
`一切脱离业务的架构都是耍流氓`！比如，抢票时间可以调整一下，`分时分次抢票`，8点卖一批次，9点卖一批次,...。将流量均摊。其次，粒度的优化，我们有时候只关心有票和无票，二不关心具体还剩多少票，所以只需要做一个粗粒度的缓存即可。

### 预备
如果并发量实在太大，可以对站点层的机器进行扩充，通过增加机器来分担压力。

## 总结
高并发架构优化的基本思路：

- 尽量将请求拦截在上游
- 读多写少多用缓存
- 结合业务来优化


', 0, '2017-04-11 10:41:48', '2017-04-11 10:43:06');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('高并发架构的优化方案', 'db', '数据库', '

## 应用场景
缓存是一种提高`读性能`的常见技术。对于读多写少的应用，就可以使用缓存进行优化。

例如，网关中各个银行通道配置bank_channel_conf(bnk_no, bnk_nm)，业务需求是：

- 查询通道信息,select bnk_no, bnk_nm from bank_channel_conf where bnk_no = ?,占请求总数的99%
- 修改通道信息,update bank_channel_conf set bnk_nm = ? where bnk_no = ?,占请求总数的1%

<!-- more -->

由于大部分的请求是查询，我们在缓存中建立bnk_no到bnk_nm的键值对，或者bnk_no到BankChannelConf实体的键值对，可以很大程度的减少数据库的压力。

## 读操作流程
现在有两个地方存放银行通道的数据，一个是`db`,一个是`cache`。每当需要读一个数据时，流程是这样的:

1. 读取缓存是否有相关的数据。bnkNo->bnkNm
2. 如果缓存中有数据，则返回缓存中的数据，这就是所谓的`数据命中[hit]`
3. 如果缓存中没有数据，就会去查询数据库，这就是所谓的`数据未命中[miss]`，最后把数据放入缓存，再返回。

> 缓存命中率[HitRate] = 命中[Hit] / (命中[hit] + 未命中[miss]) * 100%

像上面这个例子，目测缓存命中率会在95%以上！

## 写操作流程
上面读操作流程很简单，没有什么例外，但是写操作就很麻烦了，比如下面的问题：

- 是更新cache中的数据？还是淘汰cache中的数据？
- 是先操作db中的数据？还是先操作cache中的数据？

### 更新缓存
什么是更新缓存呢？就是写操作时，不但会把数据写入db中，还会把数据写入cache中（key相同就会替换，相当于更新了）。

优点：紧随写操作之后的那一次查询，不会miss，命中率稍有提高（也不算优点吧，提高的命中率忽略不计）。

### 淘汰缓存
什么是淘汰缓存？就是写操作时，只写入db，不会写入cache，不但不写入，还要删除。

优点：简单（也不算优点吧，更新也不难）
缺点：命中率稍有下降（也是忽略不计）。

如果仅仅从上面的例子中看，貌似更新缓存和淘汰缓存旗鼓相当，甚至更倾向于更新缓存。

但是，如果缓存中的value需要经过一系列的查询才能得到，那么，为了增加一次命中，可能就不值得了（毕竟代码中还要额外的写逻辑，可能还是在中间件中，我们都知道的中间件是不能带有业务逻辑的），这么来看的话，更新缓存的代价可能就更大了一些。

个人观点：淘汰缓存操作简单，缺点仅仅只是多一次miss，处理方式全世界统一，所以个人建议使用。

### 先操作db还是先操作cache
现在假设使用淘汰缓存作为对缓存的通用处理，现在又有下面两个问题：

1. 先写数据库，再淘汰缓存
2. 先淘汰缓存，再写数据库

正常不出意外的情况下，两种方案都可以，没有谁好谁坏，但是在一些极端的情况下就不好说了。

比如方案1，假如写数据库成功了，但是淘汰数据时失败了，这时候又没有事务能保证两步操作的原子性，那么就可能造成缓存中有脏数据，数据的不一致就这么产生了。

但是反过来，采用方案2，先淘汰缓存数据成功了，再写数据库时失败了，顶多就是缓存中的数据丢了，增加一次miss，不会产生脏数据，对业务的影响较小。

结论：db和cache的操作顺序是，先淘汰cache，再写db。

## 进一步优化
上述缓存框架有一个缺点，业务方不但需要关注cache和db，还需要对cache进行管理，如果多人团队开发，完全不知道在什么时机淘汰什么cache，因此，这里需要一个数据服务层，向上游提供一个优雅的接口，屏蔽缓存管理的细节，这样的话上游业务方就不需要关注这些根本没法关注的细节了。

## 遗留难点
当采用淘汰缓存方案时，在高并发的情况下，如果线程1已经淘汰了缓存，准备写数据时，恰好在这时，线程2过来读数据，发现缓存中没数据，然后就去请求数据库，再把数据库中的数据放入缓存，最后线程1才磨磨唧唧的把数据写入库中，结果就造成了cache与db不一致的问题。



', 0, '2017-04-11 10:43:44', '2017-06-30 05:10:50');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('数据库设计基本概念和思路', 'db', '数据库', '

## 基本概念
### 单库
![db-0](https://kangyonggan.com/upload/20170301082926454.png)

<!-- more -->
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-dubbo-admin的安装配置'', ''linux'', ''系统运维'', ''## 上传本地dubbo-admin到Ubuntu服务器
```
$ scp dubbo-admin.war root@121.40.66.176:/root/soft/
```

## 解压dubbo-monitor到tomcat/webapps/ROOT/目录下
```
$ unzip dubbo-admin.war -d /root/install/apache-tomcat-8.5.6/webapps/ROOT/
```

<!-- more -->

## 配置
修改`webapps/ROOT/WEB-INF/dubbo.properties`中`dubbo.registry.address`的值：

```
dubbo.registry.address=zookeeper://121.40.66.176:2181?backup=139.196.28.125:2181
```

修改tomcat的server.xml：

```
<Connector port="9090" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" ></Connector>
```

## 启动
```
$ sh bin/startup.sh
```

## 停止
```
$ sh bin/shutdown.sh
```

## 访问
http://localhost:9090/

'', 0, 0, 1, 0, 0, ''2017-04-11 13:58:47'', ''2017-04-11 13:58:47'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-dubbo-monitor2.5.3的安装配置'', ''linux'', ''系统运维'', ''
## 下载[dubbo-monitor2.5.3](http://download.csdn.net/detail/liweifengwf/7864009)到本地

## 上传本地dubbo-monitor到Ubuntu服务器
```
$ scp dubbo-monitor-simple-2.5.3-assembly.tar.gz root@121.40.66.176:/root/soft/
```

## 解压dubbo-monitor到指定目录
```
$ tar -zxvf dubbo-monitor-simple-2.5.3-assembly.tar.gz -C /root/install/
```

## 配置
修改`conf/dubbo.properties`中`dubbo.registry.address`的值：

```
dubbo.registry.address=zookeeper://121.40.66.176:2181?backup=139.196.28.125:2181
```

<!-- more -->

## 启动
```
# ./bin/start.sh
```

## 停止
```
$ ./bin/stop.sh
```

## 重启
```
$ ./bin/restart.sh
```

## 访问
http://localhost:8080/

'', 1, 0, 1, 0, 0, ''2017-04-11 14:04:11'', ''2017-04-11 14:15:54'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-git1.9.1的安装配置'', ''linux'', ''系统运维'', ''
## 更新apt-get
```
$ apt-get update
```

## 下载git
```
$ apt-get install git
```

## 测试git是否生效
```
$ git --version
```'', 1, 0, 1, 0, 0, ''2017-04-11 14:07:03'', ''2017-04-11 14:15:54'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-jdk1.8的安装配'', ''linux'', ''系统运维'', ''
## 下载[jdk1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)到本地

## 上传本地jdk到Ubuntu服务器
```
$ scp jdk-8u111-linux-x64.tar.gz root@121.40.66.176:/root/soft/
```

## 解压jdk到指定目录
```
$ tar -zxvf jdk-8u111-linux-x64.tar.gz -C /root/install/
```

## 配置jdk的环境变量
在`/etc/profile`文件尾追加下面的配置:

```
export JAVA_HOME=/root/install/jdk1.8.0_111
export JRE_HOME=/root/install/jdk1.8.0_111/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
```

<!-- more -->

之后，重新加载配置，让配置生效:

```
$ source profile
```

## 测试环境变量是否生效
```
$ java -version
```



'', 1, 0, 1, 0, 0, ''2017-04-11 14:12:39'', ''2017-04-11 14:13:04'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-jenkins的安装配置'', ''linux'', ''系统运维'', ''
## 下载[jenkins](jenkins.io/index.html)到本地

## 上传本地jenkins到Ubuntu服务器

```
$ scp jenkins.war root@121.40.66.176:/root/soft/
```

## 直接把war包放入tomcat的webapps目录下并重启tomcat即可

<!-- more -->

## 安装maven插件
去这个地址[http://updates.jenkins-ci.org/download/plugins/](http://updates.jenkins-ci.org/download/plugins/)下载maven插件到本地

然后在jenkins-->系统管理-->管理插件-->高级-->上传插件-->选择maven插件(maven-plugin.hpi)-->上传-->重启

## jenkins执行shell重启tomcat无效
需要在Post steps中执行`export BUILD_ID=BUILD_BLOG`,如:

```
export BUILD_ID=BUILD_BLOG
sh /home/kyg/shell/deploy-blog.sh
```

## 构建时， 需要指定maven配置
如果没指定， 会使用默认配置，会联网下载依赖到.m2文件夹下，所以需要指定`settings.xml`配置文件的位置, 如下图:

![jenkins-maven](https://kangyonggan.com/upload/20170101020115076.png)




'', 1, 0, 1, 0, 0, ''2017-04-11 14:18:35'', ''2017-04-11 14:18:41'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-maven3.3.9'', ''linux'', ''系统运维'', ''
## 下载[maven3.3.9](http://maven.apache.org/download.cgi)到本地

## 上传本地maven到Ubuntu服务器
```
$ scp apache-maven-3.3.9-bin.tar.gz root@121.40.66.176:/root/soft/
```

## 解压maven到指定目录
```
$ tar -zxvf apache-maven-3.3.9-bin.tar.gz -C /root/install/
```

## 配置maven的环境变量
在`/etc/profile`文件尾追加下面的配置:

```
export M2_HOME=/root/install/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin
```

<!-- more -->

之后，重新加载配置，让配置生效:

```
$ source profile
```

## 5. 测试环境变量是否生效
```
$ mvn -version
```

## 6. 配置本地仓库路径
在`/root/install/apache-maven-3.3.9/conf/settings.xml`文件中配置:

```
<localRepository>/root/data/repository</localRepository>
```

'', 1, 0, 1, 0, 0, ''2017-04-11 14:20:21'', ''2017-04-11 14:20:27'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-mysql5.6的安装配置'', ''linux'', ''系统运维'', ''

## 安装
```
$ apt-get install mysql-server-5.6
```

## 启动
```
$ /etc/init.d/mysql start
```

## 停止
```
$ /etc/init.d/mysql stop
```

## 重启
```
$ /etc/init.d/mysql restart
```

## 调整内存
修改`/etc/mysql/my.cnf`,在`[mysqld]`后面追加

```
performance_schema_max_table_instances=200
table_definition_cache=200
table_open_cache=128
```


'', 1, 0, 1, 0, 0, ''2017-04-11 14:22:18'', ''2017-04-11 14:22:26'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-nexus3.1.0的安装配置'', ''linux'', ''系统运维'', ''

## 下载[nexus3.1.0](https://www.sonatype.com/download-oss-sonatype)到本地

## 上传本地nexus到Ubuntu服务器
```
$ scp nexus-3.1.0-04-unix.tar.gz root@121.40.66.176:/root/soft/
```

## 解压nexus到指定目录
```
$ tar -zxvf nexus-3.1.0-04-unix.tar.gz -C /root/install/
```

## 启动
```
$ ./nexus start
```

<!-- more -->

## 停止
```
$ ./nexus stop
```

## 访问
http://localhost:8081/

- 用户名:admin
- 密码:admin123

## 使用

配置`settings.xml`

```
<servers>
    <server>
      <id>releases</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
    <server>
      <id>snapshots</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
  </servers>
```

配置`pom.xml`

```
<distributionManagement>
    <repository>
        <id>releases</id>
        <name>nexus releases</name>
        <url>http://kangyonggan.com:8081/repository/maven-releases/</url>
    </repository>

    <snapshotRepository>
        <id>snapshots</id>
        <name>nexus snapshots</name>
        <url>http://kangyonggan.com:8081/repository/maven-snapshots/</url>
    </snapshotRepository>
</distributionManagement>
```

'', 1, 0, 1, 0, 0, ''2017-04-11 14:23:48'', ''2017-04-11 14:24:27'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-tomcat8.5.6的安装配置'', ''linux'', ''系统运维'', ''
## 下载[tomcat8.5.6](http://tomcat.apache.org/download-80.cgi)到本地

## 上传本地tomcat到Ubuntu服务器
```
$ scp apache-tomcat-8.5.6.tar.gz root@121.40.66.176:/root/soft/
```

## 解压tomcat到指定目录
```
$ tar -zxvf apache-tomcat-8.5.6.tar.gz -C /root/install/
```

## 启动
```
$ sh startup.sh
```

## 停止
```
$ sh shutdown.sh
```



'', 1, 0, 1, 0, 0, ''2017-04-11 14:25:19'', ''2017-04-11 14:25:23'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-zookeeper3.4.9的安装配置'', ''linux'', ''系统运维'', ''
## 下载[zookeeper3.4.9](http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.9/)到本地

## 上传本地zookeeper到Ubuntu服务器
```
$ scp zookeeper-3.4.9.tar.gz root@121.40.66.176:/root/soft/
```

## 解压zookeeper到指定目录

```
$ mkdir /root/install/server1
$ tar zxvf zookeeper-3.4.9.tar.gz -C /root/install/server1/
```

<!-- more -->

## 配置（集群）
在`server1`目录下创建两个目录，分别是`data`和`logs`

```
$ cd /root/install/server1/
$ mkdir data
$ mkdir logs
```

此时，server1目录下有三个文件

```
root@iZ23ldh8kudZ:~/install/server1# pwd
/root/install/server1
root@iZ23ldh8kudZ:~/install/server1# ll
total 20
drwxr-xr-x  5 root root 4096 Dec 17 15:43 ./
drwxr-xr-x  8 root root 4096 Dec 17 15:39 ../
drwxr-xr-x  2 root root 4096 Dec 17 15:43 data/
drwxr-xr-x  2 root root 4096 Dec 17 15:43 logs/
drwxr-xr-x 10 1001 1001 4096 Aug 23 15:42 zookeeper-3.4.9/
```

在`data`目录下创建文件`myid`,其内容为`1`

```
vi /data/myid
内容为1
```

复制配置文件`zookeeper-3.4.9/conf/zoo_sample.cfg`到`zookeeper-3.4.9/conf/zoo.cfg`, 并修改其内容:

```
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/root/install/server1/data
dataLogsDir=/root/install/server1/logs
clientPort=2181

server.1=121.40.66.176:2888:3888
server.2=139.196.28.125:2888:3888
```

> 每台服务器都要有类似的配置

## 环境变量

在`/etc/profile`文件最后追加:

```
export PATH=$PATH:/root/install/server1/zookeeper-3.4.9/bin
```

立即生效

```
$ source /etc/profile
```

## 启动

```
$ zkServer.sh start
```

## 查看是否启动

```
root@iZ23ldh8kudZ:~/install/server1/zookeeper-3.4.9# jps
7096 QuorumPeerMain
7114 Jps
```

看到`QuorumPeerMain`就说明启动成功了

## 停止

```
$ zkServer.sh stop
```


'', 1, 0, 1, 0, 0, ''2017-04-11 14:27:02'', ''2017-04-11 14:27:55'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.04下配置ftp服务器'', ''linux'', ''系统运维'', ''
## 下载并安装
```
apt-get install vsftpd
```

## ftp服务器启动和重启
- 启动:`/etc/init.d/vsftpd start`
- 重启:`/etc/init.d/vsftpd restart`

<!-- more -->

## 创建ftp用户
ftp用户需满足下面条件：

- 此用户只是用来使用ftp服务的
- 此用户不可登录服务器
- 此用户不能访问ftp指定文件夹之外的文件

## 创建用户
```
useradd -d /home/ftp0 -m ftp0
passwd ftp0
```

## 修改ftp配置
修改`/etc/vsftpd.conf`的几个关键配置:

```
anonymous_enable=NO cal_user=YES# 只能访问自身的目录，此处有坑，需加上下面一行
allow_writeable_chroot=YES# 允许写自身发目录
```

## 让用户不能登录
```
usermod -s /sbin/nologin ftp0
```

注意，ubuntu下还需要在`/etc/shells`最后加上：`/sbin/nologin`

> 最后需要重启ftp服务器

## 测试
```
ftp> open 192.168.1.100
user:ftp0
pwd:xxxxx
success!
```

## 附javaftp上传代码
```
package com.kangyonggan.api.biz;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import java.io.File;
import java.io.FileInputStream;

/**
 * @author kangyonggan
 * @since 2016/12/25
 */
public class TestFtp {

    private FTPClient ftp;

    /**
     * @param path     上传到ftp服务器哪个路径下
     * @param addr     地址
     * @param port     端口号
     * @param username 用户名
     * @param password 密码
     * @return
     * @throws Exception
     */
    private boolean connect(String path, String addr, int port, String username, String password) throws Exception {
        boolean result = false;
        ftp = new FTPClient();
        int reply;
        ftp.connect(addr, port);
        ftp.login(username, password);
        ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
        reply = ftp.getReplyCode();
        if (!FTPReply.isPositiveCompletion(reply)) {
            ftp.disconnect();
            return result;
        }
        ftp.changeWorkingDirectory(path);
        result = true;
        return result;
    }

    /**
     * @param file 上传的文件或文件夹
     * @throws Exception
     */
    private void upload(File file) throws Exception {
        if (file.isDirectory()) {
            ftp.makeDirectory(file.getName());
            ftp.changeWorkingDirectory(file.getName());
            String[] files = file.list();
            for (int i = 0; i < files.length; i++) {
                File file1 = new File(file.getPath() + "\\" + files[i]);
                if (file1.isDirectory()) {
                    upload(file1);
                    ftp.changeToParentDirectory();
                } else {
                    File file2 = new File(file.getPath() + "\\" + files[i]);
                    FileInputStream input = new FileInputStream(file2);
                    ftp.storeFile(file2.getName(), input);
                    input.close();
                }
            }
        } else {
            File file2 = new File(file.getPath());
            FileInputStream input = new FileInputStream(file2);
            ftp.storeFile(file2.getName(), input);
            input.close();
        }
    }

    public static void main(String[] args) throws Exception {
        TestFtp t = new TestFtp();
        t.connect("/home/ftp0/", "192.168.1.100", 21, "ftp0", "123456");
        File file = new File("/Users/kyg/Downloads/blog.sql");
        t.upload(file);
    }

}
```



'', 1, 0, 1, 0, 0, ''2017-04-11 14:29:15'', ''2017-04-11 14:31:28'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.04从命令行启动'', ''linux'', ''系统运维'', ''
## 修改配置 /etc/default/grub
- 注释此行：`#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`
- `GRUB_CMDLINE_LINUX=""` 改为 `GRUB_CMDLINE_LINUX="text"`
- `#GRUB_TERMINAL=console` 的注释干掉

## 更新配置
```
update-grub
```

## 重启
不出意外会从命令行启动， 意外会发生在ubuntu16.04上
'', 1, 0, 1, 0, 0, ''2017-04-11 14:29:57'', ''2017-04-11 14:30:01'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.04盒盖不休眠'', ''linux'', ''系统运维'', ''

## 修改配置 /etc/systemd/logind.conf
然后将其中的：`#HandleLidSwitch=suspend` 改成： `HandleLidSwitch=ignore`

## 然后重启服务：
```
sudo restart systemd-logind
```

'', 0, 0, 1, 0, 0, ''2017-04-11 14:30:32'', ''2017-04-11 14:30:32'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu14.0.4安装及配置系列-redis3.2.0的安装配置'', ''linux'', ''系统运维'', ''
## 下载[redis3.2](https://redis.io/)到本地

## 上传本地redis到Ubuntu服务器
```
$ scp redis-3.2.0.tar.gz root@121.40.66.176:/root/soft/
```

## 解压redis到指定目录
```
$ tar -zxvf redis-3.2.0.tar.gz -C /root/install/
```

## 安装
```
make & make install
```

<!-- more -->

## 配置
在`/root/install/redis-3.2.0/redis.conf`后面追加下面的配置:

```
requirepass 123456
```

## 启动
```
$ redis-server redis.conf &
```

## 测试

```
$ redis-cli -a 123456
> ping
```

输出:`PONG`

## 停止
```
$ redis-cli -a 123456 shutdown
```

## 清空所有缓存
```
$ redis-cli -a 123456 KEYS "*" | xargs redis-cli -a 123456 DEL
```


'', 1, 0, 1, 0, 0, ''2017-04-11 14:32:14'', ''2017-04-11 14:32:19'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu16.0.4启动zookeeper报错'', ''linux'', ''系统运维'', ''

## 报错信息
```
bin/zkServer.sh: 81: /home/kyg/install/server1/zookeeper-3.4.9/bin/zkEnv.sh: Syntax error: "(" unexpected (expecting "fi")
```

## 解决方案
```
ls -l /bin/sh
lrwxrwxrwx 1 root root 4 12月 24 17:22 /bin/sh -> dash
ls -l /bin/sh
lrwxrwxrwx 1 root root 4 12月 24 20:01 /bin/sh -> bash
```


'', 1, 0, 1, 0, 0, ''2017-04-11 14:33:00'', ''2017-04-11 14:33:48'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu下mysql数据库恢复'', ''linux'', ''系统运维'', ''


前端时间我在玩主从库的时候， 一不小心把mysql数据库玩坏了， 连服务都启动不了了， 经过一番修复后还是不行， 可怜我的博客都在库里, 不过我却在庆幸， 因为这叫置之死地而后生，我又能学到牛逼技术了...

## 备份数据
mysql数据是放在/var/lib/mysql下面的，需要备份的内容有：

- ibdata1
- performance_schema
- blog文件夹 （对应数据库blog）
- 其他你需要恢复的数据库

<!-- more -->

## 重装mysql
重装教程网上一堆， 这里就不再赘述。

## 恢复
把备份的几个文件， 替换回去， 然后重启mysql， 这时候会报错， 查看mysql日志后发现是权限不足导致。

原因是：备份与恢复数据的用户一般都需要比较高的权限才能操作， 比如root，所以替换后的文件的所有者是root， 而不再是mysql， 因此需要改变文件拥有者和赋权：

```
cd /var/lib/mysql
chown mysql *

chmod 700 blog;
chmod 700 ibdata1;
chmod 700 performance_schema;
```

必要时还需要删除这两个日志文件`ib_logfile0`和`ib_logfile1`：

```
rm ib_logfile*
```

重启， 不出意外应该是可以登录mysql了， `show databases`能看到已经恢复的blog数据库了， `use blog;show tables`能看见article表了。

但是，在查询article表的时候，又会报权限不足的错， 道理是相同的， 我们去`/var/lib/mysql/blog`目录下，重新改变拥有者:

```
cd /var/lib/mysql/blog
chown mysql *
```

重启，验证， 成功！



'', 1, 0, 1, 0, 0, ''2017-04-11 14:33:40'', ''2017-04-11 14:33:52'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu下方向键不好使的解决方案'', ''linux'', ''系统运维'', ''
## 先卸载vim-tiny

```
$ sudo apt-get remove vim-common
```

## 再安装vim full：

```
$ sudo apt-get install vim
```

'', 1, 0, 1, 0, 0, ''2017-04-11 14:34:24'', ''2017-04-11 14:34:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu下防火墙的一些简单使用'', ''linux'', ''系统运维'', ''


## 摘要
公司的很多项目都是放在Linux机器上的，因此安装防火墙还是很有必要的...

## 安装防火墙
```
apt-get install firewalld
```

<!-- more -->

## 查看开放的端口
```
firewall-cmd --list-all
```

## 把一个端口开放
```
firewall-cmd --permanent --add-port=8080/tcp
```

## 端口开放之后要重新加载
```
firewall-cmd --reload
```

## 移除一个开放的端口
```
firewall-cmd --permanent --remove-port=8080/tcp
```

'', 1, 0, 1, 0, 0, ''2017-04-11 14:35:21'', ''2017-04-11 14:35:32'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Ubuntu配置DNS服务器'', ''linux'', ''系统运维'', ''


## 实验目的
在ubuntu 14.04上搭建一个自己的dns服务器，并实现重新解析baidu.com到自定义服务器。

## 安装并配置

```
kyg@kyg-Latitude-5450:~$ sudo apt-get bind9
```

<!-- more -->

检查是否安装成功

```
kyg@kyg-Latitude-5450:~$ cd /etc/bind/
kyg@kyg-Latitude-5450:/etc/bind$ ll
total 68
drwxr-sr-x   2 root bind  4096  2月 19 12:25 ./
drwxr-xr-x 129 root root 12288  2月 19 12:25 ../
-rw-r--r--   1 root root  2389  2月 16 00:33 bind.keys
-rw-r--r--   1 root root   237  2月 16 00:33 db.0
-rw-r--r--   1 root root   271  2月 16 00:33 db.127
-rw-r--r--   1 root root   237  2月 16 00:33 db.255
-rw-r--r--   1 root root   353  2月 16 00:33 db.empty
-rw-r--r--   1 root root   270  2月 16 00:33 db.local
-rw-r--r--   1 root root  3048  2月 16 00:33 db.root
-rw-r--r--   1 root bind   463  2月 16 00:33 named.conf
-rw-r--r--   1 root bind   490  2月 16 00:33 named.conf.default-zones
-rw-r--r--   1 root bind   165  2月 16 00:33 named.conf.local
-rw-r--r--   1 root bind   890  2月 19 12:25 named.conf.options
-rw-r-----   1 bind bind    77  2月 19 12:25 rndc.key
-rw-r--r--   1 root root  1317  2月 16 00:33 zones.rfc1918
```

在实验之前先ping一下百度，好做个对比

```
kyg@kyg-Latitude-5450:~$ ping baidu.com
PING baidu.com (123.125.114.144) 56(84) bytes of data.
64 bytes from 123.125.114.144: icmp_seq=1 ttl=54 time=33.4 ms
64 bytes from 123.125.114.144: icmp_seq=2 ttl=54 time=42.4 ms
64 bytes from 123.125.114.144: icmp_seq=3 ttl=54 time=37.3 ms
```

可以看到dns把baidu.com解析成的ip是123.125.114.144
现在我就搭建一个简单的dns，让自己的dns把baidu.com解析成192.168.2.112
这是自己的服务器，然后就可以把xxx展现给用户了。

配置dns：

```
kyg@kyg-Latitude-5450:~$ sudo vim /etc/bind/named.conf.local
添加如下内容:

zone "baidu.com" { type master; file "/etc/bind/db.baidu.com"; };
```

修改db的配置文件:

```
kyg@kyg-Latitude-5450:~$ cd /etc/bind/
kyg@kyg-Latitude-5450:/etc/bind# sudo cp db.local db.baidu.com
kyg@kyg-Latitude-5450:/etc/bind# vi db.baidu.com

内容如下：

;
; BIND data file for local loopback interface
;
$TTL604800
@INSOAlocalhost. root.localhost. (
o      2; Serial
o 604800; Refresh
o  86400; Retry
o2419200; Expire
o 604800 ); Negative Cache TTL
;
@INNSlocalhost.
@INA192.168.2.112
@INAAAA::1
```

最后重启服务！

```
kyg@kyg-Latitude-5450:/etc/bind# sudo /etc/init.d/bind9 restart
 * Stopping domain name service... bind9                                                waiting for pid 5141 to die
                                                                                 [ OK ]
 * Starting domain name service... bind9
```

如果启动失败，可以运行`named -g`查看错误原因.

## 测试
```
kyg@kyg-Latitude-5450:/etc/bind$ ping baidu.com
PING baidu.com (192.168.2.112) 56(84) bytes of data.
64 bytes from 192.168.2.112: icmp_seq=1 ttl=63 time=4.73 ms
64 bytes from 192.168.2.112: icmp_seq=2 ttl=63 time=2.12 ms
64 bytes from 192.168.2.112: icmp_seq=3 ttl=63 time=2.22 ms
64 bytes from 192.168.2.112: icmp_seq=4 ttl=63 time=5.15 ms
64 bytes from 192.168.2.112: icmp_seq=5 ttl=63 time=18.8 ms
64 bytes from 192.168.2.112: icmp_seq=6 ttl=63 time=2.11 ms
64 bytes from 192.168.2.112: icmp_seq=7 ttl=63 time=2.81 ms
64 bytes from 192.168.2.112: icmp_seq=8 ttl=63 time=2.79 ms
```

## 感悟
其实在我们没有安装DNS服务之前，可以将/etc/hosts文件比作一个DNS服务配置文件，因为它实现和DNS类似。

之所以会独立出DNS服务，是因为因特网主机多，如果每个主机都靠/etc/hosts文件来维护主机名到ip的映射，那么工作量非常大，对本地更新、网络资源占用都很浪费，所以出现了DNS。




'', 1, 0, 1, 0, 0, ''2017-04-11 14:36:48'', ''2017-04-11 14:36:55'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''高并发架构的优化方案'', ''other'', ''综合'', ''
应用情景：12306抢票，春运期间，一票难求！票的数量是有限的，但也罩不住中国出门打工的人多啊，如果放任所有请求去读库，哪个数据库能扛得住？

## 优化草案
### 将请求尽量拦截在上游
如果将所有的请求都落到数据层，数据读写时锁冲突严重，并发响应就会很慢，用户体验就会很差。所以可以让系统中的每一层都做些事情，不要只做一个`过渡者`，尽量拦截下一些无效的请求，给数据库减压。

<!-- more -->

### 利用缓存
12306抢票是一个典型的`读多写少`的应用场景，比如一个班次的票有2000张，有200w人抢票，刷票时就是读，抢到票就要写，读写比是1000:1, 是非常适合用缓存的，其实大多数企业应用都是读多写少，都可以用缓存。

## 系统架构
下面是一个常见的站点架构图，高并发的优化就从这张图说起。

![frame.png](https://kangyonggan.com/upload/20170227213203585.png)

- 浏览器: 与用户交互，会执行js
- 站点层: 会访问服务层，返给浏览器界面
- 服务层: 复杂的业务
- 数据层: 封装访问数据的复杂，访问数据库

## 各层优化
### 客户端优化（浏览器、App）
- 可以做防重复提交，按钮点击后置灰
- 可以用js限制x秒内只能提交一次请求

这样可以挡住普通用户，但是挡不住一些黄牛的for循环，好的是99%的都是普通用户，最起码能拦截下80%的无效请求。

### 站点层优化
客户端防重复提交也只能拦住普通用户，在黄牛盛行的今天，我们是很有必要连黄牛的请求也一并拦截！那么怎么样来拦截黄牛的for循环呢？其实也是类似客户端的防重复提交，对于每次请求，我们都能拿到用户ID，结合业务我们可以对请求进行计数，判断x秒内只能透过一次请求，这个计数可以放在session中，这样就能裆下黄牛99%的for循环请求。

但是有些黄牛手里有N(=10w)个肉鸡，N个账户，同时请求。站点层的拦截就挡不住了！

### 服务层优化
不管怎么样，搞死不让请求落到数据库，那么我怎么拦截肉鸡的高并发请求呢？利用队列！
比如，有2000张票，有20w用户想要下单购买，请求已经到了服务层，这时候可以把请求加入队列，如果队列长度大于2000（或者大于余票）就把其他请求拦截下来。

### 数据层
客户端拦截了80%，站点层拦截了99%，服务层又有队列控制，数据库基本无压。

### 业务优化
`一切脱离业务的架构都是耍流氓`！比如，抢票时间可以调整一下，`分时分次抢票`，8点卖一批次，9点卖一批次,...。将流量均摊。其次，粒度的优化，我们有时候只关心有票和无票，二不关心具体还剩多少票，所以只需要做一个粗粒度的缓存即可。

### 预备
如果并发量实在太大，可以对站点层的机器进行扩充，通过增加机器来分担压力。

## 总结
高并发架构优化的基本思路：

- 尽量将请求拦截在上游
- 读多写少多用缓存
- 结合业务来优化


'', 1, 0, 1, 0, 0, ''2017-04-11 14:41:48'', ''2017-04-11 14:43:06'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''高并发架构的优化方案'', ''db'', ''数据库'', ''

## 应用场景
缓存是一种提高`读性能`的常见技术。对于读多写少的应用，就可以使用缓存进行优化。

例如，网关中各个银行通道配置bank_channel_conf(bnk_no, bnk_nm)，业务需求是：

- 查询通道信息,select bnk_no, bnk_nm from bank_channel_conf where bnk_no = ?,占请求总数的99%
- 修改通道信息,update bank_channel_conf set bnk_nm = ? where bnk_no = ?,占请求总数的1%

<!-- more -->

由于大部分的请求是查询，我们在缓存中建立bnk_no到bnk_nm的键值对，或者bnk_no到BankChannelConf实体的键值对，可以很大程度的减少数据库的压力。

## 读操作流程
现在有两个地方存放银行通道的数据，一个是`db`,一个是`cache`。每当需要读一个数据时，流程是这样的:

1. 读取缓存是否有相关的数据。bnkNo->bnkNm
2. 如果缓存中有数据，则返回缓存中的数据，这就是所谓的`数据命中[hit]`
3. 如果缓存中没有数据，就会去查询数据库，这就是所谓的`数据未命中[miss]`，最后把数据放入缓存，再返回。

> 缓存命中率[HitRate] = 命中[Hit] / (命中[hit] + 未命中[miss]) * 100%

像上面这个例子，目测缓存命中率会在95%以上！

## 写操作流程
上面读操作流程很简单，没有什么例外，但是写操作就很麻烦了，比如下面的问题：

- 是更新cache中的数据？还是淘汰cache中的数据？
- 是先操作db中的数据？还是先操作cache中的数据？

### 更新缓存
什么是更新缓存呢？就是写操作时，不但会把数据写入db中，还会把数据写入cache中（key相同就会替换，相当于更新了）。

优点：紧随写操作之后的那一次查询，不会miss，命中率稍有提高（也不算优点吧，提高的命中率忽略不计）。

### 淘汰缓存
什么是淘汰缓存？就是写操作时，只写入db，不会写入cache，不但不写入，还要删除。

优点：简单（也不算优点吧，更新也不难）
缺点：命中率稍有下降（也是忽略不计）。

如果仅仅从上面的例子中看，貌似更新缓存和淘汰缓存旗鼓相当，甚至更倾向于更新缓存。

但是，如果缓存中的value需要经过一系列的查询才能得到，那么，为了增加一次命中，可能就不值得了（毕竟代码中还要额外的写逻辑，可能还是在中间件中，我们都知道的中间件是不能带有业务逻辑的），这么来看的话，更新缓存的代价可能就更大了一些。

个人观点：淘汰缓存操作简单，缺点仅仅只是多一次miss，处理方式全世界统一，所以个人建议使用。

### 先操作db还是先操作cache
现在假设使用淘汰缓存作为对缓存的通用处理，现在又有下面两个问题：

1. 先写数据库，再淘汰缓存
2. 先淘汰缓存，再写数据库

正常不出意外的情况下，两种方案都可以，没有谁好谁坏，但是在一些极端的情况下就不好说了。

比如方案1，假如写数据库成功了，但是淘汰数据时失败了，这时候又没有事务能保证两步操作的原子性，那么就可能造成缓存中有脏数据，数据的不一致就这么产生了。

但是反过来，采用方案2，先淘汰缓存数据成功了，再写数据库时失败了，顶多就是缓存中的数据丢了，增加一次miss，不会产生脏数据，对业务的影响较小。

结论：db和cache的操作顺序是，先淘汰cache，再写db。

## 进一步优化
上述缓存框架有一个缺点，业务方不但需要关注cache和db，还需要对cache进行管理，如果多人团队开发，完全不知道在什么时机淘汰什么cache，因此，这里需要一个数据服务层，向上游提供一个优雅的接口，屏蔽缓存管理的细节，这样的话上游业务方就不需要关注这些根本没法关注的细节了。

## 遗留难点
当采用淘汰缓存方案时，在高并发的情况下，如果线程1已经淘汰了缓存，准备写数据时，恰好在这时，线程2过来读数据，发现缓存中没数据，然后就去请求数据库，再把数据库中的数据放入缓存，最后线程1才磨磨唧唧的把数据写入库中，结果就造成了cache与db不一致的问题。



'', 1, 0, 1, 0, 0, ''2017-04-11 14:43:44'', ''2017-04-11 14:43:48'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''数据库设计基本概念和思路'', ''db'', ''数据库'', ''

## 基本概念
### 单库
![db-0](https://kangyonggan.com/upload/20170301082926454.png)

<!-- more -->

### 分组
![db-1](https://kangyonggan.com/upload/20170301082133451.png)

### 分片
![db-2](https://kangyonggan.com/upload/20170301082937059.png)

### 分组+分片
![db-3](https://kangyonggan.com/upload/20170301082946454.png)

### 各自优缺点
#### 单库
- 主要优点：简单。
- 主要缺点：可用性不高、并发不大、数据量不能太大。

#### 分组
- 主要优点：可用性强。
- 主要缺点：一致性差、从库越多，同步越慢，越容易不一致。
- 必要条件：中间件。用来维护主从一致性（门槛高，一般只有大公司才有）。

#### 分片
- 主要优点：能存储大量数据。
- 主要缺点：主键生成麻烦、扩展性差。
- 必要条件：数据路由。

数据路由常用的三种方法：

1. 范围：range
  - 优点：简单、易扩展
  - 缺点：各库压力不均
2. 哈希：hash
  - 优点：简单、数据均衡、负载均衡
  - 缺点：扩展麻烦（2库扩3库需要迁移数据，2库扩4库稍简单）
3. 路由服务：route-config-server
  - 优点：灵活、业务与路由解耦和
  - 缺点：每次访问数据库前多一次查询

## 设计思路
- 可用性
- 读性能
- 一致性
- 扩展性

### 可用性
`提高可用性的思路是冗余`！ 如果要提高数据的可用性，可以采用`分组`的数据库架构。

### 读性能
1. 读写分离
  - 采用`分组`的数据库架构
  - 写操作使用主库，读操作使用从库，减小等锁的时间
2. 使用缓存
3. 不同的库建立不同的索引
  - 写库不建索引
  - 线上读库建线上常用的索引
  - 线下读库建线下常用的索引

### 一致性
1. 主从不一致
  - 解决方案：数据库中间件（门槛高）
2. db和cache不一致
  - 缓存管理：在写库时，要先更新或淘汰cache
  - 超时时间：建议给每个cache都设置超时时间

### 扩展性
采用哈希路由时，想要平滑的扩展数据库，就只能翻倍，2库变4库，4库变8库，否则需要数据迁移。下面是平滑的把2个库扩展成4个库的步骤：

原库的数据：

- 库1的id：Mod2==0
- 库2的id：Mod2==1

增加2个新库：库3、库4

把库1数据同步到库3，库2同步到库4

修改数据路由的hash算法，以前Mod2、现在Mod4

新库的数据：

- 库1的id：Mod2==0 + Mod4==0
- 库2的id：Mod2==1 + Mod4==1
- 库3的id：Mod2==0 + Mod4==2
- 库4的id：Mod2==1 + Mod4==3

需去重的数据：

- 干掉库1中的：Mod4==2
- 干掉库2中的：Mod4==3
- 干掉库3中的：Mod4==0
- 干掉库4中的：Mod4==1

最终的数据：

- 库1的id：Mod4==0
- 库2的id：Mod4==1
- 库3的id：Mod4==2
- 库4的id：Mod4==3




'', 1, 0, 1, 0, 0, ''2017-04-11 14:44:50'', ''2017-04-11 14:44:57'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''用jdk自带的keytool导入查看删除证书'', ''code'', ''代码片段'', ''

## 导入证书
```
sudo keytool -import -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit -alias sh2_test -file /Users/kyg/Downloads/sh2_test.cer
```

## 删除证书
```
sudo keytool -delete -alias sh2_test -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit
```

## 查看证书
```
keytool -list -alias sh2_test -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit
```

## 提示
- 使用时，jdk路径请自行替换
- 一般cacerts的密码默认为changit
- keytool命令在bin目录下


'', 1, 0, 1, 0, 0, ''2017-04-11 14:46:38'', ''2017-04-11 16:18:24'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''给自己的博客生成rss订阅源'', ''java'', ''Java后台'', ''

## 目的
1. 把我的所有博客全部变成rss订阅源，以便别人订阅。
2. 当我有博客更新时，会自定更新订阅源，或者省事一点每隔30分钟自动更新一次。

## 大致步骤
1. 查询所有博客。
2. 遍历所有博客，按`rss规范`组装成xml。
3. 把组装好的xml写入服务器某个位置，比如放在:`/rss/blog.xml`
4. 在rss阅读器中添加订阅源，url为:`https://kangyonggan.com/upload/rss/blog.xml`
5. 订阅成功，阅读器会把所有博客缓存到本地，离线也可阅读。

<!-- more -->

## 按照rss规范组装xml
使用第三方jar包`rsslibj`，它依赖`exml`,如下:

```
<rsslibj.version>1.0RC2</rsslibj.version>
<exml.version>7.0</exml.version>

<dependency>
    <groupId>rsslibj</groupId>
    <artifactId>rsslibj</artifactId>
    <version>${rsslibj.version}</version>
</dependency>
<dependency>
    <groupId>exml</groupId>
    <artifactId>exml</artifactId>
    <version>${exml.version}</version>
</dependency>
```

代码如下:

```
Channel channel = new Channel();
channel.setTitle("朕的博客");
channel.setLink("http://kangyonggan.com");

String baseUrl = "http://kangyonggan.com/#article/";
String rssName = "blog.xml";

try {
    List<Article> list = articleService.findAllArticles();
    log.info("一共{}篇文章", list.size());

    for (int i = 0; i < list.size(); i++) {
        Article article = list.get(i);
        Item item = new Item();
        item.setTitle(article.getTitle());
        item.setLink(baseUrl + article.getId());
        item.setDcDate(article.getUpdatedTime());
        item.setDescription(MarkdownUtil.markdownToHtml(article.getContent()));

        channel.addItem(i, item);
    }

    File file = new File(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + rssName);

    if (!file.exists()) {
        file.createNewFile();
    }

    PrintWriter writer = new PrintWriter(new FileWriter(file));
    writer.write(channel.getFeed("rss"));
    writer.flush();
    writer.close();

    FtpUtil.upload(rssName, "rss/");

    log.info("rss刷新成功");
    return "success";
} catch (Exception e) {
    log.error("查询所有文章失败", e);
}
```

但是有个问题，那就是`Item`不能设置发布时间，订阅后在阅读器里看不到文章的发布时间或者更新时间，所以我就从网上重新找了一个，它不去用任何jar包。

## 解决发布时间问题
### Feed.java

```
package com.kangyonggan.blog.model.rss;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/1/24
 */
@Data
public class Feed {
    String title;
    String link;
    String description;
    String language;
    String copyright;
    String pubDate;
    List<FeedMessage> feedMessages = new ArrayList();

}
```

### FeedMessage.java

```
package com.kangyonggan.blog.model.rss;

import lombok.Data;

/**
 * @author kangyonggan
 * @since 2017/1/24
 */
@Data
public class FeedMessage {

    String title;

    String description;

    String link;

    String author;

    String guid;

    String pubDate;

}
```

### RSSFeedWriter.java

```
package com.kangyonggan.blog.biz.util;


import com.kangyonggan.blog.model.rss.Feed;
import com.kangyonggan.blog.model.rss.FeedMessage;

import javax.xml.stream.XMLEventFactory;
import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.*;
import java.io.FileOutputStream;

/**
 * @author kangyonggan
 * @since 2017/1/24
 */
public class RSSFeedWriter {

    private String outputFile;
    private Feed feed;

    public RSSFeedWriter(Feed feed, String outputFile) {
        this.feed = feed;
        this.outputFile = outputFile;
    }

    public void write() throws Exception {
        XMLOutputFactory outputFactory = XMLOutputFactory.newInstance();

        XMLEventWriter eventWriter = outputFactory.createXMLEventWriter(new FileOutputStream(outputFile));

        XMLEventFactory eventFactory = XMLEventFactory.newInstance();
        XMLEvent end = eventFactory.createDTD("
");

        // Create and write Start Tag

        StartDocument startDocument = eventFactory.createStartDocument();

        eventWriter.add(startDocument);

        // Create open tag
        eventWriter.add(end);

        StartElement rssStart = eventFactory.createStartElement("", "", "rss");
        eventWriter.add(rssStart);
        eventWriter.add(eventFactory.createAttribute("version", "2.0"));
        eventWriter.add(end);

        eventWriter.add(eventFactory.createStartElement("", "", "channel"));
        eventWriter.add(end);

        // Write the different nodes

        createNode(eventWriter, "title", feed.getTitle());

        createNode(eventWriter, "link", feed.getLink());

        createNode(eventWriter, "description", feed.getDescription());

        createNode(eventWriter, "language", feed.getLanguage());

        createNode(eventWriter, "copyright", feed.getCopyright());

        createNode(eventWriter, "pubdate", feed.getPubDate());

        for (FeedMessage entry : feed.getFeedMessages()) {
            eventWriter.add(eventFactory.createStartElement("", "", "item"));
            eventWriter.add(end);
            createNode(eventWriter, "title", entry.getTitle());
            createNode(eventWriter, "description", entry.getDescription());
            createNode(eventWriter, "link", entry.getLink());
            createNode(eventWriter, "author", entry.getAuthor());
            createNode(eventWriter, "guid", entry.getGuid());
            createNode(eventWriter, "pubDate", entry.getPubDate());
            eventWriter.add(end);
            eventWriter.add(eventFactory.createEndElement("", "", "item"));
            eventWriter.add(end);

        }

        eventWriter.add(end);
        eventWriter.add(eventFactory.createEndElement("", "", "channel"));
        eventWriter.add(end);
        eventWriter.add(eventFactory.createEndElement("", "", "rss"));

        eventWriter.add(end);

        eventWriter.add(eventFactory.createEndDocument());

        eventWriter.close();
    }

    private void createNode(XMLEventWriter eventWriter, String name,

                            String value) throws XMLStreamException {
        XMLEventFactory eventFactory = XMLEventFactory.newInstance();
        XMLEvent end = eventFactory.createDTD("
");
        XMLEvent tab = eventFactory.createDTD(" ");
        // Create Start node
        StartElement sElement = eventFactory.createStartElement("", "", name);
        eventWriter.add(tab);
        eventWriter.add(sElement);
        // Create Content
        Characters characters = eventFactory.createCharacters(value);
        eventWriter.add(characters);
        // Create End node
        EndElement eElement = eventFactory.createEndElement("", "", name);
        eventWriter.add(eElement);
        eventWriter.add(end);
    }
}
```

使用如下：

```
Feed feed = new Feed();
feed.setDescription("记录生活、工作和学习时的笔记心得等");
feed.setLink("http://kangyonggan.com");
feed.setTitle("朕的博客");
List<FeedMessage> feedMessages = feed.getFeedMessages();

String baseUrl = "http://kangyonggan.com/#article/";
String rssName = "blog.xml";

try {
    List<Article> list = articleService.findAllArticles();
    log.info("一共{}篇文章", list.size());

    for (int i = 0; i < list.size(); i++) {
        Article article = list.get(i);
        FeedMessage feedMessage = new FeedMessage();

        feedMessage.setTitle(article.getTitle());
        feedMessage.setLink(baseUrl + article.getId());
        feedMessage.setDescription(MarkdownUtil.markdownToHtml(article.getContent()));
        Date date = article.getUpdatedTime();
        date.setTime(date.getTime() - 8 * 60 * 60 * 1000);
        feedMessage.setPubDate(format.format(date));
        feedMessages.add(feedMessage);
    }

    File file = new File(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + rssName);

    if (!file.exists()) {
        file.createNewFile();
    }

    new RSSFeedWriter(feed, file.getPath()).write();

    FtpUtil.upload(rssName, "rss/");

    log.info("rss刷新成功");
    return "success";
} catch (Exception e) {
    log.error("查询所有文章失败", e);
}
```

## 附rss订阅源和订阅效果

![rss](https://kangyonggan.com/upload/20170125103534094.png)

![reeder](https://kangyonggan.com/upload/20170125103943826.png)


'', 1, 0, 1, 0, 0, ''2017-04-11 14:49:36'', ''2017-04-11 14:49:40'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''查询引擎优化方案'', ''java'', ''Java后台'', ''

## 现状
- 每分钟去查N次数据库，每一次都会扫描几千行，其中N=通道的数量。
- 查的非常频繁，但线上状态为I或E的交易很少很少，有一种杀鸡用牛刀的感觉。
- 第一次查询时间区间太大（30s~90s之间）。
- 查询高峰堆在一个时间点上，不均衡。
- 每分钟启动一个线程，但一此只能启动一个线程。

<!-- more -->

## 优化后
- 不用查数据库。
- 只处理状态为I或E的交易。
- 每次查询时间的区间可以精确到秒, 粒度可自由调控。
- 均衡分布。
- 可以使用线程池，可以N个线程协同处理。

## 具体步骤
创建一个数组`task[List]`，一个时钟线程Thread-timer，长度为12，每5秒走一步，如下图：

![task-arr.png](https://kangyonggan.com/upload/20170315215531865.png)

如果有状态为I或E的交易，就把BankCommand放入task[current_index + 6]的list中【此处有并发问题，加锁即可解决，后面讨论】，并把他的`loop_count`标记为0。

6 * 5s=30s之后，时钟走到刚刚上面那个交易存放的位置，另起线程取出List中loop\\_count等于0的交易之后去查询，再更新beCommand表，并把此list中所有交易的loop\\_count减1，然后清除list中loop\\_count小于0的交易。【另起线程时可以使用线程池】

如果某银行通道的查询需要延迟3分钟后才查询，只需要在放入task中的时候，让loop\\_count等于3。


'', 1, 0, 1, 0, 0, ''2017-04-11 14:51:34'', ''2017-04-11 14:52:15'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''手动安装本地jar包到仓库'', ''code'', ''代码片段'', ''

```
mvn install:install-file -DgroupId=com.kangyonggan.app -DartifactId=simclient -Dversion=1.0-SNAPSHOT -Dpackaging=jar -Dfile=/home/kyg/data/jar/simclient-1.0-SNAPSHOT.jar
```

'', 0, 0, 1, 0, 0, ''2017-04-11 14:52:54'', ''2017-04-11 14:52:54'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''手写前端单页面路由SimPage'', ''web'', ''Web前端'', ''


前端我一直在用ace admin，在16年底把ace admin ajax（单页面）用在了我的博客中。
现在我想把博客重构一遍，不准备用ace了，可是又想用它的单页面，所以就动手自己写了一个。

<!-- more -->

## simpage.js

```
/**
 * 单页面路由
 *
 * @author kangyonggan
 * @since 2017/3/21
 */
(function ($) {
    /**
     * 获取内容的url
     *
     * @param hash
     * @returns {string}
     */
    function getContentUrl(hash) {
        return window.location.origin + window.location.pathname + hash
    }

    /**
     * 加载成功
     */
    function onSuccess() {
    }

    /**
     * 加载失败
     */
    function onError() {
    }

    /**
     * 总入口
     *
     * @param contentArea
     * @param settings
     */
    function simPage(contentArea, settings) {
        var $contentArea = $(contentArea);
        var $overlay = $();//empty set
        var loadingTimer;
        // 把settings的属性合并到defaults，并且不改变defaults
        settings = $.extend(true, $.fn.simPage.defaults, settings);
        /**
         * 开始加载
         */
        function startLoading() {
            // 清除定时器
            clearInterval(loadingTimer);
            $overlay.remove();
            $overlay = $(''''<div>'''' + settings.loadingText + ''''</div>'''').css({
                position: "absolute",
                left: 0,
                top: 0,
                bottom: 0,
                right: 0,
                zIndex: 9999,
                textAlign: "center",
                marginTop: "100px"
            }).addClass("sim-page-loading");
            $contentArea.append($overlay);
            var text = $overlay.html();
            var count = 0;
            // 定时输出正在加载...
            loadingTimer = setInterval(function () {
                var temp = ".";
                for (var i = 0; i < count; i++) {
                    temp += ".";
                }
                $overlay.html(text + temp);
                count++;
                count %= 3;
            }, 1000);
        }

        /**
         * 停止加载
         *
         * @param isSuccess
         */
        function stopLoading(isSuccess) {
            // 清除定时器
            clearInterval(loadingTimer);
            $overlay.remove();
            if (isSuccess) {
                onSuccess();
            } else {
                onError();
            }
        }

        /**
         * 加载url
         *
         * @param url
         * @param method
         * @param data
         */
        function getUrl(url, method, data) {
            if (!method) {
                method = "get";
            }

            // 开始加载
            startLoading();
            $.ajax({
                ''''url'''': url,
                ''''cache'''': false,
                "method": method,
                "data": data
            }).error(function () {
                // 停止加载
                stopLoading(false);
                getUrl(getContentUrl("404"));
            }).done(function (result) {
                // 停止加载
                stopLoading(true);
                // 内容替换
                $contentArea.empty().html(result);
            });
        }

        /**
         * 异步加载url
         *
         * @param hash
         * @param cache
         */
        function loadUrl(hash) {
            hash = hash.replace(/^(#!)?#/, '''''''');
            var url = settings.contentUrl(hash);
            if (typeof url === ''''string'''') {
                getUrl(url);
            }
        };
        // 监听hash改变
        $(window).off(''''hashchange'''').on(''''hashchange'''', function (e, manual_trigger) {
            var hash = $.trim(window.location.hash);
            if (!hash || hash.length == 0) {
                return;
            }

            // 异步加载url
            loadUrl(hash);
        });
        // 是否使用默认URL
        var hash = $.trim(window.location.hash);
        if (!hash && settings.defaultUrl) {
            window.location.hash = settings.defaultUrl;
        }
        loadUrl(hash);
        // 相对定位，给【加载中...】使用
        $contentArea.css("position", "relative");

        // 监听表单提交
        $(document).on("submit", "form", function (e) {
            var $form = $(this);

            var hash = $form.attr("action");
            var method = $form.attr("method");

            if (hash.substring(0, 1) == "#") {
                e.preventDefault();
            } else {
                return true;
            }

            // 处理get方法
            if (method.toLowerCase() == "get") {
                var params = $form.serialize();
                var url = window.location.origin + window.location.pathname + hash + "?" + params;

                window.location.href = url;
            } else if (method.toLowerCase() == "post") {
                var url = window.location.origin + window.location.pathname + hash.substring(1);

                getUrl(url, "post", $form.serialize());
            }

            return false;
        });
    }

    /**
     * 单页面路由
     *
     * @param option
     * @returns {*}
     */
    $.fn.simPage = function (option) {
        return this.each(function () {
            $(this).data(''''simPage'''', new simPage(this, option));
        });
    };
    /**
     * 默认配置
     *
     * @type {{defaultUrl: string, contentUrl: getContentUrl, loadingText: string, success: onSuccess, error: onError}}
     */
    $.fn.simPage.defaults = {
        // 默认URL（默认index）
        defaultUrl: ''''#index'''',
        // 内容URL（一般默认即可）
        contentUrl: getContentUrl,
        // 加载中的文字
        loadingText: ''''正在加载'''',
        // success回调方法
        success: onSuccess,
        // error回调方法
        error: onError
    }
})(window.jQuery);
```

## 用法
```
html
<div class="sim-page"></div>

js
$(".sim-page").simPage();
```

'', 1, 0, 1, 0, 0, ''2017-04-11 14:54:17'', ''2017-04-11 14:54:42'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''实现前端markdown编辑器'', ''web'', ''Web前端'', ''

在做网站的时候， 一帮都有后台管理可以发布一些文章或者公告之类的，一般情况下我们使用的是富文本编辑器（类似word），但我并不喜欢它， 我更喜欢markdown编辑器...

## 准备工作
- 下载bootstrap [http://v3.bootcss.com](http://v3.bootcss.com)
- 下载jquery [http://jquery.com/download](http://jquery.com/download)
- 下载marked [https://github.com/chjj/marked](https://github.com/chjj/marked)
- 下载bootstrap-markdown [http://www.codingdrama.com/bootstrap-markdown](http://www.codingdrama.com/bootstrap-markdown/)

<!-- more -->

## 使用方法
### 引入css
```
<div class="hidden ajax-append-link" rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<div class="hidden ajax-append-link" rel="stylesheet" type="text/css" href="css/bootstrap-markdown.min.css">
```

### 引入js

```
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/marked.min.js"></script>
<script type="text/javascript" src="js/bootstrap-markdown.min.js"></script>
```

### 文本域
```
<textarea name="content" id="content" rows="10"><textarea>
```

### 把文本域变为markdown编辑器
```
$("#content").markdown({resize: ''''vertical''''});
```

## 更多用法请参考
[http://www.codingdrama.com/bootstrap-markdown](http://www.codingdrama.com/bootstrap-markdown/)


'', 1, 0, 1, 0, 0, ''2017-04-11 14:55:46'', ''2017-04-11 14:56:26'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''实现全文检索-基于MySQL'', ''java'', ''Java后台'', ''

我们经常在网站上能看到搜索框， 可以用空格分割关键词、可以用拼音搜索等...

## 把关键字拆分为一组词
例子：搜索`懒人快乐`， 后台程序就会把`懒人快乐`拆分成两个词`懒人,快乐`。

说明：可以使用`jieba-analysis`结巴分词， 用法如下：

```
<dependency>
    <groupId>com.huaban</groupId>
    <artifactId>jieba-analysis</artifactId>
    <version>1.0.2</version>
</dependency>
```

<!-- more -->

```
package com.kangyonggan.blog.util;


import com.huaban.analysis.jieba.JiebaSegmenter;
import com.huaban.analysis.jieba.SegToken;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/7/22
 */
public class FenCi {

    /**
     * 分词器
     */
    private static final JiebaSegmenter segmenter = new JiebaSegmenter();

    /**
     * 中文分词, 并转成拼音
     *
     * @param data
     * @return
     */
    public static String process(String data) {
        if (StringUtils.isEmpty(data)) {
            return "";
        }

        data = data.replaceAll("\\s", " ");
        data = data.replaceAll("''''", " ");

        List<SegToken> list = segmenter.process(data, JiebaSegmenter.SegMode.INDEX);

        StringBuilder sb = new StringBuilder();
        list.forEach(segToken -> sb.append(PinYin.converterToSpellWithMuti(segToken.word)).append(","));
        sb.deleteCharAt(sb.lastIndexOf(","));

        return sb.toString();
    }

}
```

## 把词转化为拼音
例子：`懒人,快乐`会被后台程序转化为`lanren,kuaile,kuaiyue`，之所以不是`lanren,kuaile`而是`lanren,kuaile,kuaiyue`， 是因为`乐`是多音字。

说明：可以使用`pinyin4j`把汉字转化为拼音， 用法如下：

```
<dependency>
     <groupId>com.belerweb</groupId>
     <artifactId>pinyin4j</artifactId>
     <version>2.5.1</version>
</dependency>
```

```
package com.kangyonggan.blog.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 16/7/22
 */
public class PinYin {

    /**
     * 汉字转换位汉语拼音首字母，英文字符不变，特殊字符丢失 支持多音字，生成方式如（长沙市长:cssc,zssz,zssc,cssz）
     *
     * @param chines 汉字
     * @return 拼音
     */
    public static String converterToFirstSpell(String chines) {
        StringBuffer pinyinName = new StringBuffer();
        char[] nameChar = chines.toCharArray();
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
        defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        for (int i = 0; i < nameChar.length; i++) {
            if (nameChar[i] > 128) {
                try {
                    // 取得当前汉字的所有全拼
                    String[] strs = PinyinHelper.toHanyuPinyinStringArray(
                            nameChar[i], defaultFormat);
                    if (strs != null) {
                        for (int j = 0; j < strs.length; j++) {
                            // 取首字母
                            pinyinName.append(strs[j].charAt(0));
                            if (j != strs.length - 1) {
                                pinyinName.append(",");
                            }
                        }
                    }
                    // else {
                    // pinyinName.append(nameChar[i]);
                    // }
                } catch (BadHanyuPinyinOutputFormatCombination e) {
                    e.printStackTrace();
                }
            } else {
                pinyinName.append(nameChar[i]);
            }
            pinyinName.append(" ");
        }
        // return pinyinName.toString();
        return parseTheChineseByObject(discountTheChinese(pinyinName.toString()));
    }

    /**
     * 汉字转换位汉语全拼，英文字符不变，特殊字符丢失
     * 不支持多音字，生成方式如（重当参:zhongdangcen）
     *
     * @param chines 汉字
     * @return 拼音
     */
    public static String converterToSpell(String chines) {
        StringBuffer pinyinName = new StringBuffer();
        char[] nameChar = chines.toCharArray();
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
        defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        for (int i = 0; i < nameChar.length; i++) {
            if (nameChar[i] > 128) {
                try {
                    // 取得当前汉字的所有全拼
                    String[] strs = PinyinHelper.toHanyuPinyinStringArray(
                            nameChar[i], defaultFormat);
                    if (strs != null && strs.length > 0) {
                        pinyinName.append(strs[0]);
                    }
                } catch (BadHanyuPinyinOutputFormatCombination e) {
                    e.printStackTrace();
                }
            } else {
                pinyinName.append(nameChar[i]);
            }
            pinyinName.append(" ");
        }
        // return pinyinName.toString();
        return parseTheChineseByObject(discountTheChinese(pinyinName.toString()));
    }

    /**
     * 汉字转换位汉语全拼，英文字符不变，特殊字符丢失
     * 支持多音字，生成方式如（重当参:zhongdangcen,zhongdangcan,chongdangcen
     * ,chongdangshen,zhongdangshen,chongdangcan）
     *
     * @param chines 汉字
     * @return 拼音
     */
    public static String converterToSpellWithMuti(String chines) {
        StringBuffer pinyinName = new StringBuffer();
        char[] nameChar = chines.toCharArray();
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
        defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        for (int i = 0; i < nameChar.length; i++) {
            if (nameChar[i] > 128) {
                try {
                    // 取得当前汉字的所有全拼
                    String[] strs = PinyinHelper.toHanyuPinyinStringArray(
                            nameChar[i], defaultFormat);
                    if (strs != null) {
                        for (int j = 0; j < strs.length; j++) {
                            pinyinName.append(strs[j]);
                            if (j != strs.length - 1) {
                                pinyinName.append(",");
                            }
                        }
                    }
                } catch (BadHanyuPinyinOutputFormatCombination e) {
                    e.printStackTrace();
                }
            } else {
                pinyinName.append(nameChar[i]);
            }
            pinyinName.append(" ");
        }
        // return pinyinName.toString();
        return parseTheChineseByObject(discountTheChinese(pinyinName.toString()));
    }

    /**
     * 去除多音字重复数据
     *
     * @param theStr
     * @return
     */
    private static List<Map<String, Integer>> discountTheChinese(String theStr) {
        // 去除重复拼音后的拼音列表
        List<Map<String, Integer>> mapList = new ArrayList<Map<String, Integer>>();
        // 用于处理每个字的多音字，去掉重复
        Map<String, Integer> onlyOne = null;
        String[] firsts = theStr.split(" ");
        // 读出每个汉字的拼音
        for (String str : firsts) {
            onlyOne = new Hashtable();
            String[] china = str.split(",");
            // 多音字处理
            for (String s : china) {
                Integer count = onlyOne.get(s);
                if (count == null) {
                    onlyOne.put(s, new Integer(1));
                } else {
                    onlyOne.remove(s);
                    count++;
                    onlyOne.put(s, count);
                }
            }
            mapList.add(onlyOne);
        }
        return mapList;
    }

    /**
     * 解析并组合拼音，对象合并方案(推荐使用)
     *
     * @return
     */
    private static String parseTheChineseByObject(
            List<Map<String, Integer>> list) {
        Map<String, Integer> first = null; // 用于统计每一次,集合组合数据
        // 遍历每一组集合
        for (int i = 0; i < list.size(); i++) {
            // 每一组集合与上一次组合的Map
            Map<String, Integer> temp = new Hashtable<String, Integer>();
            // 第一次循环，first为空
            if (first != null) {
                // 取出上次组合与此次集合的字符，并保存
                for (String s : first.keySet()) {
                    for (String s1 : list.get(i).keySet()) {
                        String str = s + s1;
                        temp.put(str, 1);
                    }
                }
                // 清理上一次组合数据
                if (temp != null && temp.size() > 0) {
                    first.clear();
                }
            } else {
                for (String s : list.get(i).keySet()) {
                    String str = s;
                    temp.put(str, 1);
                }
            }
            // 保存组合数据以便下次循环使用
            if (temp != null && temp.size() > 0) {
                first = temp;
            }
        }
        String returnStr = "";
        if (first != null) {
            // 遍历取出组合字符串
            for (String str : first.keySet()) {
                returnStr += (str + ",");
            }
        }
        if (returnStr.length() > 0) {
            returnStr = returnStr.substring(0, returnStr.length() - 1);
        }
        return returnStr;
    }
}
```

## 单独创建一个表用于全文检索
例子：现在有一个文章表`article`, 它有`title`和`body`等字段，我们想要实现的效果是~如果我们检索的关键字在title或body中， 那么我们就把这条文章记录检索出来。

- 创建一个用于检索的表`article_index`， 它有`article_id`，`title`，`body`等字段， 其中title和body字段要给的大一点， 因为这两个字段将要存储文章表的title和body所对应的拼音，具体给多大请自行分析。
- ALTER TABLE article_index ENGINE = MyISAM; 默认是InnoDB。MyISAM：支持全文索引， 但不支持事务。InnoDB：支持事务， 但不支持全文索引。
- ALTER TABLE `article_index` ADD FULLTEXT INDEX (`title`, `body`); 给title和body字段添加全文索引。
- 在发表一篇新的文章时， 把文章的`title`用`结巴分词`分成多个词， 再用`pinyin4j`转化为拼音， `body`字段也做相同处理，最后把转化后的article_id、title和body存储到`article_index`表中，用于全文检索。

说明：关于全文索引的一些常用知识`SHOW VARIABLES LIKE ''''ft_min_word_len'''';
`， ` REPAIR TABLE article_index QUICK;
` 作用以及用法请自行学习。

## 全文检索
例子：检索的关键字为`懒人快乐`

- 先把分词， 变为`懒人,快乐`。
- 再把汉字变拼音`lanren,kuaile,kuaiyue`。
- 检索：`SELECT * FROM article_index WHERE match(title, body) against(''''lanren,kuaile,kuaiyue'''' IN BOOLEAN MODE)`
- 根据检索到article_id去文章表查询对应的文章

说明：此检索是基于MySQL的， 其他数据库的检索请自行学习， 检索语句还有很多模式， 请自行学习。

> 结巴分词的时候会返回偏移量，所以你可以根据偏移量定位到文章中的关键词， 然后变成红色。



'', 1, 0, 1, 0, 0, ''2017-04-11 14:59:33'', ''2017-04-11 14:59:39'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''学习java8中java.time包下的几个类-LocalDate'', ''java'', ''Java后台'', ''

> 官方文档:[http://docs.oracle.com/javase/8/docs/api/index.html](http://docs.oracle.com/javase/8/docs/api/index.html)

在我之前的一篇文章中提到SimpleDateFormat日期格式化线程安全问题，尽管有了解决方案，但依然不是很爽，接下来我就来学习一下java8中提供的新的日期时间类`java.time`，重新写一个合手的日期时间工具类，不！这些类本身就可以作为工具类了。

<!-- more -->

## LocalDate类
### 类的定义
```
public final class LocalDate extends Object implements
    Temporal, TemporalAdjuster, ChronoLocalDate, Serializable
```

### 类的描述
这是一个`不可变`、`线程安全`的日期类，它可以存储年月日，但是不能存储时分秒。

> 常用术语: 日期-年月日，时间-时分秒，日期时间-年月日时分秒

## 获取当前日期
### 方法定义
```
public static LocalDate now();
```

### 方法描述
获取系统当前日期。

### 例子1：

在`pom.xml`中指定使用jdk1.8编译：

```
<!--compiler plugin -->
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>3.2</version>
    <configuration>
        <source>1.8</source>
        <target>1.8</target>
        <encoding>UTF-8</encoding>
    </configuration>
</plugin>
```

`LocalDateNowDemo.java`:

```
package com.kangyonggan.demo.time;

import java.time.LocalDate;

/**
 * @author kangyonggan
 * @since 2017/3/22
 */
public class LocalDateNowDemo {

    public static void main(String[] args) {
        LocalDate today = LocalDate.now();
        System.out.println(today);
    }

}
```

输出：

```
2017-03-22
Process finished with exit code 0
```

可以看出它不像java.util.Date那样输出一串乱七八糟的时间，如果我们仅仅使用日期，那会非常爽。
但是，有时候我们需要`yyyyMMdd`格式的日期。

## 日期格式化
### 方法定义
```
public String format(DateTimeFormatter formatter);
```

### 方法描述
把日期格式化指定的格式。

### 抛异常
可能会抛运行时异常`DateTimeException`

### 例子2：

```
public static void main(String[] args) {
    LocalDate today = LocalDate.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.ofPattern("yyyyMMdd")));
}
```

输出：

```
2017-03-22
20170322

Process finished with exit code 0
```

每次都写`yyyyMMdd`感觉很麻烦，而且容易错容易忘，再看下面的写法：

### 例子3：

```
public static void main(String[] args) {
    LocalDate today = LocalDate.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.BASIC_ISO_DATE));
}
```

输出：

```
2017-03-22
20170322

Process finished with exit code 0
```

输出结果是一样的，这是使用了DateTimeFormatter类中预定义的一些格式器，更多预定义格式器如下：

Formatter | Description  | Example
--------- | ----------- | ---------
ofLocalizedDate(dateStyle) | Formatter with date style from the locale | ''''2011-12-03''''
ofLocalizedTime(timeStyle) | Formatter with time style from the locale | ''''10:15:30''''
ofLocalizedDateTime(dateTimeStyle) | Formatter with a style for date and time from the locale | ''''3 Jun 2008 11:05:30''''
ofLocalizedDateTime(dateStyle,timeStyle) | Formatter with date and time styles from the locale | ''''3 Jun 2008 11:05''''
BASIC_ISO_DATE | Basic ISO date | ''''20111203''''
ISO_LOCAL_DATE | ISO Local Date | ''''2011-12-03''''
ISO_OFFSET_DATE | ISO Date with offset | ''''2011-12-03+01:00''''
ISO_DATE | ISO Date with or without offset | ''''2011-12-03+01:00''''; ''''2011-12-03''''
ISO_LOCAL_TIME | Time without offset | ''''10:15:30''''
ISO_OFFSET_TIME | Time with offset | ''''10:15:30+01:00''''
ISO_TIME | Time with or without offset | ''''10:15:30+01:00''''; ''''10:15:30''''
ISO_LOCAL_DATE_TIME | ISO Local Date and Time | ''''2011-12-03T10:15:30''''
ISO_OFFSET_DATE_TIME | Date Time with Offset | ''''2011-12-03T10:15:30+01:00''''
ISO_ZONED_DATE_TIME | Zoned Date Time | ''''2011-12-03T10:15:30+01:00[Europe/Paris]''''
ISO_DATE_TIME | Date and time with ZoneId | ''''2011-12-03T10:15:30+01:00[Europe/Paris]''''
ISO_ORDINAL_DATE | Year and day of year | ''''2012-337''''
ISO_WEEK_DATE | Year and Week | 2012-W48-6''''
ISO_INSTANT | Date and Time of an Instant | ''''2011-12-03T10:15:30Z''''
RFC_1123_DATE_TIME | RFC 1123 / RFC 822 | ''''Tue, 3 Jun 2008 11:05:30 GMT''''

刚刚是把日期格式化，下面方法是相反的操作，即把指定格式的字符串解析成日期。

## 日期解析
### 方法定义
```
public static LocalDate parse(CharSequence text);
```

### 方法描述
把`固定格式`的字符串解析成日期，字符串格式必须为:`yyyy-MM-dd`

### 抛异常
如果字符串不能被解析就会抛异常`DateTimeParseException`

### 例子4：

```
public static void main(String[] args) {
    String dateStr = "2017-03-22";
    LocalDate localDate = LocalDate.parse(dateStr);
    System.out.println(localDate);
}
```

输出：

```
2017-03-22

Process finished with exit code 0
```

### 例子5：

```
public static void main(String[] args) {
    String dateStr = "2017-3-22";
    LocalDate localDate = LocalDate.parse(dateStr);
    System.out.println(localDate);
}
```

输出：

```
Exception in thread "main" java.time.format.DateTimeParseException: Text ''''2017-3-22'''' could not be parsed at index 5
  at java.time.format.DateTimeFormatter.parseResolved0(DateTimeFormatter.java:1949)
  at java.time.format.DateTimeFormatter.parse(DateTimeFormatter.java:1851)
  at java.time.LocalDate.parse(LocalDate.java:400)
  at java.time.LocalDate.parse(LocalDate.java:385)
  at com.kangyonggan.demo.time.LocalDateParseDemo.main(LocalDateParseDemo.java:14)

Process finished with exit code 1
```

比较例4和例5，发现parse方法对字符串的要求还是比较严格的，一旦解析不了就会抛异常。
在实际开发中，我们的字符串不可能都是yyyy-MM-dd型的，LocalDate还提供了另外一个同名方法。

## 日期解析（指定格式）
### 方法定义
```
public static LocalDate parse(CharSequence text, DateTimeFormatter formatter);
```

### 方法描述
把指定格式的字符串解析成日期。

### 抛异常
如果字符串不能被解析就会抛异常`DateTimeParseException`

### 例子6：

```
public static void main(String[] args) {
    String dateStr = "20170322";
    LocalDate localDate = LocalDate.parse(dateStr, DateTimeFormatter.BASIC_ISO_DATE);
    System.out.println(localDate);
}
```

输出：

```
2017-03-22

Process finished with exit code 0
```

这个例子中我使用的是预定义的格式器，当然你也可以自己定义格式。
相比SimpleDateFormat，这个方法是线程安全的，且提供了一大批预定义的格式器。

## 其他常用方法
LocalDate类中还提供了一些其他方法，比如：

方法定义 | 描述
------- | ------
public int getYear() | 获取年
public int getMonthValue() | 获取月
public int getDayOfMonth() | 获取日
public boolean isAfter(ChronoLocalDate other) | 判断是否在other日期之后
public boolean isBefore(ChronoLocalDate other) | 判断是否在other日期之前
public boolean isEqual(ChronoLocalDate other) | 判断和other日期是否相等
public boolean isLeapYear() | 判断是否是闰年
public int lengthOfMonth() | 返回一个月有多少天
public int lengthOfYear() | 返回一年有多少天
public static LocalDate of(int year, int month, int dayOfMonth) | 返回一个日期
public LocalDate minusDays(long daysToSubtract) | 减去n天，返回一个新的LocalDate
public LocalDate minusWeeks(long weeksToSubtract) | 减去n周，返回一个新的LocalDate
public LocalDate minusMonths(long monthsToSubtract) | 减去n月，返回一个新的LocalDate
public LocalDate minusYears(long yearsToSubtract) | 减去n年，返回一个新的LocalDate
public LocalDate plusDays(long daysToSubtract) | 加上n天，返回一个新的LocalDate
public LocalDate plusWeeks(long weeksToSubtract) | 加上n周，返回一个新的LocalDate
public LocalDate plusMonths(long monthsToSubtract) | 加上n月，返回一个新的LocalDate
public LocalDate plusYears(long yearsToSubtract) | 加上n年，返回一个新的LocalDate

> LocalDate类中远不止这些方法，具体请查看官方文档。


'', 1, 0, 1, 0, 0, ''2017-04-11 15:03:32'', ''2017-04-11 15:05:20'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''学习java8中java.time包下的几个类-LocalTime'', ''java'', ''Java后台'', ''

> 官方文档：[http://docs.oracle.com/javase/8/docs/api/index.html](http://docs.oracle.com/javase/8/docs/api/index.html)

上一篇文章中学习了`LocalDate`类，学到了一些关于日期的一些用法，这一章中学习一下`LocalTime`的用法。

<!-- more -->

## LocalTime类
### 类的定义
```
public final class LocalTime extends Object implements
      Temporal, TemporalAdjuster, Comparable<LocalTime>, Serializable
```

### 类的描述
这是一个`不可变`、`线程安全`的时间类，它可以存储时分秒（毫秒），但是不能存储年月日。

## 获取当前时间
### 方法定义
```
public static LocalTime now();
```

### 方法描述
获取系统当前时间。

### 例子1：

```
public static void main(String[] args) {
    LocalDate today = LocalDate.now();
    System.out.println(today);
}
```

输出：

```
15:44:38.220

Process finished with exit code 0
```

## 时间格式化
### 方法定义
```
public String format(DateTimeFormatter formatter);
```

### 方法描述
把时间格式化指定的格式。

### 抛异常
可能会抛运行时异常DateTimeException

### 例子2：
```
public static void main(String[] args) {
    LocalTime today = LocalTime.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.ofPattern("HHmmss")));
    System.out.println(today.format(DateTimeFormatter.ISO_LOCAL_TIME));
}
```

输出：

```
15:51:29.885
155129
15:51:29.885

Process finished with exit code 0
```

其中，`DateTimeFormatter`类中一些预定义的格式器，请参考上一篇文章:
[学习java8中java.time包下的几个类-LocalDate](http://kangyonggan.com/2017/03/25/学习java8中java-time包下的几个类-LocalDate/)

## 时间解析
### 方法定义
```
public static LocalTime parse(CharSequence text);
```

### 方法描述
把固定格式的字符串解析成时间，字符串格式必须为一下几种之一（亲测）:

- HH:mm
- HH:mm:ss
- HH:mm:ss.S
- HH:mm:ss.SS
- HH:mm:ss.SSS

不能为：

- HH
- HH:m:ss

### 抛异常
如果字符串不能被解析就会抛异常DateTimeParseException

### 例子4：
```
public static void main(String[] args) {
    String dateStr = "15:57:04";
    LocalTime localTime = LocalTime.parse(dateStr);
    System.out.println(localTime);
}
```

输出：

```
15:57:04

Process finished with exit code 0
```

### 例子5：
```
public static void main(String[] args) {
    String dateStr = "155704";
    LocalTime localTime = LocalTime.parse(dateStr, DateTimeFormatter.ofPattern("HHmmss"));
    System.out.println(localTime);
}
```

输出：

```
15:57:04

Process finished with exit code 0
```

## 其他常用方法
请参考上一篇文章或者官方文档。
'', 0, 0, 1, 0, 0, ''2017-04-11 15:04:27'', ''2017-04-11 15:04:27'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''学习java8中java.time包下的几个类-LocalDateTime'', ''java'', ''Java后台'', ''

> 官方文档：[http://docs.oracle.com/javase/8/docs/api/index.html](http://docs.oracle.com/javase/8/docs/api/index.html)

前两篇文章中学习了`LocalDate`和`LocalTime`类，学到了一些关于日期和时间的一些用法，这一章中学习一下`LocalDateTime`的用法。

<!-- more -->

## LocalDateTime类
### 类的定义
```
public final class LocalDateTime extends Object implements
    Temporal, TemporalAdjuster, ChronoLocalDateTime<LocalDate>, Serializable
```

### 类的描述
这是一个`不可变`、`线程安全`的时间类，它可以存储年月日时分秒（毫秒）。

## 获取当前日期时间
### 方法定义
```
public static LocalDateTime now();
```

### 方法描述
获取系统当前日期时间。

### 例子1：

```
public static void main(String[] args) {
    LocalDateTime today = LocalDateTime.now();
    System.out.println(today);
}
```

输出：

```
2017-03-22T16:10:02.586

Process finished with exit code 0
```

## 日期时间格式化
### 方法定义
```
public String format(DateTimeFormatter formatter);
```

### 方法描述
把日期时间格式化指定的格式。

### 抛异常
可能会抛运行时异常DateTimeException

### 例子2：
```
public static void main(String[] args) {
    LocalDateTime today = LocalDateTime.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")));
    System.out.println(today.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
}
```

输出：

```
2017-03-22T16:12:51.661
2017-03-22 16:12:51.661
2017-03-22T16:12:51.661

Process finished with exit code 0
```

其中，`DateTimeFormatter`类中一些预定义的格式器，请参考之前的一篇文章:
[学习java8中java.time包下的几个类 - LocalDate](http://kangyonggan.com/#article/91)

## 日期时间解析
### 方法定义
```
public static LocalDateTime parse(CharSequence text);
```

### 方法描述
把固定格式的字符串解析成日期时间，字符串格式必须为`2017-03-22T15:57:04`。

### 抛异常
如果字符串不能被解析就会抛异常DateTimeParseException

### 例子4：
```
public static void main(String[] args) {
    String dateStr = "2017-03-22T15:57:04";
    LocalDateTime localDateTime = LocalDateTime.parse(dateStr);
    System.out.println(localDateTime);
}
```

输出：

```
2017-03-22T15:57:04

Process finished with exit code 0
```

### 例子5：
```
public static void main(String[] args) {
    String dateStr = "2017-03-22 15:57:04";
    LocalDateTime localDateTime = LocalDateTime.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    System.out.println(localDateTime);
}
```

输出：

```
2017-03-22T15:57:04

Process finished with exit code 0
```

## 其他常用方法
请参考`学习java8中java.time包下的几个类-LocalDate`或者官方文档。




'', 1, 0, 1, 0, 0, ''2017-04-11 15:05:14'', ''2017-04-11 15:07:37'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''如何把内网机器变成外网可以访问的服务器'', ''other'', ''综合'', ''

## 环境准备
1. 需要一台内网机器（性能越强越好）【192.168.1.100】
2. 一个有公网IP的路由器，或者移动内网或者电信内网IP都可以【101.245.198.155】
3. 一个公网服务器（不需要内存太大，1G足够）【121.40.66.176】

> 路由器和公网服务器要能互通，如果不通，可以尝试重启路由器，重启的作用是换一个新的ip，也许就通了

<!-- more -->

## 步骤
1. 把服务器部署在内网机器上，比如我的博客在内网可以访问:192.168.1.100:8088
2. 登录路由器，配置“端口转发”，把请求路由器8088端口的请求，转发到请求192.168.1.100:8088
3. 登录公网服务器，执行远程端口转发命令：

```
ssh -C -f -N -g -L 80:101.245.198.155:8088 kyg@101.245.198.155
```

表示，请求公网80端口的请求，会被转发到路由器（101.245.198.155）的8088端口

## 保持转发链接不中断（自动重连）
查看任务
`crontab -l`

创建任务
`crontab -e`

每小时重连一次
`0 * * * * sh conn.sh`
'', 1, 0, 1, 0, 0, ''2017-04-11 15:08:36'', ''2017-04-11 15:08:41'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''多环境下autoconfig使用的小例子'', ''java'', ''Java后台'', ''

## 为什么使用Autoconfig
在一个应用中，我们总是会遇到一些参数，例如：

- 数据库服务器IP地址、端口、用户名；
- 用来保存上传资料的目录。
- 一些参数，诸如是否打开cache、加密所用的密钥名称等等。

这些参数有一个共性，那就是：它们和应用的逻辑无关，只和当前环境、当前系统用户相关。以下场景很常见：

- 在开发、测试、发布阶段，使用不同的数据库服务器；
- 在开发阶段，使用Windows的A开发者将用户上传的文件存放在d:my_upload目录中，而使用Linux的B开发者将同样的文件存放在/home/myname/my_upload目录中。
- 在开发阶段设置cache=off，在生产环境中设置cache=on。
- 很明显，这些参数不适合被“硬编码”在配置文件或代码中。因为每一个从源码库中取得它们的人，都有可能需要修改它们，使之与自己的环境相匹配, autoconfig就是很好的选择。

<!-- more -->

## 引入插件
在`pom.xml`中引入插件，下面为多环境配置

```
<plugin.autoconfig.version>1.2</plugin.autoconfig.version>

...

<!-- autoconfig -->
<plugin>
    <groupId>com.alibaba.citrus.tool</groupId>
    <artifactId>autoconfig-maven-plugin</artifactId>
    <version>${plugin.autoconfig.version}</version>
    <executions>
        <execution>
            <id>compile</id>
            <phase>compile</phase>
            <goals>
                <goal>autoconfig</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <userProperties>${antx.path}</userProperties>
    </configuration>
</plugin>

...

<profiles>
    <profile>
        <id>dev</id>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
            <antx.path>${user.home}/antx-dev.properties</antx.path>
        </properties>
    </profile>
    <profile>
        <id>prod</id>
        <properties>
            <antx.path>${user.home}/antx-prod.properties</antx.path>
        </properties>
    </profile>
</profiles>
```

## 配置
在`src/main/resources`下创建目录`Meta-INF/autoconfig`，在目录下创建文件`auto-config.xml`, 下面是我的配置（依个人而定）:

```
<?xml version="1.0" encoding="UTF-8"?>
<config>
    <group>
        <!-- dubbo -->
        <property name="api.dubbo.name" description="项目名字" defaultValue="api"></property>
        <property name="api.dubbo.registry.address" description="dubbo注册地址"
                  defaultValue="zookeeper://127.0.0.1:2181?backup=127.0.0.1:2182,127.0.0.1:2183"></property>
        <property name="api.dubbo.protocol.port" description="dubbo注册端口" defaultValue="-1"></property>
        <property name="api.dubbo.timeout" description="dubbo超时时间" defaultValue="10000"></property>
        <property name="api.dubbo.api.version" description="api提供接口的版本" defaultValue="1.0.0"></property>

        <!-- redis -->
        <property name="api.redis.maxTotal" description="redis最大连接数" defaultValue="1000"></property>
        <property name="api.redis.minIdle" description="redis最小等待数" defaultValue="50"></property>
        <property name="api.redis.maxIdle" description="redis最大等待数" defaultValue="100"></property>
        <property name="api.redis.testOnBorrow" description="redis测试支持" defaultValue="true"></property>
        <property name="api.redis.host" description="redis主机ip" defaultValue="127.0.0.1"></property>
        <property name="api.redis.port" description="redis主机端口" defaultValue="6379"></property>
        <property name="api.redis.password" description="redis密码" defaultValue="123456"></property>

        <!--jdbc-->
        <property name="api.jdbc.driver" description="jdbc驱动" defaultValue="com.mysql.jdbc.Driver"></property>
        <property name="api.jdbc.url" description="jdbc地址" defaultValue="jdbc:mysql://127.0.0.1:3306/api"></property>
        <property name="api.jdbc.username" description="jdbc用户名" defaultValue="root"></property>
        <property name="api.jdbc.password" description="jdbc密码" defaultValue="123456"></property>

        <!-- log4j2 -->
        <property name="api.log4j2.home" description="log4j2日志的文件主目录" defaultValue="/root/logs/api"></property>

        <property name="api.slow.method.time" description="慢方法时间(秒)" defaultValue="10"></property>
        <property name="api.slow.interface.time" description="慢接口时间(秒)" defaultValue="10"></property>
        <property name="api.redis.prefix.key" description="redis键的前缀" defaultValue="api"></property>
        <property name="api.cache.open" description="是否开启缓存,Y:开启,N:不开启" defaultValue="Y"></property>
    </group>
    <script>
        <generate template="app.properties"></generate>
        <generate template="applicationContext-datasource.xml"></generate>
        <generate template="applicationContext-provider.xml"></generate>
        <generate template="applicationContext-redis.xml"></generate>
        <generate template="log4j2.xml"></generate>
    </script>
</config>
```

## 使用
在上一步中可以看到antx将会替换五个文件，下面是其中一个文件的配置`applicationContext-redis.xml`:

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:p="http://www.springframework.org/schema/p"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
ohttp://www.springframework.org/schema/beans/spring-beans-4.0.xsd">

    <bean id="poolConfig" class="redis.clients.jedis.JedisPoolConfig">
        <property name="maxTotal" value="${api.redis.maxTotal}"></property>
        <property name="minIdle" value="${api.redis.minIdle}"></property>
        <property name="maxIdle" value="${api.redis.maxIdle}"></property>
        <property name="testOnBorrow" value="${api.redis.testOnBorrow}"></property>
    </bean>

    <bean id="jedisConnectionFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory"
          p:hostName="${api.redis.host}" p:port="${api.redis.port}" p:password="${api.redis.password}" p:poolConfig-ref="poolConfig"></bean>

    <bean id="redisTemplate" class="org.springframework.data.redis.core.RedisTemplate">
        <property name="connectionFactory" ref="jedisConnectionFactory"></property>
        <property name="keySerializer">
            <bean class="org.springframework.data.redis.serializer.StringRedisSerializer" ></bean>
        </property>
        <property name="valueSerializer">
            <bean class="org.springframework.data.redis.serializer.JdkSerializationRedisSerializer"></bean>
        </property>
    </bean>
</beans>
```

> 在项目`mvn clean install`的时候，antx会自动替换它所包含的文件，可以再`target`目录下查看指定的文件是否被替换成功

'', 1, 0, 1, 0, 0, ''2017-04-11 15:09:38'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''在ubuntu14.04下安装nginx服务器'', ''linux'', ''系统运维'', ''

## 下载安装
```
sudo apt-get install nginx
```

安装完成后打开浏览器输入`http://localhost`, 看到下图代表安装成功:

<!-- more -->

![nginx](https://kangyonggan.com/upload/20170101125316443.png)

### 常用命令
1. 启动: `nginx -c /etc/nginx/nginx.conf`
2. 停止: `nginx -s stop`
3. 重新加载（配置）: `nginx -s reload`
4. 重新打开日志文件: `nginx -s reopen`

## 动静分离反向代理配置
修改`/etc/nginx/sites-available/default`配置:

```
server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
                proxy_pass http://localhost:8088;
        }

        # 设定访问静态文件直接读取不经过tomcat
        location ^~ /static/ {
                proxy_pass http://localhost:8088;
                root /WEB-INF/static/;
        }
}
```

'', 1, 0, 1, 0, 0, ''2017-04-11 15:10:46'', ''2017-04-11 16:17:54'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''刚刚安装的ubuntu16.04.1没ssh服务'', ''linux'', ''系统运维'', ''
在ubuntu16.04.1安装ssh服务，让远程可以用ssh登录

```
sudo apt-get update

sudo apt-get install openssh-server
```

'', 1, 0, 1, 0, 0, ''2017-04-11 15:11:11'', ''2017-04-11 16:17:54'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用配置中心代替properties'', ''java'', ''Java后台'', ''


## 生成一个项目`confogcenter`
用`cms-archetype`生成一个项目，然后在此基础上开发一个模块，用于管理配置信息（CRUD）

我写的配置中心在github上: [https://github.com/kangyonggan/configcenter.git](https://github.com/kangyonggan/configcenter.git)

<!-- more -->

## 原理
在spring把占位符替换之前，发送http get请求到配置中心读取配置，拿到此项目的所有配置信息后（json），把json数据解析成一对对的名值对，最后把所有的名值对全部放入系统配置中，即:`System.setProperty(name, value);`。

## 具体实现

在`applicationContext.xml`的最上方（也不一定最上，但一定要在所有占位符的上面）添加自定义的`bean`:

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:context="http://www.springframework.org/schema/context" xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/aop
ohttp://www.springframework.org/schema/aop/spring-aop-4.0.xsd
ohttp://www.springframework.org/schema/beans
ohttp://www.springframework.org/schema/beans/spring-beans-4.0.xsd
ohttp://www.springframework.org/schema/tx
ohttp://www.springframework.org/schema/tx/spring-tx-4.0.xsd
ohttp://www.springframework.org/schema/context
ohttp://www.springframework.org/schema/context/spring-context-4.0.xsd">

    <!-- Activates annotation-based bean configuration -->
    <context:annotation-config></context:annotation>

    <!-- 读取属性文件，否则 java 类无法直接读取属性 -->
    <context:property-placeholder location="classpath:app.properties"></context:property>

    <!-- 读取配置中心 -->
    <bean class="com.kangyonggan.archetype.cmscc.biz.core.MyPropertyPlaceholderConfigurer" ></bean>

    ...
</beans>
```

`MyPropertyPlaceholderConfigurer.java`的实现:

```
package com.kangyonggan.archetype.cmscc.biz.core;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kangyonggan.archetype.cmscc.biz.util.HttpUtil;
import com.kangyonggan.archetype.cmscc.biz.util.PropertiesUtil;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * @author kangyonggan
 * @since 2017/1/25
 */
@Log4j2
public class MyPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

    public MyPropertyPlaceholderConfigurer() {
        loadConfigs();
    }

    /**
     * 加载配置
     */
    private void loadConfigs() {
        String server = PropertiesUtil.getProperties("config.center.server");
        log.info("配置中心服务地址:{}", server);

        String data = HttpUtil.sendGet(server);

        if (StringUtils.isEmpty(data)) {
            throw new RuntimeException("读取配置中心异常");
        }

        log.info("已成功获取配置中心的配置");

        JSONObject jsonObject = JSON.parseObject(data);
        String errCode = (String) jsonObject.get("errCode");
        String errMsg = (String) jsonObject.get("errMsg");

        log.info("errCode:{}", errCode);
        log.info("errMsg:{}", errMsg);

        if (!"success".equals(errCode)) {
            throw new RuntimeException("读取配置中心失败");
        }

        JSONArray jsonArray = jsonObject.getJSONArray("configs");
        log.info("共有{}项配置!", jsonArray.size());

        load(jsonArray);
    }

    /**
     * 加载配置
     *
     * @param jsonArray
     */
    public static void load(JSONArray jsonArray) {
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject object = jsonArray.getJSONObject(i);
            log.info("正在存储配置:{}", object);

            String name = object.getString("name");
            String value = object.getString("value");

            System.setProperty(name, value);
            PropertiesUtil.putProperties(name, value);
        }

        log.info("从配置中心加载配置完毕！！！");
    }

}
```

其中`public static void load(JSONArray jsonArray) `之所以写成了`static`是因为我其他地方也想使用, 比如：我发现ftp的ip配置错了，然后修改了ftp的ip，但是又不想重启服务器，这时候我就会在配置中心的控制台上点一下`推送配置`,然后客户端项目就能接收到配置了，然后就需要调用load方法刷新一下内存中的配置，但有些配置刷了也没用，比如jdbc的url等。

接收配置的代码`ConfigcenterController.java`:

```
package com.kangyonggan.archetype.cmscc.web.controller.web;

import com.alibaba.fastjson.JSONArray;
import com.kangyonggan.archetype.cmscc.biz.core.MyPropertyPlaceholderConfigurer;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLDecoder;

/**
 * @author kangyonggan
 * @since 2017/1/27
 */
@Controller
@RequestMapping("configcenter")
@Log4j2
public class ConfigcenterController {

    /**
     * 接收配置中心推送过来的配置
     *
     * @param data
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public boolean receiver(@RequestParam("data") String data) {
        try {
            data = URLDecoder.decode(data, "UTF-8");
            MyPropertyPlaceholderConfigurer.load(JSONArray.parseArray(data));
        } catch (Exception e) {
            log.error("接收配置失败", e);
            return false;
        }
        return true;
    }

}
```

## 注意
#### 日志的目录不能配置在配置中心，因为在读取配置中心的配置之前就使用到了日志，我的解决方案是写入了`pom.xml`, 如：`<log4j2.home>/Users/kyg/logs/cmscc</log4j2.home>`
#### 配置中心服务器的地址配置在了`app.properties`，因为配置中心的地址是可能变的，所以不能硬编码，如：`app.proerperties`的内容:

```
config.center.server=http://localhost:7777/configuration?proj=${project.parent.artifactId}&env=${env}
```

其中`${project.parent.artifactId}`会取自`pom.xml`中父模块的artifactId,
`${env}`指的是环境，比如开发环境，联调环境，生产环境等。我写在了pom.xml中:

```
<profiles>
    <profile>
        <id>local</id>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>dev</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>uat</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>hd</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>prod</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
</profiles>
```

我把使用配置中心的项目也写了一个项目原型,地址在:[https://github.com/kangyonggan/cmscc-archetype.git](https://github.com/kangyonggan/cmscc-archetype.git)

## 附配置中心推送配置的代码
```
/**
 * 推送配置
 *
 * @param id
 * @param env
 * @return
 */
@RequestMapping(value = "push", method = RequestMethod.POST)
@RequiresPermissions("CORE_PROJECT")
@ResponseBody
public Map<String, Object> push(@RequestParam("id") Long id, @RequestParam("env") String env) {
    Map<String, Object> resultMap = getResultMap();
    Project project = projectService.findProjectById(id);

    if (project != null && StringUtils.isNotEmpty(project.getPushUrl())) {
        List<Configuration> configurations = configurationService.findProjectConfigurations(project.getCode(), env);
        String json = JSON.toJSONString(configurations);
        try {
            String data = URLEncoder.encode(json, "UTF-8");
            String result = HttpUtil.sendPost(project.getPushUrl(), "data=" + data);
            if (!"true".equals(result)) {
                setResultMapFailure(resultMap, "推送失败，请稍后再试！");
            }
        } catch (Exception e) {
            log.error("推送配置失败", e);
            setResultMapFailure(resultMap);
        }
    } else {
        setResultMapFailure(resultMap);
    }

    return resultMap;
}
```




'', 1, 0, 1, 0, 0, ''2017-04-11 15:12:15'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用U盘安装CentOS7最小安装版'', ''linux'', ''系统运维'', ''

## 下载镜像文件和刻录工具
1. CentOS7最小安装版镜像文件下载地址：[http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso)

2. 刻录工具下载地址：[https://cn.ultraiso.net/uiso9_cn.exe](https://cn.ultraiso.net/uiso9_cn.exe)

<!-- more -->

## 把系统镜像刻录到U盘
打开刻录工具`UltraISO`，【文件】-->【打开】-->【选择下载好的镜像CentOS-7-x86_64-Minimal-1611.iso】

![打开镜像](https://kangyonggan.com/upload/centos-001.png)

【启动】-->【写入硬盘映像...】

![写入硬盘映像](https://kangyonggan.com/upload/centos-002.png)

这个过程会格式化U盘，请先备份U盘内的数据，然后点击【写入】，写入过程需要一些时间。

![写入](https://kangyonggan.com/upload/centos-003.png)

一会之后，写入完成！至此，你就完成了准备工作“把系统镜像刻录到U盘”，接下来就是要用U盘安装系统了。

![写入成功](https://kangyonggan.com/upload/centos-004.png)

## 使用U盘启动
在按开机按钮后，点按F12（大多数品牌的电脑都是按F12进入一次性启动项），进入启动项后，选择带USB字样的那一项进入

![bios-usb](https://kangyonggan.com/upload/centos-005.jpg)

进入CentOS7的安装界面，选择第一行`Install CentOS Linux 7`

![安装CentOS7](https://kangyonggan.com/upload/centos-006.jpg)

## 安装系统
选择系统语言，这里我选择的是英语（推荐使用英语）。

![选择语言](https://kangyonggan.com/upload/centos-015.jpg)

选择磁盘，点击【SYSTEM】-->【INSTALLION DESTINATION】

![选择磁盘](https://kangyonggan.com/upload/centos-007.jpg)

选中自己电脑的硬盘，点击【Done】

![选中自己电脑的硬盘](https://kangyonggan.com/upload/centos-008.jpg)

释放磁盘空间，点击【Reclaim space】

![释放磁盘空间](https://kangyonggan.com/upload/centos-009.jpg)

删除老系统占用的空间，点击【Delete】

![删除老系统占用的空间](https://kangyonggan.com/upload/centos-010.jpg)

删除后点击【Reclaim space】完成。

![删除老系统占用的空间完成](https://kangyonggan.com/upload/centos-011.jpg)

开始安装，点击【Begin Installation】

![开始安装](https://kangyonggan.com/upload/centos-012.jpg)

此时会进入漫长的安装过程（机器配置好的话会很快），点击【ROOT PASSWORD】设置root的密码。

![设置root的密码](https://kangyonggan.com/upload/centos-013.jpg)

root密码设置完成后点击【DONE】

![设置root的密码完成](https://kangyonggan.com/upload/centos-014.jpg)

然后就等吧，直到右下角出现【Reboot】，说明安装完毕！

![安装完毕](https://kangyonggan.com/upload/centos-016.jpg)



'', 1, 0, 1, 0, 0, ''2017-04-11 15:15:48'', ''2017-04-11 16:17:54'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用openssl生成RSA密钥对'', ''code'', ''代码片段'', ''

## 生成秘钥对
### 生成RSA私钥，以X509编码，指定生成的密钥的位数为2048位，该步生成的私钥只是临时文件，以便第二步将私钥转为PKCS#8编码。

```
openssl genrsa -out rsa_private_key_2048.pem 2048
```

<!-- more -->

### 将上一步生成的RSA私钥转换成PKCS#8编码，作为最终使用的私钥。

```
openssl pkcs8 -topk8 -in rsa_private_key_2048.pem -out pkcs8_rsa_private_key_2048.pem -nocrypt
```

### 导出RSA公钥，以X509编码，作为最终交换的公钥。

```
openssl rsa -in rsa_private_key_2048.pem -out rsa_public_key_2048.pem -pubout
```

> 注：一般Linux系统都装有openssl工具，在windows下可以安装OpenSSL工具包。

## 用法
### 加密工具
`CryptoUtil.java`:

```
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import lombok.extern.log4j.Log4j2;
import java.io.*;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * @author kangyonggan
 * @since 2016/12/27
 */
@Log4j2
public class CryptoUtil {

    /**
     * 获取公钥对象
     *
     * @param inputStream  公钥输入流
     * @param keyAlgorithm 密钥算法
     * @return 公钥对象
     * @throws Exception
     */
    public static PublicKey getPublicKey(InputStream inputStream, String keyAlgorithm) throws Exception {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            StringBuilder sb = new StringBuilder();
            String readLine;
            while ((readLine = br.readLine()) != null) {
                if (readLine.charAt(0) == ''''-'''') {
                    continue;
                } else {
                    sb.append(readLine);
                    sb.append(''''
'''');
                }
            }
            X509EncodedKeySpec pubX509 = new X509EncodedKeySpec(Base64.decodeBase64(sb.toString()));
            KeyFactory keyFactory = KeyFactory.getInstance(keyAlgorithm);
            PublicKey publicKey = keyFactory.generatePublic(pubX509);

            return publicKey;
        } catch (FileNotFoundException e) {
            throw new Exception("公钥路径文件不存在");
        } catch (IOException e) {
            throw new Exception("读取公钥异常");
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("生成密钥工厂时没有[%s]此类算法", keyAlgorithm));
        } catch (InvalidKeySpecException e) {
            throw new Exception("生成公钥对象异常");
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                log.error(e);
            }
        }
    }

    /**
     * 获取私钥对象
     *
     * @param inputStream  私钥输入流
     * @param keyAlgorithm 密钥算法
     * @return 私钥对象
     * @throws Exception
     */
    public static PrivateKey getPrivateKey(InputStream inputStream, String keyAlgorithm) throws Exception {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            StringBuilder sb = new StringBuilder();
            String readLine;
            while ((readLine = br.readLine()) != null) {
                if (readLine.charAt(0) == ''''-'''') {
                    continue;
                } else {
                    sb.append(readLine);
                    sb.append(''''
'''');
                }
            }
            PKCS8EncodedKeySpec priPKCS8 = new PKCS8EncodedKeySpec(Base64.decodeBase64(sb.toString()));
            KeyFactory keyFactory = KeyFactory.getInstance(keyAlgorithm);
            PrivateKey privateKey = keyFactory.generatePrivate(priPKCS8);

            return privateKey;
        } catch (FileNotFoundException e) {
            throw new Exception("私钥路径文件不存在");
        } catch (IOException e) {
            throw new Exception("读取私钥异常");
        } catch (NoSuchAlgorithmException e) {
            throw new Exception("生成私钥对象异常");
        } catch (InvalidKeySpecException e) {
            throw new Exception("生成私钥对象异常");
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                log.error(e);
            }
        }
    }

    /**
     * 数字签名函数入口
     *
     * @param plainBytes    待签名明文字节数组
     * @param privateKey    签名使用私钥
     * @param signAlgorithm 签名算法
     * @return 签名后的字节数组
     * @throws Exception
     */
    public static byte[] digitalSign(byte[] plainBytes, PrivateKey privateKey, String signAlgorithm) throws Exception {
        try {
            Signature signature = Signature.getInstance(signAlgorithm);
            signature.initSign(privateKey);
            signature.update(plainBytes);
            byte[] signBytes = signature.sign();

            return signBytes;
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("数字签名时没有[%s]此类算法", signAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("数字签名时私钥无效");
        } catch (SignatureException e) {
            throw new Exception("数字签名时出现异常");
        }
    }

    /**
     * 验证数字签名函数入口
     *
     * @param plainBytes    待验签明文字节数组
     * @param signBytes     待验签签名后字节数组
     * @param publicKey     验签使用公钥
     * @param signAlgorithm 签名算法
     * @return 验签是否通过
     * @throws Exception
     */
    public static boolean verifyDigitalSign(byte[] plainBytes, byte[] signBytes, PublicKey publicKey, String signAlgorithm) throws Exception {
        boolean isValid;
        try {
            Signature signature = Signature.getInstance(signAlgorithm);
            signature.initVerify(publicKey);
            signature.update(plainBytes);
            isValid = signature.verify(signBytes);
            return isValid;
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("验证数字签名时没有[%s]此类算法", signAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("验证数字签名时公钥无效");
        } catch (SignatureException e) {
            throw new Exception("验证数字签名时出现异常");
        }
    }

    /**
     * 加密
     *
     * @param plainBytes      明文字节数组
     * @param publicKey       公钥
     * @param keyLength       密钥bit长度
     * @param reserveSize     padding填充字节数，预留11字节
     * @param cipherAlgorithm 加解密算法，一般为RSA/ECB/PKCS1Padding
     * @return 加密后字节数组，不经base64编码
     * @throws Exception
     */
    public static byte[] encrypt(byte[] plainBytes, PublicKey publicKey, int keyLength, int reserveSize, String cipherAlgorithm) throws Exception {
        int keyByteSize = keyLength / 8; // 密钥字节数
        int encryptBlockSize = keyByteSize - reserveSize; // 加密块大小=密钥字节数-padding填充字节数
        int nBlock = plainBytes.length / encryptBlockSize;// 计算分段加密的block数，向上取整
        if ((plainBytes.length % encryptBlockSize) != 0) { // 余数非0，block数再加1
            nBlock += 1;
        }

        try {
            Cipher cipher = Cipher.getInstance(cipherAlgorithm);
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);

            // 输出buffer，大小为nBlock个keyByteSize
            ByteArrayOutputStream outbuf = new ByteArrayOutputStream(nBlock * keyByteSize);
            // 分段加密
            for (int offset = 0; offset < plainBytes.length; offset += encryptBlockSize) {
                int inputLen = plainBytes.length - offset;
                if (inputLen > encryptBlockSize) {
                    inputLen = encryptBlockSize;
                }

                // 得到分段加密结果
                byte[] encryptedBlock = cipher.doFinal(plainBytes, offset, inputLen);
                // 追加结果到输出buffer中
                outbuf.write(encryptedBlock);
            }

            outbuf.flush();
            outbuf.close();
            return outbuf.toByteArray();
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("没有[%s]此类加密算法", cipherAlgorithm));
        } catch (NoSuchPaddingException e) {
            throw new Exception(String.format("没有[%s]此类填充模式", cipherAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("无效密钥");
        } catch (IllegalBlockSizeException e) {
            throw new Exception("加密块大小不合法");
        } catch (BadPaddingException e) {
            throw new Exception("错误填充模式");
        } catch (IOException e) {
            throw new Exception("字节输出流异常");
        }
    }

    /**
     * RSA解密
     *
     * @param encryptedBytes  加密后字节数组
     * @param privateKey      私钥
     * @param keyLength       密钥bit长度
     * @param reserveSize     padding填充字节数，预留11字节
     * @param cipherAlgorithm 加解密算法，一般为RSA/ECB/PKCS1Padding
     * @return 解密后字节数组，不经base64编码
     * @throws Exception
     */
    public static byte[] decrypt(byte[] encryptedBytes, PrivateKey privateKey, int keyLength, int reserveSize, String cipherAlgorithm) throws Exception {
        int keyByteSize = keyLength / 8; // 密钥字节数
        int decryptBlockSize = keyByteSize - reserveSize; // 解密块大小=密钥字节数-padding填充字节数
        int nBlock = encryptedBytes.length / keyByteSize;// 计算分段解密的block数，理论上能整除

        try {
            Cipher cipher = Cipher.getInstance(cipherAlgorithm);
            cipher.init(Cipher.DECRYPT_MODE, privateKey);

            // 输出buffer，大小为nBlock个decryptBlockSize
            ByteArrayOutputStream outbuf = new ByteArrayOutputStream(nBlock * decryptBlockSize);
            // 分段解密
            for (int offset = 0; offset < encryptedBytes.length; offset += keyByteSize) {
                // block大小: decryptBlock 或 剩余字节数
                int inputLen = encryptedBytes.length - offset;
                if (inputLen > keyByteSize) {
                    inputLen = keyByteSize;
                }

                // 得到分段解密结果
                byte[] decryptedBlock = cipher.doFinal(encryptedBytes, offset, inputLen);
                // 追加结果到输出buffer中
                outbuf.write(decryptedBlock);
            }

            outbuf.flush();
            outbuf.close();
            return outbuf.toByteArray();
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("没有[%s]此类解密算法", cipherAlgorithm));
        } catch (NoSuchPaddingException e) {
            throw new Exception(String.format("没有[%s]此类填充模式", cipherAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("无效密钥");
        } catch (IllegalBlockSizeException e) {
            throw new Exception("解密块大小不合法");
        } catch (BadPaddingException e) {
            throw new Exception("错误填充模式");
        } catch (IOException e) {
            throw new Exception("字节输出流异常");
        }
    }

    /**
     * 字符数组转16进制字符串
     *
     * @param bytes
     * @return
     */
    public static String bytes2string(byte[] bytes, int radix) {
        // 2个16进制字符占用1个字节，8个二进制字符占用1个字节
        int size = 2;
        if (radix == 2) {
            size = 8;
        }
        StringBuilder sb = new StringBuilder(bytes.length * size);
        for (int i = 0; i < bytes.length; i++) {
            int integer = bytes[i];
            while (integer < 0) {
                integer = integer + 256;
            }
            String str = Integer.toString(integer, radix);
            sb.append(StringUtils.leftPad(str.toUpperCase(), size, "0"));
        }
        return sb.toString();
    }
}
```

### 签名
```
byte[] signBytes = CryptoUtil.digitalSign(xml.getBytes("UTF-8"), privateKey, "SHA1WithRSA");
```

### 加密
```
byte[] encryptedBytes = CryptoUtil.encrypt(xmlBytes, publicKey, 2048, 11, "RSA/ECB/PKCS1Padding");
```

### 解密
```
byte[] xmlBytes = CryptoUtil.decrypt(encryptedBytes, privateKey, 2048, 11, "RSA/ECB/PKCS1Padding");
```

### 验签
```
boolean isValid = CryptoUtil.verifyDigitalSign(xmlBytes, signBytes, publicKey, "SHA1WithRSA");
```

### 加载私钥
```
/**
 * 加载私钥
 */
private void loadPrivateKey() {
    String privateKeyPath = null;
    InputStream inputStream = null;
    try {
        // TODO
        privateKeyPath = "私钥路径";
        inputStream = new FileInputStream(privateKeyPath);
        privateKey = CryptoUtil.getPrivateKey(inputStream, "RSA");
    } catch (Exception e) {
        log.error("无法加载己方私钥[{}]", privateKeyPath);
        log.error(e.getMessage(), e);
    } finally {
        try {
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception e) {
            log.error(e);
        }
    }
}
```

### 加载公钥
```
/**
 * 加载公钥
 */
private void loadPublicKey() {
    String publicKeyPath = null;
    InputStream inputStream = null;
    try {
        // TODO
        publicKeyPath = "公钥路径";
        inputStream = new FileInputStream(publicKeyPath);
        publicKey = CryptoUtil.getPublicKey(inputStream, "RSA");
    } catch (Exception e) {
        log.error("无法加载对方公钥[{}]", publicKeyPath);
        log.error(e.getMessage(), e);
    } finally {
        try {
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception e) {
            log.error(e);
        }
    }
}
```
'', 1, 0, 1, 0, 0, ''2017-04-11 15:16:52'', ''2017-04-11 16:18:24'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用Log4j正则替换功能隐藏敏感信息'', ''java'', ''Java后台'', ''

今天工作中遇到一个问题，需要把一些Log4j日志中的敏感信息给隐藏了，比如：手机号，身份证号等。

## pom.xml
```
<dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>1.2.16</version>
</dependency>
```

<!-- more -->

## log4j.xml
```
<?xml version="1.0" encoding="GBK" ?>
<!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">
<log4j:configuration>

    <appender name="console" class="org.apache.log4j.ConsoleAppender">
        <!--<layout class="org.apache.log4j.PatternLayout">-->
        <!--<param name="ConversionPattern" value="%d %t [%F:%L] %-5p : %m%n" />-->
        <!--</layout>-->
        <layout class="com.kangyonggan.demo.MyPatternLayout">
            <param name="ConversionPattern" value="%d %t [%F:%L] %-5p : %m%n"/>
        </layout>
    </appender>

    <root>
        <level value="debug"></level>
        <appender-ref ref="console"></appender>
    </root>
</log4j:configuration>
```

## MyPatternLayout.java
```
package com.kangyonggan.demo;

import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.spi.LoggingEvent;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author kangyonggan
 * @since 2017/3/20
 */
public class MyPatternLayout extends PatternLayout {

    private static final String HIDDEN = "$1$2$3****$5$6";
    private static final Pattern MOBILE_PATTERN = Pattern.compile("(\\D|^)(1)(3\\d|4[57]|5[^4]|7[0137]|8\\d)(\\d{4})(\\d{4})(\\D|$)");

    @Override
    public String format(LoggingEvent event) {
        if (event.getMessage() instanceof String) {
            String message = event.getRenderedMessage();

            Matcher matcher = MOBILE_PATTERN.matcher(message);

            if (matcher.find()) {
                String maskedMessage = matcher.replaceAll(HIDDEN);

                Throwable throwable = event.getThrowableInformation() != null ? event.getThrowableInformation().getThrowable() : null;

                LoggingEvent maskedEvent = new LoggingEvent(
                        event.fqnOfCategoryClass,
                        Logger.getLogger(event.getLoggerName()),
                        event.timeStamp,
                        event.getLevel(),
                        maskedMessage,
                        throwable);

                return super.format(maskedEvent);
            }
        }

        return super.format(event);
    }
}
```

## Test.java
```
package com.kangyonggan.demo;

import org.apache.log4j.Logger;

/**
 * @author kangyonggan
 * @since 2017/3/20
 */
public class Test {

    private static final Logger logger = Logger.getLogger(Test.class);

    public static void main(String[] args) {
        logger.info("手机号1: 13911119999，姓名：qweqe");
        logger.info("手机号2: asd13911119999asd");
        logger.info("假手机号1: 139a11119999");
        logger.info("假手机号2: 139111199991");
        logger.info("假手机号3: 139111199991");
        logger.info("假手机号4: 444139111199991");
        logger.info("假手机号5: 44413911119999");

        try {
            int a = 1 / 0;
        } catch (Exception e) {
            logger.error("13911110000", e);
        }
    }

}
```

## 输出
```
2017-03-21 15:32:50,163 main [Test.java:14] INFO  : 手机号1: 139****9999，姓名：qweqe
2017-03-21 15:32:50,166 main [Test.java:15] INFO  : 手机号2: asd139****9999asd
2017-03-21 15:32:50,166 main [Test.java:16] INFO  : 假手机号1: 139a11119999
2017-03-21 15:32:50,166 main [Test.java:17] INFO  : 假手机号2: 139111199991
2017-03-21 15:32:50,166 main [Test.java:18] INFO  : 假手机号3: 139111199991
2017-03-21 15:32:50,167 main [Test.java:19] INFO  : 假手机号4: 444139111199991
2017-03-21 15:32:50,167 main [Test.java:20] INFO  : 假手机号5: 44413911119999
2017-03-21 15:32:50,167 main [Test.java:25] ERROR : 13911110000
java.lang.ArithmeticException: / by zero
  at com.kangyonggan.demo.Test.main(Test.java:23)

Process finished with exit code 0
```

> 例子中的正则表达式写的比较弱，请根据实际情况自己写。

'', 0, 0, 1, 0, 0, ''2017-04-11 15:17:56'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用Log4j2让项目输出info级别的日志和debug级别的sql'', ''java'', ''Java后台'', ''

> log4j2的使用方法请参考我之前的一篇文章

让项目输出info级别的日志，让项目输出debug级别的日志，`log4j2.xml`的配置如下:

<!-- more -->

```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/simconf</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
        </Console>
        <RollingRandomAccessFile name="AllFile" fileName="${LOG_HOME}/all.log"
                                 filePattern="${LOG_HOME}/all-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <RollingRandomAccessFile name="ErrorFile" fileName="${LOG_HOME}/error.log"
                                 filePattern="${LOG_HOME}/error-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <Async name="AsyncAll">
            <AppenderRef ref="AllFile"></AppenderRef>
        </Async>
        <Async name="AsyncError">
            <AppenderRef ref="ErrorFile"></AppenderRef>
        </Async>
    </Appenders>
    <Loggers>
        <Logger name="com.kangyonggan.app.simconf.mapper" level="debug" additivity="false">
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Logger>

        <Root level="info" additivity="true">
            <AppenderRef ref="Console"></AppenderRef>
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Root>
    </Loggers>
</Configuration>
```

只配置log4j2.xml是不够的，因为Mybatis默认使用的不是log4j2，默认使用的顺序如下:

> SLF4J > Apache Commons Logging > Log4j2 > Log4j > JDK logging

所有我们还需要让Mybatis使用log4j2来输出日志:

```
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    ...
    <property name="configLocation" value="classpath:mybatis.xml"></property>
    ...
</bean>
```

`mybatis.xml`的内容:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <settings>
        <!--使用log4j2输出日志-->
        <setting name="logImpl" value="LOG4J2"></setting>
    </settings>
</configuration>
```

小记：本人单线程测试log4j和log4j2的性能，结果如下:
输出10000个debug+10000个info+10000个error到日志文件，log4j2是log4j速度的1.8倍左右。
输出100000个debug+100000个info+100000个error到日志文件，log4j2是log4j速度的2.6倍左右。


'', 0, 0, 1, 0, 0, ''2017-04-11 15:19:38'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用log4j2的SMTPAppender发送邮件报警'', ''java'', ''Java后台'', ''

## 目的
1. 当项目中有`报错时`，要能`自动的`、`及时的`发邮件通知`指定人员`。
2. 邮件中的错误日志要全面，最好能把当前线程的全部日志输出，不论日志级别。
3. 仅当日志为error级别时，才发邮件通知。
4. 可以配置邮件抄送给其他人。

<!-- more -->

## 引入依赖
```
<log4j2.api.version>2.5</log4j2.api.version>

<!--Log4j2-->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
```

## 配置`log4j2.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/cms</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
        </Console>
        <RollingRandomAccessFile name="AllFile" fileName="${LOG_HOME}/all.log"
                                 filePattern="${LOG_HOME}/all-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <RollingRandomAccessFile name="ErrorFile" fileName="${LOG_HOME}/error.log"
                                 filePattern="${LOG_HOME}/error-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <SMTP name="Mail" subject="内容管理系统 - 报警通知" to="kangyonggan@gmail.com" from="kangyg2017@163.com"
              smtpHost="smtp.163.com" smtpUsername="kangyg2017@163.com" smtpPassword="xxxxxxxx" bufferSize="50" >
        </SMTP>
        <Async name="AsyncAll">
            <AppenderRef ref="AllFile"></AppenderRef>
        </Async>
        <Async name="AsyncError">
            <AppenderRef ref="ErrorFile"></AppenderRef>
            <AppenderRef ref="Mail" ></AppenderRef>
        </Async>
    </Appenders>
    <Loggers>
        <Root level="debug" additivity="true">
            <AppenderRef ref="Console"></AppenderRef>
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Root>
    </Loggers>
</Configuration>
```

上面的配置中，关于报警的配置有两点:

```
<AppenderRef ref="Mail" ></AppenderRef>
```

```
<SMTP name="Mail" subject="内容管理系统 - 报警通知" to="kangyonggan@gmail.com" from="kangyg2017@163.com"
      smtpHost="smtp.163.com" smtpUsername="kangyg2017@163.com" smtpPassword="xxxxxxxx" bufferSize="50" >
</SMTP>
```

## 附加说明
- 异步输出日志，不会影响主线程性能
- error日志单独输出到error.log文件
- all.log包含所有级别的日志
- 每天会备份旧的日志文件，产生新的日志文件
- 如果一天之中有日志文件超出大小限制(上面配的500M)，会存档当前文件，另外再创建一个新的文件
- 日志文件只保存近期的（上面配置的30天）

> 温馨提示：由于是个人项目，所以没配置多个邮件接收者，如有需要，请参考[官方文档](http://logging.apache.org/log4j/2.x/manual/appenders.html#SMTPAppender)

## 收到的邮件截图
![mail](https://kangyonggan.com/upload/20170123163536603.png)
![mail](https://kangyonggan.com/upload/20170123163703359.png)
![mail](https://kangyonggan.com/upload/20170123163703945.png)
![mail](https://kangyonggan.com/upload/20170123163704569.png)


'', 1, 0, 1, 0, 0, ''2017-04-11 15:20:12'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用aop和自定义注解打印出参入参日志和方法执行时间'', ''java'', ''Java后台'', ''

## 自定义注解
`LogTime.java`:

```
package com.kangyonggan.api.common.annotation;

import java.lang.annotation.*;

/**
 * 在方法上加此注解会打印入参和出参，会计算方法消耗的时间
 *
 * @author kangyonggan
 * @since 2016/12/8
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface LogTime {
}
```

<!-- more -->

## 主要逻辑：

```
package com.kangyonggan.api.common.aop;

import com.kangyonggan.api.common.annotation.LogTime;
import com.kangyonggan.api.common.util.AopUtil;
import com.kangyonggan.api.common.util.DateUtils;
import com.kangyonggan.api.common.util.PropertiesUtil;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;

import java.lang.reflect.Method;

/**
 * 切于内部service的实现方法上， 需要在方法上手动加上@LogTime注解， 打印入参和出参，打印方法执行时间, 慢方法打印error日志
 *
 * @author kangyonggan
 * @since 2016/11/30
 */
@Log4j2
public class LogAop {

    /**
     * 设定的方法最大执行时间
     */
    private Long slowMethodTime;

    public LogAop() {
        String val = PropertiesUtil.getPropertiesOrDefault("slow.method.time", "10");
        slowMethodTime = Long.parseLong(val);
    }

    /**
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        Object args[] = joinPoint.getArgs();
        Class clazz = joinPoint.getTarget().getClass();

        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = clazz.getMethod(methodSignature.getName(), methodSignature.getParameterTypes());
        String targetName = "[" + clazz.getName() + "." + method.getName() + "]";

        LogTime logTime = method.getAnnotation(LogTime.class);
        Object result;
        if (logTime != null) {
            log.info("进入方法:" + targetName + " - args:" + AopUtil.getStringFromRequest(args));

            long beginTime = DateUtils.getNow().getTime();
            result = joinPoint.proceed(args);
            long endTime = DateUtils.getNow().getTime();
            long time = endTime - beginTime;

            log.info("离开方法:" + targetName + " - return:" + AopUtil.getStringFromResponse(result));
            log.info("方法耗时:" + time + "ms - " + targetName);

            if (time > slowMethodTime * 1000) {
                log.error("方法执行超过设定时间" + slowMethodTime + "s," + targetName);
            }
        } else {
            result = joinPoint.proceed(args);
        }

        return result;
    }
}
```


其中用到的`AopUtil.java`:

```
package com.kangyonggan.api.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2016/11/30
 */
public class AopUtil {
    public static String getStringFromRequest(Object[] args) {
        String req = "";
        for (Object arg : args) {
            if (arg == null) {
                req = req + "null,";
                continue;
            } else if (arg instanceof List == true) {
                req = req + JSON.toJSONString(arg);
            } else if (arg.getClass().isArray()) {
                req = req + JSONArray.toJSONString(arg);
            } else if (arg instanceof Enum) {
                req = req + JSON.toJSONString(arg) + ",";
            } else if (!(arg instanceof String)
                    && !(arg instanceof BigDecimal)
                    && !(arg instanceof Boolean)
                    && !(arg instanceof Integer)
                    && (arg instanceof Object)) {
                req = req + JSON.toJSONString(arg) + ",";
            } else {
                req = req + arg.toString() + ",";
            }
        }

        if (StringUtils.isNotEmpty(req) && req.length() > 100) {
            return req.hashCode() + "";
        } else {
            return req;
        }
    }

    public static String getStringFromResponse(Object arg) {
        String rsp = "";
        if (arg == null) {
            rsp = rsp + "null,";
            return rsp;
        } else if (arg instanceof List) {
            rsp = rsp + JSON.toJSONString(arg);
            return rsp;
        } else if (arg instanceof Enum) {
            rsp = rsp + JSON.toJSONString(arg);
            return rsp;
        } else if (!(arg instanceof String)
                && !(arg instanceof BigDecimal)
                && !(arg instanceof Boolean)
                && !(arg instanceof Integer)
                && (arg instanceof Object)) {
            rsp = rsp + JSON.toJSONString(arg) + ",";
        } else {
            rsp = rsp + arg.toString() + ",";
        }
        return rsp;
    }
}
```


'', 1, 0, 1, 0, 0, ''2017-04-11 15:21:31'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''使用ace admin搭建单页面网站'', ''web'', ''Web前端'', ''

## 资料
- Ace Admin [ace.zip](https://kangyonggan.com/upload/ace.zip)
- 在线实例（已经没了） [http://kangyonggan.com](http://kangyonggan.com)
- Github代码（已经没了） [https://github.com/kangyonggan/blog.git](https://github.com/kangyonggan/blog.git)

> 网上很少有ace admin相关的资料，如需使用和学习，只能去看源代码...

<!-- more -->

## 目的
做出一个类似cms后台管理系统的单页面网站，效果如下:

![加载中](https://kangyonggan.com/upload/20170109223706060.png)

![地址](https://kangyonggan.com/upload/20170109223708522.png)

## 步骤
由于关于ace admin的文档很少，尤其是ace admin ajax的！所以这就要我们自己来读源代码，看实例来学习了。

### 搭建本地demo
下载ace.zip并解压
![下载](https://kangyonggan.com/upload/20170109223701593.png)

拷贝到tomcat webapps目录下

![拷贝到tomcat](https://kangyonggan.com/upload/20170109223709211.png)

启动tomcat后，打开浏览器即可查看demo

![查看demo](https://kangyonggan.com/upload/20170109223706510.png)

可以先进入`Ajax Demo Pages`提前感受一下单页面的好处。

### 拷贝源码+修改
查看源码：右键-->查看源代码

![源码](https://kangyonggan.com/upload/20170109223707758.png)

把ace的一些核心css和js拷贝到你的html中，由于我们是要做单页面，从`Ajax Demo Pages`中可以看出，关键词是`ajax`
所以你需要格外的关注源码中出现的`ajax`,经过搜索后发现有用的是下面两点

![ajax](https://kangyonggan.com/upload/20170109223702751.png)
![ajax](https://kangyonggan.com/upload/20170109223704068.png)

点开`ace.ajax-content.js`, 如下：

![ajax-content](https://kangyonggan.com/upload/20170109223702338.png)

发现他是一个典型的jquery插件（不会jquery插件的看着会比较难，最好先去恶补一下），大致看一下这个插件，会发现它实现单页面的核心代码是:

![geturl](https://kangyonggan.com/upload/20170109223704715.png)

当用户点击超链接或者按钮时，插件代替你发起异步请求，服务器返回一个“页面”，插件拿到页面后，用下面红框框的核心代码把内容局部清空并替换，实现类似iframe的效果，给人一种我是单页面的错觉

![replace](https://kangyonggan.com/upload/20170109223707144.png)

对源码有个大致的了解就行，下面就可以动手搭建了。

## 解读源码
基础web环境搭建过程不再演示，我使用的freemarker模板，下面是我的html布局：

```html
<#assign ctx="${(rca.contextPath)!''''''''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <div class="hidden ajax-append-link" rel="shortcut icon" href="${ctx}/static/app/images/favicon.ico" type="image/x-icon">
    <!-- bootstrap & fontawesome -->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/bootstrap.min.css"></div>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/font-awesome.min.css"></div>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/jquery.gritter.min.css"></div>

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-fonts.min.css"></div>

    <#--skin-->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-skins.min.css"></div>

    <!-- ace styles -->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace.min.css" class="ace-main-stylesheet"
          id="main-ace-style"></div>

    <!--[if lte IE 9]>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-part2.min.css" class="ace-main-stylesheet"></div>
    <![endif]-->

    <!--[if lte IE 9]>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-ie.min.css"></div>
    <![endif]-->

    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/app/css/app.css"></div>

    <script src="${ctx}/static/ace/dist/js/jquery.min.js"></script>

    <!--[if lte IE 8]>
    <script src="${ctx}/static/ace/dist/js/html5shiv.js"></script>
    <script src="${ctx}/static/ace/dist/js/respond.min.js"></script>
    <![endif]-->
<@block name="app-style"/>
</head>
<body class="skin-3">
<#include "navbar.ftl"/>

<div class="main-container" id="main-container">

<#if hasSidebar?? && hasSidebar==true>
    <#include "sidebar.ftl"/>
</#if>

    <div class="main-content">
        <div class="main-content-inner">
        <#if home_name?? && home_name!=''''''''>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-tachometer home-icon"></i>
                        <a data-url="index" href="#index">${home_name}</a>
                    </li>
                </ul>
            </div>
        </#if>

            <div class="page-content">
                <div class="page-content-area"></div>
            </div>
        </div>
    </div>

<#include "footer.ftl"/>

<#include "modal.ftl"/>

    <a href="javascript:" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div>

<script>var ctx = ''''${ctx}'''';</script>
<script src="${ctx}/static/ace/dist/js/bootstrap.min.js"></script>
<script src="${ctx}/static/libs/jquery/jquery.bootstrap.min.js"></script>
<script src="${ctx}/static/ace/dist/js/jquery.gritter.min.js"></script>
<script src="${ctx}/static/ace/dist/js/ace-extra.min.js"></script>
<script src="${ctx}/static/ace/dist/js/ace-elements.min.js"></script>
<script src="${ctx}/static/ace/dist/js/ace.min.js"></script>
<script src="${ctx}/static/app/js/app.js"></script>
<@block name="app-script"/>
</body>
</html>
```

其中，`navbar.flt` `sidebar.ftl` `footer.ftl` 都是demo中的。
如果之前使用的就是freemarker+ace admin，那么你要重点关注下面两处代码:

```html
<div class="page-content">
   <div class="page-content-area"></div>
</div>
```

核心js`app.js`

```js
$(function () {
    // 异步加载界面
    var $ajaxContent = $(".page-content-area");
    $ajaxContent.ace_ajax({
        ''''default_url'''': ''''#index'''',
        ''''content_url'''': function (hash) {
            return window.location.origin + window.location.pathname + "/" + hash;
        },
        ''''update_active'''': updateMenuActive,
        ''''update_breadcrumbs'''': updateBreadcrumbs,
        ''''update_title'''': updateTitle,
        ''''loading_text'''': ''''<span class="loading">正在加载, 请稍等...</span>''''
    });

    // 监听异步加载失败事件
    $ajaxContent.on("ajaxloaderror", function (e, data) {
        window.location.href = ctx + ''''/#500'''';
    });
});


/**
 * 更新菜单激活状态
 *
 * @param hash
 */
function updateMenuActive(hash) {
    //  当前菜单
    var $menu = $($(''''a[data-url="'''' + hash + ''''"]'''')[0]).parent("li");

    // 所有菜单
    var $all_menus = $menu.parents("ul.nav-list").find("li");

    // 清除所有菜单状态
    $all_menus.removeClass("open");
    $all_menus.removeClass("active");

    // 父菜单
    var $parent = $menu.parents("li");
    if ($parent.length > 0) {
        $parent.addClass("open");
    }
    $menu.addClass("active");
}

/**
 * 更新面包屑
 *
 * @param hash
 */
function updateBreadcrumbs(hash) {
    var $menu = $(''''a[data-url="'''' + hash + ''''"]'''');

    // 下面这坨代码摘自ace.ajax-content.js
    var $breadcrumbs = $(''''.breadcrumb'''');
    if ($breadcrumbs.length > 0 && $breadcrumbs.is('''':visible'''')) {
        $breadcrumbs.find(''''> li:not(:first-child)'''').remove();

        var i = 0;
        $menu.parents(''''.nav li'''').each(function () {
            var $link = $(this).find(''''> a'''');

            var $link_clone = $link.clone();
            $link_clone.find(''''i,.fa,.glyphicon,.ace-icon,.menu-icon,.badge,.label'''').remove();
            var text = $link_clone.text();
            $link_clone.remove();

            var href = $link.attr(''''href'''');

            if (i == 0) {
                var li = $(''''<li class="active"></li>'''').appendTo($breadcrumbs);
                li.text(text);
            } else {
                var li = $(''''<li><a ></a></li>'''').insertAfter($breadcrumbs.find(''''> li:first-child''''));
                li.find(''''a'''').attr(''''href'''', href).text(text);
            }
            i++;
        })
    }
}

/**
 * 更新标题
 *
 * @param hash
 */
function updateTitle(hash) {
    var $menu = $($(''''a[data-url="'''' + hash + ''''"]'''')[0]);
    var title = $.trim($menu.text());

    if (title != '''''''') {
        document.title = title;
    }
}

/**
 * 更新状态
 *
 * @param hash
 */
function updateState(hash) {
    updateBreadcrumbs(hash);
    updateMenuActive(hash);
    updateTitle(hash);
}
```

如果你对jquery插件了解的不多，估计很难去使用`ace_ajax`，因为网上和demo中都没有使用教程，我这是根据`ace.ajax-content.js`源代码中的jquery插件反推出来的插件使用方法。

在插件源代码的最后暴露出插件有哪些公共属性和方法可被你覆写和调用

```js
$.fn.aceAjax = $.fn.ace_ajax = function (option, value, value2, value3) {
 var method_call;

 var $set = this.each(function () {
 var $this = $(this);
 var data = $this.data(''''ace_ajax'''');
 var options = typeof option === ''''object'''' && option;

 if (!data) $this.data(''''ace_ajax'''', (data = new AceAjax(this, options)));
 if (typeof option === ''''string'''' && typeof data[option] === ''''function'''') {
 if(value3 != undefined) method_call = data[option](value, value2, value3);
 else if(value2 != undefined) method_call = data[option](value, value2);
 else method_call = data[option](value);
 }
 });

 return (method_call === undefined) ? $set : method_call;
}

$.fn.aceAjax.defaults = $.fn.ace_ajax.defaults = {
 content_url: false,
 default_url: false,
 loading_icon: ''''fa fa-spin fa-spinner fa-2x orange'''',
 loading_text: '''''''',
 loading_overlay: null,
 update_breadcrumbs: true,
 update_title: true,
 update_active: true,
 close_active: false,
 max_load_wait: false
}
```

比如`loading_text`,看名称就大概猜出是在异步加载界面时，给用户的提示信息，例如`正在加载, 请稍等...`， 当然这只是大概的猜测，我们要真想使用它，肯定要读相应的源代码并且动手去验证一下。

过程中难免会遇到各种问题，只要耐心解读源码，一定会攻破的，我也遇到了好多坑，昨天花了一整天的时间才把我原本的博客给变成了单页面的，这主要是因为我的聪明才智和之前就使用的ace admin。

> 温馨提示: `ace.ajax-content.js`文件被包含在了`ace.min.js`中，因此只需要引入`ace.min.js`即可




'', 1, 0, 1, 0, 0, ''2017-04-11 15:22:55'', ''2017-04-11 16:18:39'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''windows防火墙导致ftp文件上传异常'', ''java'', ''Java后台'', ''
在win7系统下运行web项目，发现ftp文件上传异常，但是在linux下是好的，win7下报错信息如下：

```
[INFO ] 2017-01-21 21:24:03.388 [com.kangyonggan.archetype.cms.biz.util.Ftp.http-bio-8080-exec-10:53] - 连接文件服务器成功, 上传路径path:upload/
[ERROR] 2017-01-21 21:24:22.899 [com.kangyonggan.archetype.cms.biz.util.Ftp.http-bio-8080-exec-10:75] - 文件上传异常
java.net.SocketException: Software caused connection abort: socket write error
oat java.net.SocketOutputStream.socketWrite0(Native Method) ~[?:1.8.0_111]
oat java.net.SocketOutputStream.socketWrite(SocketOutputStream.java:109) ~[?:1.8.0_111]
oat java.net.SocketOutputStream.write(SocketOutputStream.java:153) ~[?:1.8.0_111]

...
```

<!-- more -->

原因是win7防火墙的问题，关闭防火墙后一切就正常了。

![关闭防火墙](https://kangyonggan.com/upload/20170121214431475.png)


'', 1, 0, 1, 0, 0, ''2017-04-11 15:24:37'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''.gitignore的内容'', ''code'', ''代码片段'', ''

```
# Maven #
target/

# IDEA #
.idea/
*.iml

# Eclipse #
.settings/
.metadata/
.classpath
.project
Servers/
```
'', 1, 0, 1, 0, 0, ''2017-04-11 15:25:46'', ''2017-04-11 16:18:24'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''HashMap实现原理分析'', ''java'', ''Java后台'', ''

> 参考：[http://blog.csdn.net/vking_wang/article/details/14166593](http://blog.csdn.net/vking_wang/article/details/14166593)

## HashMap的数据结构
在数据结构中，有`数组`和`链表`来实现对数据的存储，但这两者是两个极端。

### 数组
数组的存储区间是连续的，空间复杂度大，时间复杂度小。特点是：`查找容易，插入和删除困难`。

### 链表
链表的存储区间是离散的，空间复杂度小，时间复杂度大。特点是：`查找困难，插入和删除容易`。

### 哈希表
哈希表是综合了数组和链表的优点，既满足了查找方便，同时也不占用太多空间，使用也很方便。

<!-- more -->

哈希表有很多实现方式，下面讲解最常用的拉链发，可以理解为链表的数组：

![la](https://kangyonggan.com/upload/20170309210540154.jpeg)

从上图中总可以看出，哈希表是由`数组+链表`组成的，HashMap里面实现了一个静态内部类`Entity`,其重要属性有`key`、`value`和`next`，从属性可以看出Entity是HashMap键值对实现的一个基础Bean，上面我们说到HashMap的基础就是一个线性数组，即Entity[],Map里面的内容都保存在数组Entity[]中, 下面是个demo：

![lan](https://kangyonggan.com/upload/20170309210548825.png)

这个链表是一个长度为16的数组，左边数字是数组的下标，右边的数字是key的hash值，数组中的每一个元素都是一个链表的头节点，那么这些元素是按照什么规则存储的呢？又是按照什么规则查找的呢？

### 存取规则`hash(key)%len`
比如上图中，key的hash值为31的元素，模上数组长度16，结果是15，那么它就存储在arr[15]所在的链表中。查找时就是先计算hash(key)%len，找出元素所在的链表位于数组的位置，然后遍历链表即可。

### 几个注意点
1. 不同的Hash可能有相同的index，相同的index不一定有相同的Hash。
2. 对于`hash(key)%len`计算得到相同index的元素，采用`头插法`，即后来的插到链表的头部，也就是说数组中存储的那个头元素是最后插进来的。
3. HashMap允许key为null的元素存入，key为null的元素永远存储在链表头部，即数组中。
4. Entity[]的长度固定后，随着元素的增加，链表会越来越长，这时候HashMap中的一个因子就会起到作用，随着map的size越来越大，Entity[]的length会以一定的规则增加。



'', 1, 0, 1, 0, 0, ''2017-04-11 15:29:36'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''java手札-基础部分'', ''java'', ''Java后台'', ''

1. 一个java源文件中是否可以包含多个类（不含内部类）？可以，但只能有一个public，且必须和文件名一致。
2. goto？goto是保留字。
3. &和&&？&是按位与，&&是逻辑与，&&会短路。
4. 跳出多重循环？可以用标志但不推荐，推荐使用变量来标识。
<!-- more -->
5. switch表达式可以有哪些类型？String呢？数字+枚举。jdk1.7之后可以有String，但底层没变，只是在编译时把String转hash
6. short s1=1;s1+=1;s1=s1+1;哪错？前对后错，类型转换错误，丢失精度，编译不过。
7. char能存储汉字？可以，char是Unicode编码，占2字节。
8. 快速乘8？左移3位。
9. final修饰一个变量时，是引用不能变?还是对象不能变？引用不能变，对象内容可以变。
10. ==和equals区别？equals不能用于比较8大基本数据类型, 如果比较的是基本类型的封装类型，会转化为==来比较他们的值，如果是String，会逐个比较char，如果是其他引用对象，会转化为==来比较他们的引用地址，但是你可以覆写equals来给两个对象是否一样来定指标。==如果比较的是基本数据类型或他们的封装类，是比较他们的值，如果比较的是引用对象，比较的是他们的引用地址。
11. static？类属性，类方法。
12. int和Integer？默认值不一样，vo层最后使用封装类，比如MBG逆向生成的model就是用的封装类型。
  - 原因一：在展现层，int显示是0，Integer显示空串。
  - 原因二：在tk.mybatis中，updateSelectiveByPrimaryKey(T t)，会更新不为null的字段，如果使用Integer，就不会更新，如果使用int，可能会误更新为0。
13. Math.round(-11.5)=-11，加0.5向下取整。
14. private、friendly、protected、public，当前类，同包，子孙类，所有类。
15. override和overload？overload重载，比如Math.abs()。override覆写，修饰符范围可小不可大，异常可少可子不可扩。
16. 构造方法可被覆写？不可。覆写要求方法名一样，但子类和父类的构造方法的方法名显然不一样。
17. 面向对象特征？封装、继承、多态、抽象。
  - 封装（高内聚，低耦合）：比如冰箱，按开关即可，内部封装，暴露接口即可。
  - 继承（复用性，扩展性）：比如，BaseService中提供了基础的curd。
  - 多态：编译期间不知道要掉哪个方法，运行期间才知道，比如：UserDao接口，有两个实现，UserMyBatisDao和UserHibernateDao这两个实现。
  - 抽象：抓住主要矛盾，忽略次要矛盾。
18. 抽象类abstract和接口interface？抽象方法所在的类必须是抽象类，抽象方法不能有方法体，抽象类的子类必须实现抽象方法，抽象类中可以有普通的方法,抽象类中可以有static方法，但是抽象方法不能同时是static,抽象方法不能有synchronized，可以在子类中覆写后加synchronized关键字。接口中所有的方法都是public，所有的属性都是public static final,所有的方法不能有方法体，子类必须实现所有方法(抽象类实现接口后可以不去覆写，但继承此抽象类的子类还是需要去实现的), 抽象类中不能有static方法。
19. 逗号分隔字符串，如果最后一个符号是逗号，数组长度是不对的。
20. String str="a"+"b"+"c"+"d";值创建了一个对象，javac编译时，对它进行了优化，+号两边的字符串直接合并。
21. 一般异常必须捕获或抛出，运行时异常不必须，比如：空指针异常，数组越界异常，类型转换异常。
22. sleep不释放锁，wait会释放锁。
23. 临界资源需要同步处理（原子化操作）。
24. ArrayList和Vector？都实现了List接口，List继承Collection，有序，允许重复，底层是数组。Vector线程安全，ArrayList不是线程安全，效率高。扩增时，Vector增2倍，ArrayList增1.5倍。
25. HashMap和HashTable？都实现了Map接口，都能存储名值对，HashMap允许null键值，干掉了contains()方法，改成了containsKey()和containsValue()。HashTable线程安全，并继承了Dictionary。
26. ArrayList和LinkedList？都是集合，前者读快写慢，后者读慢写快。前者是数组，后者是链表。
27. Collection和Collections？前者是集合的顶级接口，后者是集合的帮助类。
'', 1, 0, 1, 0, 0, ''2017-04-11 15:30:11'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''jdk1.8发送http请求报SSLv3的解决方案'', ''java'', ''Java后台'', ''

从 JDK 8u31 发行版开始，已停用 SSLv3 协议（安全套接字层），该协议在正常情况下不可用。如果确实需要 SSLv3，可以重新激活该协议...

SSLv3激活步骤:

切到${java_home}/jre/lib/security目录

```
cd /Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home/jre/lib/security
```

<!-- more -->

修改`java.security`文件

```
vi java.security
```

找到`jdk.tls.disabledAlgorithms`属性， 删除`SSLv3`并保存

查找:`/jdk.tls.disabledAlgorithms`

'', 1, 0, 1, 0, 0, ''2017-04-11 15:31:22'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''JVM结构和GC的工作机制'', ''java'', ''Java后台'', ''

> 参考：[http://blog.csdn.net/moneyshi/article/details/53033577](http://blog.csdn.net/moneyshi/article/details/53033577)

## JVM结构
![jvm](https://kangyonggan.com/upload/20170309052107625.jpeg)

<!-- more -->

![jvm2](https://kangyonggan.com/upload/20170309052117048.jpeg)

从图一可知，jvm主要包括四个部分：

1. `类加载器`（ClassLoader）
  - 在jvm启动时或类运行时将需要的class加载到jvm中。
2. `执行引擎`
  - 负责执行class文件中的字节码指令。
3. `本地方法接口`
  - 主要是调用C或者C++实现的本地方法及返回结果。
4. `内存区`
  - jvm在运行时操作系统所分配的内存区，主要分为5个区。
  - ![mem](https://kangyonggan.com/upload/20170309052142757.jpeg)
  - `方法区`（Methor Area）
    - 用于存储类结构信息的地方，包括常量池、静态变量、构造函数等。被所有java线程共享。
  - `java堆`（Heap）
    - 存储java对象或实例的地方。这块是GC的主要区域， 被所有java线程共享。
  - `java栈`（Stack）
    - java栈总是和线程关联在一起，每当创建一个线程时，jvm就会为这个线程创建一个栈。栈中会包含很多栈帧，没运行一个方法就会创建一个栈帧，用于存储局部变量返回值等。每一个方法从调用到结束，就是一个栈帧从入栈到出栈的过程。java栈是线程私有的。
  - `程序计数器`（PC Register）
    - 用于保存当前线程的内存地址。由于jvm是多线程的，线程轮流切换，为了保证线程切换回来后还能恢复原先状态，就需要一个独立的计数器，记录之前中断的地方。程序计数器也是线程私有的。
  - `本地方法栈`（Native Method Stack）
    - 和java栈作用差不多，只不过是为native方法服务的。java线程私有的。

## 内存分配
在了解GC之前，需要先了解一下jvm是怎么分配内存的，然后识别哪些垃圾需要回收，以及用什么方式去回收。

java内存分配和C/C++不同，C每次申请内存都是手动的进行系统调用，这需要一定的开销，而jvm是一次性分配一大块内存，然后每次new的时候都在这块空间上分配和释放。减少系统调用次数，节省了一定的开销，有点类似于线程池的概念。

有了这块空间之后，如何进行分配和回收就和GC有关了。

java的内存申请一般有两种：`静态内存和动态内存`。编译时就能确定大小的就是静态内容，比如int类型变量。动态内存是指在运行期间才能知道大小的，比如java对象。

由于java栈、程序计数器、本地方法栈都是线程私有的，线程生则生，线程灭则灭，这几个区域的内存回收是确定的。但是java堆和方法区则不一样，只有在运行期间才知道创建哪些对象，这部分的内存回收是动态的，一般GC主要是针对这一块。

总之，栈的内存管理是顺序的，而且定长，不存在内存回收问题，堆则是为java动态分配内存，不定长度，所以存在内存分配和回收的问题。

## 垃圾检测、回收算法
GC一般要做两件事，一是检测出垃圾，二是回收垃圾。

### 检测垃圾一般有下面这些方法：
#### 引用计数器
给对象添加一个计数器，每当有人引用他，计数器就加1，引用失效就减1，计数为0时被回收。

不足：当A和B互相引用时，可能会导致无法回收。

#### 可达性分析算法
以根集对象为起点进行搜索，如果对象不可达则回收，跟集一般包括java栈中的引用对象，还有方法区、常量池以及本地方法区中引用的对象。

总之，垃圾回收的时候，会检测所有堆中的对象，没用被引用的对象就会被回收。

### 一般回收算法有如下几种
#### 标记-清除（make-sweep）
算法如名，分为两个阶段：标记 清除。标记所有需要回收的对象，然后统一回收。这是最基础的算法，后续的算法都是基于这个算法扩展的。

不足：效率低，标记清除之后会产生大量碎片，如下图：

![make_sweep](https://kangyonggan.com/upload/20170309052126121.png)

#### 复制
此算法是把内存空间划分为两个相等的区域，每次只使用其中一个区域，当垃圾回收时，遍历当前使用的区域，把正在使用汇总的对象复制到另外一个区域，此算法每次只需要处理正在使用中的对象，
因此复制成本较小，同时，复制过去时还能进行内存整理，不会出现碎片，缺点也很明显，就是需要两倍空间。

![copy](https://kangyonggan.com/upload/20170309052055174.png)

#### 标记-整理（make-compact）
此算法结合了标记清除和复制算法的优点，也是分为两个阶段，第一阶段从跟节点开始标记所有被引用的对象，第二阶段遍历整个堆，清除未标记的对象，并且把存活的对象“压缩”到一块，按顺序排放，此算法避免了碎片问题，同时也避免了两倍空间问题。

![mark_compact](https://kangyonggan.com/upload/20170309052134020.png)

#### 分代收集算法
这是一个商用的垃圾收集算法，不同的对象有不同的生命周期，不同的生命周期采用不同的回收算法，分而治之，因地制宜。比较复杂，这里不多讨论。


'', 1, 0, 1, 0, 0, ''2017-04-11 15:32:13'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''linux下杀死一个进程的常用手段'', ''code'', ''代码片段'', ''
```
ps -ef | grep redis-server | cut -c 9-15 | xargs kill -9
```
'', 0, 0, 1, 0, 0, ''2017-04-11 15:34:45'', ''2017-04-11 16:18:24'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''log4j2的使用和配置'', ''java'', ''Java后台'', ''

## 引入依赖
在`pom.xml`中添加依赖:

```
<log4j2.api.version>2.5</log4j2.api.version>

...

<!--Log4j2-->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
```

<!-- more -->

## 配置
`log4j2.xml`:

1. 异步输出日志，不会影响主线程性能
2. error日志单独输出到error.log文件
3. all.log包含所有级别的日志
4. 每天会备份旧的日志文件，产生新的日志文件
5. 如果一天之中有日志文件超出大小限制(下面配的500M)，会存档当前文件，另外再创建一个新的文件
6. 日志文件只保存近期的（下面配置的30天）

这已经可以满足大部分需求了，如果还不满足，那就再改造吧

```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/test</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
        </Console>
        <RollingRandomAccessFile name="AllFile" fileName="${LOG_HOME}/all.log"
                                 filePattern="${LOG_HOME}/all-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <RollingRandomAccessFile name="ErrorFile" fileName="${LOG_HOME}/error.log"
                                 filePattern="${LOG_HOME}/error-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <Async name="AsyncAll">
            <AppenderRef ref="AllFile"></AppenderRef>
        </Async>
        <Async name="AsyncError">
            <AppenderRef ref="ErrorFile"></AppenderRef>
        </Async>
    </Appenders>

    <Loggers>
        <Root level="debug" additivity="true">
            <AppenderRef ref="Console"></AppenderRef>
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Root>
    </Loggers>
</Configuration>
```

'', 1, 0, 1, 0, 0, ''2017-04-11 15:35:37'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Log4j2省略输出SQL语句SELECT和FROM中间的字段'', ''java'', ''Java后台'', ''

在项目中，起初我们是不打印SQL语句的，后来为了查问题更方便，就打印了SQL。
但是也带来了一些问题，比如查询的字段太多，造成满屏SQL，给查日志造成了一定的影响。
所以我就在想，能不能把`SELECT`和`FROM`中间的字段省略输出呢？

<!-- more -->

## 线上日志中的SQL
```
DEBUG : ==>  Preparing: SELECT serial_no as serialNo,bnk_no as bnkNo ,mer_org_serial_no as merOrgSerialNo,bnk_org_serial_no as bnkOrgSerialNo, mer_date as merDate,mer_time as merTime, mer_org_date as merOrgDate,mer_org_time as merOrgTime ,bnk_org_date as bnkOrgDate,bnk_org_time as bnkOrgTime, last_try_date as lastTryDate,last_try_time as lastTryTime ,last_snd_date as lastSndDate,last_snd_time as lastSndTime, last_qry_serial_no as lastQrySerialNo,last_qry_date as lastQryDate,last_qry_time as lastQryTime, input_date as inputDate,input_time as inputTime,mer_tran_co as merTranCo,bnk_tran_co as bnkTranCo, mer_org_tran_co as merOrgTranCo,bnk_org_tran_co as bankOrgTranCo ,tran_tp as tranTy,syn_flg as synFlg,bat_flg as batFlg, acount as acount,retry_flg as retryFlg,retry_max_time as retryMaxTime ,retry_interval as retryInterval, retry_counter as retryCounter,resnd_flg as resndFlg ,resnd_max_time as resndMaxTime,resnd_interval as resndInterval,resnd_counter as resndCounter, qry_flg as qryFlg,qry_tran_co as qryTranCo,qry_max_time as qryMaxTime,qry_interval as qryInterval, qry_counter as qryCounter,priority as priority,model as model ,product_id as productId,product_tp as productTp,cur_co as currencyCode, amount as amount,fee_amt as feeAmt,tran_purpose as tranPurpose ,tran_remark as tranRemark,ref_app_no as refAppNo, ref_app_kind as refAppKind,rcvr_bnk_no as rcvrBnkNo ,rcvr_acct_no as rcvrAcctNo,rcvr_acct_nm as rcvrAcctNm,rcvr_id_tp as rcvrIdTp,rcvr_id_no as rcvrIdNo, rcvr_province as rcvrProvince,rcvr_city as rcvrCity,rcvr_area_co as rcvrAreaCo,rcvr_area_nm as rcvrAreaNm, rcvr_mer_id as rcvrMerId,rcvr_mer_cert_id as rcvrMerCertId,rcvr_post_id as rcvrPostId ,rcvr_contract_no as rcvrContractNo,rcvr_contract_dt as rcvrContractDt, rcvr_proto_no as rcvrProtoNo,rcvr_mer_user_tp as rcvrMerUserTp,rcvr_mer_user_id as rcvrMerUserId, rcvr_bnk_user_tp as rcvrBnkUserTp,rcvr_bnk_user_id as rcvrBnkUserId,rcvr_resv1 as rcvrResv1, rcvr_resv2 as rcvrResv2,sndr_bnk_no as sndrBankNo,sndr_name as sndrName, sndr_acct_no as sndrAcctNo,sndr_acct_nm as sndrAcctName, sndr_id_tp as sndrIdType,sndr_id_no as sndrIdNo,sndr_province as sndrProvince,sndr_city as sndrCity, sndr_area_co as sndrAreaCode,sndr_area_nm as sndrAreaName,sndr_mer_id as sndrMerId ,sndr_mer_cert_id as sndrMerCertId,sndr_post_id as sndrPostId, sndr_contract_no as sndrContractNo,sndr_contract_dt as sndrContractDate,sndr_proto_no as sndrProtoNo, sndr_mer_user_tp as sndrMerUserType,sndr_mer_user_id as sndrMerUserId ,sndr_bnk_user_tp as sndrBnkUserType,sndr_bnk_user_id as sndrBankUserId, sndr_resv1 as sndrResv1,sndr_resv2 as sndrResv2,lock_st as lockSt,tran_st as tranSt,business_type as businessType, rvrs_st as rvrsSt,product_nm as productName, APP_VERSION as appVersion,APP_SOURCE as appSource, RCVR_BNK_BRANCH_NAME as rcvrBnkBranchName,SNDR_BNK_BRANCH_NAME as sndrBnkBranchName, created_at as insertTimestamp, updated_at as updateTimestamp FROM be_command T WHERE T.REF_APP_NO = ?
```

一大坨SQL占满了整个屏幕，并且日志文件也会变得很大，其实这句SQL有用信息很少:

```
DEBUG : ==>  Preparing: SELECT xxx FROM be_command T WHERE T.REF_APP_NO = ?
```

所以我就想能不能像上面这样输出呢？看下面的demo

## 使用Log4j2的Replace功能
### pom.xml
```
<log4j2.api.version>2.5</log4j2.api.version>

...

<!--Log4j2-->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
```

### log4j2.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/book</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="%replace{%msg}{Preparing: SELECT [w ,]+ FROM be_command}{Preparing: SELECT xxx FROM be_command}%n"/>
        </Console>
    </Appenders>

    <Loggers>
        <Root level="debug" additivity="true">
            <AppenderRef ref="Console"/>
        </Root>
    </Loggers>
</Configuration>
```

### Test.java
```
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @author kangyonggan
 * @since 2017/3/28
 */
public class Test {

    private static Logger log = LogManager.getLogger(Test.class);

    public static void main(String[] args) {
        log.info("DEBUG : ==>  Preparing: SELECT serial_no as serialNo,bnk_no as bnkNo ,mer_org_serial_no as merOrgSerialNo,bnk_org_serial_no as bnkOrgSerialNo, mer_date as merDate,mer_time as merTime, mer_org_date as merOrgDate,mer_org_time as merOrgTime ,bnk_org_date as bnkOrgDate,bnk_org_time as bnkOrgTime, last_try_date as lastTryDate,last_try_time as lastTryTime ,last_snd_date as lastSndDate,last_snd_time as lastSndTime, last_qry_serial_no as lastQrySerialNo,last_qry_date as lastQryDate,last_qry_time as lastQryTime, input_date as inputDate,input_time as inputTime,mer_tran_co as merTranCo,bnk_tran_co as bnkTranCo, mer_org_tran_co as merOrgTranCo,bnk_org_tran_co as bankOrgTranCo ,tran_tp as tranTy,syn_flg as synFlg,bat_flg as batFlg, acount as acount,retry_flg as retryFlg,retry_max_time as retryMaxTime ,retry_interval as retryInterval, retry_counter as retryCounter,resnd_flg as resndFlg ,resnd_max_time as resndMaxTime,resnd_interval as resndInterval,resnd_counter as resndCounter, qry_flg as qryFlg,qry_tran_co as qryTranCo,qry_max_time as qryMaxTime,qry_interval as qryInterval, qry_counter as qryCounter,priority as priority,model as model ,product_id as productId,product_tp as productTp,cur_co as currencyCode, amount as amount,fee_amt as feeAmt,tran_purpose as tranPurpose ,tran_remark as tranRemark,ref_app_no as refAppNo, ref_app_kind as refAppKind,rcvr_bnk_no as rcvrBnkNo ,rcvr_acct_no as rcvrAcctNo,rcvr_acct_nm as rcvrAcctNm,rcvr_id_tp as rcvrIdTp,rcvr_id_no as rcvrIdNo, rcvr_province as rcvrProvince,rcvr_city as rcvrCity,rcvr_area_co as rcvrAreaCo,rcvr_area_nm as rcvrAreaNm, rcvr_mer_id as rcvrMerId,rcvr_mer_cert_id as rcvrMerCertId,rcvr_post_id as rcvrPostId ,rcvr_contract_no as rcvrContractNo,rcvr_contract_dt as rcvrContractDt, rcvr_proto_no as rcvrProtoNo,rcvr_mer_user_tp as rcvrMerUserTp,rcvr_mer_user_id as rcvrMerUserId, rcvr_bnk_user_tp as rcvrBnkUserTp,rcvr_bnk_user_id as rcvrBnkUserId,rcvr_resv1 as rcvrResv1, rcvr_resv2 as rcvrResv2,sndr_bnk_no as sndrBankNo,sndr_name as sndrName, sndr_acct_no as sndrAcctNo,sndr_acct_nm as sndrAcctName, sndr_id_tp as sndrIdType,sndr_id_no as sndrIdNo,sndr_province as sndrProvince,sndr_city as sndrCity, sndr_area_co as sndrAreaCode,sndr_area_nm as sndrAreaName,sndr_mer_id as sndrMerId ,sndr_mer_cert_id as sndrMerCertId,sndr_post_id as sndrPostId, sndr_contract_no as sndrContractNo,sndr_contract_dt as sndrContractDate,sndr_proto_no as sndrProtoNo, sndr_mer_user_tp as sndrMerUserType,sndr_mer_user_id as sndrMerUserId ,sndr_bnk_user_tp as sndrBnkUserType,sndr_bnk_user_id as sndrBankUserId, sndr_resv1 as sndrResv1,sndr_resv2 as sndrResv2,lock_st as lockSt,tran_st as tranSt,business_type as businessType, rvrs_st as rvrsSt,product_nm as productName, APP_VERSION as appVersion,APP_SOURCE as appSource, RCVR_BNK_BRANCH_NAME as rcvrBnkBranchName,SNDR_BNK_BRANCH_NAME as sndrBnkBranchName, created_at as insertTimestamp, updated_at as updateTimestamp FROM be_command T WHERE T.REF_APP_NO = ?");
    }

}
```

### 输出
```
DEBUG : ==>  Preparing: SELECT xxx FROM be_command T WHERE T.REF_APP_NO = ?

Process finished with exit code 0
```


'', 1, 0, 1, 0, 0, ''2017-04-11 15:36:25'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Tomcat8访问软连接目录下的文件'', ''code'', ''代码片段'', ''

### Tomcat7修改context.xml
```
<Context allowLinking="true" ></Context>
```

## Tomcat8修改context.xml
```
<Context>
  <Resources allowLinking="true" ></Resources>
</Context>
```

## 使用软链接

```
ln -s /home/kyg/data/blog/upload/ /home/kyg/install/apache-tomcat-8.5.6-blog/webapps/ROOT/WEB-INF/
```

'', 0, 0, 1, 0, 0, ''2017-04-11 15:37:25'', ''2017-04-11 16:18:24'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''maven一键生成cms项目'', ''other'', ''综合'', ''

由于经常需要搭建一些类似cms这样的系统，如果每次都是手动创建项目，创建模块，拷贝改，无疑是蛋疼的。
所以我需要做一个项目原型，每次需要搭建类似cms系统的时候，只需要一键即可生成！

<!-- more -->

## 系统简介
系统结构如下:

![系统结构](https://kangyonggan.com/upload/cms_1.png)

### 各个模块之间的依赖关系
- `web模块` 依赖 `biz模块`
- `biz模块` 依赖 `service模块`和`dao模块`
- `service模块` 依赖 `model模块`
- `dao模块` 依赖 `model模块`

### 主要技术和框架
- Spring
- SpringMVC
- Mybatis
- autoconfig
- mbg
- shiro
- redis
- dubbo
- mysql
- freemarker
- ace admin ajax
- ftp
- log4j2
- fastjson
- lombok

## 基本功能
由于这只是一个项目原型，以后可能会用于各大场景，所以下面的功能只是一些最基础的。

### 网站
1. 登录
2. 注册
3. 找回密码

### 工作台
1. 系统
    - 用户管理
    - 角色管理
    - 菜单管理
2. 内容
    - 数据字典
    - 缓存管理
    - 内容管理
3. 我的
    - 个人资料

## 原型截图

![登录界面](https://kangyonggan.com/upload/cms_login.png)

![注册界面](https://kangyonggan.com/upload/cms_register.png)

![找回密码界面](https://kangyonggan.com/upload/cms_reset.png)

![个人资料界面](https://kangyonggan.com/upload/cms_profile.png)

![菜单管理界面](https://kangyonggan.com/upload/cms_menu.png)

## 使用方法
1. 拉取项目到本地 `git clone https://github.com/kangyonggan/cms-archetype.git`
2. 编译并安装 `mvn clean install`
3. 一键生成项目 `mvn archetype:generate -DarchetypeGroupId=com.kangyonggan.archetype -DarchetypeArtifactId=cms-archetype -DarchetypeVersion=1.0-SNAPSHOT -DarchetypeCatalog=local`


'', 1, 0, 1, 0, 0, ''2017-04-11 15:39:03'', ''2017-04-11 16:18:12'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Docker-01在ubuntu上安装docker引擎'', ''other'', ''综合'', ''
docker引擎支持Linux、Cloud、Windows和macOS，由于个人精力有限，我不可能一一实验，我选择在Ubuntu14.04上安装，本系列文章是通过学习官方文档整理而来。

> 官方文档:[https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

## 安装要求
- Yakkety 16.10
- Xenial 16.04 (LTS)
- Trusty 14.04 (LTS)✔️

<!-- more -->

我的实验环境是Ubuntu 14.04 LTS, `lsb_release -a`可以查看版本号

```
root@iZ23ldh8kudZ:~# lsb_release -a
No LSB modules are available.
Distributor ID:Ubuntu
Description:Ubuntu 14.04.4 LTS
Release:14.04
Codename:trusty
```

## 推荐安装额外包
`linux-image-extra-*`包，它允许Docker使用存储驱动，一般使用Docker都要安装，除非你有不得不说的理由。

```
root@iZ23ldh8kudZ:~# sudo apt-get update

root@iZ23ldh8kudZ:~# sudo apt-get install -y --no-install-recommends
linux-image-extra-$(uname -r)
linux-image-extra-virtual
```

## 使用镜像库安装Docker
安装Docker的方法有很多，选择一个你需要的即可，我是使用镜像库安装的。

- 配置镜像库安装Docker(大部分用户的选择）✔️
- 下载DEB包安装Docker

第一次在新机器上安装Docker的时候，需要配置镜像库，然后就可以从镜像库安装、更新或降级Docker

### 允许apt通过https使用镜像库
```
root@iZ23ldh8kudZ:~# sudo apt-get install -y --no-install-recommends
apt-transport-https
ca-certificates
curl
software-properties-common
```

### 添加Docker官方公钥
```
root@iZ23ldh8kudZ:~# curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
```

校验公钥`58118E89F3A912897C070ADBF76221572C52609D`:

```
root@iZ23ldh8kudZ:~# apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
/etc/apt/trusted.gpg
--------------------
pub   1024D/437D05B5 2004-09-12
Key fingerprint = 6302 39CC 130E 1A7F D81A  27B1 4097 6EAF 437D 05B5
uid                  Ubuntu Archive Automatic Signing Key <ftpmaster@ubuntu.com>
sub   2048g/79164387 2004-09-12

...
```

### 用下面的命令去稳定你的镜像库
```
root@iZ23ldh8kudZ:~# sudo add-apt-repository
"deb https://apt.dockerproject.org/repo/
ubuntu-$(lsb_release -cs)
main"
```

> `lsb_release -cs`这个子命令返回你的ubuntu系统的代号，如`trusty`

启用测试镜像库。通过编辑`/etc/apt/sources.list`,并在下面这行的最后添加`testing`。
deb https://apt.dockerproject.org/repo/ ubuntu-trusty main
添加后:
deb https://apt.dockerproject.org/repo/ ubuntu-trusty main testing

## 安装Docker
### 更新`apt`包
```
root@iZ23ldh8kudZ:~# sudo apt-get update
```

### 安装最新版docker，或者在下一步安装指定版本的
用下面的命令安装最新版

```
root@iZ23ldh8kudZ:~# sudo apt-get -y install docker-engine
```

### 在生产机器，你需要安装指定版本的docker，不要总是使用最新版，下面的命令列出了所有可用版本
```
root@iZ23ldh8kudZ:~# apt-cache madison docker-engine
docker-engine | 17.03.0~ce~rc1-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/testing amd64 Packages
docker-engine | 1.13.1-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/main amd64 Packages
docker-engine | 1.13.1~rc2-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/testing amd64 Packages
docker-engine | 1.13.1~rc1-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/testing amd64 Packages

...
```
每行的第二列是版本号，第三列是镜像库名，然后选择一个指定的版本进行安装。

```
root@iZ23ldh8kudZ:~# sudo apt-get -y install docker-engine=<版本号>
```

### 运行`Hello World`来检验是否安装正确
```
root@iZ23ldh8kudZ:~# sudo docker run hello-world
```

运行后报错了:

```
Unable to find image ''''hello-world:latest'''' locally
latest: Pulling from library/hello-world
78445dd45222: Pull complete
docker: error pulling image configuration: Get https://registry-1.docker.io/v2/library/hello-world/blobs/sha256:48b5124b2768d2b917edcb640435044a97967015485e812545546cbed5cf0233: net/http: TLS handshake timeout.
See ''''docker run --help''''.
```

重启docker服务:

```
root@iZ23ldh8kudZ:~# service docker restart
docker stop/waiting
docker start/running, process 18050
```

再次运行:

```
root@iZ23ldh8kudZ:~# docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```
'', 1, 0, 1, 0, 0, ''2017-04-11 15:39:56'', ''2017-04-11 16:18:12'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Docker-02学习docker基础知识'', ''other'', ''综合'', ''

> 官方文档:[https://docs.docker.com/engine/getstarted/](https://docs.docker.com/engine/getstarted/)

## 将会学到
- 怎么在docker容器中运行软件镜像
- 怎么Docker Hub上浏览软件镜像
- 怎么创建自己的镜像并运行在容器中
- 怎么创建自己的Docker Hub账户和镜像库
- 怎么创建一个镜像
- 上传你的镜像到Docker Hub给其他人使用

<!-- more -->

## 理解镜像和容器
Docker引擎提供的核心技术是镜像和容器。
`docker run hello-world`这条命令由下面三部分组成:

![container_explainer.png](https://kangyonggan.com/upload/20170223100628926.png)
镜像是文件系统和运行时技术。它没有状态也永远不会改变。一个容器就是一个运行中的镜像实例。当你执行hello-world命令，docker引擎：

- 校验你是否有hello-world镜像
- 从docker hub下载镜像
- 把镜像加载进容器中并且运行

'', 1, 0, 1, 0, 0, ''2017-04-11 15:45:01'', ''2017-04-11 16:18:12'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Docker-03查找并运行镜像image'', ''other'', ''综合'', ''


> 官方文档:[https://docs.docker.com/engine/getstarted/step_three/](https://docs.docker.com/engine/getstarted/step_three/)

Docker Hub上存放着全世界的docker镜像，我们可以浏览、下载并运行镜像。

## 定位whalesay镜像
### 打开浏览器，浏览[Docker Hub](https://hub.docker.com/)
![browse_and_search](https://kangyonggan.com/upload/20170223110047136.png)

Docker Hub上的镜像包含了个人（比如我）、官方和一些组织的，比如：RedHat, IBM, Google等。

<!-- more -->

### 搜索关键词`whalesay`
![image_found](https://kangyonggan.com/upload/20170223110047137.png)

### 在结果页点击`docker/whalesay`镜像
浏览器会跳转到whalesay镜像库界面。

![whale_repo](https://kangyonggan.com/upload/20170223110047137.png)

每个镜像库都包含镜像的信息，比如：镜像的分类是什么？怎么使用镜像？

### 运行`whalesay`镜像
#### 执行命令
```
root@iZ23ldh8kudZ:~# docker run docker/whalesay cowsay boo
Unable to find image ''''docker/whalesay:latest'''' locally
latest: Pulling from docker/whalesay
e190868d63f8: Pull complete
909cd34c6fd7: Pull complete
0b9bfabab7c1: Pull complete
a3ed95caeb02: Pull complete
00bf65475aba: Pull complete
c57b6bcc83e3: Pull complete
8978f6879e2f: Pull complete
8eed3712d2cf: Pull complete
Digest: sha256:178598e51a26abbc958b8a2e48825c90bc22e641de3d31e18aaf55f3258ba93b
Status: Downloaded newer image for docker/whalesay:latest

```

第一次运行可能会比较慢，大概需要一分钟左右，需耐心等待，之所以第一次运行较慢，是因为本地仓库没有此镜像，需要去Docker Hub下载。

#### 运行`docker images`命令，查看本地仓库的所有镜像,就会发现`whalesay`镜像已经被下载到本地了。
```
root@iZ23ldh8kudZ:~# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay     latest              6b362a9f73eb        21 months ago       247 MB
```

当你在容器中运行一个镜像，Docker会把镜像下载到你本地，本地的副本会为你下次运行节省时间。当且仅当Docker Hub上的镜像来源发生改变时，Docker才会去重新下载。你也可以手动删除本地镜像。

#### 再次运行`whalesay`镜像
```
root@iZ23ldh8kudZ:~# docker run docker/whalesay cowsay boo-boo

```

'', 1, 0, 1, 0, 0, ''2017-04-11 15:45:59'', ''2017-04-11 16:18:12'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Docker-04构建一个自己的镜像'', ''other'', ''综合'', ''


> 官方文档:[https://docs.docker.com/engine/getstarted/step_four/](https://docs.docker.com/engine/getstarted/step_four/)

## 编写一个Dockerfile
你可以使用你喜欢的编辑器写一个简单的[Dockerfile](https://docs.docker.com/engine/reference/builder/), Dockerfile就是用来描述构建镜像的文件、环境和命令的清单，Dockerfile越小越好。

### 创建一个新的目录
```
root@iZ23ldh8kudZ:~/code# mkdir mydockerbuild
```

<!-- more -->

### 进入这个新的目录
```
root@iZ23ldh8kudZ:~/code# cd mydockerbuild
root@iZ23ldh8kudZ:~/code/mydockerbuild# pwd
/root/code/mydockerbuild
```

### 在当前目录创建文件Dockerfile
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# vi Dockerfile
```

### 把FROM代码段写入文件
查看写入后的文件:

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# cat Dockerfile
FROM docker/whalesay:latest
```

`FROM`关键字告诉Docker我将以哪个镜像为基础。Whalesay是完美的，它已经有了cowsay程序，所以我们从它开始。

### 把RUN代码段写入镜像
查看写入后的文件:

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# cat Dockerfile
FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
```

`RUN`关键字会安装镜像所需要的程序。whalesay镜像是基于Ubuntu的，所以它使用`apt-get`去安装所需要的包，这两个命令是请求此镜像可用的包，并且把fortunes程序安装到镜像，fortunes程序会打印出屋面所说的内容。


### 把CMD代码段写入镜像
查看写入后的文件:

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# cat Dockerfile
FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
CMD /usr/games/fortune -a | cowsay
```

`CMD`关键字告诉镜像当环境设置完成后运行最后的命令，这个命令是`fortune -a`，并且输出到`cowsay`命令。

## 从Dockerfile构建镜像
编译镜像使用的命令是`docker build`，参数`-t`是给镜像一个标签, 不要忽略了`.`，它会告诉`docker build`命令去当前目录下查找`Dockerfile`文件。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker build -t docker-whale .
Sending build context to Docker daemon 2.048 kB
Step 1/3 : FROM docker/whalesay:latest
 ---> 6b362a9f73eb
Step 2/3 : RUN apt-get -y update && apt-get install -y fortunes
 ---> Running in e7673f725ff2

...

Successfully built efb18db73358
```

第一次运行时有点慢，大概一分钟左右，此间它会去下载所需要的包，会输出很多看不懂的信息。

## 学习构建的过程
构建镜像的命令`docker build -t docker-whale .`，会在当前目录下读取`Dockerfile`文件，并在本地机器上一步一步的按照指令构建一个叫作`docker-whale`的镜像，构建需要一些时间，也会输出很多信息，下面来解析输出信息的意思。

### Docker检测以确保所有需要构建的都准备好了
```
Sending build context to Docker daemon 2.048 kB
```

### 检测依赖的基础镜像
```
Step 1/3 : FROM docker/whalesay:latest
 ---> 6b362a9f73eb
```

上面的输出信息对应的代码块是`FROM`, 如果本地没有whalesay镜像，则去Docker Hub下载，如果有，那就使用本地的whalesay镜像。

### Docker启动一个临时的容器去运行`whalesay`
在这个临时的容器中，Docker会运行Dockerfile中的下一行命令，即`RUN apt-get -y update && apt-get install -y fortunes`, 这个命令是去安装`fortunes`命令，此过程中输出了大量的信息。

```
Step 2/3 : RUN apt-get -y update && apt-get install -y fortunes
 ---> Running in e7673f725ff2
Ign http://archive.ubuntu.com trusty InRelease
Get:1 http://archive.ubuntu.com trusty-updates InRelease [65.9 kB]
Get:2 http://archive.ubuntu.com trusty-security InRelease [65.9 kB]
Hit http://archive.ubuntu.com trusty Release.gpg
Get:3 http://archive.ubuntu.com trusty-updates/main Sources [485 kB]
Get:4 http://archive.ubuntu.com trusty-updates/restricted Sources [5957 B]
Get:5 http://archive.ubuntu.com trusty-updates/universe Sources [220 kB]
Get:6 http://archive.ubuntu.com trusty-updates/main amd64 Packages [1197 kB]
Get:7 http://archive.ubuntu.com trusty-updates/restricted amd64 Packages [20.4 kB]
Get:8 http://archive.ubuntu.com trusty-updates/universe amd64 Packages [516 kB]
Get:9 http://archive.ubuntu.com trusty-security/main Sources [160 kB]
Get:10 http://archive.ubuntu.com trusty-security/restricted Sources [4667 B]
Get:11 http://archive.ubuntu.com trusty-security/universe Sources [59.4 kB]
Get:12 http://archive.ubuntu.com trusty-security/main amd64 Packages [730 kB]
Get:13 http://archive.ubuntu.com trusty-security/restricted amd64 Packages [17.0 kB]
Get:14 http://archive.ubuntu.com trusty-security/universe amd64 Packages [199 kB]
Hit http://archive.ubuntu.com trusty Release
Hit http://archive.ubuntu.com trusty/main Sources
Hit http://archive.ubuntu.com trusty/restricted Sources
Hit http://archive.ubuntu.com trusty/universe Sources
Hit http://archive.ubuntu.com trusty/main amd64 Packages
Hit http://archive.ubuntu.com trusty/restricted amd64 Packages
Hit http://archive.ubuntu.com trusty/universe amd64 Packages
Fetched 3745 kB in 43s (87.0 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following extra packages will be installed:
  fortune-mod fortunes-min librecode0
Suggested packages:
  x11-utils bsdmainutils
The following NEW packages will be installed:
  fortune-mod fortunes fortunes-min librecode0
0 upgraded, 4 newly installed, 0 to remove and 92 not upgraded.
Need to get 1961 kB of archives.
After this operation, 4817 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu/ trusty/main librecode0 amd64 3.6-21 [771 kB]
Get:2 http://archive.ubuntu.com/ubuntu/ trusty/universe fortune-mod amd64 1:1.99.1-7 [39.5 kB]
Get:3 http://archive.ubuntu.com/ubuntu/ trusty/universe fortunes-min all 1:1.99.1-7 [61.8 kB]
Get:4 http://archive.ubuntu.com/ubuntu/ trusty/universe fortunes all 1:1.99.1-7 [1089 kB]
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin:
Fetched 1961 kB in 4s (466 kB/s)
Selecting previously unselected package librecode0:amd64.
(Reading database ... 13116 files and directories currently installed.)
Preparing to unpack .../librecode0_3.6-21_amd64.deb ...
Unpacking librecode0:amd64 (3.6-21) ...
Selecting previously unselected package fortune-mod.
Preparing to unpack .../fortune-mod_1%3a1.99.1-7_amd64.deb ...
Unpacking fortune-mod (1:1.99.1-7) ...
Selecting previously unselected package fortunes-min.
Preparing to unpack .../fortunes-min_1%3a1.99.1-7_all.deb ...
Unpacking fortunes-min (1:1.99.1-7) ...
Selecting previously unselected package fortunes.
Preparing to unpack .../fortunes_1%3a1.99.1-7_all.deb ...
Unpacking fortunes (1:1.99.1-7) ...
Setting up librecode0:amd64 (3.6-21) ...
Setting up fortune-mod (1:1.99.1-7) ...
Setting up fortunes-min (1:1.99.1-7) ...
Setting up fortunes (1:1.99.1-7) ...
Processing triggers for libc-bin (2.19-0ubuntu6.6) ...
 ---> 785085e9a520
Removing intermediate container e7673f725ff2
```

当`RUN`命令运行结束后，一个新的`layer`就会立即产生，并且销毁临时容器。

### 一个新的临时容器产生，并且Docker会添加layer，对应于Dockerfile中的CMD命令, 最后再销毁临时容器。
```
Step 3/3 : CMD /usr/games/fortune -a | cowsay
 ---> Using cache
 ---> efb18db73358
Successfully built efb18db73358
```

## 运行镜像
现在，校验这个新镜像是否在本地存在，并且去运行它。

### 用docker images命令查看本地镜像
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
docker-whale        latest              efb18db73358        31 minutes ago      275 MB
hello-world         latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay     latest              6b362a9f73eb        21 months ago       247 MB
```

### 运行新镜像docker run docker-whale
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker run docker-whale

```

运行时，你会发现Docker并没有去再下载任何东西，因为镜像已经在本地构建了。

### 好不容易构建好了，再运行一次
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker run docker-whale

```

你会发现，输出竟然不一样了，好像它有自己的思维，那你就多运行几次看看吧。



'', 1, 0, 1, 0, 0, ''2017-04-11 15:52:37'', ''2017-04-11 16:18:12'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Docker-05创建一个DockerHub账号和镜像库repository'', ''other'', ''综合'', ''


> 官方文档:[https://docs.docker.com/engine/getstarted/step_five/](https://docs.docker.com/engine/getstarted/step_five/)

如果你想把你的镜像分享给世界各地的其他人使用，那么你需要在Docker Hub注册一个账号。

<!-- more -->

## 注册一个账号
### 在浏览器中打开Docker Hub的[注册界面](https://hub.docker.com/register/)
![hub_signup](https://kangyonggan.com/upload/20170223142740524.png)

### 输入用户名、邮箱和密码即可注册

## 校验邮箱并创建镜像
![email_verify.png](https://kangyonggan.com/upload/20170223142740523.png)
![new_resp.png](https://kangyonggan.com/upload/20170223142740524.png)






'', 0, 0, 1, 0, 0, ''2017-04-11 15:53:17'', ''2017-04-11 16:18:12'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Docker-06推送push和拉取pull镜像'', ''other'', ''综合'', ''

> 官方文档:[https://docs.docker.com/engine/getstarted/step_six/](https://docs.docker.com/engine/getstarted/step_six/)

推送本地镜像到Docker Hub上你的镜像库中，然后再镜像从镜像库中拉取到本地，并运行它。

## 推送镜像到镜像库
### 查看本地所有镜像
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
docker-whale        latest              efb18db73358        About an hour ago   275 MB
hello-world         latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay     latest              6b362a9f73eb        21 months ago       247 MB
```

<!-- more -->

### 找到镜像ID
以`docker-whale`镜像为例，它的镜像ID是`efb18db73358`

> 现在, docker-whale镜像还没有命名空间， 你需要关联一个命名空间， 命名空间就是你的Docker Hub账户名（我的是kangyonggan, 然后给镜像名添加命名空间，比如: kangyonggan/docker-whale

### 用`docker tag`命令给镜像添加标签（命名空间）
![tagger](https://kangyonggan.com/upload/20170223153853566.png)

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker tag efb18db73358 kangyonggan/docker-whale:latest
```

#### 再次运行docker images会发现镜像已经有了标签
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
docker-whale               latest              efb18db73358        About an hour ago   275 MB
kangyonggan/docker-whale   latest              efb18db73358        About an hour ago   275 MB
hello-world                latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay            latest              6b362a9f73eb        21 months ago       247 MB
```

还会发现，相同的镜像ID存在于两个不同的镜像库。

### 登录Docker Hub
在最终把镜像推送到Docker Hub上之前，你需要登录Docker Hub。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don''''t have a Docker ID, head over to https://hub.docker.com to create one.
Username: kangyonggan
Password:
Login Succeeded
```

### 把镜像推送到自己的Docker Hub上
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker push kangyonggan/docker-whale
The push refers to a repository [docker.io/kangyonggan/docker-whale]
4d8b662d1a5a: Pushing [========>                                          ] 5.001 MB/28.13 MB
5f70bf18a086: Mounted from docker/whalesay
d061ee1340ec: Mounted from docker/whalesay
d511ed9e12e1: Mounted from docker/whalesay
091abc5148e4: Mounted from docker/whalesay
b26122d57afa: Mounted from docker/whalesay
37ee47034d9b: Mounted from docker/whalesay
528c8710fd95: Mounted from docker/whalesay
1154ba695078: Mounted from docker/whalesay
```

网速有点慢(目测要翻墙才能快)，才推送了5/28M。

### 登录Docker Hub查看新推送的镜像
![resp_list.png](https://kangyonggan.com/upload/20170223154255805.png)

由于网速太慢（怀疑是官网太慢），截图的时候还没推送完成。

## 从镜像库拉取镜像
`docker pull`是用来拉取镜像的，如果本地已经有最新版的镜像，`docker pull`命令将什么也不做，为了验证是真正的从镜像库中拉取下来的，你可以先删除本地镜像`docker image remove`。

### 用docker image remove删除本地镜像
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
docker-whale2              latest              efb18db73358        2 hours ago         275 MB
docker-whale               latest              efb18db73358        2 hours ago         275 MB
kangyonggan/docker-whale   latest              efb18db73358        2 hours ago         275 MB
hello-world                latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay            latest              6b362a9f73eb        21 months ago       247 MB

root@iZ23ldh8kudZ:~/code/mydockerbuild# docker image remove efb18db73358
Error response from daemon: conflict: unable to delete efb18db73358 (must be forced) - image is referenced in multiple repositories
```

通过镜像ID删除一个本地镜像，可能会报错，如果此时你又两个ID一样的镜像，另外也可以通过镜像标签删除镜像。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker image remove docker-whale2
Untagged: docker-whale2:latest

root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
docker-whale               latest              efb18db73358        2 hours ago         275 MB
kangyonggan/docker-whale   latest              efb18db73358        2 hours ago         275 MB
hello-world                latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay            latest              6b362a9f73eb        21 months ago       247 MB
```

### 用docker run命令从Docker Hub拉取镜像，当你本地没这个镜像的时候。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker run kangyonggan/docker-whale
```

---

更多用法请移步:[https://docs.docker.com/engine/getstarted/last_page/](https://docs.docker.com/engine/getstarted/last_page/)





'', 1, 0, 1, 0, 0, ''2017-04-11 15:54:20'', ''2017-04-11 16:18:12'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Mybatis Generator集成MapperPlugin、LombokPlugin和SerializablePlugin'', ''java'', ''Java后台'', ''

## MBG集成MapperPlugin、LombokPlugin和SerializablePlugin
可以生成的持久层代码:

- 生成BeanMapper.java
- 生成BeanMapper.xml
- 生成Bean.java

### 特点
- 生成的Mapper.java继承了MyMapper.java(所有单表的crud全部不用写SQL)
- 实体bean拥有@Data注解（免去写getter、setter和toString的烦恼）
- 实体bean实现Serializable接口，可以放心的放入Redis缓存或传输如分布式系统间（如:dubbo）

<!-- more -->

> 坑：生成的Mapper.java，默认不带注解`@Repository`，如果你又没用spring扫描mapper包， 在运行时会报错，是运行时而不是启动时。

### 引入依赖和插件
`pom.xml`中的配置:

```
<plugin.mybatis-generator.version>1.3.2</plugin.mybatis-generator.version>
<mybatis-generator.version>1.3.2</mybatis-generator.version>
<mybatis-mapper.version>3.3.8</mybatis-mapper.version>
<lombok.version>1.16.8</lombok.version>

...

<!--MBG plugin-->
<plugin>
    <groupId>org.mybatis.generator</groupId>
    <artifactId>mybatis-generator-maven-plugin</artifactId>
    <version>${plugin.mybatis-generator.version}</version>
    <configuration>
        <verbose>true</verbose>
        <overwrite>true</overwrite>
    </configuration>
    <dependencies>
        <dependency>
            <groupId>${project.groupId}</groupId>
            <artifactId>api-dao</artifactId>
            <version>${project.version}</version>
        </dependency>
    </dependencies>
</plugin>

<dependency>
    <groupId>org.mybatis.generator</groupId>
    <artifactId>mybatis-generator-core</artifactId>
    <version>${mybatis-generator.version}</version>
    <scope>compile</scope>
    <optional>true</optional>
</dependency>
<dependency>
    <groupId>tk.mybatis</groupId>
    <artifactId>mapper</artifactId>
    <version>${mybatis-mapper.version}</version>
</dependency>

<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>${lombok.version}</version>
    <scope>provided</scope>
</dependency>
```

> 提示：MBG插件之所以依赖dao, 是因为我在插件中使用了dao中的两个类,下面有。

### 代码和插件配置

`MyMapper.java`

```
package com.kangyonggan.api.mapper;

import org.springframework.stereotype.Component;
import tk.mybatis.mapper.common.ConditionMapper;
import tk.mybatis.mapper.common.ExampleMapper;
import tk.mybatis.mapper.common.SqlServerMapper;
import tk.mybatis.mapper.common.base.BaseDeleteMapper;
import tk.mybatis.mapper.common.base.BaseSelectMapper;
import tk.mybatis.mapper.common.base.BaseUpdateMapper;

/**
 * @author kangyonggan
 * @since 16/5/12
 */
@Component
public interface MyMapper<T> extends
        BaseSelectMapper<T>,
        BaseUpdateMapper<T>,
        BaseDeleteMapper<T>,
        ExampleMapper<T>,
        ConditionMapper<T>,
        SqlServerMapper<T> {
}
```

`LombokPlugin.java`

```
package com.kangyonggan.api.mapper.util;

import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.api.dom.java.Method;
import org.mybatis.generator.api.dom.java.TopLevelClass;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/5/12
 */
public class LombokPlugin extends PluginAdapter {
    private FullyQualifiedJavaType dataAnnotation = new FullyQualifiedJavaType("lombok.Data");

    public boolean validate(List<String> warnings) {
        return true;
    }

    public boolean modelBaseRecordClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        this.addDataAnnotation(topLevelClass);
        return true;
    }

    public boolean modelPrimaryKeyClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        this.addDataAnnotation(topLevelClass);
        return true;
    }

    public boolean modelRecordWithBLOBsClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        this.addDataAnnotation(topLevelClass);
        return true;
    }

    public boolean modelGetterMethodGenerated(Method method, TopLevelClass topLevelClass, IntrospectedColumn introspectedColumn, IntrospectedTable introspectedTable, ModelClassType modelClassType) {
        return false;
    }

    public boolean modelSetterMethodGenerated(Method method, TopLevelClass topLevelClass, IntrospectedColumn introspectedColumn, IntrospectedTable introspectedTable, ModelClassType modelClassType) {
        return false;
    }

    protected void addDataAnnotation(TopLevelClass topLevelClass) {
        topLevelClass.addImportedType(this.dataAnnotation);
        topLevelClass.addAnnotation("@Data");
    }
}
```

配置插件`generatorConfig.xml`, 插件放在dao模块的`src/main/resources`目录下即可

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE generatorConfiguration PUBLIC
        "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <context id="sqlContext" targetRuntime="MyBatis3Simple" defaultModelType="flat">

        <property name="beginningDelimiter" value="`"></property>
        <property name="endingDelimiter" value="`"></property>

        <!--base mapper-->
        <plugin type="tk.mybatis.mapper.generator.MapperPlugin">
            <property name="mappers" value="com.kangyonggan.api.mapper.MyMapper"></property>
        </plugin>

        <!--serialize plugin-->
        <plugin type="org.mybatis.generator.plugins.SerializablePlugin"></plugin>

        <!--lombok plugin-->
        <plugin type="com.kangyonggan.api.mapper.util.LombokPlugin"></plugin>

        <!--jdbc driver-->
        <jdbcConnection driverClass="com.mysql.jdbc.Driver"
                        connectionURL="jdbc:mysql://127.0.0.1:3306/api"
                        userId="root" password="123456"></jdbcConnection>

        <!--Xxx.java-->
        <javaModelGenerator targetPackage="com.kangyonggan.api.model.vo"
                            targetProject="../api-model/src/main/java">
            <property name="enableSubPackages" value="true"></property>
            <property name="trimStrings" value="true"></property>
        </javaModelGenerator>

        <!--XxxMapper.xml-->
        <sqlMapGenerator targetPackage="mapper" targetProject="src/main/resources">
            <property name="enableSubPackages" value="true"></property>
        </sqlMapGenerator>

        <!--XxxMapper.java-->
        <javaClientGenerator type="XMLMAPPER" targetPackage="com.kangyonggan.api.mapper"
                             targetProject="src/main/java">
            <property name="enableSubPackages" value="true"></property>
        </javaClientGenerator>

        <!--table name-->
        <table tableName="table_name">
            <generatedKey column="id" sqlStatement="Mysql" identity="true"></generatedKey>
        </table>
    </context>
</generatorConfiguration>
```

### 使用
1. 在项目跟目录下`mvn clean install`, 目的是打包`xxx-dao.jar`，好让插件去依赖
2. 使用 IntelliJ IDEA的，请参考下图(两步), 其他工具我不用，请自行摸索

![使用说明](https://kangyonggan.com/upload/20170105191303945.png)

> 温馨提示：以上配置是我个人配置，请勿直接使用，使用前请自行改造。






'', 1, 0, 1, 0, 0, ''2017-04-11 15:55:37'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''MySQL5.6主从复制的配置'', ''db'', ''数据库'', ''

## 实验环境
1. 主库机器IP: `10.10.10.248`
2. 从库机器IP: `10.10.10.166`
3. 数据库版本: `Mysql 5.6`
4. 操作系统: `Ubuntu 14.04`

<!-- more -->

## 配置主库
### 修改`/etc/mysql/my.cfg`配置，在`[mysqld]`下面添加：

```
log-bin=mysql-bin

server-id=1

```

保存后重启mysql:

```
sudo /etc/init.d/mysql restart
```

### 创建一个用户，并授权给从服务器
登录mysql

```
mysql -uroot -p
```

创建用户`kyg`并授权给从服务器:

```
grant replication slave on *.* to ''''kyg''''@''''10.10.10.166'''' identified by ''''kyg'''';
```

![master](https://kangyonggan.com/upload/20170101145536544.png)

最后别忘了刷新权限:

```
flush privileges;
```

### 查看主库状态
```
show master status;
```

记录下`File`和`Position`的值，后面配置从库时会用到

![master-status](https://kangyonggan.com/upload/20170101145208095.png)

## 配置从库
### 修改`/etc/mysql/my.cfg`配置，在`[mysqld]`下面添加：
```
server-id=2
```

保存后重启mysql:

```
sudo /etc/init.d/mysql restart
```

## 登录mysql，并配置相关参数:

```
change master to
master_host = ''''10.10.10.248'''',
master_user = ''''kyg'''',
master_password = ''''kyg'''',
master_log_file = ''''mysql-bin.000004'''',
master_log_pos = 120;
```

查看从库状态

```
show slave status G;
```

会发现从库还没开启复制

![slave-status1](https://kangyonggan.com/upload/20170101145456162.png)

这时候就需要开启从库的复制功能`start slave;`

![slave-status2](https://kangyonggan.com/upload/20170101145208097.png)

上面的截图再往下滚动， 可能会看见报错:

```
error connecting to master ''''kyg@10.10.10.248:3306'''' - retry-time: 60  retries: 7
```

这是由于主库配置了`bind-address:127.0.0.1`, 为了简单，我直接把这一行配置注释了(有安全隐患)

停止从库的复制功能:

```
stop slave
```

## 测试
### 在主库创建一个数据库`blog`
然后在从库中查看所有数据库

```
show databases;
```

![show-db](https://kangyonggan.com/upload/20170101145208096.png)

会发现从库从主库中复制了一个数据库, 实验已经成功，其他CRUD请自行实验





'', 1, 0, 1, 0, 0, ''2017-04-11 15:57:27'', ''2017-04-11 16:18:03'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''MySQL报错：数据库结构错误'', ''db'', ''数据库'', ''

> ERROR 1682 (HY000): Native table ''''performance_schema''''.''''session_variables'''' has the wrong structure

## 重启MySQL
重启MySQL后还是报同样的错。

## 重启电脑
重启电脑后还是报同样的错。

## 谷歌搜一下
需要更新MySQL：

```
mysql_upgrade -u root -p
```

<!-- more -->

输出信息如下:

```
kangyonggandeMacBook-Pro:~ kyg$ mysql_upgrade -u root -p
Enter password:
Checking if update is needed.
Checking server version.
Running queries to upgrade MySQL server.
Checking system database.
mysql.columns_priv                                 OK
mysql.db                                           OK
mysql.engine_cost                                  OK
mysql.event                                        OK
mysql.func                                         OK
mysql.general_log                                  OK
mysql.gtid_executed                                OK
mysql.help_category                                OK
mysql.help_keyword                                 OK
mysql.help_relation                                OK
mysql.help_topic                                   OK
mysql.innodb_index_stats                           OK
mysql.innodb_table_stats                           OK
mysql.ndb_binlog_index                             OK
mysql.plugin                                       OK
mysql.proc                                         OK
mysql.procs_priv                                   OK
mysql.proxies_priv                                 OK
mysql.server_cost                                  OK
mysql.servers                                      OK
mysql.slave_master_info                            OK
mysql.slave_relay_log_info                         OK
mysql.slave_worker_info                            OK
mysql.slow_log                                     OK
mysql.tables_priv                                  OK
mysql.time_zone                                    OK
mysql.time_zone_leap_second                        OK
mysql.time_zone_name                               OK
mysql.time_zone_transition                         OK
mysql.time_zone_transition_type                    OK
mysql.user                                         OK
The sys schema is already up to date (version 1.5.1).
Checking databases.
simconf.user_role                                  OK
simulator.bank_channel                             OK
simulator.bank_command                             OK
simulator.bank_command_log                         OK
simulator.bank_resp                                OK
simulator.bank_tran                                OK
simulator.dz_file                                  OK
simulator.menu                                     OK
simulator.role                                     OK
simulator.role_menu                                OK
simulator.sim_order                                OK
simulator.user                                     OK
simulator.user_role                                OK
sys.sys_config                                     OK
Upgrade process completed successfully.
Could not create the upgrade info file ''''/usr/local/mysql/data/mysql_upgrade_info'''' in the MySQL Servers datadir, errno: 13
kangyonggandeMacBook-Pro:~ kyg$
```

报错说是不能创建文件，可能是权限不足吧，于是

```
sudo mysql_upgrade -u root -p
```

输出:

```
...省略...
Upgrade process completed successfully.
Checking if update is needed.
```

这次没报错以为成功了，然后就测试了一把，发现还是报同样的错。

## 再次重启MySQL
测试后发现不报错了。

> 问题是小问题，如果之前遇到过此类问题可以一步解决，但是如果没遇到过，就需要按部就班的去解决了。



'', 1, 0, 1, 0, 0, ''2017-04-11 15:59:33'', ''2017-04-11 16:18:03'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''MySQL数据库定时备份'', ''db'', ''数据库'', ''

## 创建备份脚本
创建`.bak.sh`, 内容为:

```

today=`date +%Y%m%d`

mysqldump -uroot -p123456 blog > /home/kyg/bak/blog-bak-$today.sql

scp /home/kyg/bak/blog-bak-$today.sql root@121.40.66.176:/root/bak/
```

<!-- more -->

> 其中，备份到远程时，用到了免密登录，请参考我的另一篇博客

## 定时执行
定时执行用的是linux下自带的`crontab`命令

`crontab -l` 查看任务

`crontab -e` 编辑任务

我设置的是，每天凌晨3点执行备份:

```
0 3 * * * sh /home/kyg/.bak.sh
```



'', 1, 0, 1, 0, 0, ''2017-04-11 16:00:37'', ''2017-04-11 16:18:03'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''MySQL读写分离的实现'', ''java'', ''Java后台'', ''

## 实验环境
1. 主库:192.168.2.108:3306/kyg
2. 从库1:192.168.2.113:3306/kyg
3. 从库2:192.168.2.103:3306/kyg

<!-- more -->

## 实验目的
1. 写数据时使用主库
2. 读数据时使用从库

## 实现方案
使用MySQL自身提供的一个驱动`com.mysql.jdbc.ReplicationDriver`来实现读写分离。
如果一个方法是只读的，那么ReplicationDriver就会为你选择从库读取数据，反之就会选择主库进行读写。
可以结合SpringAop配置事物的读写：

```
<tx:advice id="transactionAdvice" transaction-manager="transactionManager">
    <tx:attributes>
        <tx:method name="delete*" propagation="REQUIRED"></tx:method>
        <tx:method name="update*" propagation="REQUIRED"></tx:method>
        <tx:method name="save*" propagation="REQUIRED"></tx:method>
        <tx:method name="remove*" propagation="REQUIRED"></tx:method>

        <tx:method name="search*" read-only="true" propagation="REQUIRED"></tx:method>
        <tx:method name="find*" read-only="true" propagation="REQUIRED"></tx:method>
        <tx:method name="get*" read-only="true" propagation="REQUIRED"></tx:method>
        <tx:method name="*" read-only="true" propagation="REQUIRED"></tx:method>
    </tx:attributes>
</tx:advice>
```

jdbc的配置:

```
blog.jdbc.driver     = com.mysql.jdbc.Driver
blog.jdbc.password   = abc
blog.jdbc.url        = jdbc:mysql:replication://192.168.2.108:3306,192.168.2.113:3306,192.168.2.103:3306/kyg
blog.jdbc.username   = abc
```

## 观察日志

![走主库](https://kangyonggan.com/upload/20170107152930664.png)

![走从库](https://kangyonggan.com/upload/20170107152931258.png)



'', 1, 0, 1, 0, 0, ''2017-04-11 16:01:23'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''nginx做负载均衡遇到session共享的问题'', ''linux'', ''系统运维'', ''

## 常见的解决方案有:
### 不使用session，换用cookie
- 简单方便对服务器无压力
- 如果客户端把cookie禁掉了的话，那么session就无法同步了
- cookie的安全性不高，虽然它已经加了密，但是还是可以伪造的

### session存在数据库
- 会加大数据库的IO，增加数据库的负担
- 数据库读写速度较慢，不利于session的适时同步

<!-- more -->

### session存在memcache或者Redis中
- 不会加大数据库的负担
- 并且安全性比用cookie大大的提高
- 把session放到内存里面，比从文件中读取要快很多
- 但偶尔会因网络较慢而出现掉线

### 使用nginx中的ip_hash技术
- 能够将某个ip的请求定向到同一台后端
- nginx不是最前端的服务器的时候，就跪了，因为转发到nginx的ip是不变的
- nginx不是最后端的服务器的时候，也得跪

> 我个人的情况比较适合选择方案3+4

## 配置如下
```
upstream kyg.com {
        server  42.196.156.22:8088;
        server  42.196.156.22:18088;
        server  42.196.156.22:28088;
        ip_hash;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
                proxy_pass http://kyg.com;
        }

        # 设定访问静态文件直接读取不经过tomcat
        location ^~ /static/ {
                proxy_pass http://kyg.com;
                root /WEB-INF/static/;
        }
}
```

就是在`upstream`下面加了`ip_hash;`配置

> 集群在设计之初最好设计成无状态的

'', 0, 0, 1, 0, 0, ''2017-04-11 16:02:06'', ''2017-04-11 16:17:54'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Nginx报错：413 Request Entity Too Large'', ''other'', ''综合'', ''
在http模块下添加配置:

```
http {
    ...
    client_max_body_size 10m;
    ...
}

```
'', 0, 0, 1, 0, 0, ''2017-04-11 16:02:31'', ''2017-04-11 16:19:00'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''nginx负载均衡的配置'', ''other'', ''综合'', ''


## 实验环境
1. 机器1的ip:10.10.10.248, tomcat端口:8088
2. 机器2的ip:10.10.10.166, tomcat端口:8088
3. nginx所在机器ip:10.10.10.248, 监听端口80

<!-- more -->

## 启动两个tomcat，配置nginx
我使用的是jenkins启动的tomcat，一键部署成功, 效果如下:

![tomcat-166.png](https://kangyonggan.com/upload/20170101200131662.png)

![tomcat-248.png](https://kangyonggan.com/upload/20170101200131669.png)

我的nginx是部署在248服务器上，监听的是80端口， 现在想做的就是:
在访问http://10.10.10.248:80的时候，nginx把所有的请求均等转发到10.10.10.248:8088和10.10.10.166:8088

nginx配置`/etc/nginx/sites-available/default`如下:

```
upstream kyg.com {
       server  10.10.10.248:8088;
       server  10.10.10.166:8088;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
                proxy_pass http://kyg.com;
        }

        # 设定访问静态文件直接读取不经过tomcat
        location ^~ /static/ {
                proxy_pass http://kyg.com;
                root /WEB-INF/static/;
        }
}
```

修改nginx配置后需要重新加载配置`sudo nginx -s reload`

### 查看日志，分析结果
1. 分别在两台服务器上`tail -f /home/kyg/logs/blog/all.log`
2. 然后访问http://10.10.10.248
3. 观察哪台服务器会刷日志
4. 再次访问http://10.10.10.248
5. 观察哪台服务器会刷日志
6. 重复访问观察...

![log](https://kangyonggan.com/upload/20170101205501760.png)

发现nginx会把所有的请求均等的（发给你一次发给我一次）转发到两台服务器, 当然你也可以配置权重，让某台服务分担的压力小一点，或者动态负载均衡等。

## kill其中一个tomcat
我现在把166服务器kill了，在访问并观察日志, 结果：

1. 网站仍然可以正常访问
2. 所有的访问全部转发到248服务器

## 分布式服务需要解决的几个问题
1. 会话共享，请参考我的另一篇博客`shiro集成redis实现session集群共享`
2. 文件共享, 请参考我的另一篇博客`ubuntu下配置ftp服务器`




'', 1, 0, 1, 0, 0, ''2017-04-11 16:03:32'', ''2017-04-11 16:19:00'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''shiro集成redis实现session集群共享'', ''java'', ''Java后台'', ''

## 好处
1. session在tomcat集群中共享（单点登录）
2. tomcat重启后会话不丢失

## 实现
覆写`EnterpriseCacheSessionDAO`

```
package com.kangyonggan.blog.web.shiro;

import com.kangyonggan.api.common.service.RedisService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

/**
 * @author kangyonggan
 * @since 2016/12/31
 */
public class MyEnterpriseCacheSessionDAO extends EnterpriseCacheSessionDAO {

    @Autowired
    private RedisService redisService;

    /**
     * 创建session，保存到redis数据库
     *
     * @param session
     * @return
     */
    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = super.doCreate(session);
        redisService.set(sessionId.toString(), session);

        return sessionId;
    }

    /**
     * 获取session
     *
     * @param sessionId
     * @return
     */
    @Override
    protected Session doReadSession(Serializable sessionId) {
        // 先从缓存中获取session，如果没有再去数据库中获取
        Session session = super.doReadSession(sessionId);
        if (session == null) {
            session = (Session) redisService.get(sessionId.toString());
        }
        return session;
    }

    /**
     * 更新session的最后一次访问时间
     *
     * @param session
     */
    @Override
    protected void doUpdate(Session session) {
        super.doUpdate(session);
        redisService.set(session.getId().toString(), session);
    }

    /**
     * 删除session
     *
     * @param session
     */
    @Override
    protected void doDelete(Session session) {
        super.doDelete(session);
        redisService.delete(session.getId().toString());
    }

}
```

> 但是一般还是别在集群中使用session。

'', 1, 0, 1, 0, 0, ''2017-04-11 16:04:09'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''SimpleDateFormat日期格式化线程安全问题'', ''java'', ''Java后台'', ''

## 常用的日期工具类
我们在开发中通常需要对日期进行格式化，就想到了写一个工具类，如下：

<!-- more -->

```
package com.kangyonggan.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        return new SimpleDateFormat(DATE_TIME).format(date);
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确】
     */
    public static Date parse(String source) throws ParseException {
        return new SimpleDateFormat(DATE_TIME).parse(source);
    }
}
```

## 追求性能的日期工具类
追求性能的同学可能会说：每次都new一个SimpleDateFormat太浪费了，于是有了下面一版：

```
package com.kangyonggan.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_TIME);

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        return simpleDateFormat.format(date);
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确或多线程临界资源问题】
     */
    public static Date parse(String source) throws ParseException {
        return simpleDateFormat.parse(source);
    }

}
```

## 测试临界资源问题
这个工具类在大多数的时候都是ok的，但是在高并发的时候就不是那么好使了，看看测试代码：

```
package com.kangyonggan.demo.util;

import java.text.ParseException;

/**
 * 测试DateUtil高并发
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class TestDateUtil {

    public static void main(String[] args) {
        for (int i = 0; i < 2; i++) {
            new Thread() {
                public void run() {
                    while (true) {
                        try {
                            sleep(1000);
                            System.out.println(DateUtil.parse("2017-03-10 11:24:35"));
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        } catch (ParseException e) {
                            e.printStackTrace();
                            return;
                        }
                    }
                }
            }.start();
        }
    }

}
```

输出信息如下：

```
Exception in thread "Thread-0" Exception in thread "Thread-1" java.lang.NumberFormatException: For input string: "101.E1012E"
  at sun.misc.FloatingDecimal.readJavaFormatString(FloatingDecimal.java:2043)
  at sun.misc.FloatingDecimal.parseDouble(FloatingDecimal.java:110)
  at java.lang.Double.parseDouble(Double.java:538)
  at java.text.DigitList.getDouble(DigitList.java:169)
  at java.text.DecimalFormat.parse(DecimalFormat.java:2056)
  at java.text.SimpleDateFormat.subParse(SimpleDateFormat.java:2162)
  at java.text.SimpleDateFormat.parse(SimpleDateFormat.java:1514)
  at java.text.DateFormat.parse(DateFormat.java:364)
  at com.kangyonggan.demo.util.DateUtil.parse(DateUtil.java:36)
  at com.kangyonggan.demo.util.TestDateUtil$1.run(TestDateUtil.java:20)
java.lang.NumberFormatException: For input string: "101.E1012E2"
  at sun.misc.FloatingDecimal.readJavaFormatString(FloatingDecimal.java:2043)
  at sun.misc.FloatingDecimal.parseDouble(FloatingDecimal.java:110)
  at java.lang.Double.parseDouble(Double.java:538)
  at java.text.DigitList.getDouble(DigitList.java:169)
  at java.text.DecimalFormat.parse(DecimalFormat.java:2056)
  at java.text.SimpleDateFormat.subParse(SimpleDateFormat.java:2162)
  at java.text.SimpleDateFormat.parse(SimpleDateFormat.java:1514)
  at java.text.DateFormat.parse(DateFormat.java:364)
  at com.kangyonggan.demo.util.DateUtil.parse(DateUtil.java:36)
  at com.kangyonggan.demo.util.TestDateUtil$1.run(TestDateUtil.java:20)

Process finished with exit code 0
```

从错误信息来看是字符串的格式有误，但我们的入参时没错的，于是我稍微修改代码:`i < 1`，即只有一个线程，这时候是不会报错的。
报错显然是多线程中临界资源`simpleDateFormat`引起的，说明`parse`方法不是线程安全的。查看SimpleDateFormat源码可以看到

```
Date parsedDate;
try {
    parsedDate = calb.establish(calendar).getTime();
    // If the year value is ambiguous,
    // then the two-digit year == the default start year
    if (ambiguousYear[0]) {
        if (parsedDate.before(defaultCenturyStart)) {
            parsedDate = calb.addYear(100).establish(calendar).getTime();
        }
    }
}
// An IllegalArgumentException will be thrown by Calendar.getTime()
// if any fields are out of range, e.g., MONTH == 17.
catch (IllegalArgumentException e) {
    pos.errorIndex = start;
    pos.index = oldStart;
    return null;
}
```

其中`calendar `是成员变量：

```
protected Calendar calendar;
```

也就是说在多线程并发时，这个临界资源是可能被多个线程同时使用的。

## 解决方案
### 1. 在每次调用的时候去new一个
虽然可能会占用一些内存（一般不是很明显，忽略不计），但比较安全。
### 2. 访问临界资源时，使用同步
```
package com.kangyonggan.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_TIME);

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        synchronized (simpleDateFormat) {
            return simpleDateFormat.format(source);
        }
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确】
     */
    public static Date parse(String source) throws ParseException {
        synchronized (simpleDateFormat) {
            return simpleDateFormat.parse(source);
        }
    }
}
```

但是，当调用太过频繁时，会有阻塞，对性能有一定的影响。

### 3. 使用ThreadLocal
```
package com.kangyonggan.demo.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    private static final ThreadLocal<DateFormat> threadLocal = new ThreadLocal<DateFormat>();

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        return getDateFormat().format(date);
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确】
     */
    public static Date parse(String source) throws ParseException {
        return getDateFormat().parse(source);
    }

    /**
     * 获取一个线程独享的dateFormat，如果没有则创建一个
     *
     * @return 返回一个线程独享的dateFormat
     */
    private static DateFormat getDateFormat() {
        DateFormat dateFormat = threadLocal.get();
        if (dateFormat == null) {
            dateFormat = new SimpleDateFormat(DATE_TIME);
            threadLocal.set(dateFormat);
        }
        return dateFormat;
    }
}
```

使用ThreadLocal有些情况下并不能减少对象的创建（如果一个线程只调用一次DateUtil），但是有些时候还是有效果的（一个线程多次调用DateUtil）。





'', 1, 0, 1, 0, 0, ''2017-04-11 16:04:54'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''Spring使用注解方式进行事务管理'', ''java'', ''Java后台'', ''

参考:[http://www.cnblogs.com/younggun/archive/2013/07/16/3193800.html](http://www.cnblogs.com/younggun/archive/2013/07/16/3193800.html)

## 使用步骤
### 在spring配置文件中引入<tx:>命名空间
```
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-2.0.xsd
         http://www.springframework.org/schema/tx
         http://www.springframework.org/schema/tx/spring-tx-2.0.xsd">
</beans>
```

<!-- more -->

### 具有@Transactional注解的bean自动配置为声明式事务支持
```
<!-- 使用JDBC事务 -->
<bean id="transactionManager"
      class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSource" ref="dataSource"></property>
</bean>

<!-- 使用annotation注解方式配置事务 -->
<tx:annotation-driven transaction-manager="transactionManager"></tx:annotation>
```

### 在接口或类的声明处,写一个@Transactional
1. 只在接口上写，接口的实现上不写，实现类会继承下来，也可以覆写注解。
2. 如果注解在类上，适用于类中所有的`public`的方法。

## 事务的传播特性和隔离级别
### 事务注解方式: @Transactional
当标于类前时, 标示类中所有方法都进行事务处理：

```
@Transactional
public class UserServiceImpl implements UserService {}
```

### 当类中某些方法不需要事务时
```
@Transactional
public class UserServiceImpl extends BaseService<User> implements UserService {

    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<Object> getAll() {
        return null;
    }

}
```

### 事务传播特性
1. @Transactional(propagation = Propagation.REQUIRED) 如果有事务, 那么加入事务, 没有的话新建一个(默认情况下)
2. @Transactional(propagation = Propagation.NOT_SUPPORTED) 容器不为这个方法开启事务
3. @Transactional(propagation = Propagation.REQUIRES_NEW) 不管是否存在事务,都创建一个新的事务,原来的挂起,新的执行完毕,继续执行老的事务
4. @Transactional(propagation = Propagation.MANDATORY) 必须在一个已有的事务中执行,否则抛出异常
5. @Transactional(propagation = Propagation.NEVER) 必须在一个没有的事务中执行,否则抛出异常(与Propagation.MANDATORY相反)
6. @Transactional(propagation = Propagation.SUPPORTS) 如果其他bean调用这个方法,在其他bean中声明事务,那就用事务.如果其他bean没有声明事务,那就不用事务

### 事务超时设置
```
@Transactional(timeout = 30) //默认是30秒
```

### 事务隔离级别
1. @Transactional(isolation = Isolation.READ_UNCOMMITTED) 读取未提交数据(会出现脏读, 不可重复读) 基本不使用
2. @Transactional(isolation = Isolation.READ_COMMITTED) 读取已提交数据(会出现不可重复读和幻读)
3. @Transactional(isolation = Isolation.REPEATABLE_READ) 可重复读(会出现幻读)
4. @Transactional(isolation = Isolation.SERIALIZABLE) 串行化

> MySQL: 默认为REPEATABLE_READ级别
> SQLServer: 默认为READ_COMMITTED

#### 脏读
一个事务读取到另一事务未提交的更新数据。

#### 不可重复读
在同一事务中, 多次读取同一数据返回的结果有所不同, 换句话说, 后续读取可以读到另一事务已提交的更新数据. 相反, "可重复读"在同一事务中多次读取数据时, 能够保证所读数据一样, 也就是后续读取不能读到另一事务已提交的更新数据。

#### 幻读
一个事务读到另一个事务已提交的insert数据。

## @Transactional注解中常用参数说明
参数名称                   | 功能描述
----------------------- | -------------
readOnly                |   该属性用于设置当前事务是否为只读事务
rollbackFor             | 该属性用于设置需要进行回滚的异常类数组，当方法中抛出指定异常数组中的异常时，则进行事务回滚。例如：指定单一异常类：@Transactional(rollbackFor=RuntimeException.class)指定多个异常类：@Transactional(rollbackFor={RuntimeException.class, Exception.class})
rollbackForClassName    | 该属性用于设置需要进行回滚的异常类名称数组，当方法中抛出指定异常名称数组中的异常时，则进行事务回滚。例如：指定单一异常类名称：@Transactional(rollbackForClassName="RuntimeException")指定多个异常类名称：@Transactional(rollbackForClassName={"RuntimeException","Exception"})
noRollbackFor           | 该属性用于设置不需要进行回滚的异常类数组，当方法中抛出指定异常数组中的异常时，不进行事务回滚。例如：指定单一异常类：@Transactional(noRollbackFor=RuntimeException.class)指定多个异常类：@Transactional(noRollbackFor={RuntimeException.class, Exception.class})
noRollbackForClassName  | 该属性用于设置不需要进行回滚的异常类名称数组，当方法中抛出指定异常名称数组中的异常时，不进行事务回滚。例如：指定单一异常类名称：@Transactional(noRollbackForClassName="RuntimeException")指定多个异常类名称：@Transactional(noRollbackForClassName={"RuntimeException","Exception"})
propagation             | 该属性用于设置事务的传播行为，例如：@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
isolation               | 该属性用于设置底层数据库的事务隔离级别，事务隔离级别用于处理多事务并发的情况，通常使用数据库的默认隔离级别即可，基本不需要进行设置
timeout                 | 该属性用于设置事务的超时秒数，默认值为-1表示永不超时

## 注意
### @Transactional只能被应用到public方法上
对于其它非public的方法,如果标记了@Transactional也不会报错,但方法没有事务功能.
### 关于异常回滚
用spring事务管理器来管理数据库的打开、提交、回滚。默认遇到运行期例外(throw new RuntimeException("异常了");)会回滚，即遇到不受检查（unchecked）的例外时回滚。
而遇到需要捕获的例外(throw new Exception("注释");)不会回滚,即遇到受检查的例外（就是非运行时抛出的异常，编译器会检查到的异常叫受检查例外或说受检查异常）时，需我们指定方式来让事务回滚 要想所有异常都回滚,要加上 @Transactional( rollbackFor={Exception.class,其它异常})。
如果让unchecked例外不回滚：

```
@Transactional(notRollbackFor = RunTimeException.class)
@Transactional(rollbackFor = Exception.class) //指定回滚,遇到异常Exception时回滚
public void methodName() {
  throw new Exception("异常了");
}

//指定不回滚,遇到运行期例外(throw new RuntimeException("异常了");)会回滚
@Transactional(noRollbackFor = Exception.class)
public ItimDaoImpl getItemDaoImpl() {
  throw new RuntimeException("异常了");
}
```

### @Transactional和<tx:annotation-driven></tx:annotation>
@Transactional注解可以被应用于接口定义和接口方法、类定义和类的 public 方法上。然而，请注意仅仅 @Transactional 注解的出现不足于开启事务行为，它仅仅 是一种元数据，能够被可以识别 @Transactional 注解和上述的配置适当的具有事务行为的beans所使用。上面的例子中，其实正是`<tx:annotation-driven></tx:annotation>`元素的出现开启了事务行为。

### 请在实现类上使用@Transactional
Spring团队的建议是你在具体的类（或类的方法）上使用 @Transactional 注解，而不要使用在类所要实现的任何接口上。你当然可以在接口上使用 @Transactional 注解，但是这将只能当你设置了基于接口的代理时它才生效。因为注解是 不能继承 的，这就意味着如果你正在使用基于类的代理时，那么事务的设置将不能被基于类的代理所识别，而且对象也将不会被事务代理所包装（将被确认为严重的）。因 此，请接受Spring团队的建议并且在具体的类上使用 @Transactional 注解。






'', 1, 0, 1, 0, 0, ''2017-04-11 16:05:32'', ''2017-04-11 16:17:29'');
INSERT INTO dfjz.article (title, category_code, category_name, content, visit_count, comment_count, is_comment, is_stick, is_deleted, created_time, updated_time) VALUES (''ssh端口转发'', ''linux'', ''系统运维'', ''

## 转发本地到远端
```
ssh -C -f -N -g -L 本地端口:远端IP:远端端口 远端用户名@远端IP
```

### 例子
```
ssh -C -f -N -g -L 2222:42.196.156.22:22 kyg@42.196.156.22
```

<!-- more -->

所有请求本地2222端口的请求，都会转发给42.196.156的22端口

> 网络前提：本地机器一定要能访问远端机器，不要求远端机器能访问本地机器

<!-- more -->

## 转发远端到本地
```
ssh -C -f -N -g –R 远端端口:本地IP:本地端口 远端用户名@远端IP
```

### 例子
```
ssh -C -f -N -g -R 2323:127.0.0.1:22 root@121.40.66.176
```

所有请求121.40.66.176:2323的请求，都会转发给本地的22端口

> 网络前提', 0, '2017-04-11 10:44:50', '2017-08-09 18:58:53');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('用jdk自带的keytool导入查看删除证书', 'code', '代码片段', '

## 导入证书
```
sudo keytool -import -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit -alias sh2_test -file /Users/kyg/Downloads/sh2_test.cer
```

## 删除证书
```
sudo keytool -delete -alias sh2_test -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit
```

## 查看证书
```
keytool -list -alias sh2_test -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit
```

## 提示
- 使用时，jdk路径请自行替换
- 一般cacerts的密码默认为changit
- keytool命令在bin目录下


', 0, '2017-04-11 10:46:38', '2017-04-11 12:18:24');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('给自己的博客生成rss订阅源', 'java', 'Java后台', '

## 目的
1. 把我的所有博客全部变成rss订阅源，以便别人订阅。
2. 当我有博客更新时，会自定更新订阅源，或者省事一点每隔30分钟自动更新一次。

## 大致步骤
1. 查询所有博客。
2. 遍历所有博客，按`rss规范`组装成xml。
3. 把组装好的xml写入服务器某个位置，比如放在:`/rss/blog.xml`
4. 在rss阅读器中添加订阅源，url为:`https://kangyonggan.com/upload/rss/blog.xml`
5. 订阅成功，阅读器会把所有博客缓存到本地，离线也可阅读。

<!-- more -->

## 按照rss规范组装xml
使用第三方jar包`rsslibj`，它依赖`exml`,如下:

```
<rsslibj.version>1.0RC2</rsslibj.version>
<exml.version>7.0</exml.version>

<dependency>
    <groupId>rsslibj</groupId>
    <artifactId>rsslibj</artifactId>
    <version>${rsslibj.version}</version>
</dependency>
<dependency>
    <groupId>exml</groupId>
    <artifactId>exml</artifactId>
    <version>${exml.version}</version>
</dependency>
```

代码如下:

```
Channel channel = new Channel();
channel.setTitle("朕的博客");
channel.setLink("http://kangyonggan.com");

String baseUrl = "http://kangyonggan.com/#article/";
String rssName = "blog.xml";

try {
    List<Article> list = articleService.findAllArticles();
    log.info("一共{}篇文章", list.size());

    for (int i = 0; i < list.size(); i++) {
        Article article = list.get(i);
        Item item = new Item();
        item.setTitle(article.getTitle());
        item.setLink(baseUrl + article.getId());
        item.setDcDate(article.getUpdatedTime());
        item.setDescription(MarkdownUtil.markdownToHtml(article.getContent()));

        channel.addItem(i, item);
    }

    File file = new File(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + rssName);

    if (!file.exists()) {
        file.createNewFile();
    }

    PrintWriter writer = new PrintWriter(new FileWriter(file));
    writer.write(channel.getFeed("rss"));
    writer.flush();
    writer.close();

    FtpUtil.upload(rssName, "rss/");

    log.info("rss刷新成功");
    return "success";
} catch (Exception e) {
    log.error("查询所有文章失败", e);
}
```

但是有个问题，那就是`Item`不能设置发布时间，订阅后在阅读器里看不到文章的发布时间或者更新时间，所以我就从网上重新找了一个，它不去用任何jar包。

## 解决发布时间问题
### Feed.java

```
package com.kangyonggan.blog.model.rss;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/1/24
 */
@Data
public class Feed {
    String title;
    String link;
    String description;
    String language;
    String copyright;
    String pubDate;
    List<FeedMessage> feedMessages = new ArrayList();

}
```

### FeedMessage.java

```
package com.kangyonggan.blog.model.rss;

import lombok.Data;

/**
 * @author kangyonggan
 * @since 2017/1/24
 */
@Data
public class FeedMessage {

    String title;

    String description;

    String link;

    String author;

    String guid;

    String pubDate;

}
```

### RSSFeedWriter.java

```
package com.kangyonggan.blog.biz.util;


import com.kangyonggan.blog.model.rss.Feed;
import com.kangyonggan.blog.model.rss.FeedMessage;

import javax.xml.stream.XMLEventFactory;
import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.*;
import java.io.FileOutputStream;

/**
 * @author kangyonggan
 * @since 2017/1/24
 */
public class RSSFeedWriter {

    private String outputFile;
    private Feed feed;

    public RSSFeedWriter(Feed feed, String outputFile) {
        this.feed = feed;
        this.outputFile = outputFile;
    }

    public void write() throws Exception {
        XMLOutputFactory outputFactory = XMLOutputFactory.newInstance();

        XMLEventWriter eventWriter = outputFactory.createXMLEventWriter(new FileOutputStream(outputFile));

        XMLEventFactory eventFactory = XMLEventFactory.newInstance();
        XMLEvent end = eventFactory.createDTD("
");

        // Create and write Start Tag

        StartDocument startDocument = eventFactory.createStartDocument();

        eventWriter.add(startDocument);

        // Create open tag
        eventWriter.add(end);

        StartElement rssStart = eventFactory.createStartElement("", "", "rss");
        eventWriter.add(rssStart);
        eventWriter.add(eventFactory.createAttribute("version", "2.0"));
        eventWriter.add(end);

        eventWriter.add(eventFactory.createStartElement("", "", "channel"));
        eventWriter.add(end);

        // Write the different nodes

        createNode(eventWriter, "title", feed.getTitle());

        createNode(eventWriter, "link", feed.getLink());

        createNode(eventWriter, "description", feed.getDescription());

        createNode(eventWriter, "language", feed.getLanguage());

        createNode(eventWriter, "copyright", feed.getCopyright());

        createNode(eventWriter, "pubdate", feed.getPubDate());

        for (FeedMessage entry : feed.getFeedMessages()) {
            eventWriter.add(eventFactory.createStartElement("", "", "item"));
            eventWriter.add(end);
            createNode(eventWriter, "title", entry.getTitle());
            createNode(eventWriter, "description", entry.getDescription());
            createNode(eventWriter, "link", entry.getLink());
            createNode(eventWriter, "author", entry.getAuthor());
            createNode(eventWriter, "guid", entry.getGuid());
            createNode(eventWriter, "pubDate", entry.getPubDate());
            eventWriter.add(end);
            eventWriter.add(eventFactory.createEndElement("", "", "item"));
            eventWriter.add(end);

        }

        eventWriter.add(end);
        eventWriter.add(eventFactory.createEndElement("", "", "channel"));
        eventWriter.add(end);
        eventWriter.add(eventFactory.createEndElement("", "", "rss"));

        eventWriter.add(end);

        eventWriter.add(eventFactory.createEndDocument());

        eventWriter.close();
    }

    private void createNode(XMLEventWriter eventWriter, String name,

                            String value) throws XMLStreamException {
        XMLEventFactory eventFactory = XMLEventFactory.newInstance();
        XMLEvent end = eventFactory.createDTD("
");
        XMLEvent tab = eventFactory.createDTD(" ");
        // Create Start node
        StartElement sElement = eventFactory.createStartElement("", "", name);
        eventWriter.add(tab);
        eventWriter.add(sElement);
        // Create Content
        Characters characters = eventFactory.createCharacters(value);
        eventWriter.add(characters);
        // Create End node
        EndElement eElement = eventFactory.createEndElement("", "", name);
        eventWriter.add(eElement);
        eventWriter.add(end);
    }
}
```

使用如下：

```
Feed feed = new Feed();
feed.setDescription("记录生活、工作和学习时的笔记心得等");
feed.setLink("http://kangyonggan.com");
feed.setTitle("朕的博客");
List<FeedMessage> feedMessages = feed.getFeedMessages();

String baseUrl = "http://kangyonggan.com/#article/";
String rssName = "blog.xml";

try {
    List<Article> list = articleService.findAllArticles();
    log.info("一共{}篇文章", list.size());

    for (int i = 0; i < list.size(); i++) {
        Article article = list.get(i);
        FeedMessage feedMessage = new FeedMessage();

        feedMessage.setTitle(article.getTitle());
        feedMessage.setLink(baseUrl + article.getId());
        feedMessage.setDescription(MarkdownUtil.markdownToHtml(article.getContent()));
        Date date = article.getUpdatedTime();
        date.setTime(date.getTime() - 8 * 60 * 60 * 1000);
        feedMessage.setPubDate(format.format(date));
        feedMessages.add(feedMessage);
    }

    File file = new File(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + rssName);

    if (!file.exists()) {
        file.createNewFile();
    }

    new RSSFeedWriter(feed, file.getPath()).write();

    FtpUtil.upload(rssName, "rss/");

    log.info("rss刷新成功");
    return "success";
} catch (Exception e) {
    log.error("查询所有文章失败", e);
}
```

## 附rss订阅源和订阅效果

![rss](https://kangyonggan.com/upload/20170125103534094.png)

![reeder](https://kangyonggan.com/upload/20170125103943826.png)


', 0, '2017-04-11 10:49:36', '2017-07-27 07:49:26');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('查询引擎优化方案', 'java', 'Java后台', '

## 现状
- 每分钟去查N次数据库，每一次都会扫描几千行，其中N=通道的数量。
- 查的非常频繁，但线上状态为I或E的交易很少很少，有一种杀鸡用牛刀的感觉。
- 第一次查询时间区间太大（30s~90s之间）。
- 查询高峰堆在一个时间点上，不均衡。
- 每分钟启动一个线程，但一此只能启动一个线程。

<!-- more -->

## 优化后
- 不用查数据库。
- 只处理状态为I或E的交易。
- 每次查询时间的区间可以精确到秒, 粒度可自由调控。
- 均衡分布。
- 可以使用线程池，可以N个线程协同处理。

## 具体步骤
创建一个数组`task[List]`，一个时钟线程Thread-timer，长度为12，每5秒走一步，如下图：

![task-arr.png](https://kangyonggan.com/upload/20170315215531865.png)

如果有状态为I或E的交易，就把BankCommand放入task[current_index + 6]的list中【此处有并发问题，加锁即可解决，后面讨论】，并把他的`loop_count`标记为0。

6 * 5s=30s之后，时钟走到刚刚上面那个交易存放的位置，另起线程取出List中loop\\_count等于0的交易之后去查询，再更新beCommand表，并把此list中所有交易的loop\\_count减1，然后清除list中loop\\_count小于0的交易。【另起线程时可以使用线程池】

如果某银行通道的查询需要延迟3分钟后才查询，只需要在放入task中的时候，让loop\\_count等于3。


', 0, '2017-04-11 10:51:34', '2017-07-10 20:42:54');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('手动安装本地jar包到仓库', 'code', '代码片段', '

```
mvn install:install-file -DgroupId=com.kangyonggan.app -DartifactId=simclient -Dversion=1.0-SNAPSHOT -Dpackaging=jar -Dfile=/home/kyg/data/jar/simclient-1.0-SNAPSHOT.jar
```

', 0, '2017-04-11 10:52:54', '2017-08-14 05:58:17');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('手写前端单页面路由SimPage', 'web', 'Web前端', '


前端我一直在用ace admin，在16年底把ace admin ajax（单页面）用在了我的博客中。
现在我想把博客重构一遍，不准备用ace了，可是又想用它的单页面，所以就动手自己写了一个。

<!-- more -->

## simpage.js

```
/**
 * 单页面路由
 *
 * @author kangyonggan
 * @since 2017/3/21
 */
(function ($) {
    /**
     * 获取内容的url
     *
     * @param hash
     * @returns {string}
     */
    function getContentUrl(hash) {
        return window.location.origin + window.location.pathname + hash
    }

    /**
     * 加载成功
     */
    function onSuccess() {
    }

    /**
     * 加载失败
     */
    function onError() {
    }

    /**
     * 总入口
     *
     * @param contentArea
     * @param settings
     */
    function simPage(contentArea, settings) {
        var $contentArea = $(contentArea);
        var $overlay = $();//empty set
        var loadingTimer;
        // 把settings的属性合并到defaults，并且不改变defaults
        settings = $.extend(true, $.fn.simPage.defaults, settings);
        /**
         * 开始加载
         */
        function startLoading() {
            // 清除定时器
            clearInterval(loadingTimer);
            $overlay.remove();
            $overlay = $(''<div>'' + settings.loadingText + ''</div>'').css({
                position: "absolute",
                left: 0,
                top: 0,
                bottom: 0,
                right: 0,
                zIndex: 9999,
                textAlign: "center",
                marginTop: "100px"
            }).addClass("sim-page-loading");
            $contentArea.append($overlay);
            var text = $overlay.html();
            var count = 0;
            // 定时输出正在加载...
            loadingTimer = setInterval(function () {
                var temp = ".";
                for (var i = 0; i < count; i++) {
                    temp += ".";
                }
                $overlay.html(text + temp);
                count++;
                count %= 3;
            }, 1000);
        }

        /**
         * 停止加载
         *
         * @param isSuccess
         */
        function stopLoading(isSuccess) {
            // 清除定时器
            clearInterval(loadingTimer);
            $overlay.remove();
            if (isSuccess) {
                onSuccess();
            } else {
                onError();
            }
        }

        /**
         * 加载url
         *
         * @param url
         * @param method
         * @param data
         */
        function getUrl(url, method, data) {
            if (!method) {
                method = "get";
            }

            // 开始加载
            startLoading();
            $.ajax({
                ''url'': url,
                ''cache'': false,
                "method": method,
                "data": data
            }).error(function () {
                // 停止加载
                stopLoading(false);
                getUrl(getContentUrl("404"));
            }).done(function (result) {
                // 停止加载
                stopLoading(true);
                // 内容替换
                $contentArea.empty().html(result);
            });
        }

        /**
         * 异步加载url
         *
         * @param hash
         * @param cache
         */
        function loadUrl(hash) {
            hash = hash.replace(/^(#!)?#/, '''');
            var url = settings.contentUrl(hash);
            if (typeof url === ''string'') {
                getUrl(url);
            }
        };
        // 监听hash改变
        $(window).off(''hashchange'').on(''hashchange'', function (e, manual_trigger) {
            var hash = $.trim(window.location.hash);
            if (!hash || hash.length == 0) {
                return;
            }

            // 异步加载url
            loadUrl(hash);
        });
        // 是否使用默认URL
        var hash = $.trim(window.location.hash);
        if (!hash && settings.defaultUrl) {
            window.location.hash = settings.defaultUrl;
        }
        loadUrl(hash);
        // 相对定位，给【加载中...】使用
        $contentArea.css("position", "relative");

        // 监听表单提交
        $(document).on("submit", "form", function (e) {
            var $form = $(this);

            var hash = $form.attr("action");
            var method = $form.attr("method");

            if (hash.substring(0, 1) == "#") {
                e.preventDefault();
            } else {
                return true;
            }

            // 处理get方法
            if (method.toLowerCase() == "get") {
                var params = $form.serialize();
                var url = window.location.origin + window.location.pathname + hash + "?" + params;

                window.location.href = url;
            } else if (method.toLowerCase() == "post") {
                var url = window.location.origin + window.location.pathname + hash.substring(1);

                getUrl(url, "post", $form.serialize());
            }

            return false;
        });
    }

    /**
     * 单页面路由
     *
     * @param option
     * @returns {*}
     */
    $.fn.simPage = function (option) {
        return this.each(function () {
            $(this).data(''simPage'', new simPage(this, option));
        });
    };
    /**
     * 默认配置
     *
     * @type {{defaultUrl: string, contentUrl: getContentUrl, loadingText: string, success: onSuccess, error: onError}}
     */
    $.fn.simPage.defaults = {
        // 默认URL（默认index）
        defaultUrl: ''#index'',
        // 内容URL（一般默认即可）
        contentUrl: getContentUrl,
        // 加载中的文字
        loadingText: ''正在加载'',
        // success回调方法
        success: onSuccess,
        // error回调方法
        error: onError
    }
})(window.jQuery);
```

## 用法
```
html
<div class="sim-page"></div>

js
$(".sim-page").simPage();
```

', 0, '2017-04-11 10:54:17', '2017-08-14 17:50:57');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('实现前端markdown编辑器', 'web', 'Web前端', '

在做网站的时候， 一帮都有后台管理可以发布一些文章或者公告之类的，一般情况下我们使用的是富文本编辑器（类似word），但我并不喜欢它， 我更喜欢markdown编辑器...

## 准备工作
- 下载bootstrap [http://v3.bootcss.com](http://v3.bootcss.com)
- 下载jquery [http://jquery.com/download](http://jquery.com/download)
- 下载marked [https://github.com/chjj/marked](https://github.com/chjj/marked)
- 下载bootstrap-markdown [http://www.codingdrama.com/bootstrap-markdown](http://www.codingdrama.com/bootstrap-markdown/)

<!-- more -->

## 使用方法
### 引入css
```
<div class="hidden ajax-append-link" rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<div class="hidden ajax-append-link" rel="stylesheet" type="text/css" href="css/bootstrap-markdown.min.css">
```

### 引入js

```
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/marked.min.js"></script>
<script type="text/javascript" src="js/bootstrap-markdown.min.js"></script>
```

### 文本域
```
<textarea name="content" id="content" rows="10"><textarea>
```

### 把文本域变为markdown编辑器
```
$("#content").markdown({resize: ''vertical''});
```

## 更多用法请参考
[http://www.codingdrama.com/bootstrap-markdown](http://www.codingdrama.com/bootstrap-markdown/)


', 0, '2017-04-11 10:55:46', '2017-08-07 21:01:50');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('实现全文检索-基于MySQL', 'java', 'Java后台', '

我们经常在网站上能看到搜索框， 可以用空格分割关键词、可以用拼音搜索等...

## 把关键字拆分为一组词
例子：搜索`懒人快乐`， 后台程序就会把`懒人快乐`拆分成两个词`懒人,快乐`。

说明：可以使用`jieba-analysis`结巴分词， 用法如下：

```
<dependency>
    <groupId>com.huaban</groupId>
    <artifactId>jieba-analysis</artifactId>
    <version>1.0.2</version>
</dependency>
```

<!-- more -->

```
package com.kangyonggan.blog.util;


import com.huaban.analysis.jieba.JiebaSegmenter;
import com.huaban.analysis.jieba.SegToken;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/7/22
 */
public class FenCi {

    /**
     * 分词器
     */
    private static final JiebaSegmenter segmenter = new JiebaSegmenter();

    /**
     * 中文分词, 并转成拼音
     *
     * @param data
     * @return
     */
    public static String process(String data) {
        if (StringUtils.isEmpty(data)) {
            return "";
        }

        data = data.replaceAll("\\s", " ");
        data = data.replaceAll("''", " ");

        List<SegToken> list = segmenter.process(data, JiebaSegmenter.SegMode.INDEX);

        StringBuilder sb = new StringBuilder();
        list.forEach(segToken -> sb.append(PinYin.converterToSpellWithMuti(segToken.word)).append(","));
        sb.deleteCharAt(sb.lastIndexOf(","));

        return sb.toString();
    }

}
```

## 把词转化为拼音
例子：`懒人,快乐`会被后台程序转化为`lanren,kuaile,kuaiyue`，之所以不是`lanren,kuaile`而是`lanren,kuaile,kuaiyue`， 是因为`乐`是多音字。

说明：可以使用`pinyin4j`把汉字转化为拼音， 用法如下：

```
<dependency>
     <groupId>com.belerweb</groupId>
     <artifactId>pinyin4j</artifactId>
     <version>2.5.1</version>
</dependency>
```

```
package com.kangyonggan.blog.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 16/7/22
 */
public class PinYin {

    /**
     * 汉字转换位汉语拼音首字母，英文字符不变，特殊字符丢失 支持多音字，生成方式如（长沙市长:cssc,zssz,zssc,cssz）
     *
     * @param chines 汉字
     * @return 拼音
     */
    public static String converterToFirstSpell(String chines) {
        StringBuffer pinyinName = new StringBuffer();
        char[] nameChar = chines.toCharArray();
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
        defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        for (int i = 0; i < nameChar.length; i++) {
            if (nameChar[i] > 128) {
                try {
                    // 取得当前汉字的所有全拼
                    String[] strs = PinyinHelper.toHanyuPinyinStringArray(
                            nameChar[i], defaultFormat);
                    if (strs != null) {
                        for (int j = 0; j < strs.length; j++) {
                            // 取首字母
                            pinyinName.append(strs[j].charAt(0));
                            if (j != strs.length - 1) {
                                pinyinName.append(",");
                            }
                        }
                    }
                    // else {
                    // pinyinName.append(nameChar[i]);
                    // }
                } catch (BadHanyuPinyinOutputFormatCombination e) {
                    e.printStackTrace();
                }
            } else {
                pinyinName.append(nameChar[i]);
            }
            pinyinName.append(" ");
        }
        // return pinyinName.toString();
        return parseTheChineseByObject(discountTheChinese(pinyinName.toString()));
    }

    /**
     * 汉字转换位汉语全拼，英文字符不变，特殊字符丢失
     * 不支持多音字，生成方式如（重当参:zhongdangcen）
     *
     * @param chines 汉字
     * @return 拼音
     */
    public static String converterToSpell(String chines) {
        StringBuffer pinyinName = new StringBuffer();
        char[] nameChar = chines.toCharArray();
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
        defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        for (int i = 0; i < nameChar.length; i++) {
            if (nameChar[i] > 128) {
                try {
                    // 取得当前汉字的所有全拼
                    String[] strs = PinyinHelper.toHanyuPinyinStringArray(
                            nameChar[i], defaultFormat);
                    if (strs != null && strs.length > 0) {
                        pinyinName.append(strs[0]);
                    }
                } catch (BadHanyuPinyinOutputFormatCombination e) {
                    e.printStackTrace();
                }
            } else {
                pinyinName.append(nameChar[i]);
            }
            pinyinName.append(" ");
        }
        // return pinyinName.toString();
        return parseTheChineseByObject(discountTheChinese(pinyinName.toString()));
    }

    /**
     * 汉字转换位汉语全拼，英文字符不变，特殊字符丢失
     * 支持多音字，生成方式如（重当参:zhongdangcen,zhongdangcan,chongdangcen
     * ,chongdangshen,zhongdangshen,chongdangcan）
     *
     * @param chines 汉字
     * @return 拼音
     */
    public static String converterToSpellWithMuti(String chines) {
        StringBuffer pinyinName = new StringBuffer();
        char[] nameChar = chines.toCharArray();
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
        defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        for (int i = 0; i < nameChar.length; i++) {
            if (nameChar[i] > 128) {
                try {
                    // 取得当前汉字的所有全拼
                    String[] strs = PinyinHelper.toHanyuPinyinStringArray(
                            nameChar[i], defaultFormat);
                    if (strs != null) {
                        for (int j = 0; j < strs.length; j++) {
                            pinyinName.append(strs[j]);
                            if (j != strs.length - 1) {
                                pinyinName.append(",");
                            }
                        }
                    }
                } catch (BadHanyuPinyinOutputFormatCombination e) {
                    e.printStackTrace();
                }
            } else {
                pinyinName.append(nameChar[i]);
            }
            pinyinName.append(" ");
        }
        // return pinyinName.toString();
        return parseTheChineseByObject(discountTheChinese(pinyinName.toString()));
    }

    /**
     * 去除多音字重复数据
     *
     * @param theStr
     * @return
     */
    private static List<Map<String, Integer>> discountTheChinese(String theStr) {
        // 去除重复拼音后的拼音列表
        List<Map<String, Integer>> mapList = new ArrayList<Map<String, Integer>>();
        // 用于处理每个字的多音字，去掉重复
        Map<String, Integer> onlyOne = null;
        String[] firsts = theStr.split(" ");
        // 读出每个汉字的拼音
        for (String str : firsts) {
            onlyOne = new Hashtable();
            String[] china = str.split(",");
            // 多音字处理
            for (String s : china) {
                Integer count = onlyOne.get(s);
                if (count == null) {
                    onlyOne.put(s, new Integer(1));
                } else {
                    onlyOne.remove(s);
                    count++;
                    onlyOne.put(s, count);
                }
            }
            mapList.add(onlyOne);
        }
        return mapList;
    }

    /**
     * 解析并组合拼音，对象合并方案(推荐使用)
     *
     * @return
     */
    private static String parseTheChineseByObject(
            List<Map<String, Integer>> list) {
        Map<String, Integer> first = null; // 用于统计每一次,集合组合数据
        // 遍历每一组集合
        for (int i = 0; i < list.size(); i++) {
            // 每一组集合与上一次组合的Map
            Map<String, Integer> temp = new Hashtable<String, Integer>();
            // 第一次循环，first为空
            if (first != null) {
                // 取出上次组合与此次集合的字符，并保存
                for (String s : first.keySet()) {
                    for (String s1 : list.get(i).keySet()) {
                        String str = s + s1;
                        temp.put(str, 1);
                    }
                }
                // 清理上一次组合数据
                if (temp != null && temp.size() > 0) {
                    first.clear();
                }
            } else {
                for (String s : list.get(i).keySet()) {
                    String str = s;
                    temp.put(str, 1);
                }
            }
            // 保存组合数据以便下次循环使用
            if (temp != null && temp.size() > 0) {
                first = temp;
            }
        }
        String returnStr = "";
        if (first != null) {
            // 遍历取出组合字符串
            for (String str : first.keySet()) {
                returnStr += (str + ",");
            }
        }
        if (returnStr.length() > 0) {
            returnStr = returnStr.substring(0, returnStr.length() - 1);
        }
        return returnStr;
    }
}
```

## 单独创建一个表用于全文检索
例子：现在有一个文章表`article`, 它有`title`和`body`等字段，我们想要实现的效果是~如果我们检索的关键字在title或body中， 那么我们就把这条文章记录检索出来。

- 创建一个用于检索的表`article_index`， 它有`article_id`，`title`，`body`等字段， 其中title和body字段要给的大一点， 因为这两个字段将要存储文章表的title和body所对应的拼音，具体给多大请自行分析。
- ALTER TABLE article_index ENGINE = MyISAM; 默认是InnoDB。MyISAM：支持全文索引， 但不支持事务。InnoDB：支持事务， 但不支持全文索引。
- ALTER TABLE `article_index` ADD FULLTEXT INDEX (`title`, `body`); 给title和body字段添加全文索引。
- 在发表一篇新的文章时， 把文章的`title`用`结巴分词`分成多个词， 再用`pinyin4j`转化为拼音， `body`字段也做相同处理，最后把转化后的article_id、title和body存储到`article_index`表中，用于全文检索。

说明：关于全文索引的一些常用知识`SHOW VARIABLES LIKE ''ft_min_word_len'';
`， ` REPAIR TABLE article_index QUICK;
` 作用以及用法请自行学习。

## 全文检索
例子：检索的关键字为`懒人快乐`

- 先把分词， 变为`懒人,快乐`。
- 再把汉字变拼音`lanren,kuaile,kuaiyue`。
- 检索：`SELECT * FROM article_index WHERE match(title, body) against(''lanren,kuaile,kuaiyue'' IN BOOLEAN MODE)`
- 根据检索到article_id去文章表查询对应的文章

说明：此检索是基于MySQL的， 其他数据库的检索请自行学习， 检索语句还有很多模式， 请自行学习。

> 结巴分词的时候会返回偏移量，所以你可以根据偏移量定位到文章中的关键词， 然后变成红色。



', 0, '2017-04-11 10:59:33', '2017-08-05 23:33:02');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('学习java8中java.time包下的几个类-LocalDate', 'java', 'Java后台', '

> 官方文档:[http://docs.oracle.com/javase/8/docs/api/index.html](http://docs.oracle.com/javase/8/docs/api/index.html)

在我之前的一篇文章中提到SimpleDateFormat日期格式化线程安全问题，尽管有了解决方案，但依然不是很爽，接下来我就来学习一下java8中提供的新的日期时间类`java.time`，重新写一个合手的日期时间工具类，不！这些类本身就可以作为工具类了。

<!-- more -->

## LocalDate类
### 类的定义
```
public final class LocalDate extends Object implements
    Temporal, TemporalAdjuster, ChronoLocalDate, Serializable
```

### 类的描述
这是一个`不可变`、`线程安全`的日期类，它可以存储年月日，但是不能存储时分秒。

> 常用术语: 日期-年月日，时间-时分秒，日期时间-年月日时分秒

## 获取当前日期
### 方法定义
```
public static LocalDate now();
```

### 方法描述
获取系统当前日期。

### 例子1：

在`pom.xml`中指定使用jdk1.8编译：

```
<!--compiler plugin -->
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>3.2</version>
    <configuration>
        <source>1.8</source>
        <target>1.8</target>
        <encoding>UTF-8</encoding>
    </configuration>
</plugin>
```

`LocalDateNowDemo.java`:

```
package com.kangyonggan.demo.time;

import java.time.LocalDate;

/**
 * @author kangyonggan
 * @since 2017/3/22
 */
public class LocalDateNowDemo {

    public static void main(String[] args) {
        LocalDate today = LocalDate.now();
        System.out.println(today);
    }

}
```

输出：

```
2017-03-22
Process finished with exit code 0
```

可以看出它不像java.util.Date那样输出一串乱七八糟的时间，如果我们仅仅使用日期，那会非常爽。
但是，有时候我们需要`yyyyMMdd`格式的日期。

## 日期格式化
### 方法定义
```
public String format(DateTimeFormatter formatter);
```

### 方法描述
把日期格式化指定的格式。

### 抛异常
可能会抛运行时异常`DateTimeException`

### 例子2：

```
public static void main(String[] args) {
    LocalDate today = LocalDate.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.ofPattern("yyyyMMdd")));
}
```

输出：

```
2017-03-22
20170322

Process finished with exit code 0
```

每次都写`yyyyMMdd`感觉很麻烦，而且容易错容易忘，再看下面的写法：

### 例子3：

```
public static void main(String[] args) {
    LocalDate today = LocalDate.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.BASIC_ISO_DATE));
}
```

输出：

```
2017-03-22
20170322

Process finished with exit code 0
```

输出结果是一样的，这是使用了DateTimeFormatter类中预定义的一些格式器，更多预定义格式器如下：

Formatter | Description  | Example
--------- | ----------- | ---------
ofLocalizedDate(dateStyle) | Formatter with date style from the locale | ''2011-12-03''
ofLocalizedTime(timeStyle) | Formatter with time style from the locale | ''10:15:30''
ofLocalizedDateTime(dateTimeStyle) | Formatter with a style for date and time from the locale | ''3 Jun 2008 11:05:30''
ofLocalizedDateTime(dateStyle,timeStyle) | Formatter with date and time styles from the locale | ''3 Jun 2008 11:05''
BASIC_ISO_DATE | Basic ISO date | ''20111203''
ISO_LOCAL_DATE | ISO Local Date | ''2011-12-03''
ISO_OFFSET_DATE | ISO Date with offset | ''2011-12-03+01:00''
ISO_DATE | ISO Date with or without offset | ''2011-12-03+01:00''; ''2011-12-03''
ISO_LOCAL_TIME | Time without offset | ''10:15:30''
ISO_OFFSET_TIME | Time with offset | ''10:15:30+01:00''
ISO_TIME | Time with or without offset | ''10:15:30+01:00''; ''10:15:30''
ISO_LOCAL_DATE_TIME | ISO Local Date and Time | ''2011-12-03T10:15:30''
ISO_OFFSET_DATE_TIME | Date Time with Offset | ''2011-12-03T10:15:30+01:00''
ISO_ZONED_DATE_TIME | Zoned Date Time | ''2011-12-03T10:15:30+01:00[Europe/Paris]''
ISO_DATE_TIME | Date and time with ZoneId | ''2011-12-03T10:15:30+01:00[Europe/Paris]''
ISO_ORDINAL_DATE | Year and day of year | ''2012-337''
ISO_WEEK_DATE | Year and Week | 2012-W48-6''
ISO_INSTANT | Date and Time of an Instant | ''2011-12-03T10:15:30Z''
RFC_1123_DATE_TIME | RFC 1123 / RFC 822 | ''Tue, 3 Jun 2008 11:05:30 GMT''

刚刚是把日期格式化，下面方法是相反的操作，即把指定格式的字符串解析成日期。

## 日期解析
### 方法定义
```
public static LocalDate parse(CharSequence text);
```

### 方法描述
把`固定格式`的字符串解析成日期，字符串格式必须为:`yyyy-MM-dd`

### 抛异常
如果字符串不能被解析就会抛异常`DateTimeParseException`

### 例子4：

```
public static void main(String[] args) {
    String dateStr = "2017-03-22";
    LocalDate localDate = LocalDate.parse(dateStr);
    System.out.println(localDate);
}
```

输出：

```
2017-03-22

Process finished with exit code 0
```

### 例子5：

```
public static void main(String[] args) {
    String dateStr = "2017-3-22";
    LocalDate localDate = LocalDate.parse(dateStr);
    System.out.println(localDate);
}
```

输出：

```
Exception in thread "main" java.time.format.DateTimeParseException: Text ''2017-3-22'' could not be parsed at index 5
  at java.time.format.DateTimeFormatter.parseResolved0(DateTimeFormatter.java:1949)
  at java.time.format.DateTimeFormatter.parse(DateTimeFormatter.java:1851)
  at java.time.LocalDate.parse(LocalDate.java:400)
  at java.time.LocalDate.parse(LocalDate.java:385)
  at com.kangyonggan.demo.time.LocalDateParseDemo.main(LocalDateParseDemo.java:14)

Process finished with exit code 1
```

比较例4和例5，发现parse方法对字符串的要求还是比较严格的，一旦解析不了就会抛异常。
在实际开发中，我们的字符串不可能都是yyyy-MM-dd型的，LocalDate还提供了另外一个同名方法。

## 日期解析（指定格式）
### 方法定义
```
public static LocalDate parse(CharSequence text, DateTimeFormatter formatter);
```

### 方法描述
把指定格式的字符串解析成日期。

### 抛异常
如果字符串不能被解析就会抛异常`DateTimeParseException`

### 例子6：

```
public static void main(String[] args) {
    String dateStr = "20170322";
    LocalDate localDate = LocalDate.parse(dateStr, DateTimeFormatter.BASIC_ISO_DATE);
    System.out.println(localDate);
}
```

输出：

```
2017-03-22

Process finished with exit code 0
```

这个例子中我使用的是预定义的格式器，当然你也可以自己定义格式。
相比SimpleDateFormat，这个方法是线程安全的，且提供了一大批预定义的格式器。

## 其他常用方法
LocalDate类中还提供了一些其他方法，比如：

方法定义 | 描述
------- | ------
public int getYear() | 获取年
public int getMonthValue() | 获取月
public int getDayOfMonth() | 获取日
public boolean isAfter(ChronoLocalDate other) | 判断是否在other日期之后
public boolean isBefore(ChronoLocalDate other) | 判断是否在other日期之前
public boolean isEqual(ChronoLocalDate other) | 判断和other日期是否相等
public boolean isLeapYear() | 判断是否是闰年
public int lengthOfMonth() | 返回一个月有多少天
public int lengthOfYear() | 返回一年有多少天
public static LocalDate of(int year, int month, int dayOfMonth) | 返回一个日期
public LocalDate minusDays(long daysToSubtract) | 减去n天，返回一个新的LocalDate
public LocalDate minusWeeks(long weeksToSubtract) | 减去n周，返回一个新的LocalDate
public LocalDate minusMonths(long monthsToSubtract) | 减去n月，返回一个新的LocalDate
public LocalDate minusYears(long yearsToSubtract) | 减去n年，返回一个新的LocalDate
public LocalDate plusDays(long daysToSubtract) | 加上n天，返回一个新的LocalDate
public LocalDate plusWeeks(long weeksToSubtract) | 加上n周，返回一个新的LocalDate
public LocalDate plusMonths(long monthsToSubtract) | 加上n月，返回一个新的LocalDate
public LocalDate plusYears(long yearsToSubtract) | 加上n年，返回一个新的LocalDate

> LocalDate类中远不止这些方法，具体请查看官方文档。


', 0, '2017-04-11 11:03:32', '2017-04-12 17:57:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('学习java8中java.time包下的几个类-LocalTime', 'java', 'Java后台', '

> 官方文档：[http://docs.oracle.com/javase/8/docs/api/index.html](http://docs.oracle.com/javase/8/docs/api/index.html)

上一篇文章中学习了`LocalDate`类，学到了一些关于日期的一些用法，这一章中学习一下`LocalTime`的用法。

<!-- more -->

## LocalTime类
### 类的定义
```
public final class LocalTime extends Object implements
      Temporal, TemporalAdjuster, Comparable<LocalTime>, Serializable
```

### 类的描述
这是一个`不可变`、`线程安全`的时间类，它可以存储时分秒（毫秒），但是不能存储年月日。

## 获取当前时间
### 方法定义
```
public static LocalTime now();
```

### 方法描述
获取系统当前时间。

### 例子1：

```
public static void main(String[] args) {
    LocalDate today = LocalDate.now();
    System.out.println(today);
}
```

输出：

```
15:44:38.220

Process finished with exit code 0
```

## 时间格式化
### 方法定义
```
public String format(DateTimeFormatter formatter);
```

### 方法描述
把时间格式化指定的格式。

### 抛异常
可能会抛运行时异常DateTimeException

### 例子2：
```
public static void main(String[] args) {
    LocalTime today = LocalTime.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.ofPattern("HHmmss")));
    System.out.println(today.format(DateTimeFormatter.ISO_LOCAL_TIME));
}
```

输出：

```
15:51:29.885
155129
15:51:29.885

Process finished with exit code 0
```

其中，`DateTimeFormatter`类中一些预定义的格式器，请参考上一篇文章:
[学习java8中java.time包下的几个类-LocalDate](http://kangyonggan.com/2017/03/25/学习java8中java-time包下的几个类-LocalDate/)

## 时间解析
### 方法定义
```
public static LocalTime parse(CharSequence text);
```

### 方法描述
把固定格式的字符串解析成时间，字符串格式必须为一下几种之一（亲测）:

- HH:mm
- HH:mm:ss
- HH:mm:ss.S
- HH:mm:ss.SS
- HH:mm:ss.SSS

不能为：

- HH
- HH:m:ss

### 抛异常
如果字符串不能被解析就会抛异常DateTimeParseException

### 例子4：
```
public static void main(String[] args) {
    String dateStr = "15:57:04";
    LocalTime localTime = LocalTime.parse(dateStr);
    System.out.println(localTime);
}
```

输出：

```
15:57:04

Process finished with exit code 0
```

### 例子5：
```
public static void main(String[] args) {
    String dateStr = "155704";
    LocalTime localTime = LocalTime.parse(dateStr, DateTimeFormatter.ofPattern("HHmmss"));
    System.out.println(localTime);
}
```

输出：

```
15:57:04

Process finished with exit code 0
```

## 其他常用方法
请参考上一篇文章或者官方文档。
', 0, '2017-04-11 11:04:27', '2017-08-14 05:22:31');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('学习java8中java.time包下的几个类-LocalDateTime', 'java', 'Java后台', '

> 官方文档：[http://docs.oracle.com/javase/8/docs/api/index.html](http://docs.oracle.com/javase/8/docs/api/index.html)

前两篇文章中学习了`LocalDate`和`LocalTime`类，学到了一些关于日期和时间的一些用法，这一章中学习一下`LocalDateTime`的用法。

<!-- more -->

## LocalDateTime类
### 类的定义
```
public final class LocalDateTime extends Object implements
    Temporal, TemporalAdjuster, ChronoLocalDateTime<LocalDate>, Serializable
```

### 类的描述
这是一个`不可变`、`线程安全`的时间类，它可以存储年月日时分秒（毫秒）。

## 获取当前日期时间
### 方法定义
```
public static LocalDateTime now();
```

### 方法描述
获取系统当前日期时间。

### 例子1：

```
public static void main(String[] args) {
    LocalDateTime today = LocalDateTime.now();
    System.out.println(today);
}
```

输出：

```
2017-03-22T16:10:02.586

Process finished with exit code 0
```

## 日期时间格式化
### 方法定义
```
public String format(DateTimeFormatter formatter);
```

### 方法描述
把日期时间格式化指定的格式。

### 抛异常
可能会抛运行时异常DateTimeException

### 例子2：
```
public static void main(String[] args) {
    LocalDateTime today = LocalDateTime.now();
    System.out.println(today);
    System.out.println(today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")));
    System.out.println(today.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
}
```

输出：

```
2017-03-22T16:12:51.661
2017-03-22 16:12:51.661
2017-03-22T16:12:51.661

Process finished with exit code 0
```

其中，`DateTimeFormatter`类中一些预定义的格式器，请参考之前的一篇文章:
[学习java8中java.time包下的几个类 - LocalDate](http://kangyonggan.com/#article/91)

## 日期时间解析
### 方法定义
```
public static LocalDateTime parse(CharSequence text);
```

### 方法描述
把固定格式的字符串解析成日期时间，字符串格式必须为`2017-03-22T15:57:04`。

### 抛异常
如果字符串不能被解析就会抛异常DateTimeParseException

### 例子4：
```
public static void main(String[] args) {
    String dateStr = "2017-03-22T15:57:04";
    LocalDateTime localDateTime = LocalDateTime.parse(dateStr);
    System.out.println(localDateTime);
}
```

输出：

```
2017-03-22T15:57:04

Process finished with exit code 0
```

### 例子5：
```
public static void main(String[] args) {
    String dateStr = "2017-03-22 15:57:04";
    LocalDateTime localDateTime = LocalDateTime.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    System.out.println(localDateTime);
}
```

输出：

```
2017-03-22T15:57:04

Process finished with exit code 0
```

## 其他常用方法
请参考`学习java8中java.time包下的几个类-LocalDate`或者官方文档。




', 0, '2017-04-11 11:05:14', '2017-08-03 07:35:20');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('如何把内网机器变成外网可以访问的服务器', 'other', '综合', '

## 环境准备
1. 需要一台内网机器（性能越强越好）【192.168.1.100】
2. 一个有公网IP的路由器，或者移动内网或者电信内网IP都可以【101.245.198.155】
3. 一个公网服务器（不需要内存太大，1G足够）【121.40.66.176】

> 路由器和公网服务器要能互通，如果不通，可以尝试重启路由器，重启的作用是换一个新的ip，也许就通了

<!-- more -->

## 步骤
1. 把服务器部署在内网机器上，比如我的博客在内网可以访问:192.168.1.100:8088
2. 登录路由器，配置“端口转发”，把请求路由器8088端口的请求，转发到请求192.168.1.100:8088
3. 登录公网服务器，执行远程端口转发命令：

```
ssh -C -f -N -g -L 80:101.245.198.155:8088 kyg@101.245.198.155
```

表示，请求公网80端口的请求，会被转发到路由器（101.245.198.155）的8088端口

## 保持转发链接不中断（自动重连）
查看任务
`crontab -l`

创建任务
`crontab -e`

每小时重连一次
`0 * * * * sh conn.sh`
', 0, '2017-04-11 11:08:36', '2017-08-16 07:50:25');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('多环境下autoconfig使用的小例子', 'java', 'Java后台', '

## 为什么使用Autoconfig
在一个应用中，我们总是会遇到一些参数，例如：

- 数据库服务器IP地址、端口、用户名；
- 用来保存上传资料的目录。
- 一些参数，诸如是否打开cache、加密所用的密钥名称等等。

这些参数有一个共性，那就是：它们和应用的逻辑无关，只和当前环境、当前系统用户相关。以下场景很常见：

- 在开发、测试、发布阶段，使用不同的数据库服务器；
- 在开发阶段，使用Windows的A开发者将用户上传的文件存放在d:my_upload目录中，而使用Linux的B开发者将同样的文件存放在/home/myname/my_upload目录中。
- 在开发阶段设置cache=off，在生产环境中设置cache=on。
- 很明显，这些参数不适合被“硬编码”在配置文件或代码中。因为每一个从源码库中取得它们的人，都有可能需要修改它们，使之与自己的环境相匹配, autoconfig就是很好的选择。

<!-- more -->

## 引入插件
在`pom.xml`中引入插件，下面为多环境配置

```
<plugin.autoconfig.version>1.2</plugin.autoconfig.version>

...

<!-- autoconfig -->
<plugin>
    <groupId>com.alibaba.citrus.tool</groupId>
    <artifactId>autoconfig-maven-plugin</artifactId>
    <version>${plugin.autoconfig.version}</version>
    <executions>
        <execution>
            <id>compile</id>
            <phase>compile</phase>
            <goals>
                <goal>autoconfig</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <userProperties>${antx.path}</userProperties>
    </configuration>
</plugin>

...

<profiles>
    <profile>
        <id>dev</id>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
            <antx.path>${user.home}/antx-dev.properties</antx.path>
        </properties>
    </profile>
    <profile>
        <id>prod</id>
        <properties>
            <antx.path>${user.home}/antx-prod.properties</antx.path>
        </properties>
    </profile>
</profiles>
```

## 配置
在`src/main/resources`下创建目录`Meta-INF/autoconfig`，在目录下创建文件`auto-config.xml`, 下面是我的配置（依个人而定）:

```
<?xml version="1.0" encoding="UTF-8"?>
<config>
    <group>
        <!-- dubbo -->
        <property name="api.dubbo.name" description="项目名字" defaultValue="api"></property>
        <property name="api.dubbo.registry.address" description="dubbo注册地址"
                  defaultValue="zookeeper://127.0.0.1:2181?backup=127.0.0.1:2182,127.0.0.1:2183"></property>
        <property name="api.dubbo.protocol.port" description="dubbo注册端口" defaultValue="-1"></property>
        <property name="api.dubbo.timeout" description="dubbo超时时间" defaultValue="10000"></property>
        <property name="api.dubbo.api.version" description="api提供接口的版本" defaultValue="1.0.0"></property>

        <!-- redis -->
        <property name="api.redis.maxTotal" description="redis最大连接数" defaultValue="1000"></property>
        <property name="api.redis.minIdle" description="redis最小等待数" defaultValue="50"></property>
        <property name="api.redis.maxIdle" description="redis最大等待数" defaultValue="100"></property>
        <property name="api.redis.testOnBorrow" description="redis测试支持" defaultValue="true"></property>
        <property name="api.redis.host" description="redis主机ip" defaultValue="127.0.0.1"></property>
        <property name="api.redis.port" description="redis主机端口" defaultValue="6379"></property>
        <property name="api.redis.password" description="redis密码" defaultValue="123456"></property>

        <!--jdbc-->
        <property name="api.jdbc.driver" description="jdbc驱动" defaultValue="com.mysql.jdbc.Driver"></property>
        <property name="api.jdbc.url" description="jdbc地址" defaultValue="jdbc:mysql://127.0.0.1:3306/api"></property>
        <property name="api.jdbc.username" description="jdbc用户名" defaultValue="root"></property>
        <property name="api.jdbc.password" description="jdbc密码" defaultValue="123456"></property>

        <!-- log4j2 -->
        <property name="api.log4j2.home" description="log4j2日志的文件主目录" defaultValue="/root/logs/api"></property>

        <property name="api.slow.method.time" description="慢方法时间(秒)" defaultValue="10"></property>
        <property name="api.slow.interface.time" description="慢接口时间(秒)" defaultValue="10"></property>
        <property name="api.redis.prefix.key" description="redis键的前缀" defaultValue="api"></property>
        <property name="api.cache.open" description="是否开启缓存,Y:开启,N:不开启" defaultValue="Y"></property>
    </group>
    <script>
        <generate template="app.properties"></generate>
        <generate template="applicationContext-datasource.xml"></generate>
        <generate template="applicationContext-provider.xml"></generate>
        <generate template="applicationContext-redis.xml"></generate>
        <generate template="log4j2.xml"></generate>
    </script>
</config>
```

## 使用
在上一步中可以看到antx将会替换五个文件，下面是其中一个文件的配置`applicationContext-redis.xml`:

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:p="http://www.springframework.org/schema/p"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
ohttp://www.springframework.org/schema/beans/spring-beans-4.0.xsd">

    <bean id="poolConfig" class="redis.clients.jedis.JedisPoolConfig">
        <property name="maxTotal" value="${api.redis.maxTotal}"></property>
        <property name="minIdle" value="${api.redis.minIdle}"></property>
        <property name="maxIdle" value="${api.redis.maxIdle}"></property>
        <property name="testOnBorrow" value="${api.redis.testOnBorrow}"></property>
    </bean>

    <bean id="jedisConnectionFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory"
          p:hostName="${api.redis.host}" p:port="${api.redis.port}" p:password="${api.redis.password}" p:poolConfig-ref="poolConfig"></bean>

    <bean id="redisTemplate" class="org.springframework.data.redis.core.RedisTemplate">
        <property name="connectionFactory" ref="jedisConnectionFactory"></property>
        <property name="keySerializer">
            <bean class="org.springframework.data.redis.serializer.StringRedisSerializer" ></bean>
        </property>
        <property name="valueSerializer">
            <bean class="org.springframework.data.redis.serializer.JdkSerializationRedisSerializer"></bean>
        </property>
    </bean>
</beans>
```

> 在项目`mvn clean install`的时候，antx会自动替换它所包含的文件，可以再`target`目录下查看指定的文件是否被替换成功

', 0, '2017-04-11 11:09:38', '2017-05-27 15:45:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('在ubuntu14.04下安装nginx服务器', 'linux', '系统运维', '

## 下载安装
```
sudo apt-get install nginx
```

安装完成后打开浏览器输入`http://localhost`, 看到下图代表安装成功:

<!-- more -->

![nginx](https://kangyonggan.com/upload/20170101125316443.png)

### 常用命令
1. 启动: `nginx -c /etc/nginx/nginx.conf`
2. 停止: `nginx -s stop`
3. 重新加载（配置）: `nginx -s reload`
4. 重新打开日志文件: `nginx -s reopen`

## 动静分离反向代理配置
修改`/etc/nginx/sites-available/default`配置:

```
server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
                proxy_pass http://localhost:8088;
        }

        # 设定访问静态文件直接读取不经过tomcat
        location ^~ /static/ {
                proxy_pass http://localhost:8088;
                root /WEB-INF/static/;
        }
}
```

', 0, '2017-04-11 11:10:46', '2017-07-21 08:00:28');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('刚刚安装的ubuntu16.04.1没ssh服务', 'linux', '系统运维', '
在ubuntu16.04.1安装ssh服务，让远程可以用ssh登录

```
sudo apt-get update

sudo apt-get install openssh-server
```

', 0, '2017-04-11 11:11:11', '2017-08-14 13:39:09');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用配置中心代替properties', 'java', 'Java后台', '


## 生成一个项目`confogcenter`
用`cms-archetype`生成一个项目，然后在此基础上开发一个模块，用于管理配置信息（CRUD）

我写的配置中心在github上: [https://github.com/kangyonggan/configcenter.git](https://github.com/kangyonggan/configcenter.git)

<!-- more -->

## 原理
在spring把占位符替换之前，发送http get请求到配置中心读取配置，拿到此项目的所有配置信息后（json），把json数据解析成一对对的名值对，最后把所有的名值对全部放入系统配置中，即:`System.setProperty(name, value);`。

## 具体实现

在`applicationContext.xml`的最上方（也不一定最上，但一定要在所有占位符的上面）添加自定义的`bean`:

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:context="http://www.springframework.org/schema/context" xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/aop
ohttp://www.springframework.org/schema/aop/spring-aop-4.0.xsd
ohttp://www.springframework.org/schema/beans
ohttp://www.springframework.org/schema/beans/spring-beans-4.0.xsd
ohttp://www.springframework.org/schema/tx
ohttp://www.springframework.org/schema/tx/spring-tx-4.0.xsd
ohttp://www.springframework.org/schema/context
ohttp://www.springframework.org/schema/context/spring-context-4.0.xsd">

    <!-- Activates annotation-based bean configuration -->
    <context:annotation-config></context:annotation>

    <!-- 读取属性文件，否则 java 类无法直接读取属性 -->
    <context:property-placeholder location="classpath:app.properties"></context:property>

    <!-- 读取配置中心 -->
    <bean class="com.kangyonggan.archetype.cmscc.biz.core.MyPropertyPlaceholderConfigurer" ></bean>

    ...
</beans>
```

`MyPropertyPlaceholderConfigurer.java`的实现:

```
package com.kangyonggan.archetype.cmscc.biz.core;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kangyonggan.archetype.cmscc.biz.util.HttpUtil;
import com.kangyonggan.archetype.cmscc.biz.util.PropertiesUtil;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * @author kangyonggan
 * @since 2017/1/25
 */
@Log4j2
public class MyPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

    public MyPropertyPlaceholderConfigurer() {
        loadConfigs();
    }

    /**
     * 加载配置
     */
    private void loadConfigs() {
        String server = PropertiesUtil.getProperties("config.center.server");
        log.info("配置中心服务地址:{}", server);

        String data = HttpUtil.sendGet(server);

        if (StringUtils.isEmpty(data)) {
            throw new RuntimeException("读取配置中心异常");
        }

        log.info("已成功获取配置中心的配置");

        JSONObject jsonObject = JSON.parseObject(data);
        String errCode = (String) jsonObject.get("errCode");
        String errMsg = (String) jsonObject.get("errMsg");

        log.info("errCode:{}", errCode);
        log.info("errMsg:{}", errMsg);

        if (!"success".equals(errCode)) {
            throw new RuntimeException("读取配置中心失败");
        }

        JSONArray jsonArray = jsonObject.getJSONArray("configs");
        log.info("共有{}项配置!", jsonArray.size());

        load(jsonArray);
    }

    /**
     * 加载配置
     *
     * @param jsonArray
     */
    public static void load(JSONArray jsonArray) {
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject object = jsonArray.getJSONObject(i);
            log.info("正在存储配置:{}", object);

            String name = object.getString("name");
            String value = object.getString("value");

            System.setProperty(name, value);
            PropertiesUtil.putProperties(name, value);
        }

        log.info("从配置中心加载配置完毕！！！");
    }

}
```

其中`public static void load(JSONArray jsonArray) `之所以写成了`static`是因为我其他地方也想使用, 比如：我发现ftp的ip配置错了，然后修改了ftp的ip，但是又不想重启服务器，这时候我就会在配置中心的控制台上点一下`推送配置`,然后客户端项目就能接收到配置了，然后就需要调用load方法刷新一下内存中的配置，但有些配置刷了也没用，比如jdbc的url等。

接收配置的代码`ConfigcenterController.java`:

```
package com.kangyonggan.archetype.cmscc.web.controller.web;

import com.alibaba.fastjson.JSONArray;
import com.kangyonggan.archetype.cmscc.biz.core.MyPropertyPlaceholderConfigurer;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLDecoder;

/**
 * @author kangyonggan
 * @since 2017/1/27
 */
@Controller
@RequestMapping("configcenter")
@Log4j2
public class ConfigcenterController {

    /**
     * 接收配置中心推送过来的配置
     *
     * @param data
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public boolean receiver(@RequestParam("data") String data) {
        try {
            data = URLDecoder.decode(data, "UTF-8");
            MyPropertyPlaceholderConfigurer.load(JSONArray.parseArray(data));
        } catch (Exception e) {
            log.error("接收配置失败", e);
            return false;
        }
        return true;
    }

}
```

## 注意
#### 日志的目录不能配置在配置中心，因为在读取配置中心的配置之前就使用到了日志，我的解决方案是写入了`pom.xml`, 如：`<log4j2.home>/Users/kyg/logs/cmscc</log4j2.home>`
#### 配置中心服务器的地址配置在了`app.properties`，因为配置中心的地址是可能变的，所以不能硬编码，如：`app.proerperties`的内容:

```
config.center.server=http://localhost:7777/configuration?proj=${project.parent.artifactId}&env=${env}
```

其中`${project.parent.artifactId}`会取自`pom.xml`中父模块的artifactId,
`${env}`指的是环境，比如开发环境，联调环境，生产环境等。我写在了pom.xml中:

```
<profiles>
    <profile>
        <id>local</id>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>dev</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>uat</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>hd</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
    <profile>
        <id>prod</id>
        <properties>
            <env>local</env>
        </properties>
    </profile>
</profiles>
```

我把使用配置中心的项目也写了一个项目原型,地址在:[https://github.com/kangyonggan/cmscc-archetype.git](https://github.com/kangyonggan/cmscc-archetype.git)

## 附配置中心推送配置的代码
```
/**
 * 推送配置
 *
 * @param id
 * @param env
 * @return
 */
@RequestMapping(value = "push", method = RequestMethod.POST)
@RequiresPermissions("CORE_PROJECT")
@ResponseBody
public Map<String, Object> push(@RequestParam("id") Long id, @RequestParam("env") String env) {
    Map<String, Object> resultMap = getResultMap();
    Project project = projectService.findProjectById(id);

    if (project != null && StringUtils.isNotEmpty(project.getPushUrl())) {
        List<Configuration> configurations = configurationService.findProjectConfigurations(project.getCode(), env);
        String json = JSON.toJSONString(configurations);
        try {
            String data = URLEncoder.encode(json, "UTF-8");
            String result = HttpUtil.sendPost(project.getPushUrl(), "data=" + data);
            if (!"true".equals(result)) {
                setResultMapFailure(resultMap, "推送失败，请稍后再试！");
            }
        } catch (Exception e) {
            log.error("推送配置失败", e);
            setResultMapFailure(resultMap);
        }
    } else {
        setResultMapFailure(resultMap);
    }

    return resultMap;
}
```




', 0, '2017-04-11 11:12:15', '2017-07-18 06:22:53');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用U盘安装CentOS7最小安装版', 'linux', '系统运维', '

## 下载镜像文件和刻录工具
1. CentOS7最小安装版镜像文件下载地址：[http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso)

2. 刻录工具下载地址：[https://cn.ultraiso.net/uiso9_cn.exe](https://cn.ultraiso.net/uiso9_cn.exe)

<!-- more -->

## 把系统镜像刻录到U盘
打开刻录工具`UltraISO`，【文件】-->【打开】-->【选择下载好的镜像CentOS-7-x86_64-Minimal-1611.iso】

![打开镜像](https://kangyonggan.com/upload/centos-001.png)

【启动】-->【写入硬盘映像...】

![写入硬盘映像](https://kangyonggan.com/upload/centos-002.png)

这个过程会格式化U盘，请先备份U盘内的数据，然后点击【写入】，写入过程需要一些时间。

![写入](https://kangyonggan.com/upload/centos-003.png)

一会之后，写入完成！至此，你就完成了准备工作“把系统镜像刻录到U盘”，接下来就是要用U盘安装系统了。

![写入成功](https://kangyonggan.com/upload/centos-004.png)

## 使用U盘启动
在按开机按钮后，点按F12（大多数品牌的电脑都是按F12进入一次性启动项），进入启动项后，选择带USB字样的那一项进入

![bios-usb](https://kangyonggan.com/upload/centos-005.jpg)

进入CentOS7的安装界面，选择第一行`Install CentOS Linux 7`

![安装CentOS7](https://kangyonggan.com/upload/centos-006.jpg)

## 安装系统
选择系统语言，这里我选择的是英语（推荐使用英语）。

![选择语言](https://kangyonggan.com/upload/centos-015.jpg)

选择磁盘，点击【SYSTEM】-->【INSTALLION DESTINATION】

![选择磁盘](https://kangyonggan.com/upload/centos-007.jpg)

选中自己电脑的硬盘，点击【Done】

![选中自己电脑的硬盘](https://kangyonggan.com/upload/centos-008.jpg)

释放磁盘空间，点击【Reclaim space】

![释放磁盘空间](https://kangyonggan.com/upload/centos-009.jpg)

删除老系统占用的空间，点击【Delete】

![删除老系统占用的空间](https://kangyonggan.com/upload/centos-010.jpg)

删除后点击【Reclaim space】完成。

![删除老系统占用的空间完成](https://kangyonggan.com/upload/centos-011.jpg)

开始安装，点击【Begin Installation】

![开始安装](https://kangyonggan.com/upload/centos-012.jpg)

此时会进入漫长的安装过程（机器配置好的话会很快），点击【ROOT PASSWORD】设置root的密码。

![设置root的密码](https://kangyonggan.com/upload/centos-013.jpg)

root密码设置完成后点击【DONE】

![设置root的密码完成](https://kangyonggan.com/upload/centos-014.jpg)

然后就等吧，直到右下角出现【Reboot】，说明安装完毕！

![安装完毕](https://kangyonggan.com/upload/centos-016.jpg)



', 0, '2017-04-11 11:15:48', '2017-04-12 17:22:36');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用openssl生成RSA密钥对', 'code', '代码片段', '

## 生成秘钥对
### 生成RSA私钥，以X509编码，指定生成的密钥的位数为2048位，该步生成的私钥只是临时文件，以便第二步将私钥转为PKCS#8编码。

```
openssl genrsa -out rsa_private_key_2048.pem 2048
```

<!-- more -->

### 将上一步生成的RSA私钥转换成PKCS#8编码，作为最终使用的私钥。

```
openssl pkcs8 -topk8 -in rsa_private_key_2048.pem -out pkcs8_rsa_private_key_2048.pem -nocrypt
```

### 导出RSA公钥，以X509编码，作为最终交换的公钥。

```
openssl rsa -in rsa_private_key_2048.pem -out rsa_public_key_2048.pem -pubout
```

> 注：一般Linux系统都装有openssl工具，在windows下可以安装OpenSSL工具包。

## 用法
### 加密工具
`CryptoUtil.java`:

```
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import lombok.extern.log4j.Log4j2;
import java.io.*;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * @author kangyonggan
 * @since 2016/12/27
 */
@Log4j2
public class CryptoUtil {

    /**
     * 获取公钥对象
     *
     * @param inputStream  公钥输入流
     * @param keyAlgorithm 密钥算法
     * @return 公钥对象
     * @throws Exception
     */
    public static PublicKey getPublicKey(InputStream inputStream, String keyAlgorithm) throws Exception {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            StringBuilder sb = new StringBuilder();
            String readLine;
            while ((readLine = br.readLine()) != null) {
                if (readLine.charAt(0) == ''-'') {
                    continue;
                } else {
                    sb.append(readLine);
                    sb.append(''
'');
                }
            }
            X509EncodedKeySpec pubX509 = new X509EncodedKeySpec(Base64.decodeBase64(sb.toString()));
            KeyFactory keyFactory = KeyFactory.getInstance(keyAlgorithm);
            PublicKey publicKey = keyFactory.generatePublic(pubX509);

            return publicKey;
        } catch (FileNotFoundException e) {
            throw new Exception("公钥路径文件不存在");
        } catch (IOException e) {
            throw new Exception("读取公钥异常");
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("生成密钥工厂时没有[%s]此类算法", keyAlgorithm));
        } catch (InvalidKeySpecException e) {
            throw new Exception("生成公钥对象异常");
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                log.error(e);
            }
        }
    }

    /**
     * 获取私钥对象
     *
     * @param inputStream  私钥输入流
     * @param keyAlgorithm 密钥算法
     * @return 私钥对象
     * @throws Exception
     */
    public static PrivateKey getPrivateKey(InputStream inputStream, String keyAlgorithm) throws Exception {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            StringBuilder sb = new StringBuilder();
            String readLine;
            while ((readLine = br.readLine()) != null) {
                if (readLine.charAt(0) == ''-'') {
                    continue;
                } else {
                    sb.append(readLine);
                    sb.append(''
'');
                }
            }
            PKCS8EncodedKeySpec priPKCS8 = new PKCS8EncodedKeySpec(Base64.decodeBase64(sb.toString()));
            KeyFactory keyFactory = KeyFactory.getInstance(keyAlgorithm);
            PrivateKey privateKey = keyFactory.generatePrivate(priPKCS8);

            return privateKey;
        } catch (FileNotFoundException e) {
            throw new Exception("私钥路径文件不存在");
        } catch (IOException e) {
            throw new Exception("读取私钥异常");
        } catch (NoSuchAlgorithmException e) {
            throw new Exception("生成私钥对象异常");
        } catch (InvalidKeySpecException e) {
            throw new Exception("生成私钥对象异常");
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                log.error(e);
            }
        }
    }

    /**
     * 数字签名函数入口
     *
     * @param plainBytes    待签名明文字节数组
     * @param privateKey    签名使用私钥
     * @param signAlgorithm 签名算法
     * @return 签名后的字节数组
     * @throws Exception
     */
    public static byte[] digitalSign(byte[] plainBytes, PrivateKey privateKey, String signAlgorithm) throws Exception {
        try {
            Signature signature = Signature.getInstance(signAlgorithm);
            signature.initSign(privateKey);
            signature.update(plainBytes);
            byte[] signBytes = signature.sign();

            return signBytes;
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("数字签名时没有[%s]此类算法", signAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("数字签名时私钥无效");
        } catch (SignatureException e) {
            throw new Exception("数字签名时出现异常");
        }
    }

    /**
     * 验证数字签名函数入口
     *
     * @param plainBytes    待验签明文字节数组
     * @param signBytes     待验签签名后字节数组
     * @param publicKey     验签使用公钥
     * @param signAlgorithm 签名算法
     * @return 验签是否通过
     * @throws Exception
     */
    public static boolean verifyDigitalSign(byte[] plainBytes, byte[] signBytes, PublicKey publicKey, String signAlgorithm) throws Exception {
        boolean isValid;
        try {
            Signature signature = Signature.getInstance(signAlgorithm);
            signature.initVerify(publicKey);
            signature.update(plainBytes);
            isValid = signature.verify(signBytes);
            return isValid;
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("验证数字签名时没有[%s]此类算法", signAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("验证数字签名时公钥无效");
        } catch (SignatureException e) {
            throw new Exception("验证数字签名时出现异常");
        }
    }

    /**
     * 加密
     *
     * @param plainBytes      明文字节数组
     * @param publicKey       公钥
     * @param keyLength       密钥bit长度
     * @param reserveSize     padding填充字节数，预留11字节
     * @param cipherAlgorithm 加解密算法，一般为RSA/ECB/PKCS1Padding
     * @return 加密后字节数组，不经base64编码
     * @throws Exception
     */
    public static byte[] encrypt(byte[] plainBytes, PublicKey publicKey, int keyLength, int reserveSize, String cipherAlgorithm) throws Exception {
        int keyByteSize = keyLength / 8; // 密钥字节数
        int encryptBlockSize = keyByteSize - reserveSize; // 加密块大小=密钥字节数-padding填充字节数
        int nBlock = plainBytes.length / encryptBlockSize;// 计算分段加密的block数，向上取整
        if ((plainBytes.length % encryptBlockSize) != 0) { // 余数非0，block数再加1
            nBlock += 1;
        }

        try {
            Cipher cipher = Cipher.getInstance(cipherAlgorithm);
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);

            // 输出buffer，大小为nBlock个keyByteSize
            ByteArrayOutputStream outbuf = new ByteArrayOutputStream(nBlock * keyByteSize);
            // 分段加密
            for (int offset = 0; offset < plainBytes.length; offset += encryptBlockSize) {
                int inputLen = plainBytes.length - offset;
                if (inputLen > encryptBlockSize) {
                    inputLen = encryptBlockSize;
                }

                // 得到分段加密结果
                byte[] encryptedBlock = cipher.doFinal(plainBytes, offset, inputLen);
                // 追加结果到输出buffer中
                outbuf.write(encryptedBlock);
            }

            outbuf.flush();
            outbuf.close();
            return outbuf.toByteArray();
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("没有[%s]此类加密算法", cipherAlgorithm));
        } catch (NoSuchPaddingException e) {
            throw new Exception(String.format("没有[%s]此类填充模式", cipherAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("无效密钥");
        } catch (IllegalBlockSizeException e) {
            throw new Exception("加密块大小不合法");
        } catch (BadPaddingException e) {
            throw new Exception("错误填充模式");
        } catch (IOException e) {
            throw new Exception("字节输出流异常");
        }
    }

    /**
     * RSA解密
     *
     * @param encryptedBytes  加密后字节数组
     * @param privateKey      私钥
     * @param keyLength       密钥bit长度
     * @param reserveSize     padding填充字节数，预留11字节
     * @param cipherAlgorithm 加解密算法，一般为RSA/ECB/PKCS1Padding
     * @return 解密后字节数组，不经base64编码
     * @throws Exception
     */
    public static byte[] decrypt(byte[] encryptedBytes, PrivateKey privateKey, int keyLength, int reserveSize, String cipherAlgorithm) throws Exception {
        int keyByteSize = keyLength / 8; // 密钥字节数
        int decryptBlockSize = keyByteSize - reserveSize; // 解密块大小=密钥字节数-padding填充字节数
        int nBlock = encryptedBytes.length / keyByteSize;// 计算分段解密的block数，理论上能整除

        try {
            Cipher cipher = Cipher.getInstance(cipherAlgorithm);
            cipher.init(Cipher.DECRYPT_MODE, privateKey);

            // 输出buffer，大小为nBlock个decryptBlockSize
            ByteArrayOutputStream outbuf = new ByteArrayOutputStream(nBlock * decryptBlockSize);
            // 分段解密
            for (int offset = 0; offset < encryptedBytes.length; offset += keyByteSize) {
                // block大小: decryptBlock 或 剩余字节数
                int inputLen = encryptedBytes.length - offset;
                if (inputLen > keyByteSize) {
                    inputLen = keyByteSize;
                }

                // 得到分段解密结果
                byte[] decryptedBlock = cipher.doFinal(encryptedBytes, offset, inputLen);
                // 追加结果到输出buffer中
                outbuf.write(decryptedBlock);
            }

            outbuf.flush();
            outbuf.close();
            return outbuf.toByteArray();
        } catch (NoSuchAlgorithmException e) {
            throw new Exception(String.format("没有[%s]此类解密算法", cipherAlgorithm));
        } catch (NoSuchPaddingException e) {
            throw new Exception(String.format("没有[%s]此类填充模式", cipherAlgorithm));
        } catch (InvalidKeyException e) {
            throw new Exception("无效密钥");
        } catch (IllegalBlockSizeException e) {
            throw new Exception("解密块大小不合法");
        } catch (BadPaddingException e) {
            throw new Exception("错误填充模式");
        } catch (IOException e) {
            throw new Exception("字节输出流异常");
        }
    }

    /**
     * 字符数组转16进制字符串
     *
     * @param bytes
     * @return
     */
    public static String bytes2string(byte[] bytes, int radix) {
        // 2个16进制字符占用1个字节，8个二进制字符占用1个字节
        int size = 2;
        if (radix == 2) {
            size = 8;
        }
        StringBuilder sb = new StringBuilder(bytes.length * size);
        for (int i = 0; i < bytes.length; i++) {
            int integer = bytes[i];
            while (integer < 0) {
                integer = integer + 256;
            }
            String str = Integer.toString(integer, radix);
            sb.append(StringUtils.leftPad(str.toUpperCase(), size, "0"));
        }
        return sb.toString();
    }
}
```

### 签名
```
byte[] signBytes = CryptoUtil.digitalSign(xml.getBytes("UTF-8"), privateKey, "SHA1WithRSA");
```

### 加密
```
byte[] encryptedBytes = CryptoUtil.encrypt(xmlBytes, publicKey, 2048, 11, "RSA/ECB/PKCS1Padding");
```

### 解密
```
byte[] xmlBytes = CryptoUtil.decrypt(encryptedBytes, privateKey, 2048, 11, "RSA/ECB/PKCS1Padding");
```

### 验签
```
boolean isValid = CryptoUtil.verifyDigitalSign(xmlBytes, signBytes, publicKey, "SHA1WithRSA");
```

### 加载私钥
```
/**
 * 加载私钥
 */
private void loadPrivateKey() {
    String privateKeyPath = null;
    InputStream inputStream = null;
    try {
        // TODO
        privateKeyPath = "私钥路径";
        inputStream = new FileInputStream(privateKeyPath);
        privateKey = CryptoUtil.getPrivateKey(inputStream, "RSA");
    } catch (Exception e) {
        log.error("无法加载己方私钥[{}]", privateKeyPath);
        log.error(e.getMessage(), e);
    } finally {
        try {
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception e) {
            log.error(e);
        }
    }
}
```

### 加载公钥
```
/**
 * 加载公钥
 */
private void loadPublicKey() {
    String publicKeyPath = null;
    InputStream inputStream = null;
    try {
        // TODO
        publicKeyPath = "公钥路径";
        inputStream = new FileInputStream(publicKeyPath);
        publicKey = CryptoUtil.getPublicKey(inputStream, "RSA");
    } catch (Exception e) {
        log.error("无法加载对方公钥[{}]", publicKeyPath);
        log.error(e.getMessage(), e);
    } finally {
        try {
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception e) {
            log.error(e);
        }
    }
}
```
', 0, '2017-04-11 11:16:52', '2017-06-05 06:20:36');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用Log4j正则替换功能隐藏敏感信息', 'java', 'Java后台', '

今天工作中遇到一个问题，需要把一些Log4j日志中的敏感信息给隐藏了，比如：手机号，身份证号等。

## pom.xml
```
<dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>1.2.16</version>
</dependency>
```

<!-- more -->

## log4j.xml
```
<?xml version="1.0" encoding="GBK" ?>
<!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">
<log4j:configuration>

    <appender name="console" class="org.apache.log4j.ConsoleAppender">
        <!--<layout class="org.apache.log4j.PatternLayout">-->
        <!--<param name="ConversionPattern" value="%d %t [%F:%L] %-5p : %m%n" />-->
        <!--</layout>-->
        <layout class="com.kangyonggan.demo.MyPatternLayout">
            <param name="ConversionPattern" value="%d %t [%F:%L] %-5p : %m%n"/>
        </layout>
    </appender>

    <root>
        <level value="debug"></level>
        <appender-ref ref="console"></appender>
    </root>
</log4j:configuration>
```

## MyPatternLayout.java
```
package com.kangyonggan.demo;

import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.spi.LoggingEvent;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author kangyonggan
 * @since 2017/3/20
 */
public class MyPatternLayout extends PatternLayout {

    private static final String HIDDEN = "$1$2$3****$5$6";
    private static final Pattern MOBILE_PATTERN = Pattern.compile("(\\D|^)(1)(3\\d|4[57]|5[^4]|7[0137]|8\\d)(\\d{4})(\\d{4})(\\D|$)");

    @Override
    public String format(LoggingEvent event) {
        if (event.getMessage() instanceof String) {
            String message = event.getRenderedMessage();

            Matcher matcher = MOBILE_PATTERN.matcher(message);

            if (matcher.find()) {
                String maskedMessage = matcher.replaceAll(HIDDEN);

                Throwable throwable = event.getThrowableInformation() != null ? event.getThrowableInformation().getThrowable() : null;

                LoggingEvent maskedEvent = new LoggingEvent(
                        event.fqnOfCategoryClass,
                        Logger.getLogger(event.getLoggerName()),
                        event.timeStamp,
                        event.getLevel(),
                        maskedMessage,
                        throwable);

                return super.format(maskedEvent);
            }
        }

        return super.format(event);
    }
}
```

## Test.java
```
package com.kangyonggan.demo;

import org.apache.log4j.Logger;

/**
 * @author kangyonggan
 * @since 2017/3/20
 */
public class Test {

    private static final Logger logger = Logger.getLogger(Test.class);

    public static void main(String[] args) {
        logger.info("手机号1: 13911119999，姓名：qweqe");
        logger.info("手机号2: asd13911119999asd");
        logger.info("假手机号1: 139a11119999");
        logger.info("假手机号2: 139111199991");
        logger.info("假手机号3: 139111199991");
        logger.info("假手机号4: 444139111199991");
        logger.info("假手机号5: 44413911119999");

        try {
            int a = 1 / 0;
        } catch (Exception e) {
            logger.error("13911110000", e);
        }
    }

}
```

## 输出
```
2017-03-21 15:32:50,163 main [Test.java:14] INFO  : 手机号1: 139****9999，姓名：qweqe
2017-03-21 15:32:50,166 main [Test.java:15] INFO  : 手机号2: asd139****9999asd
2017-03-21 15:32:50,166 main [Test.java:16] INFO  : 假手机号1: 139a11119999
2017-03-21 15:32:50,166 main [Test.java:17] INFO  : 假手机号2: 139111199991
2017-03-21 15:32:50,166 main [Test.java:18] INFO  : 假手机号3: 139111199991
2017-03-21 15:32:50,167 main [Test.java:19] INFO  : 假手机号4: 444139111199991
2017-03-21 15:32:50,167 main [Test.java:20] INFO  : 假手机号5: 44413911119999
2017-03-21 15:32:50,167 main [Test.java:25] ERROR : 13911110000
java.lang.ArithmeticException: / by zero
  at com.kangyonggan.demo.Test.main(Test.java:23)

Process finished with exit code 0
```

> 例子中的正则表达式写的比较弱，请根据实际情况自己写。

', 0, '2017-04-11 11:17:56', '2017-05-27 15:31:30');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用Log4j2让项目输出info级别的日志和debug级别的sql', 'java', 'Java后台', '

> log4j2的使用方法请参考我之前的一篇文章

让项目输出info级别的日志，让项目输出debug级别的日志，`log4j2.xml`的配置如下:

<!-- more -->

```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/simconf</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
        </Console>
        <RollingRandomAccessFile name="AllFile" fileName="${LOG_HOME}/all.log"
                                 filePattern="${LOG_HOME}/all-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <RollingRandomAccessFile name="ErrorFile" fileName="${LOG_HOME}/error.log"
                                 filePattern="${LOG_HOME}/error-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <Async name="AsyncAll">
            <AppenderRef ref="AllFile"></AppenderRef>
        </Async>
        <Async name="AsyncError">
            <AppenderRef ref="ErrorFile"></AppenderRef>
        </Async>
    </Appenders>
    <Loggers>
        <Logger name="com.kangyonggan.app.simconf.mapper" level="debug" additivity="false">
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Logger>

        <Root level="info" additivity="true">
            <AppenderRef ref="Console"></AppenderRef>
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Root>
    </Loggers>
</Configuration>
```

只配置log4j2.xml是不够的，因为Mybatis默认使用的不是log4j2，默认使用的顺序如下:

> SLF4J > Apache Commons Logging > Log4j2 > Log4j > JDK logging

所有我们还需要让Mybatis使用log4j2来输出日志:

```
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    ...
    <property name="configLocation" value="classpath:mybatis.xml"></property>
    ...
</bean>
```

`mybatis.xml`的内容:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <settings>
        <!--使用log4j2输出日志-->
        <setting name="logImpl" value="LOG4J2"></setting>
    </settings>
</configuration>
```

小记：本人单线程测试log4j和log4j2的性能，结果如下:
输出10000个debug+10000个info+10000个error到日志文件，log4j2是log4j速度的1.8倍左右。
输出100000个debug+100000个info+100000个error到日志文件，log4j2是log4j速度的2.6倍左右。


', 0, '2017-04-11 11:19:38', '2017-07-29 07:38:28');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用log4j2的SMTPAppender发送邮件报警', 'java', 'Java后台', '

## 目的
1. 当项目中有`报错时`，要能`自动的`、`及时的`发邮件通知`指定人员`。
2. 邮件中的错误日志要全面，最好能把当前线程的全部日志输出，不论日志级别。
3. 仅当日志为error级别时，才发邮件通知。
4. 可以配置邮件抄送给其他人。

<!-- more -->

## 引入依赖
```
<log4j2.api.version>2.5</log4j2.api.version>

<!--Log4j2-->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
```

## 配置`log4j2.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/cms</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
        </Console>
        <RollingRandomAccessFile name="AllFile" fileName="${LOG_HOME}/all.log"
                                 filePattern="${LOG_HOME}/all-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <RollingRandomAccessFile name="ErrorFile" fileName="${LOG_HOME}/error.log"
                                 filePattern="${LOG_HOME}/error-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <SMTP name="Mail" subject="内容管理系统 - 报警通知" to="kangyonggan@gmail.com" from="kangyg2017@163.com"
              smtpHost="smtp.163.com" smtpUsername="kangyg2017@163.com" smtpPassword="xxxxxxxx" bufferSize="50" >
        </SMTP>
        <Async name="AsyncAll">
            <AppenderRef ref="AllFile"></AppenderRef>
        </Async>
        <Async name="AsyncError">
            <AppenderRef ref="ErrorFile"></AppenderRef>
            <AppenderRef ref="Mail" ></AppenderRef>
        </Async>
    </Appenders>
    <Loggers>
        <Root level="debug" additivity="true">
            <AppenderRef ref="Console"></AppenderRef>
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Root>
    </Loggers>
</Configuration>
```

上面的配置中，关于报警的配置有两点:

```
<AppenderRef ref="Mail" ></AppenderRef>
```

```
<SMTP name="Mail" subject="内容管理系统 - 报警通知" to="kangyonggan@gmail.com" from="kangyg2017@163.com"
      smtpHost="smtp.163.com" smtpUsername="kangyg2017@163.com" smtpPassword="xxxxxxxx" bufferSize="50" >
</SMTP>
```

## 附加说明
- 异步输出日志，不会影响主线程性能
- error日志单独输出到error.log文件
- all.log包含所有级别的日志
- 每天会备份旧的日志文件，产生新的日志文件
- 如果一天之中有日志文件超出大小限制(上面配的500M)，会存档当前文件，另外再创建一个新的文件
- 日志文件只保存近期的（上面配置的30天）

> 温馨提示：由于是个人项目，所以没配置多个邮件接收者，如有需要，请参考[官方文档](http://logging.apache.org/log4j/2.x/manual/appenders.html#SMTPAppender)

## 收到的邮件截图
![mail](https://kangyonggan.com/upload/20170123163536603.png)
![mail](https://kangyonggan.com/upload/20170123163703359.png)
![mail](https://kangyonggan.com/upload/20170123163703945.png)
![mail](https://kangyonggan.com/upload/20170123163704569.png)


', 0, '2017-04-11 11:20:12', '2017-06-05 06:29:17');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用aop和自定义注解打印出参入参日志和方法执行时间', 'java', 'Java后台', '

## 自定义注解
`LogTime.java`:

```
package com.kangyonggan.api.common.annotation;

import java.lang.annotation.*;

/**
 * 在方法上加此注解会打印入参和出参，会计算方法消耗的时间
 *
 * @author kangyonggan
 * @since 2016/12/8
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface LogTime {
}
```

<!-- more -->

## 主要逻辑：

```
package com.kangyonggan.api.common.aop;

import com.kangyonggan.api.common.annotation.LogTime;
import com.kangyonggan.api.common.util.AopUtil;
import com.kangyonggan.api.common.util.DateUtils;
import com.kangyonggan.api.common.util.PropertiesUtil;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;

import java.lang.reflect.Method;

/**
 * 切于内部service的实现方法上， 需要在方法上手动加上@LogTime注解， 打印入参和出参，打印方法执行时间, 慢方法打印error日志
 *
 * @author kangyonggan
 * @since 2016/11/30
 */
@Log4j2
public class LogAop {

    /**
     * 设定的方法最大执行时间
     */
    private Long slowMethodTime;

    public LogAop() {
        String val = PropertiesUtil.getPropertiesOrDefault("slow.method.time", "10");
        slowMethodTime = Long.parseLong(val);
    }

    /**
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        Object args[] = joinPoint.getArgs();
        Class clazz = joinPoint.getTarget().getClass();

        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = clazz.getMethod(methodSignature.getName(), methodSignature.getParameterTypes());
        String targetName = "[" + clazz.getName() + "." + method.getName() + "]";

        LogTime logTime = method.getAnnotation(LogTime.class);
        Object result;
        if (logTime != null) {
            log.info("进入方法:" + targetName + " - args:" + AopUtil.getStringFromRequest(args));

            long beginTime = DateUtils.getNow().getTime();
            result = joinPoint.proceed(args);
            long endTime = DateUtils.getNow().getTime();
            long time = endTime - beginTime;

            log.info("离开方法:" + targetName + " - return:" + AopUtil.getStringFromResponse(result));
            log.info("方法耗时:" + time + "ms - " + targetName);

            if (time > slowMethodTime * 1000) {
                log.error("方法执行超过设定时间" + slowMethodTime + "s," + targetName);
            }
        } else {
            result = joinPoint.proceed(args);
        }

        return result;
    }
}
```


其中用到的`AopUtil.java`:

```
package com.kangyonggan.api.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2016/11/30
 */
public class AopUtil {
    public static String getStringFromRequest(Object[] args) {
        String req = "";
        for (Object arg : args) {
            if (arg == null) {
                req = req + "null,";
                continue;
            } else if (arg instanceof List == true) {
                req = req + JSON.toJSONString(arg);
            } else if (arg.getClass().isArray()) {
                req = req + JSONArray.toJSONString(arg);
            } else if (arg instanceof Enum) {
                req = req + JSON.toJSONString(arg) + ",";
            } else if (!(arg instanceof String)
                    && !(arg instanceof BigDecimal)
                    && !(arg instanceof Boolean)
                    && !(arg instanceof Integer)
                    && (arg instanceof Object)) {
                req = req + JSON.toJSONString(arg) + ",";
            } else {
                req = req + arg.toString() + ",";
            }
        }

        if (StringUtils.isNotEmpty(req) && req.length() > 100) {
            return req.hashCode() + "";
        } else {
            return req;
        }
    }

    public static String getStringFromResponse(Object arg) {
        String rsp = "";
        if (arg == null) {
            rsp = rsp + "null,";
            return rsp;
        } else if (arg instanceof List) {
            rsp = rsp + JSON.toJSONString(arg);
            return rsp;
        } else if (arg instanceof Enum) {
            rsp = rsp + JSON.toJSONString(arg);
            return rsp;
        } else if (!(arg instanceof String)
                && !(arg instanceof BigDecimal)
                && !(arg instanceof Boolean)
                && !(arg instanceof Integer)
                && (arg instanceof Object)) {
            rsp = rsp + JSON.toJSONString(arg) + ",";
        } else {
            rsp = rsp + arg.toString() + ",";
        }
        return rsp;
    }
}
```


', 0, '2017-04-11 11:21:31', '2017-07-28 15:11:05');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用ace admin搭建单页面网站', 'web', 'Web前端', '

## 资料
- Ace Admin [ace.zip](https://kangyonggan.com/upload/ace.zip)
- 在线实例（已经没了） [http://kangyonggan.com](http://kangyonggan.com)
- Github代码（已经没了） [https://github.com/kangyonggan/blog.git](https://github.com/kangyonggan/blog.git)

> 网上很少有ace admin相关的资料，如需使用和学习，只能去看源代码...

<!-- more -->

## 目的
做出一个类似cms后台管理系统的单页面网站，效果如下:

![加载中](https://kangyonggan.com/upload/20170109223706060.png)

![地址](https://kangyonggan.com/upload/20170109223708522.png)

## 步骤
由于关于ace admin的文档很少，尤其是ace admin ajax的！所以这就要我们自己来读源代码，看实例来学习了。

### 搭建本地demo
下载ace.zip并解压
![下载](https://kangyonggan.com/upload/20170109223701593.png)

拷贝到tomcat webapps目录下

![拷贝到tomcat](https://kangyonggan.com/upload/20170109223709211.png)

启动tomcat后，打开浏览器即可查看demo

![查看demo](https://kangyonggan.com/upload/20170109223706510.png)

可以先进入`Ajax Demo Pages`提前感受一下单页面的好处。

### 拷贝源码+修改
查看源码：右键-->查看源代码

![源码](https://kangyonggan.com/upload/20170109223707758.png)

把ace的一些核心css和js拷贝到你的html中，由于我们是要做单页面，从`Ajax Demo Pages`中可以看出，关键词是`ajax`
所以你需要格外的关注源码中出现的`ajax`,经过搜索后发现有用的是下面两点

![ajax](https://kangyonggan.com/upload/20170109223702751.png)
![ajax](https://kangyonggan.com/upload/20170109223704068.png)

点开`ace.ajax-content.js`, 如下：

![ajax-content](https://kangyonggan.com/upload/20170109223702338.png)

发现他是一个典型的jquery插件（不会jquery插件的看着会比较难，最好先去恶补一下），大致看一下这个插件，会发现它实现单页面的核心代码是:

![geturl](https://kangyonggan.com/upload/20170109223704715.png)

当用户点击超链接或者按钮时，插件代替你发起异步请求，服务器返回一个“页面”，插件拿到页面后，用下面红框框的核心代码把内容局部清空并替换，实现类似iframe的效果，给人一种我是单页面的错觉

![replace](https://kangyonggan.com/upload/20170109223707144.png)

对源码有个大致的了解就行，下面就可以动手搭建了。

## 解读源码
基础web环境搭建过程不再演示，我使用的freemarker模板，下面是我的html布局：

```html
<#assign ctx="${(rca.contextPath)!''''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <div class="hidden ajax-append-link" rel="shortcut icon" href="${ctx}/static/app/images/favicon.ico" type="image/x-icon">
    <!-- bootstrap & fontawesome -->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/bootstrap.min.css"></div>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/font-awesome.min.css"></div>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/jquery.gritter.min.css"></div>

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-fonts.min.css"></div>

    <#--skin-->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-skins.min.css"></div>

    <!-- ace styles -->
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace.min.css" class="ace-main-stylesheet"
          id="main-ace-style"></div>

    <!--[if lte IE 9]>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-part2.min.css" class="ace-main-stylesheet"></div>
    <![endif]-->

    <!--[if lte IE 9]>
    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/ace/dist/css/ace-ie.min.css"></div>
    <![endif]-->

    <div class="hidden ajax-append-link" rel="stylesheet" href="${ctx}/static/app/css/app.css"></div>

    <script src="${ctx}/static/ace/dist/js/jquery.min.js"></script>

    <!--[if lte IE 8]>
    <script src="${ctx}/static/ace/dist/js/html5shiv.js"></script>
    <script src="${ctx}/static/ace/dist/js/respond.min.js"></script>
    <![endif]-->
<@block name="app-style"/>
</head>
<body class="skin-3">
<#include "navbar.ftl"/>

<div class="main-container" id="main-container">

<#if hasSidebar?? && hasSidebar==true>
    <#include "sidebar.ftl"/>
</#if>

    <div class="main-content">
        <div class="main-content-inner">
        <#if home_name?? && home_name!=''''>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-tachometer home-icon"></i>
                        <a data-url="index" href="#index">${home_name}</a>
                    </li>
                </ul>
            </div>
        </#if>

            <div class="page-content">
                <div class="page-content-area"></div>
            </div>
        </div>
    </div>

<#include "footer.ftl"/>

<#include "modal.ftl"/>

    <a href="javascript:" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div>

<script>var ctx = ''${ctx}'';</script>
<script src="${ctx}/static/ace/dist/js/bootstrap.min.js"></script>
<script src="${ctx}/static/libs/jquery/jquery.bootstrap.min.js"></script>
<script src="${ctx}/static/ace/dist/js/jquery.gritter.min.js"></script>
<script src="${ctx}/static/ace/dist/js/ace-extra.min.js"></script>
<script src="${ctx}/static/ace/dist/js/ace-elements.min.js"></script>
<script src="${ctx}/static/ace/dist/js/ace.min.js"></script>
<script src="${ctx}/static/app/js/app.js"></script>
<@block name="app-script"/>
</body>
</html>
```

其中，`navbar.flt` `sidebar.ftl` `footer.ftl` 都是demo中的。
如果之前使用的就是freemarker+ace admin，那么你要重点关注下面两处代码:

```html
<div class="page-content">
   <div class="page-content-area"></div>
</div>
```

核心js`app.js`

```js
$(function () {
    // 异步加载界面
    var $ajaxContent = $(".page-content-area");
    $ajaxContent.ace_ajax({
        ''default_url'': ''#index'',
        ''content_url'': function (hash) {
            return window.location.origin + window.location.pathname + "/" + hash;
        },
        ''update_active'': updateMenuActive,
        ''update_breadcrumbs'': updateBreadcrumbs,
        ''update_title'': updateTitle,
        ''loading_text'': ''<span class="loading">正在加载, 请稍等...</span>''
    });

    // 监听异步加载失败事件
    $ajaxContent.on("ajaxloaderror", function (e, data) {
        window.location.href = ctx + ''/#500'';
    });
});


/**
 * 更新菜单激活状态
 *
 * @param hash
 */
function updateMenuActive(hash) {
    //  当前菜单
    var $menu = $($(''a[data-url="'' + hash + ''"]'')[0]).parent("li");

    // 所有菜单
    var $all_menus = $menu.parents("ul.nav-list").find("li");

    // 清除所有菜单状态
    $all_menus.removeClass("open");
    $all_menus.removeClass("active");

    // 父菜单
    var $parent = $menu.parents("li");
    if ($parent.length > 0) {
        $parent.addClass("open");
    }
    $menu.addClass("active");
}

/**
 * 更新面包屑
 *
 * @param hash
 */
function updateBreadcrumbs(hash) {
    var $menu = $(''a[data-url="'' + hash + ''"]'');

    // 下面这坨代码摘自ace.ajax-content.js
    var $breadcrumbs = $(''.breadcrumb'');
    if ($breadcrumbs.length > 0 && $breadcrumbs.is('':visible'')) {
        $breadcrumbs.find(''> li:not(:first-child)'').remove();

        var i = 0;
        $menu.parents(''.nav li'').each(function () {
            var $link = $(this).find(''> a'');

            var $link_clone = $link.clone();
            $link_clone.find(''i,.fa,.glyphicon,.ace-icon,.menu-icon,.badge,.label'').remove();
            var text = $link_clone.text();
            $link_clone.remove();

            var href = $link.attr(''href'');

            if (i == 0) {
                var li = $(''<li class="active"></li>'').appendTo($breadcrumbs);
                li.text(text);
            } else {
                var li = $(''<li><a ></a></li>'').insertAfter($breadcrumbs.find(''> li:first-child''));
                li.find(''a'').attr(''href'', href).text(text);
            }
            i++;
        })
    }
}

/**
 * 更新标题
 *
 * @param hash
 */
function updateTitle(hash) {
    var $menu = $($(''a[data-url="'' + hash + ''"]'')[0]);
    var title = $.trim($menu.text());

    if (title != '''') {
        document.title = title;
    }
}

/**
 * 更新状态
 *
 * @param hash
 */
function updateState(hash) {
    updateBreadcrumbs(hash);
    updateMenuActive(hash);
    updateTitle(hash);
}
```

如果你对jquery插件了解的不多，估计很难去使用`ace_ajax`，因为网上和demo中都没有使用教程，我这是根据`ace.ajax-content.js`源代码中的jquery插件反推出来的插件使用方法。

在插件源代码的最后暴露出插件有哪些公共属性和方法可被你覆写和调用

```js
$.fn.aceAjax = $.fn.ace_ajax = function (option, value, value2, value3) {
 var method_call;

 var $set = this.each(function () {
 var $this = $(this);
 var data = $this.data(''ace_ajax'');
 var options = typeof option === ''object'' && option;

 if (!data) $this.data(''ace_ajax'', (data = new AceAjax(this, options)));
 if (typeof option === ''string'' && typeof data[option] === ''function'') {
 if(value3 != undefined) method_call = data[option](value, value2, value3);
 else if(value2 != undefined) method_call = data[option](value, value2);
 else method_call = data[option](value);
 }
 });

 return (method_call === undefined) ? $set : method_call;
}

$.fn.aceAjax.defaults = $.fn.ace_ajax.defaults = {
 content_url: false,
 default_url: false,
 loading_icon: ''fa fa-spin fa-spinner fa-2x orange'',
 loading_text: '''',
 loading_overlay: null,
 update_breadcrumbs: true,
 update_title: true,
 update_active: true,
 close_active: false,
 max_load_wait: false
}
```

比如`loading_text`,看名称就大概猜出是在异步加载界面时，给用户的提示信息，例如`正在加载, 请稍等...`， 当然这只是大概的猜测，我们要真想使用它，肯定要读相应的源代码并且动手去验证一下。

过程中难免会遇到各种问题，只要耐心解读源码，一定会攻破的，我也遇到了好多坑，昨天花了一整天的时间才把我原本的博客给变成了单页面的，这主要是因为我的聪明才智和之前就使用的ace admin。

> 温馨提示: `ace.ajax-content.js`文件被包含在了`ace.min.js`中，因此只需要引入`ace.min.js`即可




', 0, '2017-04-11 11:22:55', '2017-07-29 07:04:07');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('windows防火墙导致ftp文件上传异常', 'java', 'Java后台', '
在win7系统下运行web项目，发现ftp文件上传异常，但是在linux下是好的，win7下报错信息如下：

```
[INFO ] 2017-01-21 21:24:03.388 [com.kangyonggan.archetype.cms.biz.util.Ftp.http-bio-8080-exec-10:53] - 连接文件服务器成功, 上传路径path:upload/
[ERROR] 2017-01-21 21:24:22.899 [com.kangyonggan.archetype.cms.biz.util.Ftp.http-bio-8080-exec-10:75] - 文件上传异常
java.net.SocketException: Software caused connection abort: socket write error
oat java.net.SocketOutputStream.socketWrite0(Native Method) ~[?:1.8.0_111]
oat java.net.SocketOutputStream.socketWrite(SocketOutputStream.java:109) ~[?:1.8.0_111]
oat java.net.SocketOutputStream.write(SocketOutputStream.java:153) ~[?:1.8.0_111]

...
```

<!-- more -->

原因是win7防火墙的问题，关闭防火墙后一切就正常了。

![关闭防火墙](https://kangyonggan.com/upload/20170121214431475.png)


', 0, '2017-04-11 11:24:37', '2017-04-11 12:17:29');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('.gitignore的内容', 'code', '代码片段', '

```
# Maven #
target/

# IDEA #
.idea/
*.iml

# Eclipse #
.settings/
.metadata/
.classpath
.project
Servers/
```
', 0, '2017-04-11 11:25:46', '2017-06-05 06:45:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('HashMap实现原理分析', 'java', 'Java后台', '

> 参考：[http://blog.csdn.net/vking_wang/article/details/14166593](http://blog.csdn.net/vking_wang/article/details/14166593)

## HashMap的数据结构
在数据结构中，有`数组`和`链表`来实现对数据的存储，但这两者是两个极端。

### 数组
数组的存储区间是连续的，空间复杂度大，时间复杂度小。特点是：`查找容易，插入和删除困难`。

### 链表
链表的存储区间是离散的，空间复杂度小，时间复杂度大。特点是：`查找困难，插入和删除容易`。

### 哈希表
哈希表是综合了数组和链表的优点，既满足了查找方便，同时也不占用太多空间，使用也很方便。

<!-- more -->

哈希表有很多实现方式，下面讲解最常用的拉链发，可以理解为链表的数组：

![la](https://kangyonggan.com/upload/20170309210540154.jpeg)

从上图中总可以看出，哈希表是由`数组+链表`组成的，HashMap里面实现了一个静态内部类`Entity`,其重要属性有`key`、`value`和`next`，从属性可以看出Entity是HashMap键值对实现的一个基础Bean，上面我们说到HashMap的基础就是一个线性数组，即Entity[],Map里面的内容都保存在数组Entity[]中, 下面是个demo：

![lan](https://kangyonggan.com/upload/20170309210548825.png)

这个链表是一个长度为16的数组，左边数字是数组的下标，右边的数字是key的hash值，数组中的每一个元素都是一个链表的头节点，那么这些元素是按照什么规则存储的呢？又是按照什么规则查找的呢？

### 存取规则`hash(key)%len`
比如上图中，key的hash值为31的元素，模上数组长度16，结果是15，那么它就存储在arr[15]所在的链表中。查找时就是先计算hash(key)%len，找出元素所在的链表位于数组的位置，然后遍历链表即可。

### 几个注意点
1. 不同的Hash可能有相同的index，相同的index不一定有相同的Hash。
2. 对于`hash(key)%len`计算得到相同index的元素，采用`头插法`，即后来的插到链表的头部，也就是说数组中存储的那个头元素是最后插进来的。
3. HashMap允许key为null的元素存入，key为null的元素永远存储在链表头部，即数组中。
4. Entity[]的长度固定后，随着元素的增加，链表会越来越长，这时候HashMap中的一个因子就会起到作用，随着map的size越来越大，Entity[]的length会以一定的规则增加。



', 0, '2017-04-11 11:29:36', '2017-06-30 03:00:06');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('java手札-基础部分', 'java', 'Java后台', '

1. 一个java源文件中是否可以包含多个类（不含内部类）？可以，但只能有一个public，且必须和文件名一致。
2. goto？goto是保留字。
3. &和&&？&是按位与，&&是逻辑与，&&会短路。
4. 跳出多重循环？可以用标志但不推荐，推荐使用变量来标识。
<!-- more -->
5. switch表达式可以有哪些类型？String呢？数字+枚举。jdk1.7之后可以有String，但底层没变，只是在编译时把String转hash
6. short s1=1;s1+=1;s1=s1+1;哪错？前对后错，类型转换错误，丢失精度，编译不过。
7. char能存储汉字？可以，char是Unicode编码，占2字节。
8. 快速乘8？左移3位。
9. final修饰一个变量时，是引用不能变?还是对象不能变？引用不能变，对象内容可以变。
10. ==和equals区别？equals不能用于比较8大基本数据类型, 如果比较的是基本类型的封装类型，会转化为==来比较他们的值，如果是String，会逐个比较char，如果是其他引用对象，会转化为==来比较他们的引用地址，但是你可以覆写equals来给两个对象是否一样来定指标。==如果比较的是基本数据类型或他们的封装类，是比较他们的值，如果比较的是引用对象，比较的是他们的引用地址。
11. static？类属性，类方法。
12. int和Integer？默认值不一样，vo层最后使用封装类，比如MBG逆向生成的model就是用的封装类型。
  - 原因一：在展现层，int显示是0，Integer显示空串。
  - 原因二：在tk.mybatis中，updateSelectiveByPrimaryKey(T t)，会更新不为null的字段，如果使用Integer，就不会更新，如果使用int，可能会误更新为0。
13. Math.round(-11.5)=-11，加0.5向下取整。
14. private、friendly、protected、public，当前类，同包，子孙类，所有类。
15. override和overload？overload重载，比如Math.abs()。override覆写，修饰符范围可小不可大，异常可少可子不可扩。
16. 构造方法可被覆写？不可。覆写要求方法名一样，但子类和父类的构造方法的方法名显然不一样。
17. 面向对象特征？封装、继承、多态、抽象。
  - 封装（高内聚，低耦合）：比如冰箱，按开关即可，内部封装，暴露接口即可。
  - 继承（复用性，扩展性）：比如，BaseService中提供了基础的curd。
  - 多态：编译期间不知道要掉哪个方法，运行期间才知道，比如：UserDao接口，有两个实现，UserMyBatisDao和UserHibernateDao这两个实现。
  - 抽象：抓住主要矛盾，忽略次要矛盾。
18. 抽象类abstract和接口interface？抽象方法所在的类必须是抽象类，抽象方法不能有方法体，抽象类的子类必须实现抽象方法，抽象类中可以有普通的方法,抽象类中可以有static方法，但是抽象方法不能同时是static,抽象方法不能有synchronized，可以在子类中覆写后加synchronized关键字。接口中所有的方法都是public，所有的属性都是public static final,所有的方法不能有方法体，子类必须实现所有方法(抽象类实现接口后可以不去覆写，但继承此抽象类的子类还是需要去实现的), 抽象类中不能有static方法。
19. 逗号分隔字符串，如果最后一个符号是逗号，数组长度是不对的。
20. String str="a"+"b"+"c"+"d";值创建了一个对象，javac编译时，对它进行了优化，+号两边的字符串直接合并。
21. 一般异常必须捕获或抛出，运行时异常不必须，比如：空指针异常，数组越界异常，类型转换异常。
22. sleep不释放锁，wait会释放锁。
23. 临界资源需要同步处理（原子化操作）。
24. ArrayList和Vector？都实现了List接口，List继承Collection，有序，允许重复，底层是数组。Vector线程安全，ArrayList不是线程安全，效率高。扩增时，Vector增2倍，ArrayList增1.5倍。
25. HashMap和HashTable？都实现了Map接口，都能存储名值对，HashMap允许null键值，干掉了contains()方法，改成了containsKey()和containsValue()。HashTable线程安全，并继承了Dictionary。
26. ArrayList和LinkedList？都是集合，前者读快写慢，后者读慢写快。前者是数组，后者是链表。
27. Collection和Collections？前者是集合的顶级接口，后者是集合的帮助类。
', 0, '2017-04-11 11:30:11', '2017-08-06 18:09:10');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('jdk1.8发送http请求报SSLv3的解决方案', 'java', 'Java后台', '

从 JDK 8u31 发行版开始，已停用 SSLv3 协议（安全套接字层），该协议在正常情况下不可用。如果确实需要 SSLv3，可以重新激活该协议...

SSLv3激活步骤:

切到${java_home}/jre/lib/security目录

```
cd /Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home/jre/lib/security
```

<!-- more -->

修改`java.security`文件

```
vi java.security
```

找到`jdk.tls.disabledAlgorithms`属性， 删除`SSLv3`并保存

查找:`/jdk.tls.disabledAlgorithms`

', 0, '2017-04-11 11:31:22', '2017-04-11 12:17:29');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('JVM结构和GC的工作机制', 'java', 'Java后台', '

> 参考：[http://blog.csdn.net/moneyshi/article/details/53033577](http://blog.csdn.net/moneyshi/article/details/53033577)

## JVM结构
![jvm](https://kangyonggan.com/upload/20170309052107625.jpeg)

<!-- more -->

![jvm2](https://kangyonggan.com/upload/20170309052117048.jpeg)

从图一可知，jvm主要包括四个部分：

1. `类加载器`（ClassLoader）
  - 在jvm启动时或类运行时将需要的class加载到jvm中。
2. `执行引擎`
  - 负责执行class文件中的字节码指令。
3. `本地方法接口`
  - 主要是调用C或者C++实现的本地方法及返回结果。
4. `内存区`
  - jvm在运行时操作系统所分配的内存区，主要分为5个区。
  - ![mem](https://kangyonggan.com/upload/20170309052142757.jpeg)
  - `方法区`（Methor Area）
    - 用于存储类结构信息的地方，包括常量池、静态变量、构造函数等。被所有java线程共享。
  - `java堆`（Heap）
    - 存储java对象或实例的地方。这块是GC的主要区域， 被所有java线程共享。
  - `java栈`（Stack）
    - java栈总是和线程关联在一起，每当创建一个线程时，jvm就会为这个线程创建一个栈。栈中会包含很多栈帧，没运行一个方法就会创建一个栈帧，用于存储局部变量返回值等。每一个方法从调用到结束，就是一个栈帧从入栈到出栈的过程。java栈是线程私有的。
  - `程序计数器`（PC Register）
    - 用于保存当前线程的内存地址。由于jvm是多线程的，线程轮流切换，为了保证线程切换回来后还能恢复原先状态，就需要一个独立的计数器，记录之前中断的地方。程序计数器也是线程私有的。
  - `本地方法栈`（Native Method Stack）
    - 和java栈作用差不多，只不过是为native方法服务的。java线程私有的。

## 内存分配
在了解GC之前，需要先了解一下jvm是怎么分配内存的，然后识别哪些垃圾需要回收，以及用什么方式去回收。

java内存分配和C/C++不同，C每次申请内存都是手动的进行系统调用，这需要一定的开销，而jvm是一次性分配一大块内存，然后每次new的时候都在这块空间上分配和释放。减少系统调用次数，节省了一定的开销，有点类似于线程池的概念。

有了这块空间之后，如何进行分配和回收就和GC有关了。

java的内存申请一般有两种：`静态内存和动态内存`。编译时就能确定大小的就是静态内容，比如int类型变量。动态内存是指在运行期间才能知道大小的，比如java对象。

由于java栈、程序计数器、本地方法栈都是线程私有的，线程生则生，线程灭则灭，这几个区域的内存回收是确定的。但是java堆和方法区则不一样，只有在运行期间才知道创建哪些对象，这部分的内存回收是动态的，一般GC主要是针对这一块。

总之，栈的内存管理是顺序的，而且定长，不存在内存回收问题，堆则是为java动态分配内存，不定长度，所以存在内存分配和回收的问题。

## 垃圾检测、回收算法
GC一般要做两件事，一是检测出垃圾，二是回收垃圾。

### 检测垃圾一般有下面这些方法：
#### 引用计数器
给对象添加一个计数器，每当有人引用他，计数器就加1，引用失效就减1，计数为0时被回收。

不足：当A和B互相引用时，可能会导致无法回收。

#### 可达性分析算法
以根集对象为起点进行搜索，如果对象不可达则回收，跟集一般包括java栈中的引用对象，还有方法区、常量池以及本地方法区中引用的对象。

总之，垃圾回收的时候，会检测所有堆中的对象，没用被引用的对象就会被回收。

### 一般回收算法有如下几种
#### 标记-清除（make-sweep）
算法如名，分为两个阶段：标记 清除。标记所有需要回收的对象，然后统一回收。这是最基础的算法，后续的算法都是基于这个算法扩展的。

不足：效率低，标记清除之后会产生大量碎片，如下图：

![make_sweep](https://kangyonggan.com/upload/20170309052126121.png)

#### 复制
此算法是把内存空间划分为两个相等的区域，每次只使用其中一个区域，当垃圾回收时，遍历当前使用的区域，把正在使用汇总的对象复制到另外一个区域，此算法每次只需要处理正在使用中的对象，
因此复制成本较小，同时，复制过去时还能进行内存整理，不会出现碎片，缺点也很明显，就是需要两倍空间。

![copy](https://kangyonggan.com/upload/20170309052055174.png)

#### 标记-整理（make-compact）
此算法结合了标记清除和复制算法的优点，也是分为两个阶段，第一阶段从跟节点开始标记所有被引用的对象，第二阶段遍历整个堆，清除未标记的对象，并且把存活的对象“压缩”到一块，按顺序排放，此算法避免了碎片问题，同时也避免了两倍空间问题。

![mark_compact](https://kangyonggan.com/upload/20170309052134020.png)

#### 分代收集算法
这是一个商用的垃圾收集算法，不同的对象有不同的生命周期，不同的生命周期采用不同的回收算法，分而治之，因地制宜。比较复杂，这里不多讨论。


', 0, '2017-04-11 11:32:13', '2017-05-27 15:45:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('linux下杀死一个进程的常用手段', 'code', '代码片段', '
```
ps -ef | grep redis-server | cut -c 9-15 | xargs kill -9
```
', 0, '2017-04-11 11:34:45', '2017-06-05 06:20:10');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('log4j2的使用和配置', 'java', 'Java后台', '

## 引入依赖
在`pom.xml`中添加依赖:

```
<log4j2.api.version>2.5</log4j2.api.version>

...

<!--Log4j2-->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
```

<!-- more -->

## 配置
`log4j2.xml`:

1. 异步输出日志，不会影响主线程性能
2. error日志单独输出到error.log文件
3. all.log包含所有级别的日志
4. 每天会备份旧的日志文件，产生新的日志文件
5. 如果一天之中有日志文件超出大小限制(下面配的500M)，会存档当前文件，另外再创建一个新的文件
6. 日志文件只保存近期的（下面配置的30天）

这已经可以满足大部分需求了，如果还不满足，那就再改造吧

```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/test</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
        </Console>
        <RollingRandomAccessFile name="AllFile" fileName="${LOG_HOME}/all.log"
                                 filePattern="${LOG_HOME}/all-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <RollingRandomAccessFile name="ErrorFile" fileName="${LOG_HOME}/error.log"
                                 filePattern="${LOG_HOME}/error-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"></PatternLayout>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"></TimeBasedTriggeringPolicy>
                <SizeBasedTriggeringPolicy size="500 MB"></SizeBasedTriggeringPolicy>
            </Policies>
            <DefaultRolloverStrategy max="30"></DefaultRolloverStrategy>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"></ThresholdFilter>
                <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"></ThresholdFilter>
            </Filters>
        </RollingRandomAccessFile>
        <Async name="AsyncAll">
            <AppenderRef ref="AllFile"></AppenderRef>
        </Async>
        <Async name="AsyncError">
            <AppenderRef ref="ErrorFile"></AppenderRef>
        </Async>
    </Appenders>

    <Loggers>
        <Root level="debug" additivity="true">
            <AppenderRef ref="Console"></AppenderRef>
            <AppenderRef ref="AsyncAll"></AppenderRef>
            <AppenderRef ref="AsyncError"></AppenderRef>
        </Root>
    </Loggers>
</Configuration>
```

', 0, '2017-04-11 11:35:37', '2017-05-27 15:30:12');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Log4j2省略输出SQL语句SELECT和FROM中间的字段', 'java', 'Java后台', '

在项目中，起初我们是不打印SQL语句的，后来为了查问题更方便，就打印了SQL。
但是也带来了一些问题，比如查询的字段太多，造成满屏SQL，给查日志造成了一定的影响。
所以我就在想，能不能把`SELECT`和`FROM`中间的字段省略输出呢？

<!-- more -->

## 线上日志中的SQL
```
DEBUG : ==>  Preparing: SELECT serial_no as serialNo,bnk_no as bnkNo ,mer_org_serial_no as merOrgSerialNo,bnk_org_serial_no as bnkOrgSerialNo, mer_date as merDate,mer_time as merTime, mer_org_date as merOrgDate,mer_org_time as merOrgTime ,bnk_org_date as bnkOrgDate,bnk_org_time as bnkOrgTime, last_try_date as lastTryDate,last_try_time as lastTryTime ,last_snd_date as lastSndDate,last_snd_time as lastSndTime, last_qry_serial_no as lastQrySerialNo,last_qry_date as lastQryDate,last_qry_time as lastQryTime, input_date as inputDate,input_time as inputTime,mer_tran_co as merTranCo,bnk_tran_co as bnkTranCo, mer_org_tran_co as merOrgTranCo,bnk_org_tran_co as bankOrgTranCo ,tran_tp as tranTy,syn_flg as synFlg,bat_flg as batFlg, acount as acount,retry_flg as retryFlg,retry_max_time as retryMaxTime ,retry_interval as retryInterval, retry_counter as retryCounter,resnd_flg as resndFlg ,resnd_max_time as resndMaxTime,resnd_interval as resndInterval,resnd_counter as resndCounter, qry_flg as qryFlg,qry_tran_co as qryTranCo,qry_max_time as qryMaxTime,qry_interval as qryInterval, qry_counter as qryCounter,priority as priority,model as model ,product_id as productId,product_tp as productTp,cur_co as currencyCode, amount as amount,fee_amt as feeAmt,tran_purpose as tranPurpose ,tran_remark as tranRemark,ref_app_no as refAppNo, ref_app_kind as refAppKind,rcvr_bnk_no as rcvrBnkNo ,rcvr_acct_no as rcvrAcctNo,rcvr_acct_nm as rcvrAcctNm,rcvr_id_tp as rcvrIdTp,rcvr_id_no as rcvrIdNo, rcvr_province as rcvrProvince,rcvr_city as rcvrCity,rcvr_area_co as rcvrAreaCo,rcvr_area_nm as rcvrAreaNm, rcvr_mer_id as rcvrMerId,rcvr_mer_cert_id as rcvrMerCertId,rcvr_post_id as rcvrPostId ,rcvr_contract_no as rcvrContractNo,rcvr_contract_dt as rcvrContractDt, rcvr_proto_no as rcvrProtoNo,rcvr_mer_user_tp as rcvrMerUserTp,rcvr_mer_user_id as rcvrMerUserId, rcvr_bnk_user_tp as rcvrBnkUserTp,rcvr_bnk_user_id as rcvrBnkUserId,rcvr_resv1 as rcvrResv1, rcvr_resv2 as rcvrResv2,sndr_bnk_no as sndrBankNo,sndr_name as sndrName, sndr_acct_no as sndrAcctNo,sndr_acct_nm as sndrAcctName, sndr_id_tp as sndrIdType,sndr_id_no as sndrIdNo,sndr_province as sndrProvince,sndr_city as sndrCity, sndr_area_co as sndrAreaCode,sndr_area_nm as sndrAreaName,sndr_mer_id as sndrMerId ,sndr_mer_cert_id as sndrMerCertId,sndr_post_id as sndrPostId, sndr_contract_no as sndrContractNo,sndr_contract_dt as sndrContractDate,sndr_proto_no as sndrProtoNo, sndr_mer_user_tp as sndrMerUserType,sndr_mer_user_id as sndrMerUserId ,sndr_bnk_user_tp as sndrBnkUserType,sndr_bnk_user_id as sndrBankUserId, sndr_resv1 as sndrResv1,sndr_resv2 as sndrResv2,lock_st as lockSt,tran_st as tranSt,business_type as businessType, rvrs_st as rvrsSt,product_nm as productName, APP_VERSION as appVersion,APP_SOURCE as appSource, RCVR_BNK_BRANCH_NAME as rcvrBnkBranchName,SNDR_BNK_BRANCH_NAME as sndrBnkBranchName, created_at as insertTimestamp, updated_at as updateTimestamp FROM be_command T WHERE T.REF_APP_NO = ?
```

一大坨SQL占满了整个屏幕，并且日志文件也会变得很大，其实这句SQL有用信息很少:

```
DEBUG : ==>  Preparing: SELECT xxx FROM be_command T WHERE T.REF_APP_NO = ?
```

所以我就想能不能像上面这样输出呢？看下面的demo

## 使用Log4j2的Replace功能
### pom.xml
```
<log4j2.api.version>2.5</log4j2.api.version>

...

<!--Log4j2-->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>${log4j2.api.version}</version>
</dependency>
```

### log4j2.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <properties>
        <property name="LOG_HOME">/Users/kyg/logs/book</property>
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="%replace{%msg}{Preparing: SELECT [w ,]+ FROM be_command}{Preparing: SELECT xxx FROM be_command}%n"/>
        </Console>
    </Appenders>

    <Loggers>
        <Root level="debug" additivity="true">
            <AppenderRef ref="Console"/>
        </Root>
    </Loggers>
</Configuration>
```

### Test.java
```
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @author kangyonggan
 * @since 2017/3/28
 */
public class Test {

    private static Logger log = LogManager.getLogger(Test.class);

    public static void main(String[] args) {
        log.info("DEBUG : ==>  Preparing: SELECT serial_no as serialNo,bnk_no as bnkNo ,mer_org_serial_no as merOrgSerialNo,bnk_org_serial_no as bnkOrgSerialNo, mer_date as merDate,mer_time as merTime, mer_org_date as merOrgDate,mer_org_time as merOrgTime ,bnk_org_date as bnkOrgDate,bnk_org_time as bnkOrgTime, last_try_date as lastTryDate,last_try_time as lastTryTime ,last_snd_date as lastSndDate,last_snd_time as lastSndTime, last_qry_serial_no as lastQrySerialNo,last_qry_date as lastQryDate,last_qry_time as lastQryTime, input_date as inputDate,input_time as inputTime,mer_tran_co as merTranCo,bnk_tran_co as bnkTranCo, mer_org_tran_co as merOrgTranCo,bnk_org_tran_co as bankOrgTranCo ,tran_tp as tranTy,syn_flg as synFlg,bat_flg as batFlg, acount as acount,retry_flg as retryFlg,retry_max_time as retryMaxTime ,retry_interval as retryInterval, retry_counter as retryCounter,resnd_flg as resndFlg ,resnd_max_time as resndMaxTime,resnd_interval as resndInterval,resnd_counter as resndCounter, qry_flg as qryFlg,qry_tran_co as qryTranCo,qry_max_time as qryMaxTime,qry_interval as qryInterval, qry_counter as qryCounter,priority as priority,model as model ,product_id as productId,product_tp as productTp,cur_co as currencyCode, amount as amount,fee_amt as feeAmt,tran_purpose as tranPurpose ,tran_remark as tranRemark,ref_app_no as refAppNo, ref_app_kind as refAppKind,rcvr_bnk_no as rcvrBnkNo ,rcvr_acct_no as rcvrAcctNo,rcvr_acct_nm as rcvrAcctNm,rcvr_id_tp as rcvrIdTp,rcvr_id_no as rcvrIdNo, rcvr_province as rcvrProvince,rcvr_city as rcvrCity,rcvr_area_co as rcvrAreaCo,rcvr_area_nm as rcvrAreaNm, rcvr_mer_id as rcvrMerId,rcvr_mer_cert_id as rcvrMerCertId,rcvr_post_id as rcvrPostId ,rcvr_contract_no as rcvrContractNo,rcvr_contract_dt as rcvrContractDt, rcvr_proto_no as rcvrProtoNo,rcvr_mer_user_tp as rcvrMerUserTp,rcvr_mer_user_id as rcvrMerUserId, rcvr_bnk_user_tp as rcvrBnkUserTp,rcvr_bnk_user_id as rcvrBnkUserId,rcvr_resv1 as rcvrResv1, rcvr_resv2 as rcvrResv2,sndr_bnk_no as sndrBankNo,sndr_name as sndrName, sndr_acct_no as sndrAcctNo,sndr_acct_nm as sndrAcctName, sndr_id_tp as sndrIdType,sndr_id_no as sndrIdNo,sndr_province as sndrProvince,sndr_city as sndrCity, sndr_area_co as sndrAreaCode,sndr_area_nm as sndrAreaName,sndr_mer_id as sndrMerId ,sndr_mer_cert_id as sndrMerCertId,sndr_post_id as sndrPostId, sndr_contract_no as sndrContractNo,sndr_contract_dt as sndrContractDate,sndr_proto_no as sndrProtoNo, sndr_mer_user_tp as sndrMerUserType,sndr_mer_user_id as sndrMerUserId ,sndr_bnk_user_tp as sndrBnkUserType,sndr_bnk_user_id as sndrBankUserId, sndr_resv1 as sndrResv1,sndr_resv2 as sndrResv2,lock_st as lockSt,tran_st as tranSt,business_type as businessType, rvrs_st as rvrsSt,product_nm as productName, APP_VERSION as appVersion,APP_SOURCE as appSource, RCVR_BNK_BRANCH_NAME as rcvrBnkBranchName,SNDR_BNK_BRANCH_NAME as sndrBnkBranchName, created_at as insertTimestamp, updated_at as updateTimestamp FROM be_command T WHERE T.REF_APP_NO = ?");
    }

}
```

### 输出
```
DEBUG : ==>  Preparing: SELECT xxx FROM be_command T WHERE T.REF_APP_NO = ?

Process finished with exit code 0
```


', 0, '2017-04-11 11:36:25', '2017-05-27 15:29:39');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Tomcat8访问软连接目录下的文件', 'code', '代码片段', '

### Tomcat7修改context.xml
```
<Context allowLinking="true" ></Context>
```

## Tomcat8修改context.xml
```
<Context>
  <Resources allowLinking="true" ></Resources>
</Context>
```

## 使用软链接

```
ln -s /home/kyg/data/blog/upload/ /home/kyg/install/apache-tomcat-8.5.6-blog/webapps/ROOT/WEB-INF/
```

', 0, '2017-04-11 11:37:25', '2017-06-28 05:48:08');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('maven一键生成cms项目', 'other', '综合', '

由于经常需要搭建一些类似cms这样的系统，如果每次都是手动创建项目，创建模块，拷贝改，无疑是蛋疼的。
所以我需要做一个项目原型，每次需要搭建类似cms系统的时候，只需要一键即可生成！

<!-- more -->

## 系统简介
系统结构如下:

![系统结构](https://kangyonggan.com/upload/cms_1.png)

### 各个模块之间的依赖关系
- `web模块` 依赖 `biz模块`
- `biz模块` 依赖 `service模块`和`dao模块`
- `service模块` 依赖 `model模块`
- `dao模块` 依赖 `model模块`

### 主要技术和框架
- Spring
- SpringMVC
- Mybatis
- autoconfig
- mbg
- shiro
- redis
- dubbo
- mysql
- freemarker
- ace admin ajax
- ftp
- log4j2
- fastjson
- lombok

## 基本功能
由于这只是一个项目原型，以后可能会用于各大场景，所以下面的功能只是一些最基础的。

### 网站
1. 登录
2. 注册
3. 找回密码

### 工作台
1. 系统
    - 用户管理
    - 角色管理
    - 菜单管理
2. 内容
    - 数据字典
    - 缓存管理
    - 内容管理
3. 我的
    - 个人资料

## 原型截图

![登录界面](https://kangyonggan.com/upload/cms_login.png)

![注册界面](https://kangyonggan.com/upload/cms_register.png)

![找回密码界面](https://kangyonggan.com/upload/cms_reset.png)

![个人资料界面](https://kangyonggan.com/upload/cms_profile.png)

![菜单管理界面](https://kangyonggan.com/upload/cms_menu.png)

## 使用方法
1. 拉取项目到本地 `git clone https://github.com/kangyonggan/cms-archetype.git`
2. 编译并安装 `mvn clean install`
3. 一键生成项目 `mvn archetype:generate -DarchetypeGroupId=com.kangyonggan.archetype -DarchetypeArtifactId=cms-archetype -DarchetypeVersion=1.0-SNAPSHOT -DarchetypeCatalog=local`


', 0, '2017-04-11 11:39:03', '2017-04-11 12:18:12');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Docker-01在ubuntu上安装docker引擎', 'other', '综合', '
docker引擎支持Linux、Cloud、Windows和macOS，由于个人精力有限，我不可能一一实验，我选择在Ubuntu14.04上安装，本系列文章是通过学习官方文档整理而来。

> 官方文档:[https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

## 安装要求
- Yakkety 16.10
- Xenial 16.04 (LTS)
- Trusty 14.04 (LTS)✔️

<!-- more -->

我的实验环境是Ubuntu 14.04 LTS, `lsb_release -a`可以查看版本号

```
root@iZ23ldh8kudZ:~# lsb_release -a
No LSB modules are available.
Distributor ID:Ubuntu
Description:Ubuntu 14.04.4 LTS
Release:14.04
Codename:trusty
```

## 推荐安装额外包
`linux-image-extra-*`包，它允许Docker使用存储驱动，一般使用Docker都要安装，除非你有不得不说的理由。

```
root@iZ23ldh8kudZ:~# sudo apt-get update

root@iZ23ldh8kudZ:~# sudo apt-get install -y --no-install-recommends
linux-image-extra-$(uname -r)
linux-image-extra-virtual
```

## 使用镜像库安装Docker
安装Docker的方法有很多，选择一个你需要的即可，我是使用镜像库安装的。

- 配置镜像库安装Docker(大部分用户的选择）✔️
- 下载DEB包安装Docker

第一次在新机器上安装Docker的时候，需要配置镜像库，然后就可以从镜像库安装、更新或降级Docker

### 允许apt通过https使用镜像库
```
root@iZ23ldh8kudZ:~# sudo apt-get install -y --no-install-recommends
apt-transport-https
ca-certificates
curl
software-properties-common
```

### 添加Docker官方公钥
```
root@iZ23ldh8kudZ:~# curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
```

校验公钥`58118E89F3A912897C070ADBF76221572C52609D`:

```
root@iZ23ldh8kudZ:~# apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
/etc/apt/trusted.gpg
--------------------
pub   1024D/437D05B5 2004-09-12
Key fingerprint = 6302 39CC 130E 1A7F D81A  27B1 4097 6EAF 437D 05B5
uid                  Ubuntu Archive Automatic Signing Key <ftpmaster@ubuntu.com>
sub   2048g/79164387 2004-09-12

...
```

### 用下面的命令去稳定你的镜像库
```
root@iZ23ldh8kudZ:~# sudo add-apt-repository
"deb https://apt.dockerproject.org/repo/
ubuntu-$(lsb_release -cs)
main"
```

> `lsb_release -cs`这个子命令返回你的ubuntu系统的代号，如`trusty`

启用测试镜像库。通过编辑`/etc/apt/sources.list`,并在下面这行的最后添加`testing`。
deb https://apt.dockerproject.org/repo/ ubuntu-trusty main
添加后:
deb https://apt.dockerproject.org/repo/ ubuntu-trusty main testing

## 安装Docker
### 更新`apt`包
```
root@iZ23ldh8kudZ:~# sudo apt-get update
```

### 安装最新版docker，或者在下一步安装指定版本的
用下面的命令安装最新版

```
root@iZ23ldh8kudZ:~# sudo apt-get -y install docker-engine
```

### 在生产机器，你需要安装指定版本的docker，不要总是使用最新版，下面的命令列出了所有可用版本
```
root@iZ23ldh8kudZ:~# apt-cache madison docker-engine
docker-engine | 17.03.0~ce~rc1-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/testing amd64 Packages
docker-engine | 1.13.1-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/main amd64 Packages
docker-engine | 1.13.1~rc2-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/testing amd64 Packages
docker-engine | 1.13.1~rc1-0~ubuntu-trusty | https://apt.dockerproject.org/repo/ ubuntu-trusty/testing amd64 Packages

...
```
每行的第二列是版本号，第三列是镜像库名，然后选择一个指定的版本进行安装。

```
root@iZ23ldh8kudZ:~# sudo apt-get -y install docker-engine=<版本号>
```

### 运行`Hello World`来检验是否安装正确
```
root@iZ23ldh8kudZ:~# sudo docker run hello-world
```

运行后报错了:

```
Unable to find image ''hello-world:latest'' locally
latest: Pulling from library/hello-world
78445dd45222: Pull complete
docker: error pulling image configuration: Get https://registry-1.docker.io/v2/library/hello-world/blobs/sha256:48b5124b2768d2b917edcb640435044a97967015485e812545546cbed5cf0233: net/http: TLS handshake timeout.
See ''docker run --help''.
```

重启docker服务:

```
root@iZ23ldh8kudZ:~# service docker restart
docker stop/waiting
docker start/running, process 18050
```

再次运行:

```
root@iZ23ldh8kudZ:~# docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```
', 0, '2017-04-11 11:39:56', '2017-04-11 12:18:12');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Docker-02学习docker基础知识', 'other', '综合', '

> 官方文档:[https://docs.docker.com/engine/getstarted/](https://docs.docker.com/engine/getstarted/)

## 将会学到
- 怎么在docker容器中运行软件镜像
- 怎么Docker Hub上浏览软件镜像
- 怎么创建自己的镜像并运行在容器中
- 怎么创建自己的Docker Hub账户和镜像库
- 怎么创建一个镜像
- 上传你的镜像到Docker Hub给其他人使用

<!-- more -->

## 理解镜像和容器
Docker引擎提供的核心技术是镜像和容器。
`docker run hello-world`这条命令由下面三部分组成:

![container_explainer.png](https://kangyonggan.com/upload/20170223100628926.png)
镜像是文件系统和运行时技术。它没有状态也永远不会改变。一个容器就是一个运行中的镜像实例。当你执行hello-world命令，docker引擎：

- 校验你是否有hello-world镜像
- 从docker hub下载镜像
- 把镜像加载进容器中并且运行

', 0, '2017-04-11 11:45:01', '2017-04-16 10:24:09');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Docker-03查找并运行镜像image', 'other', '综合', '


> 官方文档:[https://docs.docker.com/engine/getstarted/step_three/](https://docs.docker.com/engine/getstarted/step_three/)

Docker Hub上存放着全世界的docker镜像，我们可以浏览、下载并运行镜像。

## 定位whalesay镜像
### 打开浏览器，浏览[Docker Hub](https://hub.docker.com/)
![browse_and_search](https://kangyonggan.com/upload/20170223110047136.png)

Docker Hub上的镜像包含了个人（比如我）、官方和一些组织的，比如：RedHat, IBM, Google等。

<!-- more -->

### 搜索关键词`whalesay`
![image_found](https://kangyonggan.com/upload/20170223110047137.png)

### 在结果页点击`docker/whalesay`镜像
浏览器会跳转到whalesay镜像库界面。

![whale_repo](https://kangyonggan.com/upload/20170223110047137.png)

每个镜像库都包含镜像的信息，比如：镜像的分类是什么？怎么使用镜像？

### 运行`whalesay`镜像
#### 执行命令
```
root@iZ23ldh8kudZ:~# docker run docker/whalesay cowsay boo
Unable to find image ''docker/whalesay:latest'' locally
latest: Pulling from docker/whalesay
e190868d63f8: Pull complete
909cd34c6fd7: Pull complete
0b9bfabab7c1: Pull complete
a3ed95caeb02: Pull complete
00bf65475aba: Pull complete
c57b6bcc83e3: Pull complete
8978f6879e2f: Pull complete
8eed3712d2cf: Pull complete
Digest: sha256:178598e51a26abbc958b8a2e48825c90bc22e641de3d31e18aaf55f3258ba93b
Status: Downloaded newer image for docker/whalesay:latest

```

第一次运行可能会比较慢，大概需要一分钟左右，需耐心等待，之所以第一次运行较慢，是因为本地仓库没有此镜像，需要去Docker Hub下载。

#### 运行`docker images`命令，查看本地仓库的所有镜像,就会发现`whalesay`镜像已经被下载到本地了。
```
root@iZ23ldh8kudZ:~# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay     latest              6b362a9f73eb        21 months ago       247 MB
```

当你在容器中运行一个镜像，Docker会把镜像下载到你本地，本地的副本会为你下次运行节省时间。当且仅当Docker Hub上的镜像来源发生改变时，Docker才会去重新下载。你也可以手动删除本地镜像。

#### 再次运行`whalesay`镜像
```
root@iZ23ldh8kudZ:~# docker run docker/whalesay cowsay boo-boo

```

', 0, '2017-04-11 11:45:59', '2017-04-12 07:45:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Docker-04构建一个自己的镜像', 'other', '综合', '


> 官方文档:[https://docs.docker.com/engine/getstarted/step_four/](https://docs.docker.com/engine/getstarted/step_four/)

## 编写一个Dockerfile
你可以使用你喜欢的编辑器写一个简单的[Dockerfile](https://docs.docker.com/engine/reference/builder/), Dockerfile就是用来描述构建镜像的文件、环境和命令的清单，Dockerfile越小越好。

### 创建一个新的目录
```
root@iZ23ldh8kudZ:~/code# mkdir mydockerbuild
```

<!-- more -->

### 进入这个新的目录
```
root@iZ23ldh8kudZ:~/code# cd mydockerbuild
root@iZ23ldh8kudZ:~/code/mydockerbuild# pwd
/root/code/mydockerbuild
```

### 在当前目录创建文件Dockerfile
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# vi Dockerfile
```

### 把FROM代码段写入文件
查看写入后的文件:

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# cat Dockerfile
FROM docker/whalesay:latest
```

`FROM`关键字告诉Docker我将以哪个镜像为基础。Whalesay是完美的，它已经有了cowsay程序，所以我们从它开始。

### 把RUN代码段写入镜像
查看写入后的文件:

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# cat Dockerfile
FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
```

`RUN`关键字会安装镜像所需要的程序。whalesay镜像是基于Ubuntu的，所以它使用`apt-get`去安装所需要的包，这两个命令是请求此镜像可用的包，并且把fortunes程序安装到镜像，fortunes程序会打印出屋面所说的内容。


### 把CMD代码段写入镜像
查看写入后的文件:

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# cat Dockerfile
FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
CMD /usr/games/fortune -a | cowsay
```

`CMD`关键字告诉镜像当环境设置完成后运行最后的命令，这个命令是`fortune -a`，并且输出到`cowsay`命令。

## 从Dockerfile构建镜像
编译镜像使用的命令是`docker build`，参数`-t`是给镜像一个标签, 不要忽略了`.`，它会告诉`docker build`命令去当前目录下查找`Dockerfile`文件。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker build -t docker-whale .
Sending build context to Docker daemon 2.048 kB
Step 1/3 : FROM docker/whalesay:latest
 ---> 6b362a9f73eb
Step 2/3 : RUN apt-get -y update && apt-get install -y fortunes
 ---> Running in e7673f725ff2

...

Successfully built efb18db73358
```

第一次运行时有点慢，大概一分钟左右，此间它会去下载所需要的包，会输出很多看不懂的信息。

## 学习构建的过程
构建镜像的命令`docker build -t docker-whale .`，会在当前目录下读取`Dockerfile`文件，并在本地机器上一步一步的按照指令构建一个叫作`docker-whale`的镜像，构建需要一些时间，也会输出很多信息，下面来解析输出信息的意思。

### Docker检测以确保所有需要构建的都准备好了
```
Sending build context to Docker daemon 2.048 kB
```

### 检测依赖的基础镜像
```
Step 1/3 : FROM docker/whalesay:latest
 ---> 6b362a9f73eb
```

上面的输出信息对应的代码块是`FROM`, 如果本地没有whalesay镜像，则去Docker Hub下载，如果有，那就使用本地的whalesay镜像。

### Docker启动一个临时的容器去运行`whalesay`
在这个临时的容器中，Docker会运行Dockerfile中的下一行命令，即`RUN apt-get -y update && apt-get install -y fortunes`, 这个命令是去安装`fortunes`命令，此过程中输出了大量的信息。

```
Step 2/3 : RUN apt-get -y update && apt-get install -y fortunes
 ---> Running in e7673f725ff2
Ign http://archive.ubuntu.com trusty InRelease
Get:1 http://archive.ubuntu.com trusty-updates InRelease [65.9 kB]
Get:2 http://archive.ubuntu.com trusty-security InRelease [65.9 kB]
Hit http://archive.ubuntu.com trusty Release.gpg
Get:3 http://archive.ubuntu.com trusty-updates/main Sources [485 kB]
Get:4 http://archive.ubuntu.com trusty-updates/restricted Sources [5957 B]
Get:5 http://archive.ubuntu.com trusty-updates/universe Sources [220 kB]
Get:6 http://archive.ubuntu.com trusty-updates/main amd64 Packages [1197 kB]
Get:7 http://archive.ubuntu.com trusty-updates/restricted amd64 Packages [20.4 kB]
Get:8 http://archive.ubuntu.com trusty-updates/universe amd64 Packages [516 kB]
Get:9 http://archive.ubuntu.com trusty-security/main Sources [160 kB]
Get:10 http://archive.ubuntu.com trusty-security/restricted Sources [4667 B]
Get:11 http://archive.ubuntu.com trusty-security/universe Sources [59.4 kB]
Get:12 http://archive.ubuntu.com trusty-security/main amd64 Packages [730 kB]
Get:13 http://archive.ubuntu.com trusty-security/restricted amd64 Packages [17.0 kB]
Get:14 http://archive.ubuntu.com trusty-security/universe amd64 Packages [199 kB]
Hit http://archive.ubuntu.com trusty Release
Hit http://archive.ubuntu.com trusty/main Sources
Hit http://archive.ubuntu.com trusty/restricted Sources
Hit http://archive.ubuntu.com trusty/universe Sources
Hit http://archive.ubuntu.com trusty/main amd64 Packages
Hit http://archive.ubuntu.com trusty/restricted amd64 Packages
Hit http://archive.ubuntu.com trusty/universe amd64 Packages
Fetched 3745 kB in 43s (87.0 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following extra packages will be installed:
  fortune-mod fortunes-min librecode0
Suggested packages:
  x11-utils bsdmainutils
The following NEW packages will be installed:
  fortune-mod fortunes fortunes-min librecode0
0 upgraded, 4 newly installed, 0 to remove and 92 not upgraded.
Need to get 1961 kB of archives.
After this operation, 4817 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu/ trusty/main librecode0 amd64 3.6-21 [771 kB]
Get:2 http://archive.ubuntu.com/ubuntu/ trusty/universe fortune-mod amd64 1:1.99.1-7 [39.5 kB]
Get:3 http://archive.ubuntu.com/ubuntu/ trusty/universe fortunes-min all 1:1.99.1-7 [61.8 kB]
Get:4 http://archive.ubuntu.com/ubuntu/ trusty/universe fortunes all 1:1.99.1-7 [1089 kB]
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin:
Fetched 1961 kB in 4s (466 kB/s)
Selecting previously unselected package librecode0:amd64.
(Reading database ... 13116 files and directories currently installed.)
Preparing to unpack .../librecode0_3.6-21_amd64.deb ...
Unpacking librecode0:amd64 (3.6-21) ...
Selecting previously unselected package fortune-mod.
Preparing to unpack .../fortune-mod_1%3a1.99.1-7_amd64.deb ...
Unpacking fortune-mod (1:1.99.1-7) ...
Selecting previously unselected package fortunes-min.
Preparing to unpack .../fortunes-min_1%3a1.99.1-7_all.deb ...
Unpacking fortunes-min (1:1.99.1-7) ...
Selecting previously unselected package fortunes.
Preparing to unpack .../fortunes_1%3a1.99.1-7_all.deb ...
Unpacking fortunes (1:1.99.1-7) ...
Setting up librecode0:amd64 (3.6-21) ...
Setting up fortune-mod (1:1.99.1-7) ...
Setting up fortunes-min (1:1.99.1-7) ...
Setting up fortunes (1:1.99.1-7) ...
Processing triggers for libc-bin (2.19-0ubuntu6.6) ...
 ---> 785085e9a520
Removing intermediate container e7673f725ff2
```

当`RUN`命令运行结束后，一个新的`layer`就会立即产生，并且销毁临时容器。

### 一个新的临时容器产生，并且Docker会添加layer，对应于Dockerfile中的CMD命令, 最后再销毁临时容器。
```
Step 3/3 : CMD /usr/games/fortune -a | cowsay
 ---> Using cache
 ---> efb18db73358
Successfully built efb18db73358
```

## 运行镜像
现在，校验这个新镜像是否在本地存在，并且去运行它。

### 用docker images命令查看本地镜像
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
docker-whale        latest              efb18db73358        31 minutes ago      275 MB
hello-world         latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay     latest              6b362a9f73eb        21 months ago       247 MB
```

### 运行新镜像docker run docker-whale
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker run docker-whale

```

运行时，你会发现Docker并没有去再下载任何东西，因为镜像已经在本地构建了。

### 好不容易构建好了，再运行一次
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker run docker-whale

```

你会发现，输出竟然不一样了，好像它有自己的思维，那你就多运行几次看看吧。



', 0, '2017-04-11 11:52:37', '2017-04-11 12:18:12');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Docker-05创建一个DockerHub账号和镜像库repository', 'other', '综合', '


> 官方文档:[https://docs.docker.com/engine/getstarted/step_five/](https://docs.docker.com/engine/getstarted/step_five/)

如果你想把你的镜像分享给世界各地的其他人使用，那么你需要在Docker Hub注册一个账号。

<!-- more -->

## 注册一个账号
### 在浏览器中打开Docker Hub的[注册界面](https://hub.docker.com/register/)
![hub_signup](https://kangyonggan.com/upload/20170223142740524.png)

### 输入用户名、邮箱和密码即可注册

## 校验邮箱并创建镜像
![email_verify.png](https://kangyonggan.com/upload/20170223142740523.png)
![new_resp.png](https://kangyonggan.com/upload/20170223142740524.png)






', 0, '2017-04-11 11:53:17', '2017-04-11 12:18:12');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Docker-06推送push和拉取pull镜像', 'other', '综合', '

> 官方文档:[https://docs.docker.com/engine/getstarted/step_six/](https://docs.docker.com/engine/getstarted/step_six/)

推送本地镜像到Docker Hub上你的镜像库中，然后再镜像从镜像库中拉取到本地，并运行它。

## 推送镜像到镜像库
### 查看本地所有镜像
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
docker-whale        latest              efb18db73358        About an hour ago   275 MB
hello-world         latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay     latest              6b362a9f73eb        21 months ago       247 MB
```

<!-- more -->

### 找到镜像ID
以`docker-whale`镜像为例，它的镜像ID是`efb18db73358`

> 现在, docker-whale镜像还没有命名空间， 你需要关联一个命名空间， 命名空间就是你的Docker Hub账户名（我的是kangyonggan, 然后给镜像名添加命名空间，比如: kangyonggan/docker-whale

### 用`docker tag`命令给镜像添加标签（命名空间）
![tagger](https://kangyonggan.com/upload/20170223153853566.png)

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker tag efb18db73358 kangyonggan/docker-whale:latest
```

#### 再次运行docker images会发现镜像已经有了标签
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
docker-whale               latest              efb18db73358        About an hour ago   275 MB
kangyonggan/docker-whale   latest              efb18db73358        About an hour ago   275 MB
hello-world                latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay            latest              6b362a9f73eb        21 months ago       247 MB
```

还会发现，相同的镜像ID存在于两个不同的镜像库。

### 登录Docker Hub
在最终把镜像推送到Docker Hub上之前，你需要登录Docker Hub。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don''t have a Docker ID, head over to https://hub.docker.com to create one.
Username: kangyonggan
Password:
Login Succeeded
```

### 把镜像推送到自己的Docker Hub上
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker push kangyonggan/docker-whale
The push refers to a repository [docker.io/kangyonggan/docker-whale]
4d8b662d1a5a: Pushing [========>                                          ] 5.001 MB/28.13 MB
5f70bf18a086: Mounted from docker/whalesay
d061ee1340ec: Mounted from docker/whalesay
d511ed9e12e1: Mounted from docker/whalesay
091abc5148e4: Mounted from docker/whalesay
b26122d57afa: Mounted from docker/whalesay
37ee47034d9b: Mounted from docker/whalesay
528c8710fd95: Mounted from docker/whalesay
1154ba695078: Mounted from docker/whalesay
```

网速有点慢(目测要翻墙才能快)，才推送了5/28M。

### 登录Docker Hub查看新推送的镜像
![resp_list.png](https://kangyonggan.com/upload/20170223154255805.png)

由于网速太慢（怀疑是官网太慢），截图的时候还没推送完成。

## 从镜像库拉取镜像
`docker pull`是用来拉取镜像的，如果本地已经有最新版的镜像，`docker pull`命令将什么也不做，为了验证是真正的从镜像库中拉取下来的，你可以先删除本地镜像`docker image remove`。

### 用docker image remove删除本地镜像
```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
docker-whale2              latest              efb18db73358        2 hours ago         275 MB
docker-whale               latest              efb18db73358        2 hours ago         275 MB
kangyonggan/docker-whale   latest              efb18db73358        2 hours ago         275 MB
hello-world                latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay            latest              6b362a9f73eb        21 months ago       247 MB

root@iZ23ldh8kudZ:~/code/mydockerbuild# docker image remove efb18db73358
Error response from daemon: conflict: unable to delete efb18db73358 (must be forced) - image is referenced in multiple repositories
```

通过镜像ID删除一个本地镜像，可能会报错，如果此时你又两个ID一样的镜像，另外也可以通过镜像标签删除镜像。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker image remove docker-whale2
Untagged: docker-whale2:latest

root@iZ23ldh8kudZ:~/code/mydockerbuild# docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
docker-whale               latest              efb18db73358        2 hours ago         275 MB
kangyonggan/docker-whale   latest              efb18db73358        2 hours ago         275 MB
hello-world                latest              48b5124b2768        5 weeks ago         1.84 kB
docker/whalesay            latest              6b362a9f73eb        21 months ago       247 MB
```

### 用docker run命令从Docker Hub拉取镜像，当你本地没这个镜像的时候。

```
root@iZ23ldh8kudZ:~/code/mydockerbuild# docker run kangyonggan/docker-whale
```

---

更多用法请移步:[https://docs.docker.com/engine/getstarted/last_page/](https://docs.docker.com/engine/getstarted/last_page/)





', 0, '2017-04-11 11:54:20', '2017-04-11 12:18:12');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Mybatis Generator集成MapperPlugin、LombokPlugin和SerializablePlugin', 'java', 'Java后台', '

## MBG集成MapperPlugin、LombokPlugin和SerializablePlugin
可以生成的持久层代码:

- 生成BeanMapper.java
- 生成BeanMapper.xml
- 生成Bean.java

### 特点
- 生成的Mapper.java继承了MyMapper.java(所有单表的crud全部不用写SQL)
- 实体bean拥有@Data注解（免去写getter、setter和toString的烦恼）
- 实体bean实现Serializable接口，可以放心的放入Redis缓存或传输如分布式系统间（如:dubbo）

<!-- more -->

> 坑：生成的Mapper.java，默认不带注解`@Repository`，如果你又没用spring扫描mapper包， 在运行时会报错，是运行时而不是启动时。

### 引入依赖和插件
`pom.xml`中的配置:

```
<plugin.mybatis-generator.version>1.3.2</plugin.mybatis-generator.version>
<mybatis-generator.version>1.3.2</mybatis-generator.version>
<mybatis-mapper.version>3.3.8</mybatis-mapper.version>
<lombok.version>1.16.8</lombok.version>

...

<!--MBG plugin-->
<plugin>
    <groupId>org.mybatis.generator</groupId>
    <artifactId>mybatis-generator-maven-plugin</artifactId>
    <version>${plugin.mybatis-generator.version}</version>
    <configuration>
        <verbose>true</verbose>
        <overwrite>true</overwrite>
    </configuration>
    <dependencies>
        <dependency>
            <groupId>${project.groupId}</groupId>
            <artifactId>api-dao</artifactId>
            <version>${project.version}</version>
        </dependency>
    </dependencies>
</plugin>

<dependency>
    <groupId>org.mybatis.generator</groupId>
    <artifactId>mybatis-generator-core</artifactId>
    <version>${mybatis-generator.version}</version>
    <scope>compile</scope>
    <optional>true</optional>
</dependency>
<dependency>
    <groupId>tk.mybatis</groupId>
    <artifactId>mapper</artifactId>
    <version>${mybatis-mapper.version}</version>
</dependency>

<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>${lombok.version}</version>
    <scope>provided</scope>
</dependency>
```

> 提示：MBG插件之所以依赖dao, 是因为我在插件中使用了dao中的两个类,下面有。

### 代码和插件配置

`MyMapper.java`

```
package com.kangyonggan.api.mapper;

import org.springframework.stereotype.Component;
import tk.mybatis.mapper.common.ConditionMapper;
import tk.mybatis.mapper.common.ExampleMapper;
import tk.mybatis.mapper.common.SqlServerMapper;
import tk.mybatis.mapper.common.base.BaseDeleteMapper;
import tk.mybatis.mapper.common.base.BaseSelectMapper;
import tk.mybatis.mapper.common.base.BaseUpdateMapper;

/**
 * @author kangyonggan
 * @since 16/5/12
 */
@Component
public interface MyMapper<T> extends
        BaseSelectMapper<T>,
        BaseUpdateMapper<T>,
        BaseDeleteMapper<T>,
        ExampleMapper<T>,
        ConditionMapper<T>,
        SqlServerMapper<T> {
}
```

`LombokPlugin.java`

```
package com.kangyonggan.api.mapper.util;

import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.api.dom.java.Method;
import org.mybatis.generator.api.dom.java.TopLevelClass;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/5/12
 */
public class LombokPlugin extends PluginAdapter {
    private FullyQualifiedJavaType dataAnnotation = new FullyQualifiedJavaType("lombok.Data");

    public boolean validate(List<String> warnings) {
        return true;
    }

    public boolean modelBaseRecordClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        this.addDataAnnotation(topLevelClass);
        return true;
    }

    public boolean modelPrimaryKeyClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        this.addDataAnnotation(topLevelClass);
        return true;
    }

    public boolean modelRecordWithBLOBsClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        this.addDataAnnotation(topLevelClass);
        return true;
    }

    public boolean modelGetterMethodGenerated(Method method, TopLevelClass topLevelClass, IntrospectedColumn introspectedColumn, IntrospectedTable introspectedTable, ModelClassType modelClassType) {
        return false;
    }

    public boolean modelSetterMethodGenerated(Method method, TopLevelClass topLevelClass, IntrospectedColumn introspectedColumn, IntrospectedTable introspectedTable, ModelClassType modelClassType) {
        return false;
    }

    protected void addDataAnnotation(TopLevelClass topLevelClass) {
        topLevelClass.addImportedType(this.dataAnnotation);
        topLevelClass.addAnnotation("@Data");
    }
}
```

配置插件`generatorConfig.xml`, 插件放在dao模块的`src/main/resources`目录下即可

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE generatorConfiguration PUBLIC
        "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <context id="sqlContext" targetRuntime="MyBatis3Simple" defaultModelType="flat">

        <property name="beginningDelimiter" value="`"></property>
        <property name="endingDelimiter" value="`"></property>

        <!--base mapper-->
        <plugin type="tk.mybatis.mapper.generator.MapperPlugin">
            <property name="mappers" value="com.kangyonggan.api.mapper.MyMapper"></property>
        </plugin>

        <!--serialize plugin-->
        <plugin type="org.mybatis.generator.plugins.SerializablePlugin"></plugin>

        <!--lombok plugin-->
        <plugin type="com.kangyonggan.api.mapper.util.LombokPlugin"></plugin>

        <!--jdbc driver-->
        <jdbcConnection driverClass="com.mysql.jdbc.Driver"
                        connectionURL="jdbc:mysql://127.0.0.1:3306/api"
                        userId="root" password="123456"></jdbcConnection>

        <!--Xxx.java-->
        <javaModelGenerator targetPackage="com.kangyonggan.api.model.vo"
                            targetProject="../api-model/src/main/java">
            <property name="enableSubPackages" value="true"></property>
            <property name="trimStrings" value="true"></property>
        </javaModelGenerator>

        <!--XxxMapper.xml-->
        <sqlMapGenerator targetPackage="mapper" targetProject="src/main/resources">
            <property name="enableSubPackages" value="true"></property>
        </sqlMapGenerator>

        <!--XxxMapper.java-->
        <javaClientGenerator type="XMLMAPPER" targetPackage="com.kangyonggan.api.mapper"
                             targetProject="src/main/java">
            <property name="enableSubPackages" value="true"></property>
        </javaClientGenerator>

        <!--table name-->
        <table tableName="table_name">
            <generatedKey column="id" sqlStatement="Mysql" identity="true"></generatedKey>
        </table>
    </context>
</generatorConfiguration>
```

### 使用
1. 在项目跟目录下`mvn clean install`, 目的是打包`xxx-dao.jar`，好让插件去依赖
2. 使用 IntelliJ IDEA的，请参考下图(两步), 其他工具我不用，请自行摸索

![使用说明](https://kangyonggan.com/upload/20170105191303945.png)

> 温馨提示：以上配置是我个人配置，请勿直接使用，使用前请自行改造。






', 0, '2017-04-11 11:55:37', '2017-05-26 02:39:51');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('MySQL5.6主从复制的配置', 'db', '数据库', '

## 实验环境
1. 主库机器IP: `10.10.10.248`
2. 从库机器IP: `10.10.10.166`
3. 数据库版本: `Mysql 5.6`
4. 操作系统: `Ubuntu 14.04`

<!-- more -->

## 配置主库
### 修改`/etc/mysql/my.cfg`配置，在`[mysqld]`下面添加：

```
log-bin=mysql-bin

server-id=1

```

保存后重启mysql:

```
sudo /etc/init.d/mysql restart
```

### 创建一个用户，并授权给从服务器
登录mysql

```
mysql -uroot -p
```

创建用户`kyg`并授权给从服务器:

```
grant replication slave on *.* to ''kyg''@''10.10.10.166'' identified by ''kyg'';
```

![master](https://kangyonggan.com/upload/20170101145536544.png)

最后别忘了刷新权限:

```
flush privileges;
```

### 查看主库状态
```
show master status;
```

记录下`File`和`Position`的值，后面配置从库时会用到

![master-status](https://kangyonggan.com/upload/20170101145208095.png)

## 配置从库
### 修改`/etc/mysql/my.cfg`配置，在`[mysqld]`下面添加：
```
server-id=2
```

保存后重启mysql:

```
sudo /etc/init.d/mysql restart
```

## 登录mysql，并配置相关参数:

```
change master to
master_host = ''10.10.10.248'',
master_user = ''kyg'',
master_password = ''kyg'',
master_log_file = ''mysql-bin.000004'',
master_log_pos = 120;
```

查看从库状态

```
show slave status G;
```

会发现从库还没开启复制

![slave-status1](https://kangyonggan.com/upload/20170101145456162.png)

这时候就需要开启从库的复制功能`start slave;`

![slave-status2](https://kangyonggan.com/upload/20170101145208097.png)

上面的截图再往下滚动， 可能会看见报错:

```
error connecting to master ''kyg@10.10.10.248:3306'' - retry-time: 60  retries: 7
```

这是由于主库配置了`bind-address:127.0.0.1`, 为了简单，我直接把这一行配置注释了(有安全隐患)

停止从库的复制功能:

```
stop slave
```

## 测试
### 在主库创建一个数据库`blog`
然后在从库中查看所有数据库

```
show databases;
```

![show-db](https://kangyonggan.com/upload/20170101145208096.png)

会发现从库从主库中复制了一个数据库, 实验已经成功，其他CRUD请自行实验





', 0, '2017-04-11 11:57:27', '2017-05-26 09:35:09');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('MySQL报错：数据库结构错误', 'db', '数据库', '

> ERROR 1682 (HY000): Native table ''performance_schema''.''session_variables'' has the wrong structure

## 重启MySQL
重启MySQL后还是报同样的错。

## 重启电脑
重启电脑后还是报同样的错。

## 谷歌搜一下
需要更新MySQL：

```
mysql_upgrade -u root -p
```

<!-- more -->

输出信息如下:

```
kangyonggandeMacBook-Pro:~ kyg$ mysql_upgrade -u root -p
Enter password:
Checking if update is needed.
Checking server version.
Running queries to upgrade MySQL server.
Checking system database.
mysql.columns_priv                                 OK
mysql.db                                           OK
mysql.engine_cost                                  OK
mysql.event                                        OK
mysql.func                                         OK
mysql.general_log                                  OK
mysql.gtid_executed                                OK
mysql.help_category                                OK
mysql.help_keyword                                 OK
mysql.help_relation                                OK
mysql.help_topic                                   OK
mysql.innodb_index_stats                           OK
mysql.innodb_table_stats                           OK
mysql.ndb_binlog_index                             OK
mysql.plugin                                       OK
mysql.proc                                         OK
mysql.procs_priv                                   OK
mysql.proxies_priv                                 OK
mysql.server_cost                                  OK
mysql.servers                                      OK
mysql.slave_master_info                            OK
mysql.slave_relay_log_info                         OK
mysql.slave_worker_info                            OK
mysql.slow_log                                     OK
mysql.tables_priv                                  OK
mysql.time_zone                                    OK
mysql.time_zone_leap_second                        OK
mysql.time_zone_name                               OK
mysql.time_zone_transition                         OK
mysql.time_zone_transition_type                    OK
mysql.user                                         OK
The sys schema is already up to date (version 1.5.1).
Checking databases.
simconf.user_role                                  OK
simulator.bank_channel                             OK
simulator.bank_command                             OK
simulator.bank_command_log                         OK
simulator.bank_resp                                OK
simulator.bank_tran                                OK
simulator.dz_file                                  OK
simulator.menu                                     OK
simulator.role                                     OK
simulator.role_menu                                OK
simulator.sim_order                                OK
simulator.user                                     OK
simulator.user_role                                OK
sys.sys_config                                     OK
Upgrade process completed successfully.
Could not create the upgrade info file ''/usr/local/mysql/data/mysql_upgrade_info'' in the MySQL Servers datadir, errno: 13
kangyonggandeMacBook-Pro:~ kyg$
```

报错说是不能创建文件，可能是权限不足吧，于是

```
sudo mysql_upgrade -u root -p
```

输出:

```
...省略...
Upgrade process completed successfully.
Checking if update is needed.
```

这次没报错以为成功了，然后就测试了一把，发现还是报同样的错。

## 再次重启MySQL
测试后发现不报错了。

> 问题是小问题，如果之前遇到过此类问题可以一步解决，但是如果没遇到过，就需要按部就班的去解决了。



', 0, '2017-04-11 11:59:33', '2017-04-11 12:18:03');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('MySQL数据库定时备份', 'db', '数据库', '

## 创建备份脚本
创建`.bak.sh`, 内容为:

```

today=`date +%Y%m%d`

mysqldump -uroot -p123456 blog > /home/kyg/bak/blog-bak-$today.sql

scp /home/kyg/bak/blog-bak-$today.sql root@121.40.66.176:/root/bak/
```

<!-- more -->

> 其中，备份到远程时，用到了免密登录，请参考我的另一篇博客

## 定时执行
定时执行用的是linux下自带的`crontab`命令

`crontab -l` 查看任务

`crontab -e` 编辑任务

我设置的是，每天凌晨3点执行备份:

```
0 3 * * * sh /home/kyg/.bak.sh
```



', 0, '2017-04-11 12:00:37', '2017-07-27 03:48:38');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('MySQL读写分离的实现', 'java', 'Java后台', '

## 实验环境
1. 主库:192.168.2.108:3306/kyg
2. 从库1:192.168.2.113:3306/kyg
3. 从库2:192.168.2.103:3306/kyg

<!-- more -->

## 实验目的
1. 写数据时使用主库
2. 读数据时使用从库

## 实现方案
使用MySQL自身提供的一个驱动`com.mysql.jdbc.ReplicationDriver`来实现读写分离。
如果一个方法是只读的，那么ReplicationDriver就会为你选择从库读取数据，反之就会选择主库进行读写。
可以结合SpringAop配置事物的读写：

```
<tx:advice id="transactionAdvice" transaction-manager="transactionManager">
    <tx:attributes>
        <tx:method name="delete*" propagation="REQUIRED"></tx:method>
        <tx:method name="update*" propagation="REQUIRED"></tx:method>
        <tx:method name="save*" propagation="REQUIRED"></tx:method>
        <tx:method name="remove*" propagation="REQUIRED"></tx:method>

        <tx:method name="search*" read-only="true" propagation="REQUIRED"></tx:method>
        <tx:method name="find*" read-only="true" propagation="REQUIRED"></tx:method>
        <tx:method name="get*" read-only="true" propagation="REQUIRED"></tx:method>
        <tx:method name="*" read-only="true" propagation="REQUIRED"></tx:method>
    </tx:attributes>
</tx:advice>
```

jdbc的配置:

```
blog.jdbc.driver     = com.mysql.jdbc.Driver
blog.jdbc.password   = abc
blog.jdbc.url        = jdbc:mysql:replication://192.168.2.108:3306,192.168.2.113:3306,192.168.2.103:3306/kyg
blog.jdbc.username   = abc
```

## 观察日志

![走主库](https://kangyonggan.com/upload/20170107152930664.png)

![走从库](https://kangyonggan.com/upload/20170107152931258.png)



', 0, '2017-04-11 12:01:23', '2017-07-22 00:32:41');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('nginx做负载均衡遇到session共享的问题', 'linux', '系统运维', '

## 常见的解决方案有:
### 不使用session，换用cookie
- 简单方便对服务器无压力
- 如果客户端把cookie禁掉了的话，那么session就无法同步了
- cookie的安全性不高，虽然它已经加了密，但是还是可以伪造的

### session存在数据库
- 会加大数据库的IO，增加数据库的负担
- 数据库读写速度较慢，不利于session的适时同步

<!-- more -->

### session存在memcache或者Redis中
- 不会加大数据库的负担
- 并且安全性比用cookie大大的提高
- 把session放到内存里面，比从文件中读取要快很多
- 但偶尔会因网络较慢而出现掉线

### 使用nginx中的ip_hash技术
- 能够将某个ip的请求定向到同一台后端
- nginx不是最前端的服务器的时候，就跪了，因为转发到nginx的ip是不变的
- nginx不是最后端的服务器的时候，也得跪

> 我个人的情况比较适合选择方案3+4

## 配置如下
```
upstream kyg.com {
        server  42.196.156.22:8088;
        server  42.196.156.22:18088;
        server  42.196.156.22:28088;
        ip_hash;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
                proxy_pass http://kyg.com;
        }

        # 设定访问静态文件直接读取不经过tomcat
        location ^~ /static/ {
                proxy_pass http://kyg.com;
                root /WEB-INF/static/;
        }
}
```

就是在`upstream`下面加了`ip_hash;`配置

> 集群在设计之初最好设计成无状态的

', 0, '2017-04-11 12:02:06', '2017-04-12 15:12:40');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Nginx报错：413 Request Entity Too Large', 'other', '综合', '
在http模块下添加配置:

```
http {
    ...
    client_max_body_size 10m;
    ...
}

```
', 0, '2017-04-11 12:02:31', '2017-04-11 12:19:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('nginx负载均衡的配置', 'other', '综合', '


## 实验环境
1. 机器1的ip:10.10.10.248, tomcat端口:8088
2. 机器2的ip:10.10.10.166, tomcat端口:8088
3. nginx所在机器ip:10.10.10.248, 监听端口80

<!-- more -->

## 启动两个tomcat，配置nginx
我使用的是jenkins启动的tomcat，一键部署成功, 效果如下:

![tomcat-166.png](https://kangyonggan.com/upload/20170101200131662.png)

![tomcat-248.png](https://kangyonggan.com/upload/20170101200131669.png)

我的nginx是部署在248服务器上，监听的是80端口， 现在想做的就是:
在访问http://10.10.10.248:80的时候，nginx把所有的请求均等转发到10.10.10.248:8088和10.10.10.166:8088

nginx配置`/etc/nginx/sites-available/default`如下:

```
upstream kyg.com {
       server  10.10.10.248:8088;
       server  10.10.10.166:8088;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
                proxy_pass http://kyg.com;
        }

        # 设定访问静态文件直接读取不经过tomcat
        location ^~ /static/ {
                proxy_pass http://kyg.com;
                root /WEB-INF/static/;
        }
}
```

修改nginx配置后需要重新加载配置`sudo nginx -s reload`

### 查看日志，分析结果
1. 分别在两台服务器上`tail -f /home/kyg/logs/blog/all.log`
2. 然后访问http://10.10.10.248
3. 观察哪台服务器会刷日志
4. 再次访问http://10.10.10.248
5. 观察哪台服务器会刷日志
6. 重复访问观察...

![log](https://kangyonggan.com/upload/20170101205501760.png)

发现nginx会把所有的请求均等的（发给你一次发给我一次）转发到两台服务器, 当然你也可以配置权重，让某台服务分担的压力小一点，或者动态负载均衡等。

## kill其中一个tomcat
我现在把166服务器kill了，在访问并观察日志, 结果：

1. 网站仍然可以正常访问
2. 所有的访问全部转发到248服务器

## 分布式服务需要解决的几个问题
1. 会话共享，请参考我的另一篇博客`shiro集成redis实现session集群共享`
2. 文件共享, 请参考我的另一篇博客`ubuntu下配置ftp服务器`




', 0, '2017-04-11 12:03:32', '2017-04-11 12:19:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('shiro集成redis实现session集群共享', 'java', 'Java后台', '

## 好处
1. session在tomcat集群中共享（单点登录）
2. tomcat重启后会话不丢失

## 实现
覆写`EnterpriseCacheSessionDAO`

```
package com.kangyonggan.blog.web.shiro;

import com.kangyonggan.api.common.service.RedisService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

/**
 * @author kangyonggan
 * @since 2016/12/31
 */
public class MyEnterpriseCacheSessionDAO extends EnterpriseCacheSessionDAO {

    @Autowired
    private RedisService redisService;

    /**
     * 创建session，保存到redis数据库
     *
     * @param session
     * @return
     */
    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = super.doCreate(session);
        redisService.set(sessionId.toString(), session);

        return sessionId;
    }

    /**
     * 获取session
     *
     * @param sessionId
     * @return
     */
    @Override
    protected Session doReadSession(Serializable sessionId) {
        // 先从缓存中获取session，如果没有再去数据库中获取
        Session session = super.doReadSession(sessionId);
        if (session == null) {
            session = (Session) redisService.get(sessionId.toString());
        }
        return session;
    }

    /**
     * 更新session的最后一次访问时间
     *
     * @param session
     */
    @Override
    protected void doUpdate(Session session) {
        super.doUpdate(session);
        redisService.set(session.getId().toString(), session);
    }

    /**
     * 删除session
     *
     * @param session
     */
    @Override
    protected void doDelete(Session session) {
        super.doDelete(session);
        redisService.delete(session.getId().toString());
    }

}
```

> 但是一般还是别在集群中使用session。

', 0, '2017-04-11 12:04:09', '2017-05-27 15:28:58');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('SimpleDateFormat日期格式化线程安全问题', 'java', 'Java后台', '

## 常用的日期工具类
我们在开发中通常需要对日期进行格式化，就想到了写一个工具类，如下：

<!-- more -->

```
package com.kangyonggan.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        return new SimpleDateFormat(DATE_TIME).format(date);
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确】
     */
    public static Date parse(String source) throws ParseException {
        return new SimpleDateFormat(DATE_TIME).parse(source);
    }
}
```

## 追求性能的日期工具类
追求性能的同学可能会说：每次都new一个SimpleDateFormat太浪费了，于是有了下面一版：

```
package com.kangyonggan.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_TIME);

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        return simpleDateFormat.format(date);
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确或多线程临界资源问题】
     */
    public static Date parse(String source) throws ParseException {
        return simpleDateFormat.parse(source);
    }

}
```

## 测试临界资源问题
这个工具类在大多数的时候都是ok的，但是在高并发的时候就不是那么好使了，看看测试代码：

```
package com.kangyonggan.demo.util;

import java.text.ParseException;

/**
 * 测试DateUtil高并发
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class TestDateUtil {

    public static void main(String[] args) {
        for (int i = 0; i < 2; i++) {
            new Thread() {
                public void run() {
                    while (true) {
                        try {
                            sleep(1000);
                            System.out.println(DateUtil.parse("2017-03-10 11:24:35"));
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        } catch (ParseException e) {
                            e.printStackTrace();
                            return;
                        }
                    }
                }
            }.start();
        }
    }

}
```

输出信息如下：

```
Exception in thread "Thread-0" Exception in thread "Thread-1" java.lang.NumberFormatException: For input string: "101.E1012E"
  at sun.misc.FloatingDecimal.readJavaFormatString(FloatingDecimal.java:2043)
  at sun.misc.FloatingDecimal.parseDouble(FloatingDecimal.java:110)
  at java.lang.Double.parseDouble(Double.java:538)
  at java.text.DigitList.getDouble(DigitList.java:169)
  at java.text.DecimalFormat.parse(DecimalFormat.java:2056)
  at java.text.SimpleDateFormat.subParse(SimpleDateFormat.java:2162)
  at java.text.SimpleDateFormat.parse(SimpleDateFormat.java:1514)
  at java.text.DateFormat.parse(DateFormat.java:364)
  at com.kangyonggan.demo.util.DateUtil.parse(DateUtil.java:36)
  at com.kangyonggan.demo.util.TestDateUtil$1.run(TestDateUtil.java:20)
java.lang.NumberFormatException: For input string: "101.E1012E2"
  at sun.misc.FloatingDecimal.readJavaFormatString(FloatingDecimal.java:2043)
  at sun.misc.FloatingDecimal.parseDouble(FloatingDecimal.java:110)
  at java.lang.Double.parseDouble(Double.java:538)
  at java.text.DigitList.getDouble(DigitList.java:169)
  at java.text.DecimalFormat.parse(DecimalFormat.java:2056)
  at java.text.SimpleDateFormat.subParse(SimpleDateFormat.java:2162)
  at java.text.SimpleDateFormat.parse(SimpleDateFormat.java:1514)
  at java.text.DateFormat.parse(DateFormat.java:364)
  at com.kangyonggan.demo.util.DateUtil.parse(DateUtil.java:36)
  at com.kangyonggan.demo.util.TestDateUtil$1.run(TestDateUtil.java:20)

Process finished with exit code 0
```

从错误信息来看是字符串的格式有误，但我们的入参时没错的，于是我稍微修改代码:`i < 1`，即只有一个线程，这时候是不会报错的。
报错显然是多线程中临界资源`simpleDateFormat`引起的，说明`parse`方法不是线程安全的。查看SimpleDateFormat源码可以看到

```
Date parsedDate;
try {
    parsedDate = calb.establish(calendar).getTime();
    // If the year value is ambiguous,
    // then the two-digit year == the default start year
    if (ambiguousYear[0]) {
        if (parsedDate.before(defaultCenturyStart)) {
            parsedDate = calb.addYear(100).establish(calendar).getTime();
        }
    }
}
// An IllegalArgumentException will be thrown by Calendar.getTime()
// if any fields are out of range, e.g., MONTH == 17.
catch (IllegalArgumentException e) {
    pos.errorIndex = start;
    pos.index = oldStart;
    return null;
}
```

其中`calendar `是成员变量：

```
protected Calendar calendar;
```

也就是说在多线程并发时，这个临界资源是可能被多个线程同时使用的。

## 解决方案
### 1. 在每次调用的时候去new一个
虽然可能会占用一些内存（一般不是很明显，忽略不计），但比较安全。
### 2. 访问临界资源时，使用同步
```
package com.kangyonggan.demo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_TIME);

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        synchronized (simpleDateFormat) {
            return simpleDateFormat.format(source);
        }
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确】
     */
    public static Date parse(String source) throws ParseException {
        synchronized (simpleDateFormat) {
            return simpleDateFormat.parse(source);
        }
    }
}
```

但是，当调用太过频繁时，会有阻塞，对性能有一定的影响。

### 3. 使用ThreadLocal
```
package com.kangyonggan.demo.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 *
 * @author kangyonggan
 * @since 2017/3/10
 */
public class DateUtil {

    private static final String DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    private static final ThreadLocal<DateFormat> threadLocal = new ThreadLocal<DateFormat>();

    /**
     * 格式化成日期时间型字符串
     *
     * @param date 日期
     * @return 返回日期时间型字符串
     */
    public static String format2DateTime(Date date) {
        return getDateFormat().format(date);
    }

    /**
     * 把字符串成解析日期
     *
     * @param source 日期字符串
     * @return 解析后的日期
     * @throws ParseException 解析异常【字符串的格式不正确】
     */
    public static Date parse(String source) throws ParseException {
        return getDateFormat().parse(source);
    }

    /**
     * 获取一个线程独享的dateFormat，如果没有则创建一个
     *
     * @return 返回一个线程独享的dateFormat
     */
    private static DateFormat getDateFormat() {
        DateFormat dateFormat = threadLocal.get();
        if (dateFormat == null) {
            dateFormat = new SimpleDateFormat(DATE_TIME);
            threadLocal.set(dateFormat);
        }
        return dateFormat;
    }
}
```

使用ThreadLocal有些情况下并不能减少对象的创建（如果一个线程只调用一次DateUtil），但是有些时候还是有效果的（一个线程多次调用DateUtil）。





', 0, '2017-04-11 12:04:54', '2017-07-13 06:46:10');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('Spring使用注解方式进行事务管理', 'java', 'Java后台', '

参考:[http://www.cnblogs.com/younggun/archive/2013/07/16/3193800.html](http://www.cnblogs.com/younggun/archive/2013/07/16/3193800.html)

## 使用步骤
### 在spring配置文件中引入<tx:>命名空间
```
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-2.0.xsd
         http://www.springframework.org/schema/tx
         http://www.springframework.org/schema/tx/spring-tx-2.0.xsd">
</beans>
```

<!-- more -->

### 具有@Transactional注解的bean自动配置为声明式事务支持
```
<!-- 使用JDBC事务 -->
<bean id="transactionManager"
      class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSource" ref="dataSource"></property>
</bean>

<!-- 使用annotation注解方式配置事务 -->
<tx:annotation-driven transaction-manager="transactionManager"></tx:annotation>
```

### 在接口或类的声明处,写一个@Transactional
1. 只在接口上写，接口的实现上不写，实现类会继承下来，也可以覆写注解。
2. 如果注解在类上，适用于类中所有的`public`的方法。

## 事务的传播特性和隔离级别
### 事务注解方式: @Transactional
当标于类前时, 标示类中所有方法都进行事务处理：

```
@Transactional
public class UserServiceImpl implements UserService {}
```

### 当类中某些方法不需要事务时
```
@Transactional
public class UserServiceImpl extends BaseService<User> implements UserService {

    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<Object> getAll() {
        return null;
    }

}
```

### 事务传播特性
1. @Transactional(propagation = Propagation.REQUIRED) 如果有事务, 那么加入事务, 没有的话新建一个(默认情况下)
2. @Transactional(propagation = Propagation.NOT_SUPPORTED) 容器不为这个方法开启事务
3. @Transactional(propagation = Propagation.REQUIRES_NEW) 不管是否存在事务,都创建一个新的事务,原来的挂起,新的执行完毕,继续执行老的事务
4. @Transactional(propagation = Propagation.MANDATORY) 必须在一个已有的事务中执行,否则抛出异常
5. @Transactional(propagation = Propagation.NEVER) 必须在一个没有的事务中执行,否则抛出异常(与Propagation.MANDATORY相反)
6. @Transactional(propagation = Propagation.SUPPORTS) 如果其他bean调用这个方法,在其他bean中声明事务,那就用事务.如果其他bean没有声明事务,那就不用事务

### 事务超时设置
```
@Transactional(timeout = 30) //默认是30秒
```

### 事务隔离级别
1. @Transactional(isolation = Isolation.READ_UNCOMMITTED) 读取未提交数据(会出现脏读, 不可重复读) 基本不使用
2. @Transactional(isolation = Isolation.READ_COMMITTED) 读取已提交数据(会出现不可重复读和幻读)
3. @Transactional(isolation = Isolation.REPEATABLE_READ) 可重复读(会出现幻读)
4. @Transactional(isolation = Isolation.SERIALIZABLE) 串行化

> MySQL: 默认为REPEATABLE_READ级别
> SQLServer: 默认为READ_COMMITTED

#### 脏读
一个事务读取到另一事务未提交的更新数据。

#### 不可重复读
在同一事务中, 多次读取同一数据返回的结果有所不同, 换句话说, 后续读取可以读到另一事务已提交的更新数据. 相反, "可重复读"在同一事务中多次读取数据时, 能够保证所读数据一样, 也就是后续读取不能读到另一事务已提交的更新数据。

#### 幻读
一个事务读到另一个事务已提交的insert数据。

## @Transactional注解中常用参数说明
参数名称                   | 功能描述
----------------------- | -------------
readOnly                |   该属性用于设置当前事务是否为只读事务
rollbackFor             | 该属性用于设置需要进行回滚的异常类数组，当方法中抛出指定异常数组中的异常时，则进行事务回滚。例如：指定单一异常类：@Transactional(rollbackFor=RuntimeException.class)指定多个异常类：@Transactional(rollbackFor={RuntimeException.class, Exception.class})
rollbackForClassName    | 该属性用于设置需要进行回滚的异常类名称数组，当方法中抛出指定异常名称数组中的异常时，则进行事务回滚。例如：指定单一异常类名称：@Transactional(rollbackForClassName="RuntimeException")指定多个异常类名称：@Transactional(rollbackForClassName={"RuntimeException","Exception"})
noRollbackFor           | 该属性用于设置不需要进行回滚的异常类数组，当方法中抛出指定异常数组中的异常时，不进行事务回滚。例如：指定单一异常类：@Transactional(noRollbackFor=RuntimeException.class)指定多个异常类：@Transactional(noRollbackFor={RuntimeException.class, Exception.class})
noRollbackForClassName  | 该属性用于设置不需要进行回滚的异常类名称数组，当方法中抛出指定异常名称数组中的异常时，不进行事务回滚。例如：指定单一异常类名称：@Transactional(noRollbackForClassName="RuntimeException")指定多个异常类名称：@Transactional(noRollbackForClassName={"RuntimeException","Exception"})
propagation             | 该属性用于设置事务的传播行为，例如：@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
isolation               | 该属性用于设置底层数据库的事务隔离级别，事务隔离级别用于处理多事务并发的情况，通常使用数据库的默认隔离级别即可，基本不需要进行设置
timeout                 | 该属性用于设置事务的超时秒数，默认值为-1表示永不超时

## 注意
### @Transactional只能被应用到public方法上
对于其它非public的方法,如果标记了@Transactional也不会报错,但方法没有事务功能.
### 关于异常回滚
用spring事务管理器来管理数据库的打开、提交、回滚。默认遇到运行期例外(throw new RuntimeException("异常了");)会回滚，即遇到不受检查（unchecked）的例外时回滚。
而遇到需要捕获的例外(throw new Exception("注释");)不会回滚,即遇到受检查的例外（就是非运行时抛出的异常，编译器会检查到的异常叫受检查例外或说受检查异常）时，需我们指定方式来让事务回滚 要想所有异常都回滚,要加上 @Transactional( rollbackFor={Exception.class,其它异常})。
如果让unchecked例外不回滚：

```
@Transactional(notRollbackFor = RunTimeException.class)
@Transactional(rollbackFor = Exception.class) //指定回滚,遇到异常Exception时回滚
public void methodName() {
  throw new Exception("异常了");
}

//指定不回滚,遇到运行期例外(throw new RuntimeException("异常了");)会回滚
@Transactional(noRollbackFor = Exception.class)
public ItimDaoImpl getItemDaoImpl() {
  throw new RuntimeException("异常了");
}
```

### @Transactional和<tx:annotation-driven></tx:annotation>
@Transactional注解可以被应用于接口定义和接口方法、类定义和类的 public 方法上。然而，请注意仅仅 @Transactional 注解的出现不足于开启事务行为，它仅仅 是一种元数据，能够被可以识别 @Transactional 注解和上述的配置适当的具有事务行为的beans所使用。上面的例子中，其实正是`<tx:annotation-driven></tx:annotation>`元素的出现开启了事务行为。

### 请在实现类上使用@Transactional
Spring团队的建议是你在具体的类（或类的方法）上使用 @Transactional 注解，而不要使用在类所要实现的任何接口上。你当然可以在接口上使用 @Transactional 注解，但是这将只能当你设置了基于接口的代理时它才生效。因为注解是 不能继承 的，这就意味着如果你正在使用基于类的代理时，那么事务的设置将不能被基于类的代理所识别，而且对象也将不会被事务代理所包装（将被确认为严重的）。因 此，请接受Spring团队的建议并且在具体的类上使用 @Transactional 注解。






', 0, '2017-04-11 12:05:32', '2017-08-15 07:03:01');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('ssh端口转发', 'linux', '系统运维', '## 转发本地到远端
```
ssh -C -f -N -g -L 本地端口:远端IP:远端端口 远端用户名@远端IP
```

### 例子
```
ssh -C -f -N -g -L 2222:42.196.156.22:22 kyg@42.196.156.22
```

所有请求本地2222端口的请求，都会转发给42.196.156的22端口

> 网络前提：远端机器一定要能访问本地机器，不要求本地机器能访问远端机器

<!-- more -->

## 转发远端到本地
```
ssh -C -f -N -g –R 远端端口:本地IP:本地端口 远端用户名@远端IP
```

### 例子
```
ssh -C -f -N -g -R 2323:127.0.0.1:22 root@121.40.66.176
```

所有请求121.40.66.176:2323的请求，都会转发给本地的22端口

> 网络前提：本地机器一定要能访问远端机器，不要求远端机器能访问本地机器


', 0, '2017-04-11 12:06:13', '2017-08-16 10:30:29');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('ssh免密登录', 'linux', '系统运维', '

现在有两台机器A和B， 想要用ssh从A登录到B， 并且不使用密码

## 在A机器上生成密钥对
```
ssh-keygen -t rsa
```

然后会有三次提示用户输入， 什么也不要输入， 直接回车， 就会在用户根目录生成`.ssh`文件夹, 文件夹里会有`id_rsa`私钥和`id_rsa.pub`公钥

## 把公钥导入B机器
```
ssh-copy-id -i .ssh/id_rsa.pub root@192.168.20.212
```

<!-- more -->

执行这个命令会要求输入一次密码， 不过以后就不用再输密码了。
如果A机器没安装ssh-copy-id命令， 可以先运行下面的命令去下载`ssh-copy-id`

```
curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh
```

也可以手动导入， 先把公钥scp到B机器（也要输入一次密码），
然后输出到.ssh/authorized_keys文件中即可

```
cat id_rsa.pub > .ssh/authorized_keys
```

## 免密登录测试

```
ssh root@192.168.20.212
```


', 0, '2017-04-11 12:06:51', '2017-08-16 09:57:51');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('ssh登录控制,登录失败5次禁IP', 'linux', '系统运维', '

今天在登录我服务器的时候，发现了下面这段话

```
kangyonggandeMacBook-Pro:~ kyg$ ./.login.sh
Last failed login: Sun Mar  5 13:27:21 EST 2017 from 42.196.186.61 on ssh:notty
There were 721 failed login attempts since the last successful login.
Last login: Sat Mar  4 07:33:47 2017 from 192.168.2.222
```

<!-- more -->

发现是有人尝试爆破我的服务器，我的服务器是CentOS7,于是我查看日志：

```
[root@localhost log]# pwd
/var/log
[root@localhost log]# ll
总用量 10044
drwxr-xr-x. 2 root   root       176 2月  26 08:37 anaconda
drwx------. 2 root   root        99 3月   5 07:30 audit
-rw-r--r--. 1 root   root      9671 3月   1 08:05 boot.log
-rw-------. 1 root   utmp    473856 3月   5 13:27 btmp
-rw-------. 1 root   utmp    462720 2月  28 12:15 btmp-20170301
drwxr-xr-x. 2 chrony chrony       6 12月  6 17:42 chrony
-rw-------. 1 root   root     51771 3月   6 02:01 cron
-rw-r--r--. 1 root   root     59619 3月   1 08:05 dmesg
-rw-r--r--. 1 root   root     59102 2月  28 06:39 dmesg.old
-rw-r--r--. 1 root   root      2873 2月  27 07:19 firewalld
-rw-------. 1 root   root      1280 2月  26 08:42 grubby
-rw-r--r--. 1 root   root    291708 3月   6 02:06 lastlog
-rw-------. 1 root   root      3805 3月   5 03:00 maillog
-rw-------. 1 root   root   3661588 3月   6 02:20 messages
-rw-r--r--. 1 mysql  mysql    65242 3月   2 02:48 mysqld.log
drwx------. 2 root   root         6 6月  10 2014 ppp
drwxr-xr-x. 2 root   root         6 2月  26 08:37 rhsm
-rw-------. 1 root   root   3081270 3月   6 02:20 secure
-rw-------. 1 root   root         0 2月  26 08:35 spooler
-rw-------. 1 root   root         0 2月  26 08:34 tallylog
drwxr-xr-x. 2 root   root        23 12月  6 17:26 tuned
-rw-------. 1 root   root     29494 3月   6 02:17 wpa_supplicant.log
-rw-r--r--. 1 root   root     51059 2月  27 06:32 wpa_supplicant.log-20170227
-rw-rw-r--. 1 root   utmp     44160 3月   6 02:06 wtmp
-rw-------. 1 root   root      7438 2月  27 07:03 yum.log

[root@localhost log]# grep "Failed password for" secure
...太多就不贴出来了
Mar  4 21:34:02 localhost sshd[24674]: Failed password for root from 42.196.186.61 port 56860 ssh2
Mar  4 21:34:05 localhost sshd[24674]: Failed password for root from 42.196.186.61 port 56860 ssh2
Mar  4 21:34:07 localhost sshd[24679]: Failed password for root from 42.196.186.61 port 56862 ssh2
Mar  4 21:34:09 localhost sshd[24679]: Failed password for root from 42.196.186.61 port 56862 ssh2
Mar  4 21:34:12 localhost sshd[24679]: Failed password for root from 42.196.186.61 port 56862 ssh2
Mar  4 21:34:14 localhost sshd[24684]: Failed password for root from 42.196.186.61 port 56962 ssh2
Mar  4 21:34:17 localhost sshd[24684]: Failed password for root from 42.196.186.61 port 56962 ssh2
Mar  5 04:37:23 localhost sshd[26486]: Failed password for root from 42.196.186.61 port 57172 ssh2
Mar  5 04:37:25 localhost sshd[26486]: Failed password for root from 42.196.186.61 port 57172 ssh2
Mar  5 04:37:26 localhost sshd[26486]: Failed password for root from 42.196.186.61 port 57172 ssh2
Mar  5 04:37:28 localhost sshd[26486]: Failed password for root from 42.196.186.61 port 57172 ssh2
Mar  5 04:37:30 localhost sshd[26486]: Failed password for root from 42.196.186.61 port 57172 ssh2
Mar  5 04:37:32 localhost sshd[26486]: Failed password for root from 42.196.186.61 port 57172 ssh2
Mar  5 05:06:04 localhost sshd[26627]: Failed password for root from 42.196.186.61 port 60976 ssh2
Mar  5 05:06:07 localhost sshd[26627]: Failed password for root from 42.196.186.61 port 60976 ssh2
Mar  5 05:06:09 localhost sshd[26627]: Failed password for root from 42.196.186.61 port 60976 ssh2
Mar  5 05:06:12 localhost sshd[26627]: Failed password for root from 42.196.186.61 port 60976 ssh2
Mar  5 05:06:14 localhost sshd[26627]: Failed password for root from 42.196.186.61 port 60976 ssh2
Mar  5 05:06:17 localhost sshd[26627]: Failed password for root from 42.196.186.61 port 60976 ssh2
Mar  5 10:05:12 localhost sshd[27881]: Failed password for root from 123.207.23.34 port 38482 ssh2
Mar  5 10:05:15 localhost sshd[27881]: Failed password for root from 123.207.23.34 port 38482 ssh2
Mar  5 10:05:17 localhost sshd[27881]: Failed password for root from 123.207.23.34 port 38482 ssh2
Mar  5 10:05:19 localhost sshd[27881]: Failed password for root from 123.207.23.34 port 38482 ssh2
Mar  5 10:05:21 localhost sshd[27881]: Failed password for root from 123.207.23.34 port 38482 ssh2
Mar  5 10:05:24 localhost sshd[27881]: Failed password for root from 123.207.23.34 port 38482 ssh2
Mar  5 13:27:07 localhost sshd[28721]: Failed password for root from 42.196.186.61 port 43224 ssh2
Mar  5 13:27:10 localhost sshd[28721]: Failed password for root from 42.196.186.61 port 43224 ssh2
Mar  5 13:27:13 localhost sshd[28721]: Failed password for root from 42.196.186.61 port 43224 ssh2
Mar  5 13:27:16 localhost sshd[28721]: Failed password for root from 42.196.186.61 port 43224 ssh2
Mar  5 13:27:18 localhost sshd[28721]: Failed password for root from 42.196.186.61 port 43224 ssh2
Mar  5 13:27:21 localhost sshd[28721]: Failed password for root from 42.196.186.61 port 43224 ssh2
```

看到这么多的登录失败，我觉得我需要做些什么才行，比如：禁止用户名密码登录，只允许秘钥登录，但是有时候用别人的电脑没秘钥会不方便，所以，我决定`登录失败超过5次禁IP`

下面是脚本`.ip-deny.sh`：

```
#! /bin/sh

cat /var/log/secure | awk ''/Failed/{print $(NF-3)}'' | sort | uniq -c | awk ''{print $2"="$1;}'' > /root/ip-black.txt

MAX=5

for i in `cat  /root/ip-black.txt`
do
  ip=`echo $i |awk -F= ''{print $1}''`
  cnt=`echo $i |awk -F= ''{print $2}''`
  if [ $cnt -gt $MAX ]
  then
    grep $ip /etc/hosts.deny > /dev/null
    if [ $? -gt 0 ]
    then
      echo "sshd:$ip:deny" >> /etc/hosts.deny
    fi
  fi

done

cat /etc/hosts.deny
```

最后在定时任务中，每隔1分钟执行一次脚本：

```
[root@localhost ~]# crontab -e
```

查看所有定时任务：

```
[root@localhost ~]# crontab -l
# m h  dom mon dow   command


# 每天凌晨三点备份数据
0 3 * * * sh /root/.back.sh

# 每隔1分钟执行一次，登录失败超过5次禁IP
*/1 * * * *  sh /root/.ip-deny.sh
```

经试验，登录失败五次，然后再经过1分钟之后（之内），试验生效！



', 0, '2017-04-11 12:07:28', '2017-07-14 06:26:16');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('ssh登录时指定密码', 'linux', '系统运维', '

## 下载`sshpass`
[http://sourceforge.net/projects/sshpass/](http://sourceforge.net/projects/sshpass/)

## 安装
```
[root@localhost ~]# tar -zxvf sshpass-1.06.tar.gz -C /root/install/
[root@localhost ~]# cd /root/install/sshpass-1.06
[root@localhost sshpass-1.06]# ./configure
[root@localhost sshpass-1.06]# make
[root@localhost sshpass-1.06]# make install
```

## 使用
```
[root@localhost ~]# sshpass -p 123456 ssh root@121.40.66.176
```


', 0, '2017-04-11 12:08:06', '2017-06-09 08:10:04');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('从零开始搭建NexT主题的Hexo博客', 'other', '综合', '

> 参考文档: [http://theme-next.iissnan.com/getting-started.html](http://theme-next.iissnan.com/getting-started.html)

## 系统版本
```
root@iZ23ldh8kudZ:~# cat /etc/issue
Ubuntu 16.04.2 LTS
 l
```

其他系统搭建流程类似，这里不一一演示。

## 准备工作
关于hexo和next的基本概念这里不再介绍，只说怎么安装和使用。

<!-- more -->

### 安装Git
```
root@iZ23ldh8kudZ:~# apt-get update
root@iZ23ldh8kudZ:~# apt-get install git
```

### 安装Node.js
```
root@iZ23ldh8kudZ:~# apt-get install nodejs
root@iZ23ldh8kudZ:~# apt-get install npm
```

<!-- more -->

## 安装Hexo
```
root@iZ23ldh8kudZ:~# npm install -g hexo-cli
```

发现报错, 经谷歌后，在需要安装nodejs-legacy：

```
root@iZ23ldh8kudZ:~# apt-get install nodejs-legacy
```

再次安装hexo-cli后成功！

```
root@iZ23ldh8kudZ:~# hexo -version
hexo-cli: 1.0.2
os: Linux 4.4.0-63-generic linux x64
http_parser: 2.5.0
node: 4.2.6
v8: 4.5.103.35
uv: 1.8.0
zlib: 1.2.8
ares: 1.10.1-DEV
icu: 55.1
modules: 46
openssl: 1.0.2g-fips
```

## 建站
```
root@iZ23ldh8kudZ:~# hexo init blog
root@iZ23ldh8kudZ:~# cd blog/
root@iZ23ldh8kudZ:~/blog# npm install
```

### 启动
```
root@iZ23ldh8kudZ:~/blog# hexo s
```

### 查看
在浏览器中输入localhost:4000，查看效果如下：

![hexo-01](https://kangyonggan.com/upload/hexo-01.png)

至此，hexo博客就搭建好了，接下来就是安装NexT主题并且进行各种配置了。

## 安装NexT主题
```
root@iZ23ldh8kudZ:~/blog# pwd
/root/blog
root@iZ23ldh8kudZ:~/blog# git clone https://github.com/iissnan/hexo-theme-next themes/next
```

安装成功之后，会发现主题文件夹下面多了一个`next`文件夹

```
root@iZ23ldh8kudZ:~/blog# ll themes/
total 16
drwxr-xr-x 4 root root 4096 Mar 28 17:58 ./
drwxr-xr-x 6 root root 4096 Mar 28 17:48 ../
drwxr-xr-x 6 root root 4096 Mar 28 17:26 landscape/
drwxr-xr-x 9 root root 4096 Mar 28 17:59 next/
```

### 使用next主题
编辑`站点配置文件`, 修改theme配置的值：

```
theme: next
```

重启hexo，查看界面效果：

![hexo-02](https://kangyonggan.com/upload/hexo-02.png)

> 提示：修改站点配置需要重启，修改主题文件不需要重启，如果改了没生效，请运行`hexo clean`

个人感觉这个有点丑，所以我又换了一个风格，next提供了3中风格的主题：

- Muse - 默认 Scheme，这是 NexT 最初的版本，黑白主调，大量留白
- Mist - Muse 的紧凑版本，整洁有序的单栏外观
- Pisces - 双栏 Scheme，小家碧玉似的清新

修改`主题配置文件`, 修改scheme配置的值：

```
scheme: Mist
```

重启hexo，查看界面效果：

![hexo-03](https://kangyonggan.com/upload/hexo-03.png)

个人比较喜欢这种风格的主题。

## 个性化设置
### 网站相关设置
修改`站点配置文件`， Site相关配置默认如下：

```
title: Hexo
subtitle:
description:
author: John Doe
language:
timezone:
```

经过配置后：

```
title: 东方娇子
subtitle:
description: 二逼青年欢乐多
author: 康永敢
language: zh-Hans
timezone:
```

设置`favicon`： 把favicon.ico放在`source/`目录下即可。

设置作者头像：
修改`主题配置文件`：

```
avatar: /upload/avatar.png
```

然后把你的头像(avatar.png)放在`themes/next/source/upload/`目录下，没有uploads目录的话可以自己创建一个。


重启后查看效果如下：

![hexo-04](https://kangyonggan.com/upload/hexo-04.png)

> 头像可以设置成gif动态图！

### 菜单相关设置
修改`主题配置文件`，默认菜单相关配置如下：

```

menu:
  home: /
  #categories: /categories
  #about: /about
  archives: /archives
  tags: /tags
  #sitemap: /sitemap.xml
  #commonweal: /404.html


menu_icons:
  enable: true
  #KeyMapsToMenuItemKey: NameOfTheIconFromFontAwesome
  home: home
  about: user
  categories: th
  schedule: calendar
  tags: tags
  archives: archive
  sitemap: sitemap
  commonweal: heartbeat

```

本人配置后如下：

```
menu:
  home: /
  categories: /categories
  about: /about
  archives: /archives
  tags: /tags
  sitemap: /sitemap.xml
  commonweal: /404.html


menu_icons:
  enable: true
  #KeyMapsToMenuItemKey: NameOfTheIconFromFontAwesome
  home: home
  about: user
  categories: th
  schedule: calendar
  tags: tags
  archives: archive
  sitemap: sitemap
  commonweal: heartbeat
```

图标我没换变，用的默认的，只是多显示了几个菜单而已，当然，现在的菜单是不能正常使用的，还需要再做一些操作。

效果如下:

![hexo-05](https://kangyonggan.com/upload/hexo-05.png)

现在看起来好像该有的都有了，但是点击之后会报错，比如点击“关于”菜单：

![hexo-06](https://kangyonggan.com/upload/hexo-06.png)

### 关于

发现缺少“关于”页面，下面就来添加关于页面：

```
root@iZ23ldh8kudZ:~/blog# hexo new page about
INFO  Created: ~/blog/source/about/index.md
root@iZ23ldh8kudZ:~/blog# ll source/
total 36
drwxr-xr-x 4 root root  4096 Mar 28 21:18 ./
drwxr-xr-x 6 root root  4096 Mar 28 20:24 ../
drwxr-xr-x 2 root root  4096 Mar 28 21:18 about/
-rw-r--r-- 1 root root 16958 Mar 28 20:58 favicon.ico
drwxr-xr-x 2 root root  4096 Mar 28 17:26 _posts/
```

发现在source目录下了生成一个about文件夹，about里面是一个md文件， 内容为：

```
root@iZ23ldh8kudZ:~/blog# cat source/about/index.md
---
title: about
date: 2017-03-28 21:18:40
---
```

本人编辑后内容为：


    ---
    title: 关于作者
    date: 2017-03-25 14:15:25
    comments: false
    ---

    ###
    - 姓名：康永敢
    - 性别：男
    - 职业：Java开发

    ### 联系方式
    - 手机：18221372104
    - 邮箱：kangyonggan@gmail.com
    - QQ：2825176081
    - 现住址：上海市松江区九亭镇
    - 工作地址：上海市南京西路399号明天广场21楼（华信证券）


其中`comments`表示此页面不需要评论，关于评论的问题下面会讨论。
刷新后界面如下：

![hexo-07](https://kangyonggan.com/upload/hexo-07.png)

### 404
404页面我用的是公益404，在source目录下创建404.html, 内容如下：

```
<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf-8;"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="robots" content="all" />
  <meta name="robots" content="index,follow"/>
  <link rel="stylesheet" type="text/css" href="https://qzone.qq.com/gy/404/style/404style.css">
</head>
<body>
  <script type="text/plain" src="http://www.qq.com/404/search_children.js"
          charset="utf-8" homePageUrl="/"
          homePageName="回到我的主页">
  </script>
  <script src="https://qzone.qq.com/gy/404/data.js" charset="utf-8"></script>
  <script src="https://qzone.qq.com/gy/404/page.js" charset="utf-8"></script>
</body>
</html>
```

刷新后效果如下：

![hexo-08](https://kangyonggan.com/upload/hexo-08.png)

### 标签
```
root@iZ23ldh8kudZ:~/blog# hexo new page tags
INFO  Created: ~/blog/source/tags/index.md
root@iZ23ldh8kudZ:~/blog# cat source/tags/index.md
---
title: tags
date: 2017-03-28 21:33:05
---
root@iZ23ldh8kudZ:~/blog#
```

经过我的修改后内容为：

```
---
title: 全部标签
date: 2017-03-25 14:13:35
type: tags
comments: false
---
```

刷新后看效果：

![hexo-09](https://kangyonggan.com/upload/hexo-09.png)

刷新后看不到什么效果，因为你还没有“标签”，怎么才能有标签呢？不急，下面会说的。

### 分类
```
root@iZ23ldh8kudZ:~/blog# hexo new page categories
INFO  Created: ~/blog/source/categories/index.md
root@iZ23ldh8kudZ:~/blog# cat source/categories/index.md
---
title: categories
date: 2017-03-28 21:37:42
---
root@iZ23ldh8kudZ:~/blog#
```

经过我的修改后内容为：

```
---
title: 全部分类
date: 2017-03-25 14:15:11
type: categories
comments: false
---
```

刷新后看效果：

![hexo-10](https://kangyonggan.com/upload/hexo-10.png)

刷新后看不到什么效果，原因同上。

## 文章
其他的配置现在不好说，因为没有文章！所以接下来我会先创建一些文章。

### 文章模板
在scaffolds目录下是创建新文章时的模板:

```
root@iZ23ldh8kudZ:~/blog# ll scaffolds/
total 20
drwxr-xr-x 2 root root 4096 Mar 28 17:26 ./
drwxr-xr-x 6 root root 4096 Mar 28 20:24 ../
-rw-r--r-- 1 root root   33 Mar 28 17:26 draft.md
-rw-r--r-- 1 root root   44 Mar 28 17:26 page.md
-rw-r--r-- 1 root root   50 Mar 28 17:26 post.md
```

默认使用的是post.md这个模板，你也可以在站点文件中配置其他模板：

```
default_layout: post
```

不过一般也不需要改，我是直接改的post.md，改后内容如下：

```
---
title: {{ title }}
date: {{ date }}
categories:
tags:
---
```

使用模板创建一篇文章：

```
root@iZ23ldh8kudZ:~/blog# hexo new SSH免密登录
INFO  Created: ~/blog/source/_posts/SSH免密登录.md
root@iZ23ldh8kudZ:~/blog#
```

`hexo new <title>`命令会使用默认模板创建一篇文章，文章在source/_post/文件夹下。

为了观察实际效果，我在这篇文章中添加一些真实的内容

刷新后效果如下：

![hexo-11](https://kangyonggan.com/upload/hexo-11.png)

这时候你再去查看“标签”页和“分类”页，应该就能看见有内容了。

### 分页
为了看出分页效果，我先把hexo例子中的Hello World干掉，另外把我的博客搬进_post中。
修改`站点配置文件`中的`per_page`配置，默认是10，我改为5:

```
per_page: 5
pagination_dir: page
```

效果如下：

![hexo-12](https://kangyonggan.com/upload/hexo-12.png)

## 其他
至此，博客就已经有型了，但是还得经典细琢。

### 分享
当我们看到一篇好文章时想分享给其他人看怎么办？复制url?太low了！

修改`主题配置文件`的`jiathis`:

```
jiathis: true
```

刷新文章详情页面,可以在底部看到分享按钮：

![hexo-13](https://kangyonggan.com/upload/hexo-13.png)

### 社交链接

修改`主题配置文件`的`Social`相关配置:

```
social:
  Github: https://github.com/kangyonggan/
  Book: http://kangyonggan.com:6666/

social_icons:
  enable: true
  # Icon Mappings.
  # KeyMapsToSocialItemKey: NameOfTheIconFromFontAwesome
  GitHub: github
  Twitter: twitter
  Weibo: weibo
  Book: book
```

刷新后效果如下：

![hexo-14](https://kangyonggan.com/upload/hexo-14.png)


发现进入详情界面后，自动弹出右边目录结构（如果文章有目录的时候），设置`主题配置文件`，让进入详情界面的时候不要自动弹目录结构：
修改sidebar:display的值：

```
sidebar:
  # Sidebar Position, available value: left | right
  position: left
  #position: right

  # Sidebar Display, available value:
  #  - post    expand on posts automatically. Default.
  #  - always  expand for all pages automatically
  #  - hide    expand only when click on the sidebar toggle icon.
  #  - remove  Totally remove sidebar including sidebar toggle.
  #display: post
  #display: always
  display: hide
  #display: remove

  # Sidebar offset from top menubar in pixels.
  offset: 12
  offset_float: 0

  # Back to top in sidebar
  b2t: false

  # Scroll percent label in b2t button
  scrollpercent: false

```

### 生成RSS

```
root@iZ23ldh8kudZ:~/blog# npm install hexo-generator-feed --save
```

修改`主题配置文件`的rss配置，如下：

```
rss:

feed:
  type: atom
  path: atom.xml
  limit: 20
  hub:
  content:
```

rss配置没变，feed相关的为新增的, 刷新后就可以在sidebar中看见rss链接了。

![hexo-15](https://kangyonggan.com/upload/hexo-15.png)

可以使用`rss阅读器`订阅这个rss地址的文章。

### 打赏
修改`主题配置文件`中的`alipay`的值(如果没有alipay就新增):

```
alipay: /upload/ipay.png
```

然后把支付宝的收款二维码放到`themes/next/source/upload/`目录下。

文章详情界面的效果如图：

![hexo-16](https://kangyonggan.com/upload/hexo-16.png)

### 代码高亮风格
修改`主题配置文件`的`highlight_theme`的值:

```
highlight_theme: night
```

### 站点地图
```
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
```

修改`站点配置文件`，在最后添加(可以不加，因为有缺省值)：

```
sitemap:
  path: sitemap.xml
baidusitemap:
  path: baidusitemap.xml
```

重启后访问`http://localhost:4000/sitemap.xml`，就可以看到内容了。

![hexo-18](https://kangyonggan.com/upload/hexo-18.png)

但是连接地址是错的，所以我们需要在`站点配置文件`中修改：


```
url: http://kangyonggan.com
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:
```

下面是提交`站点地图`到百度站长工具中的过程, 不搞SEO的可以略过

![hexo-17](https://kangyonggan.com/upload/hexo-17.png)

### 百度统计
在[http://tongji.baidu.com/](http://tongji.baidu.com/)注册账号，并创建应用，然后在“代码获取”界面获取`baidu_analytics`，如下图：

![hexo-19](https://kangyonggan.com/upload/hexo-19.png)

修改`主题配置文件`的`baidu_analytics`的值：

```
baidu_analytics: 9a7a48ed52f9726****8a0955ae72adf
```

为了个人id不被盗用，我隐藏了四位。一段时间之后查看访问量：

![hexo-20](https://kangyonggan.com/upload/hexo-20.png)


### 评论
之前的hexo用户使用`多说`评论插件的比较多，但是现在多说即将关闭，新用户已经不能使用了，所有我使用`畅言`。

注册畅言[http://changyan.kuaizhan.com/](http://changyan.kuaizhan.com/)并创建站点，获取`APP ID`和`APP KEY`。

![hexo-21](https://kangyonggan.com/upload/hexo-21.png)

把这两个的值写入`主题配置文件`:

```
changyan:
  enable: true
  appid: cy****H1C
  appkey: 5bc9ff33a197******b38cc87994bf4f
  count: true
```

效果如下：

![hexo-22](https://kangyonggan.com/upload/hexo-22.png)

我这里的评论框是黑色的，你可以在“畅言”网站上修改评论框的样式。

### 站内搜索
这是个很好用的功能，就是反应有点慢。修改`主题配置文件`的`local_search`的值：

```
local_search:
  enable: true
```

修改这个配置可以在界面上看到“搜索”按钮。但点击无效。

修改`站点配置文件`，在最后新增：

```
search:
  path: search.xml
  field: post
  format: html
  limit: 10000
```

安装搜索插件：

```
npm install hexo-generator-search --save
```

重启后搜索效果如下：

![hexo-23](https://kangyonggan.com/upload/hexo-23.png)

## hexo常用命令
### 清除
```
hexo clean
```

### 生成站点
```
hexo gengrate
```

可以简写为`hexo g`

### 本地启动
```
hexo server
```

可以简写为`hexo s`

还可以带参数，比如`hexo s --debug`会在命令窗口打印日志以供调试。

### 发布
```
hexo deploy
```

简写为`hexo d`

需要在`站点配置文件`中配置`deploy`相关参数：

```
deploy:
  type: git
  repo: https://github.com/kangyonggan/kangyonggan.github.io.git
```

此外还需要安装deploy相关插件，并且配置git全局用户相关变量，不然没权限推送到github上。

如果没云空间的可以在deploy到github上托管，但github最近比较慢，所以我是放在云服务器上的。



', 0, '2017-04-11 12:13:16', '2017-06-09 08:09:56');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('把网站从http免费升级到https', 'other', '综合', '## 申请免费SSL
打开[https://zerossl.com/](https://zerossl.com/), 点击【ONLINE TOOLS】

![https](https://kangyonggan.com/upload/https01.png)

点击【START】开始申请证书

<!-- more -->

![https](https://kangyonggan.com/upload/https02.png)

填写【邮箱】、【域名】、勾选【HTTP verification】、【Accept ZeroSSL TOS】和【Accept Let''s Encrypt SA (pdf)】, 填写完成后点击【NEXT】

![https](https://kangyonggan.com/upload/https03.png)

此时会询问你是否也包含www前缀的域名，建议第一次玩的时候选择No，因为这样后面的校验是相对容易一些，等玩会了之后再选择Yes，我这里选择的是【Yes】。

![https](https://kangyonggan.com/upload/https04.png)

点击【下载】，然后点击【NEXT】。

![https](https://kangyonggan.com/upload/https05.png)

点击【下载】，然后点击【NEXT】。

![https](https://kangyonggan.com/upload/https06.png)

然后进入域名校验界面。

![https](https://kangyonggan.com/upload/https07.png)

这时候你需要在你的项目中放置两个文件，以供校验：  
1. 文件路径为：http://kangyonggan.com/.well-known/acme-challenge/WxvjNvXfff_DGNzHeGhi6rDqMVjJQlcatSvO_1SdemE
2. 文件内容为：WxvjNvXfff_DGNzHeGhi6rDqMVjJQlcatSvO_1SdemE.m4z6_KmV_JPWzx3GFVoB9p-ytleQL5vLVuNZItQ2dik

同理，再创建另外一个文件：  
1. 文件路径为：http://www.kangyonggan.com/.well-known/acme-challenge/wpyYcbGItz-rmHKNFPrjrSnVy3vQ4cFC3fuRGvYF1l8
2. 文件内容为：wpyYcbGItz-rmHKNFPrjrSnVy3vQ4cFC3fuRGvYF1l8.m4z6_KmV_JPWzx3GFVoB9p-ytleQL5vLVuNZItQ2dik

需要注意的是：这两个文件的地址，一个有www，一个没有www，如果你前面没有包含www前缀的域名，你就只需要提供一个文件只可。

下面是我提供的文件：

![https](https://kangyonggan.com/upload/https08.png)

![https](https://kangyonggan.com/upload/https09.png)

把项目发布之后访问以下上面的两个地址，看看能不能访问通, 如果访问的通，点击【NEXT】

![https](https://kangyonggan.com/upload/https10.png)

如果校验没过，别放弃，多点几次，我就是在点了2次才通过的：

![https](https://kangyonggan.com/upload/https11.png)

在这一步一定一定不能忘了下载这两个文件，因为后面配置服务器的时候回用到这两个文件，最后点击【DONE NEXT】结束。

但是这个证书有效期是90天，90天之后需要再次申请，过程和这次一样。

## 使用Nginx配置SSL
把下载的两个文件重命名为domain.crt和domain.key,然后配置nginx：

```
server {
	server_name kangyonggan.com;
    listen 443;
    ssl on;
    ssl_certificate /root/ssl/domain.crt;
    ssl_certificate_key /root/ssl/domain.key;
	
	location / {
		proxy_pass http://localhost:8080;
	}

	# 设定访问静态文件直接读取不经过tomcat
	location ^~ /static/ {
			proxy_pass http://localhost:8080;
			root /WEB-INF/static/;
	}
}
```

重新加载nginx的配置：

```
nginx -s reload
```

访问https://kangyonggan.com和https://www.kangyonggan.com

![https](https://kangyonggan.com/upload/https12.png)

![https](https://kangyonggan.com/upload/https13.png)

虽然可以访问https了，但是原本的http仍然可以访问，所以还需要再配置。

## http重定向到https
把原本80端口的server配置：

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        server_name _;

        location / {
                proxy_pass http://localhost:8080;
        }
}
```

改为：

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        server_name _;

        location / {
                # proxy_pass http://localhost:8080;
                return 301 https://kangyonggan.com$request_uri;
        }
}
```

再次访问http的网站，就会被重定向到https了。










', 0, '2017-04-16 11:23:16', '2017-07-20 03:12:17');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用SSH内网穿透加Nginx反向代理之后获取真实IP', 'java', 'Java后台', '
![nginx](https://kangyonggan.com/upload/nginx-ssh.png)

## 配置Nginx
```
location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        # try_files $uri $uri/ =404;
        proxy_pass http://localhost:8080;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
}
```

<!-- more -->

重新加载Nginx配置:

```
nginx -s reload
```

## JAVA获取IP
```
String ip = request.getHeader("X-Real-IP");
```

', 0, '2017-04-19 05:44:52', '2017-08-16 07:50:19');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('修改Linux系统的系统时间', 'other', '综合', '
## 需求缘由
最近我在一台PC电脑上装了Ubuntu系统，然后把项目跑了起来，一直没去关注系统时间，今天却发现系统时间比“现在”要快12个小时，所以我需要把系统时间改正过来。

## 使用date命令
```
sudo date -s "2017-04-20 09:27:07"
```

改了之后再使用date命令查询时间，发现成功了，但是，大概几分钟之后又恢复成之前的错误时间了。

## 使用hwclock命令
```
sudo hwclock --set --date="04/20/17 09:24"
```

还是同样的问题，几分钟后就恢复了。

<!-- more -->

## 改时区	

```
sudo cp /usr/share/zoneinfo/Asia/Shanghai ./localtime
```

亲测这个是ok的，即使重启也不会恢复成错的时间。', 0, '2017-04-20 02:18:24', '2017-07-28 09:40:28');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用Log4j2的Rewrite过滤敏感信息', 'java', 'Java后台', '最近由于种种原因需要把项目的Log4j升级到Log4j2,其中遇到一个问题：  
怎么给日志脱敏？

## 摸索过程
查看官方文档[https://logging.apache.org/log4j/2.0/manual/appenders.html#RewriteAppender](https://logging.apache.org/log4j/2.0/manual/appenders.html#RewriteAppender)，官方文档中虽然有所介绍，但是没给demo，百度谷歌都很难查到此类文章，所有配置起来有一定难度。  

<!-- more -->

### pom.xml的配置
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.kangyonggan.demo</groupId>
    <artifactId>log4j2-rewrite</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <log4j2.api.version>2.8.2</log4j2.api.version>
    </properties>

    <dependencies>
        <!--Log4j2-->
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-api</artifactId>
            <version>${log4j2.api.version}</version>
        </dependency>
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-core</artifactId>
            <version>${log4j2.api.version}</version>
        </dependency>
    </dependencies>

</project>
```

### log4j2.xml的配置
```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="warn">
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"/>
        </Console>

        <Rewrite name="Rewrite">
            <MyRewritePolicy/>
            <AppenderRef ref="Console"/>
        </Rewrite>
    </Appenders>

    <Loggers>
        <Root level="info">
            <AppenderRef ref="Rewrite"/>
        </Root>
    </Loggers>
</Configuration>
```

其中MyRewritePolicy是我自定义的，它实现了RewritePolicy接口，同时需要实现一个方法public LogEvent rewrite(final LogEvent event)  

### MyRewritePolicy.java的实现
```
package com.kangyonggan.demo;

import org.apache.logging.log4j.core.LogEvent;
import org.apache.logging.log4j.core.appender.rewrite.RewritePolicy;
import org.apache.logging.log4j.core.impl.Log4jLogEvent;
import org.apache.logging.log4j.message.SimpleMessage;

/**
 * @author kangyonggan
 * @since 2017/4/24 0024
 */
public final class MyRewritePolicy implements RewritePolicy {

    @Override
    public LogEvent rewrite(final LogEvent event) {
        String message = event.getMessage().getFormattedMessage();
        // 处理日志的逻辑
        message = "处理后的日志: " + message;

        SimpleMessage simpleMessage = new SimpleMessage(message);
        LogEvent result = new Log4jLogEvent(event.getLoggerName(), event.getMarker(),
                event.getLoggerFqcn(), event.getLevel(), simpleMessage,
                event.getThrown(), event.getContextMap(), event.getContextStack(),
                event.getThreadName(), event.getSource(), event.getTimeMillis());

        return result;
    }
}

```

### 小测一下
```
package com.kangyonggan.demo;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @author kangyonggan
 * @since 2017/4/24 0024
 */
public class Test {

    private static Logger logger = LogManager.getLogger(Test.class);

    public static void main(String[] args) {
        logger.info("手机号:{}", "15121149571");
    }

}

```

运行后报错：

```
2017-04-24 23:35:04,827 main ERROR Unable to invoke factory method in class class com.kangyonggan.demo.MyRewritePolicy for element MyRewritePolicy. java.lang.IllegalStateException: No factory method found for class com.kangyonggan.demo.MyRewritePolicy
	at org.apache.logging.log4j.core.config.plugins.util.PluginBuilder.findFactoryMethod(PluginBuilder.java:224)
	at org.apache.logging.log4j.core.config.plugins.util.PluginBuilder.build(PluginBuilder.java:130)
	at org.apache.logging.log4j.core.config.AbstractConfiguration.createPluginObject(AbstractConfiguration.java:952)
	at org.apache.logging.log4j.core.config.AbstractConfiguration.createConfiguration(AbstractConfiguration.java:892)
	at org.apache.logging.log4j.core.config.AbstractConfiguration.createConfiguration(AbstractConfiguration.java:884)
	at org.apache.logging.log4j.core.config.AbstractConfiguration.createConfiguration(AbstractConfiguration.java:884)
	at org.apache.logging.log4j.core.config.AbstractConfiguration.doConfigure(AbstractConfiguration.java:508)
	at org.apache.logging.log4j.core.config.AbstractConfiguration.initialize(AbstractConfiguration.java:232)
	at org.apache.logging.log4j.core.config.AbstractConfiguration.start(AbstractConfiguration.java:244)
	at org.apache.logging.log4j.core.LoggerContext.setConfiguration(LoggerContext.java:545)
	at org.apache.logging.log4j.core.LoggerContext.reconfigure(LoggerContext.java:617)
	at org.apache.logging.log4j.core.LoggerContext.reconfigure(LoggerContext.java:634)
	at org.apache.logging.log4j.core.LoggerContext.start(LoggerContext.java:229)
	at org.apache.logging.log4j.core.impl.Log4jContextFactory.getContext(Log4jContextFactory.java:152)
	at org.apache.logging.log4j.core.impl.Log4jContextFactory.getContext(Log4jContextFactory.java:45)
	at org.apache.logging.log4j.LogManager.getContext(LogManager.java:194)
	at org.apache.logging.log4j.LogManager.getLogger(LogManager.java:551)
	at com.kangyonggan.demo.Test.<clinit>(Test.java:12)

[INFO ] 2017-04-24 23:35:04.884 [com.kangyonggan.demo.Test.main:15] - 手机号:15121149571
```

从报错信息中可以看出：没有工厂方法（No factory method found）。  
还提到了org.apache.logging.log4j.core.config.plugins这个包下面的插件。  
所以去这个包下面看一下相关的插件：  

![plugin](https://kangyonggan.com/upload/log4j2-rewrite-01.png)

果然看到了factory相关的plugin，并且PluginFactory是作用在method上的。

### 使用@PluginFactory注解

```
package com.kangyonggan.demo;

import org.apache.logging.log4j.core.LogEvent;
import org.apache.logging.log4j.core.appender.rewrite.RewritePolicy;
import org.apache.logging.log4j.core.config.plugins.PluginFactory;
import org.apache.logging.log4j.core.impl.Log4jLogEvent;
import org.apache.logging.log4j.message.SimpleMessage;

/**
 * @author kangyonggan
 * @since 2017/4/24 0024
 */
public final class MyRewritePolicy implements RewritePolicy {

    public LogEvent rewrite(final LogEvent event) {
        String message = event.getMessage().getFormattedMessage();
        // 处理日志的逻辑
        message = "处理后的日志: " + message;

        SimpleMessage simpleMessage = new SimpleMessage(message);
        LogEvent result = new Log4jLogEvent(event.getLoggerName(), event.getMarker(),
                event.getLoggerFqcn(), event.getLevel(), simpleMessage,
                event.getThrown(), event.getContextMap(), event.getContextStack(),
                event.getThreadName(), event.getSource(), event.getTimeMillis());

        return result;
    }

    @PluginFactory
    public static void factory() {
        System.out.println("factory");
    }
}

```

这次运行后没有报错了，也打印了“factory”，但是rewrite方法没被执行。

仔细一想，这既然是工厂方法，一定是为了创建对象的，所以再次修改如下。

### PluginFactory返回自定义的实例
```
package com.kangyonggan.demo;

import org.apache.logging.log4j.core.LogEvent;
import org.apache.logging.log4j.core.appender.rewrite.RewritePolicy;
import org.apache.logging.log4j.core.config.plugins.PluginFactory;
import org.apache.logging.log4j.core.impl.Log4jLogEvent;
import org.apache.logging.log4j.message.SimpleMessage;

/**
 * @author kangyonggan
 * @since 2017/4/24 0024
 */
public final class MyRewritePolicy implements RewritePolicy {

    public LogEvent rewrite(final LogEvent event) {
        String message = event.getMessage().getFormattedMessage();
        // 处理日志的逻辑
        message = "处理后的日志: " + message;

        SimpleMessage simpleMessage = new SimpleMessage(message);
        LogEvent result = new Log4jLogEvent(event.getLoggerName(), event.getMarker(),
                event.getLoggerFqcn(), event.getLevel(), simpleMessage,
                event.getThrown(), event.getContextMap(), event.getContextStack(),
                event.getThreadName(), event.getSource(), event.getTimeMillis());

        return result;
    }

    @PluginFactory
    public static MyRewritePolicy factory() {
        System.out.println("factory");
        return new MyRewritePolicy();
    }
}
```

在此运行后发现成功了！

### 完整log4j2.xml的配置
```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN" monitorInterval="300">
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"/>
        </Console>
        <RollingRandomAccessFile name="AllFile" fileName="${dfjz.log4j2.home}/all.log"
                                 filePattern="${dfjz.log4j2.home}/all-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"/>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"/>
                <SizeBasedTriggeringPolicy size="500 MB"/>
            </Policies>
            <DefaultRolloverStrategy max="30"/>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"/>
                <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"/>
            </Filters>
        </RollingRandomAccessFile>
        <RollingRandomAccessFile name="ErrorFile" fileName="${dfjz.log4j2.home}/error.log"
                                 filePattern="${dfjz.log4j2.home}/error-%d{yyyy-MM-dd}-%i.log">
            <PatternLayout pattern="[%-5level] %d{yyyy-MM-dd HH:mm:ss.SSS} [%logger{36}.%t:%L] - %msg%n"/>
            <Policies>
                <TimeBasedTriggeringPolicy interval="1"/>
                <SizeBasedTriggeringPolicy size="500 MB"/>
            </Policies>
            <DefaultRolloverStrategy max="30"/>
            <Filters>
                <ThresholdFilter level="fatal" onMatch="DENY" onMismatch="NEUTRAL"/>
                <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"/>
            </Filters>
        </RollingRandomAccessFile>

        <SMTP name="Mail" subject="${dfjz.app.name} - 报警通知" to="${dfjz.mail.receiver}" from="${dfjz.mail.username}"
              smtpHost="${dfjz.mail.host}" smtpUsername="${dfjz.mail.username}" smtpPassword="${dfjz.mail.password}" bufferSize="${dfjz.mail.bufferSize}" >
        </SMTP>
        <Async name="AsyncAll">
            <AppenderRef ref="AllFile"/>
        </Async>
        <Async name="AsyncError">
            <AppenderRef ref="ErrorFile"/>
            <AppenderRef ref="Mail" />
        </Async>

        <Rewrite name="Rewrite">
            <MyRewritePolicy/>
            <AppenderRef ref="Console"/>
            <AppenderRef ref="AsyncAll"/>
            <AppenderRef ref="AsyncError"/>
        </Rewrite>
    </Appenders>
    <Loggers>
        <Root level="debug" additivity="true">
            <AppenderRef ref="Rewrite"/>
        </Root>
    </Loggers>
</Configuration>
```

用以上配置就已经可以解决我们项目中的所有需求了，不对，还漏了一个，就是普通日志只打印info级别的，sql需要打印debug级别的。

### 打印debug级别的SQL
请参考我的另一篇文章[使用Log4j2让项目输出info级别的日志和debug级别的sql](https://kangyonggan.com/#article/41)
> 觉得不错就赏点吧，你的支持是我进步的动力！








', 0, '2017-04-24 15:51:12', '2017-06-26 08:21:23');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('JDBC连接MySQL数据库的代码片段', 'code', '代码片段', '```
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author kangyonggan
 * @since 4/25/17
 */
public class ExcelParse605 {

    private static String url = "jdbc:mysql://127.0.0.1:3306/dfjz?useUnicode=true&characterEncoding=UTF-8";
    private static String username = "root";
    private static String password = "123456";

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            ps = conn.prepareStatement("SELECT bnk_resp_co FROM be_resp WHERE bnk_no = ''605''");
            rs = ps.executeQuery();
            while (rs.next()) {
                String bnkRespCo = rs.getString("bnk_resp_co");
                System.out.println(bnkRespCo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
```', 0, '2017-04-25 02:28:02', '2017-07-28 08:56:31');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('配置dubbo多注册中心', 'java', 'Java后台', '参考dubbo官方文档[http://dubbo.io/User+Guide-zh.htm#UserGuide-zh-%E5%A4%9A%E6%B3%A8%E5%86%8C%E4%B8%AD%E5%BF%83](http://dubbo.io/User+Guide-zh.htm#UserGuide-zh-%E5%A4%9A%E6%B3%A8%E5%86%8C%E4%B8%AD%E5%BF%83)

## consumer.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:dubbo="http://code.alibabatech.com/schema/dubbo"
       xsi:schemaLocation="http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd
       http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
       http://code.alibabatech.com/schema/dubbo http://code.alibabatech.com/schema/dubbo/dubbo.xsd">

    <context:annotation-config/>
    <dubbo:application name="ENGINE_HELPER"/>

    <dubbo:registry id="dev_address" address="zookeeper://10.199.101.211:8080?backup=10.199.101.212:2181,10.199.101.213:2181"/>
    <dubbo:registry id="uat_address" address="zookeeper://10.199.105.204:2181?backup=10.199.105.203:2181,10.199.105.202:2181" default="false"/>

    <dubbo:reference id="bankEngineServiceDev" cluster="failfast"
                     interface="com.shhxzq.fin.bankengine.service.BankEngineService"
                     lazy="true" version="1.2.0" check="false" timeout="100000" registry="dev_address"/>

    <dubbo:reference id="bankEngineServiceUat" cluster="failfast"
                     interface="com.shhxzq.fin.bankengine.service.BankEngineService"
                     lazy="true" version="1.2.0" check="false" timeout="100000" registry="uat_address"/>

</beans>
```



', 0, '2017-04-28 03:21:46', '2017-07-14 06:05:00');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用Spring配置多数据源', 'java', 'Java后台', '今天在做一个小功能的时候，遇到了这样一个问题，根据交易流水号查询dev环境的交易记录或uat环境的交易记录。那么久需要配置多数据源了，所以就捣鼓了一下，记录一下。

<!-- more -->

## 两个dataSources
```
    <!-- 配置dbcp数据源 - dev -->
    <bean id="dataSourceDev" class="com.alibaba.druid.pool.DruidDataSource"
          destroy-method="close">
        <property name="driverClassName" value="${ehelper.jdbc.driver}"/>
        <property name="url" value="${ehelper.jdbc.url.dev}"/>
        <property name="username" value="${ehelper.jdbc.username.dev}"/>
        <property name="password" value="${ehelper.jdbc.password.dev}"/>

        <!-- 配置初始化大小、最小、最大 -->
        <property name="initialSize" value="5"/>
        <property name="minIdle" value="5"/>
        <property name="maxActive" value="100"/>

        <!-- 配置获取连接等待超时的时间 -->
        <property name="maxWait" value="60000" />

        <!-- 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒 -->
        <property name="timeBetweenEvictionRunsMillis" value="60000" />

        <!-- 配置一个连接在池中最小生存的时间，单位是毫秒 -->
        <property name="minEvictableIdleTimeMillis" value="300000" />

        <property name="validationQuery" value="SELECT ''x''" />
        <property name="testWhileIdle" value="true" />
        <property name="testOnBorrow" value="false" />
        <property name="testOnReturn" value="false" />

        <!-- 打开PSCache，并且指定每个连接上PSCache的大小 -->
        <property name="poolPreparedStatements" value="true" />
        <property name="maxPoolPreparedStatementPerConnectionSize" value="20" />

        <!-- 关闭长时间不使用的连接 -->
        <property name="removeAbandoned" value="true" /> <!-- 打开removeAbandoned功能 -->
        <property name="removeAbandonedTimeout" value="1200" /> <!-- 1200秒，也就是20分钟 -->
        <property name="logAbandoned" value="true" /> <!-- 关闭abanded连接时输出错误日志 -->
    </bean>

    <!-- 配置dbcp数据源 - uat -->
    <bean id="dataSourceUat" class="com.alibaba.druid.pool.DruidDataSource"
          destroy-method="close">
        <property name="driverClassName" value="${ehelper.jdbc.driver}"/>
        <property name="url" value="${ehelper.jdbc.url.uat}"/>
        <property name="username" value="${ehelper.jdbc.username.uat}"/>
        <property name="password" value="${ehelper.jdbc.password.uat}"/>

        <!-- 配置初始化大小、最小、最大 -->
        <property name="initialSize" value="5"/>
        <property name="minIdle" value="5"/>
        <property name="maxActive" value="100"/>

        <!-- 配置获取连接等待超时的时间 -->
        <property name="maxWait" value="60000" />

        <!-- 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒 -->
        <property name="timeBetweenEvictionRunsMillis" value="60000" />

        <!-- 配置一个连接在池中最小生存的时间，单位是毫秒 -->
        <property name="minEvictableIdleTimeMillis" value="300000" />

        <property name="validationQuery" value="SELECT ''x''" />
        <property name="testWhileIdle" value="true" />
        <property name="testOnBorrow" value="false" />
        <property name="testOnReturn" value="false" />

        <!-- 打开PSCache，并且指定每个连接上PSCache的大小 -->
        <property name="poolPreparedStatements" value="true" />
        <property name="maxPoolPreparedStatementPerConnectionSize" value="20" />

        <!-- 关闭长时间不使用的连接 -->
        <property name="removeAbandoned" value="true" /> <!-- 打开removeAbandoned功能 -->
        <property name="removeAbandonedTimeout" value="1200" /> <!-- 1200秒，也就是20分钟 -->
        <property name="logAbandoned" value="true" /> <!-- 关闭abanded连接时输出错误日志 -->
    </bean>
```

## MultiDataSource
需要自己实现数据源路由， 继承AbstractRoutingDataSource，覆写determineCurrentLookupKey方法即可。

```
package com.shhxzq.fin.ehelper.biz.util;

import com.shhxzq.fin.ehelper.model.constants.DataSource;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 多数据源
 *
 * @author kangyonggan
 * @since 4/28/17
 */
public class MultiDataSource extends AbstractRoutingDataSource {

    private static final ThreadLocal<String> dataSourceKey = new InheritableThreadLocal();

    public static void setDataSource(DataSource dataSource) {
        dataSourceKey.set(dataSource.name());
    }

    @Override
    protected Object determineCurrentLookupKey() {
        return dataSourceKey.get();
    }
}
```

其中DataSource是个枚举：

```
package com.shhxzq.fin.ehelper.model.constants;

/**
 * @author kangyonggan
 * @since 4/28/17
 */
public enum DataSource {
    DEV, UAT;

    public static DataSource getDataSource(String name) {
        for (DataSource dataSource : DataSource.values()) {
            if (dataSource.name().equalsIgnoreCase(name)) {
                return dataSource;
            }
        }

        return DataSource.DEV;
    }
}

```

## sqlSessionFactory
```
<!-- 创建SqlSessionFactory，同时指定数据源 -->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="multiDataSource"/>
    <property name="configLocation" value="classpath:mybatis.xml"></property>
    <property name="mapperLocations" value="classpath:mapper/*.xml"></property>
    <property name="typeAliasesPackage" value="com.shhxzq.fin.ehelper.model.vo"/>
    <property name="plugins">
        <array>
            <bean class="com.github.pagehelper.PageHelper">
                <property name="properties">
                    <value>
                        dialect=mysql
                    </value>
                </property>
            </bean>
        </array>
    </property>
</bean>
```

## sqlSession
```
<!-- 配置SQLSession模板 -->
<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate" scope="prototype">
    <constructor-arg index="0" ref="sqlSessionFactory"/>
</bean>
```

## transactionManager
```
<!-- 使用JDBC事务 -->
<bean id="transactionManager"
      class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSource" ref="multiDataSource"/>
</bean>
```

## transactionAdvice
```
<!-- AOP配置事物 -->
<tx:advice id="transactionAdvice" transaction-manager="transactionManager">
    <tx:attributes>
        <tx:method name="delete*" propagation="REQUIRED"/>
        <tx:method name="update*" propagation="REQUIRED"/>
        <tx:method name="save*" propagation="REQUIRED"/>
        <tx:method name="remove*" propagation="REQUIRED"/>
        <tx:method name="send*" propagation="REQUIRED"/>

        <tx:method name="search*" read-only="true" propagation="REQUIRED"/>
        <tx:method name="find*" read-only="true" propagation="REQUIRED"/>
        <tx:method name="get*" read-only="true" propagation="REQUIRED"/>
        <tx:method name="*" read-only="true" propagation="REQUIRED"/>
    </tx:attributes>
</tx:advice>
```

## transactionPointcut
```
<!-- 配置AOP切面 -->
<aop:config>
    <!--切点，用于事务-->
    <aop:pointcut id="transactionPointcut"
                  expression="execution(* com.shhxzq.fin.ehelper.biz.service.impl.transaction..*.*(..))"/>

    <!--事物切面-->
    <aop:advisor pointcut-ref="transactionPointcut" advice-ref="transactionAdvice"/>
</aop:config>
```

## 方案一
原本我是想在spring初始化bean的时候就指定数据源，这样的话事务就不会和数据源打架，我想到的方案是，给不同的包指定不同的数据源，但是这样会带来一个问题，就是会冗余代码。

比如dev环境和uat环境的service分别放在dev和uat包下，再分别给dev包河uat包指定dev的数据源和uat的数据源。

引发的问题：dev和uat业务逻辑一样，仅数据源不一样，但是却有两份代码！冗余还是小事，以后维护才是大事，所以此方案果断排除。

## 方案二
在调用方法的时候传入一个参数，指定调用哪个数据源，这样代码就没冗余的地方了，但是会带来一个问题。

就是需要修改老代码，在参数中增加一个参数，然后在方法中指定数据源，在方法中指定数据源可以使用注解和切面完成，但不可避面的还是要增加一个参数。

如果不增加一个参数，而是在注解中加参数呢？我也这么想过，但是这样的话，这个方法就只能使用固定的数据源了，达不到动态的效果。

进一步分析，如果在注解中加参数，另外再多写一个方法指定为另一个数据源呢？显然是不可取的，方法冗余，维护困难，如果再次增加数据源还得再加一个方法。

所以，最后我还是选择了使用【传参+注解】的方案，没办法，要想动态切换数据源，你总的告诉方法你要用哪个数据源吧，怎么告诉他？传参是最好途径了，并且扩展性强。下面是我具体实现代码。

## DataSourceSwitch
```
package com.shhxzq.fin.ehelper.model.annotation;

import java.lang.annotation.*;

/**
 * 在方法上加此注解，会使用第一个参数即DataSource枚举切换数据源
 *
 * @author kangyonggan
 * @since 2016/12/8
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface DataSourceSwitch {

}
```

## DataSourceAop
```
package com.shhxzq.fin.ehelper.biz.aop;

import com.shhxzq.fin.ehelper.biz.util.MultiDataSource;
import com.shhxzq.fin.ehelper.model.annotation.DataSourceSwitch;
import com.shhxzq.fin.ehelper.model.constants.DataSource;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * @author kangyonggan
 * @since 4/28/17
 */
@Log4j2
@Component
@Aspect
public class DataSourceAop {

    @Pointcut("execution(* com.shhxzq.fin.ehelper.biz.service.impl..*.*(..))")
    public void pointcut() {
    }

    /**
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Around("pointcut()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        Object args[] = joinPoint.getArgs();
        Class clazz = joinPoint.getTarget().getClass();

        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = clazz.getMethod(methodSignature.getName(), methodSignature.getParameterTypes());

        DataSourceSwitch dataSourceSwitch = method.getAnnotation(DataSourceSwitch.class);
        if (dataSourceSwitch != null) {
            log.info("使用指定的数据源.");
            if (args.length > 0) {
                Object obj = args[0];
                if (obj instanceof DataSource) {
                    DataSource dataSource = (DataSource) obj;
                    MultiDataSource.setDataSource(dataSource);
                    log.info("数据源：{}", dataSource.name());
                } else {
                    log.info("第一个参数不是DataSource枚举，所以仍然使用默认数据源.");
                }
            } else {
                log.info("第一个参数不是DataSource枚举，所以仍然使用默认数据源.");
            }
        } else {
            log.info("使用默认数据源.");
        }


        return joinPoint.proceed(args);
    }
}
```

## BeCommandServiceImpl
```
package com.shhxzq.fin.ehelper.biz.service.impl;

import com.shhxzq.fin.ehelper.biz.service.BeCommandService;
import com.shhxzq.fin.ehelper.model.annotation.DataSourceSwitch;
import com.shhxzq.fin.ehelper.model.annotation.LogTime;
import com.shhxzq.fin.ehelper.model.constants.DataSource;
import com.shhxzq.fin.ehelper.model.vo.BeCommand;
import org.springframework.stereotype.Service;

/**
 * @author kangyonggan
 * @since 4/28/17
 */
@Service
public class BeCommandServiceImpl extends BaseService<BeCommand> implements BeCommandService {

    @Override
    @LogTime
    @DataSourceSwitch
    public BeCommand findBeCommandBySerialNo(DataSource dataSource, String serialNo) {
        BeCommand beCommand = new BeCommand();
        beCommand.setSerialNo(serialNo);

        return super.selectOne(beCommand);
    }
}
```

## 问题
另外我还遇到了一个问题，那就是事务和多数据源打架了，我的解决方案是把它们两个分开。但也不是太好，先这样吧，以后再研究。



', 0, '2017-04-28 03:57:21', '2017-07-22 00:31:27');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('pegdown包和asm冲突', 'java', 'Java后台', '今天学充电过程中无意发现一个冲突，原本我的项目中是引入了pegdown包的，后来又想引入asm包，却发现类型转换错误：

org.objectweb.asm.ClassAdapter cannot be converted to org.objectweb.asm.ClassVisitor

可是ClassAdapter已经实现了ClassVisitor接口，并且我在一个干净的demo中是没报错的，所以我有理由怀疑是jar包冲突了。

```
<dependency>
    <groupId>org.pegdown</groupId>
    <artifactId>pegdown</artifactId>
    <version>1.6.0</version>
</dependency>
```

```
<dependency>
    <groupId>asm</groupId>
    <artifactId>asm</artifactId>
    <version>3.3.1</version>
</dependency>
```', 0, '2017-05-19 02:33:58', '2017-07-17 05:45:46');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('设计模式 - 概述', 'pattern', '设计模式', '## 为何需要模式
模式是做事的方法，是实现目标，研磨技术的方法。开发人员通常在编写一段时间的代码之后才会考虑设计。或许我们已经注意到，有些人写的代码简介而实用，那么怎么才能让代码更简洁更优雅呢？那就是使用设计模式！模式是思想的提现，而非具体的实现。

## 模式的分类
根据设计模式的参考书 Design Patterns - Elements of Reusable Object-Oriented Software（中文译名：设计模式 - 可复用的面向对象软件元素） 中所提到的，总共有 23 种设计模式。这些模式可以分为三大类：创建型模式（Creational Patterns）、结构型模式（Structural Patterns）、行为型模式（Behavioral Patterns）。当然，我们还会讨论另一类设计模式：J2EE 设计模式。
<!-- more -->

<table>
<thead>
<tr>
<th width="16%">模式</th>
<th width="33%">描述</th>
<th>包括</th></tr>
</thead>
<tbody>
<tr>
<td>创建型模式</td>
<td>这些设计模式提供了一种在创建对象的同时隐藏创建逻辑的方式，而不是使用新的运算符直接实例化对象。这使得程序在判断针对某个给定实例需要创建哪些对象时更加灵活。</td>
<td>
工厂模式（Factory Pattern）<br/>
抽象工厂模式（Abstract Factory Pattern）<br/>
单例模式（Singleton Pattern）<br/>
建造者模式（Builder Pattern）<br/>
原型模式（Prototype Pattern）
</td>
</tr>
<tr>
<td>结构型模式</td>
<td>这些设计模式关注类和对象的组合。继承的概念被用来组合接口和定义组合对象获得新功能的方式。</td>
<td>
适配器模式（Adapter Pattern）<br/>
桥接模式（Bridge Pattern）<br/>
过滤器模式（Filter、Criteria Pattern）<br/>
组合模式（Composite Pattern）<br/>
装饰器模式（Decorator Pattern）<br/>
外观模式（Facade Pattern）<br/>
享元模式（Flyweight Pattern）<br/>
代理模式（Proxy Pattern）
</td>
</tr>
<tr>
<td>行为型模式</td>
<td>这些设计模式特别关注对象之间的通信。</td>
<td>
责任链模式（Chain of Responsibility Pattern）<br/>
命令模式（Command Pattern）<br/>
解释器模式（Interpreter Pattern）<br/>
迭代器模式（Iterator Pattern）<br/>
中介者模式（Mediator Pattern）<br/>
备忘录模式（Memento Pattern）<br/>
观察者模式（Observer Pattern）<br/>
状态模式（State Pattern）<br/>
空对象模式（Null Object Pattern）<br/>
策略模式（Strategy Pattern）<br/>
模板模式（Template Pattern）<br/>
访问者模式（Visitor Pattern）
</td>
</tr>
<tr>
<td>J2EE 模式</td>
<td>这些设计模式特别关注表示层。这些模式是由 Sun Java Center 鉴定的。</td>
<td>
MVC 模式（MVC Pattern）<br/>
业务代表模式（Business Delegate Pattern）<br/>
组合实体模式（Composite Entity Pattern）<br/>
数据访问对象模式（Data Access Object Pattern）<br/>
前端控制器模式（Front Controller Pattern）<br/>
拦截过滤器模式（Intercepting Filter Pattern）<br/>
服务定位器模式（Service Locator Pattern）<br/>
传输对象模式（Transfer Object Pattern）
</td>
</tr>
</tbody>
</table>

![关系图](http://kangyonggan.com/upload/pattern.jpg)

## 设计模式的六大原则
### 1、开闭原则（Open Close Principle）
开闭原则的意思是：对扩展开放，对修改关闭。在程序需要进行拓展的时候，不能去修改原有的代码，实现一个热插拔的效果。简言之，是为了使程序的扩展性好，易于维护和升级。想要达到这样的效果，我们需要使用接口和抽象类，后面的具体设计中我们会提到这点。

### 2、里氏代换原则（Liskov Substitution Principle）
里氏代换原则是面向对象设计的基本原则之一。 里氏代换原则中说，任何基类可以出现的地方，子类一定可以出现。LSP 是继承复用的基石，只有当派生类可以替换掉基类，且软件单位的功能不受到影响时，基类才能真正被复用，而派生类也能够在基类的基础上增加新的行为。里氏代换原则是对开闭原则的补充。实现开闭原则的关键步骤就是抽象化，而基类与子类的继承关系就是抽象化的具体实现，所以里氏代换原则是对实现抽象化的具体步骤的规范。

### 3、依赖倒转原则（Dependence Inversion Principle）
这个原则是开闭原则的基础，具体内容：针对接口编程，依赖于抽象而不依赖于具体。

### 4、接口隔离原则（Interface Segregation Principle）
这个原则的意思是：使用多个隔离的接口，比使用单个接口要好。它还有另外一个意思是：降低类之间的耦合度。由此可见，其实设计模式就是从大型软件架构出发、便于升级和维护的软件设计思想，它强调降低依赖，降低耦合。

### 5、迪米特法则，又称最少知道原则（Demeter Principle）
最少知道原则是指：一个实体应当尽量少地与其他实体之间发生相互作用，使得系统功能模块相对独立。

### 6、合成复用原则（Composite Reuse Principle）
合成复用原则是指：尽量使用合成/聚合的方式，而不是使用继承。', 1, '2017-06-13 03:18:50', '2017-06-14 05:54:12');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用jdbc向MySQL中插入时间丢失毫秒', 'java', 'Java后台', '## 问题描述
最近遇到一个问题，项目中使用Mybatis向MySQL中插入一条记录，结果发现时间的毫秒会丢失，MySQL版本5.6及以上，建表语句如下：

```
create table la_trans_monitor
(
	begin_time timestamp(3) default CURRENT_TIMESTAMP(3) not null
)
```

其他和本题无关字段已省略。

<!-- more -->

生成的Model：

```
package com.kangyonggan.app.dfjz.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Table(name = "la_trans_monitor")
@Data
public class LaTransMonitor implements Serializable {

    @Column(name = "begin_time")
    private Date beginTime;

    private static final long serialVersionUID = 1L;
}
```

## 问题分析
从debug日志中可以看出参数是有毫秒的，但是数据库中就是没有落入毫秒

```
[DEBUG] 2017-06-16 10:59:11.039 [com.kangyonggan.app.dfjz.mapper.LaTransMonitorMapper.insertSelective.main:145] - ==>  Preparing: INSERT INTO la_trans_monitor ( sys_date,sys_time,method_type,method_route,method_name,begin_time,end_time,used_time ) VALUES ( ?,?,?,?,?,?,?,? ) 
[DEBUG] 2017-06-16 10:59:11.065 [com.kangyonggan.app.dfjz.mapper.LaTransMonitorMapper.insertSelective.main:145] - ==> Parameters: 20170615(String), 112233(String), XX(String), XX(String), XXX(String), 2017-06-16 10:59:10.342(Timestamp), 2017-06-16 10:59:10.342(Timestamp), 12345(Long)
[DEBUG] 2017-06-16 10:59:11.188 [com.kangyonggan.app.dfjz.mapper.LaTransMonitorMapper.insertSelective.main:145] - <==    Updates: 1
```

解决这个问题的过程中有想到： 
1. 会不会是MySQL版本问题？
2. 会不会是Mybatis版本问题？
3. 会不会是建表脚本问题？
4. 会不会是配置问题？

通过控制变量法，经过一一验证，都没发现问题。

我曾经手写过简版Mybatis，所以清楚以下几点：    
1. 日志不等于它实际执行的SQL，所以看到日志中有毫秒是没多大意义的。
2. PreparedStatement有两个主要步骤，一个是准备带有占位符的SQL，另一个就是给占位符填数据。

所以我猜测PreparedStatement在填数据的时候，对java.util.date的处理过程中丢掉了毫秒，接下来就是debug跟踪源代码，最后发现PreparedStatement填数据的类是在mysql-connector-java这个jar包下的。  
源代码如下：  

```
private void setTimestampInternal(int parameterIndex, Timestamp x, Calendar targetCalendar, TimeZone tz, boolean rollForward) throws SQLException {
    if(x == null) {
        this.setNull(parameterIndex, 93);
    } else {
        this.checkClosed();
        if(!this.useLegacyDatetimeCode) {
            this.newSetTimestampInternal(parameterIndex, x, targetCalendar);
        } else {
            String timestampString = null;
            Calendar sessionCalendar = this.connection.getUseJDBCCompliantTimezoneShift()?this.connection.getUtcCalendar():this.getCalendarInstanceForSessionOrNew();
            synchronized(sessionCalendar) {
                x = TimeUtil.changeTimezone(this.connection, sessionCalendar, targetCalendar, x, tz, this.connection.getServerTimezoneTZ(), rollForward);
            }

            if(this.connection.getUseSSPSCompatibleTimezoneShift()) {
                this.doSSPSCompatibleTimezoneShift(parameterIndex, x, sessionCalendar);
            } else {
                synchronized(this) {
                    if(this.tsdf == null) {
                        this.tsdf = new SimpleDateFormat("\\''\\''yyyy-MM-dd HH:mm:ss", Locale.US);
                    }

                    timestampString = this.tsdf.format(x);
                    StringBuffer buf = new StringBuffer();
                    buf.append(timestampString);
                    buf.append(''.'');
                    buf.append(this.formatNanos(x.getNanos()));
                    buf.append(''\\'''');
                    this.setInternal(parameterIndex, buf.toString());
                }
            }
        }

        this.parameterTypes[parameterIndex - 1 + this.getParameterIndexOffset()] = 93;
    }

}
```

从上面代码中可以看出，它在处理时间的时候，使用SimpleDateFormat进行格式化的，格式化中没保留毫秒，紧接着后面又去拼接纳秒formatNanos，但是继续跟踪此方法后发现它返回的是0，因此最后PreparedStatement填的值形如"yyyy-MM-dd HH:MM:ss.0"。

问题已经定位到，所以就想着能不能升级jar包版本解决问题呢？

去[中央仓库](https://mvnrepository.com/)搜一把, 发现我现在的版本5.1.9实在是太古老了，用的人也不多，于是换了新版的用的人较多的5.1.34, 果然成功解决问题。新版jar包核心代码如下：

```
private void setTimestampInternal(int parameterIndex, Timestamp x, Calendar targetCalendar, TimeZone tz, boolean rollForward) throws SQLException {
    synchronized(this.checkClosed().getConnectionMutex()) {
        if(x == null) {
            this.setNull(parameterIndex, 93);
        } else {
            this.checkClosed();
            if(!this.useLegacyDatetimeCode) {
                this.newSetTimestampInternal(parameterIndex, x, targetCalendar);
            } else {
                Calendar sessionCalendar = this.connection.getUseJDBCCompliantTimezoneShift()?this.connection.getUtcCalendar():this.getCalendarInstanceForSessionOrNew();
                synchronized(sessionCalendar) {
                    x = TimeUtil.changeTimezone(this.connection, sessionCalendar, targetCalendar, x, tz, this.connection.getServerTimezoneTZ(), rollForward);
                }

                if(this.connection.getUseSSPSCompatibleTimezoneShift()) {
                    this.doSSPSCompatibleTimezoneShift(parameterIndex, x, sessionCalendar);
                } else {
                    synchronized(this) {
                        if(this.tsdf == null) {
                            this.tsdf = new SimpleDateFormat("\\''\\''yyyy-MM-dd HH:mm:ss", Locale.US);
                        }

                        StringBuffer buf = new StringBuffer();
                        buf.append(this.tsdf.format(x));
                        if(this.serverSupportsFracSecs) {
                            int nanos = x.getNanos();
                            if(nanos != 0) {
                                buf.append(''.'');
                                buf.append(TimeUtil.formatNanos(nanos, this.serverSupportsFracSecs, true));
                            }
                        }

                        buf.append(''\\'''');
                        this.setInternal(parameterIndex, buf.toString());
                    }
                }
            }

            this.parameterTypes[parameterIndex - 1 + this.getParameterIndexOffset()] = 93;
        }

    }
}
```









', 0, '2017-06-16 03:26:08', '2017-07-28 10:07:24');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('java文档注释规范', 'java', 'Java后台', '## 什么地方加注释
### 基本注释（必须加）
1. 类/接口/枚举的注释
2. 构造方法的注释
3. 方法的注释
4. 全局变量的注释
5. 字段/属性的注释

> 备注：逻辑简单的做简单注释即可，另外，持久化对象、vo或dto对象的getter、setter方法不需加注释。

<!-- more -->

### 特殊注释（必须加）
1. 算法及复杂逻辑必须有注释
2. 在代码不明处必须有注释
3. 在循环和分支处必须有注释
4. 对外提供的接口必须有注释

## 注释的格式
### 单行注释
```
if ("AL0001".equals(bnkTranCo)) {
    // 身份鉴权(其实就是发短信)
    singleVirement.sendSms(dto);
} else if ("AL0005".equals(bnkTranCo)) {
    // 签约
    singleVirement.verify(dto);
} else {
    throw new CommandException("调度指令不支持的执行指令");
}
```

### 块注释
```
/**
 * 准备响应数据
 */
ReturnDto returnDto = new ReturnDto();
ResponsionDto respDto = new ResponsionDto();
TransactionMessageDto tranMsgDto = new TransactionMessageDto();
String serialNo = dto.getSerialNo();
String state = null;
String respCo = null;
String respMsg = null;
String merRespCo = null;
String merRespMsg = null;
String tranSt = null;
```

### 文档注释
```
/**
 * 根据用户名查找指定用户
 *
 * @param username 用户名
 * @return 返回查找到的唯一用户，如果没查到就会返回null
 */
User findUserByUsername(String username);
```

### 文档注释标签语法

 标签        | 标签类型   |  说明 
--------   | -----  | ----  
@author 作者     | 包、类、接口 |   作者标识    
@version 版本号  | 包、类、接口 |  版本号 
@param 参数名 描述  | 方法 |  方法的入参名及描述信息，如入参有特别要求，可在此注释。 
@return 描述  | 方法 |  对方法返回值的注释 
@deprecated 过期文本  | 包、类、接口、属性、方法 |  标识随着程序版本的提升，当前API已经过期，仅为了保证兼容性依然存在，以此告之开发者不应再用这个API。 
@throws 异常类名  | 方法 |  方法所会抛出的异常。 
@exception 异常类名  | 方法 |  同@throws 
@see 引用  | 包、类、接口、属性、 方法 | 查看相关内容，如类、方法、变量等。 
@since 描述文本  | 包、类、接口、属性、 方法 |  API在什么程序的什么版本后开发支持。 
{@link包.类#成员 标签}  | 包、类、接口、属性、 方法 |  链接到某个特定的成员对应的文档中。 
{@value}  | 静态值域 |  当对常量进行注释时，如果想将其值包含在文档中，则通过该标签来引用常量的值。 

## 生成文档
### 使用jdk自带的命令
语法：

```
javadoc -d 指定生成目录 源文件.java 
```

例子：

```
javadoc -d /Users/kyg/docs/hello /Users/kyg/Hello.java
```

执行完成后在hello文件夹中打开index.html即可。

### 使用idea工具生成
> Idea > Tools > Generate JavaDoc...

如图：

![生成javadoc](https://kangyonggan.com/upload/javadoc.png)

## 其他
1. 接口必须写注释，实现不需要写注释，因为生成的javasoc中会自动使用接口的注释。
2. 文档描述使用的是html语法，换行使用<br>，段落使用<p>等。
3. 如果使用的是idea，可以在"File and Code Templates"中配置文件模板。
4. 生成文档过程中，如果注释写的不规范，生成过程会报警告，可以按警告提示去完善注释，也可以直接忽略。
5. 我的一个小[demo](https://github.com/kangyonggan/javadoc.git)


', 0, '2017-06-29 03:30:58', '2017-07-27 09:46:15');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('学习React - Hello World', 'web', 'Web前端', '## Hello World
```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Hello React!</title>
    <script src="https://cdn.bootcss.com/react/15.4.2/react.min.js"></script>
    <script src="https://cdn.bootcss.com/react/15.4.2/react-dom.min.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.22.1/babel.min.js"></script>
  </head>
  <body>
    <div id="example"></div>
    <script type="text/babel">
      ReactDOM.render(
        <h1>Hello, world!</h1>,
        document.getElementById(''example'')
      );
    </script>
  </body>
</html>
```

<!-- more -->

### 实例解析：
实例中引入了三个库： react.min.js 、react-dom.min.js 和 babel.min.js：  
- react.min.js - React 的核心库
- react-dom.min.js - 提供与 DOM 相关的功能
- babel.min.js - Babel 可以将 ES6 代码转为 ES5代码，这样就能在目前不支持 ES6 浏览器上执行 React 代码。Babel 内嵌了对 JSX 的支持。通过将 Babel 和 babel-sublime 包（package）一同使用可以让源码的语法渲染上升到一个全新的水平。

> ### 注意：
如果我们需要使用 JSX，则 <script> 标签的 type 属性需要设置为 text/babel。

## 通过 npm 使用 React
如果你的系统还不支持 Node.js 及 NPM 可以参考的 [Node.js 教程](http://www.runoob.com/nodejs/nodejs-tutorial.html)。
建议在 React 中使用 CommonJS 模块系统，比如 browserify 或 webpack，此处使用 webpack。
国内使用 npm 速度很慢，你可以使用淘宝定制的 cnpm (gzip 压缩支持) 命令行工具代替默认的 npm:

```
$ npm install -g cnpm --registry=https://registry.npm.taobao.org
$ npm config set registry https://registry.npm.taobao.org
```

这样就可以使用 cnpm 命令来安装模块了：

```
$ cnpm install [name]
```

更多信息可以查阅：[http://npm.taobao.org/](http://npm.taobao.org/)。

## 使用 create-react-app 快速构建 React 开发环境
create-react-app 是来自于 Facebook，通过该命令我们无需配置就能快速构建 React 开发环境。
create-react-app 自动创建的项目是基于 Webpack + ES6 。
执行以下命令创建项目：

```
$ cnpm install -g create-react-app
$ create-react-app my-app
$ cd my-app/
$ npm start
```

> ### create-react-app 执行慢的解决方法：
在使用 create-react-app my-app 来创建一个新的React应用，在拉取各种资源时,往往会非常慢,一直卡在那。

```
fetchMetadata: sill mapToRegistry uri http://registry.npmjs.org/whatwg-fetch
```

可以看到资源还是使用了 npmjs.org，解决方法是换成淘宝的资源：

```
$ npm config set registry https://registry.npm.taobao.org
-- 配置后可通过下面方式来验证是否成功
$ npm config get registry
-- 或 npm info express
```

在浏览器中打开 http://localhost:3000/ ，结果如下图所示：

![](https://kangyonggan.com/upload/react-hello-01.png)

项目的目录结构如下：

```
my-app/
  README.md
  node_modules/
  package.json
  .gitignore
  public/
    favicon.ico
    index.html
  src/
    App.css
    App.js
    App.test.js
    index.css
    index.js
    logo.svg
```

尝试修改 src/App.js 文件代码：

```
import React, { Component } from ''react'';
import logo from ''./logo.svg'';
import ''./App.css'';

class App extends Component {
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Hello World</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
      </div>
    );
  }
}

export default App;

```

修改后，打开 http://localhost:3000/ （一般自动刷新），输出结果如下：

![](https://kangyonggan.com/upload/react-hello-02.png)

', 0, '2017-07-20 03:13:32', '2017-08-03 09:28:35');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('使用swift解析xml', 'ios', 'iOS开发', '
## 项目结构
![项目结构](https://kangyonggan.com/upload/swift-xmlparse.png)

## 测试数据
[https://kangyonggan.com/upload/swift-xmlparse.xml](https://kangyonggan.com/upload/swift-xmlparse.xml)

```
<?xml version="1.0" encoding="utf-8"?>

<Users> 
    <User id="1001"> 
        <Username>zhangsan</Username>  
        <Age>23</Age> 
    </User>  
    <User id="1002"> 
        <Username>李四</Username>  
        <Age>24</Age> 
    </User> 
</Users>
```

<!-- more -->

## 对应的实体类
MyUser.swift

```
import Foundation

class MyUser: NSObject {
    
    // 用户ID
    var id: Int?;
    
    // 用户名
    var username: String?;
    
    // 年龄
    var age: Int?;
}
```

## 解析XML工具类
MyXmlParser.swift

```

import UIKit

class MyXmlParser: NSObject, XMLParserDelegate {
    
    // 用户列表
    var userList:[MyUser] = []
    
    // 判断是否解析到开始标签<User>
    var isUser:Bool = false
    
    // 当前解析的用户
    var currentUser: MyUser!;
    
    //当前解析的标签的值
    var currentElementValue:String!
    
    //是否解析成功
    var isSuccess = true;
    
    // 读取到开始标签的事件。比如：读取到<User>的时候
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "User" {
            self.currentUser = MyUser();
            isUser = true;
            // 获取属性
            self.currentUser.id = Int(attributeDict["id"]!);
        }
    }
    
    // 读取到标签值的事件。比如：读取到<Username>zhangsan</Username>中的zhangsan的时候
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.currentElementValue = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
    }
    
    // 读取到结束标签的事件。比如：读取到</User>的时候
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if isUser {
            // 获取User子标签的值
            if elementName == "username" {
                self.currentUser.username = self.currentElementValue;
            } else if elementName == "age" {
                self.currentUser.age = Int(self.currentElementValue);
            }
        }
        
        // 当读取到</User>时，说明当前实体读取完毕
        if isUser && elementName == "User" {
            userList.append(currentUser);
            isUser = false;
        }
        
    }
    
    // 解析xml发送异常的事件。
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        isSuccess = false;
    }
}


```

## 测试
ViewController.swift

```
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        parseXml(url: "https://kangyonggan.com/upload/swift-xmlparse.xml");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 解析指定地址的url
    func parseXml(url: String) {
        let delegate = MyXmlParser();
        let parser = XMLParser(contentsOf: URL(string: url)!)!;
        
        parser.delegate = delegate;
        parser.parse();
        
        // 输出验证
        if delegate.isSuccess {
            NSLog("xml解析成功了");
            for user in delegate.userList {
                NSLog("id=\\(user.id!), username=\\(user.username!), age=\\(user.age!)");
            }
        } else {
            NSLog("xml解析失败了");
        }
    }

}
```

## 输出
```
2017-08-03 17:23:15.541 xmlparse[17172:359082] xml解析成功了
2017-08-03 17:23:15.541 xmlparse[17172:359082] id=1001, username=zhangsan, age=23
2017-08-03 17:23:15.541 xmlparse[17172:359082] id=1002, username=李四, age=24
```', 0, '2017-08-03 09:46:27', '2017-08-11 09:55:09');
INSERT INTO future.article (title, category_code, category_name, content, is_deleted, created_time, updated_time) VALUES ('在swift中使用通知', 'ios', 'iOS开发', '
## 通知的观察者
```
NotificationCenter.default.addObserver(self, selector: #selector(BookListController.receiveNotify), name: NSNotification.Name(rawValue: "BookListRefresh"), object: nil)
```

```
func receiveNotify() {
    // TODO
}
```

<!-- more -->

## 通知的发布者
```
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BookListRefresh"), object: nil)
```
', 0, '2017-08-03 10:21:09', '2017-08-17 03:23:14');

UPDATE article SET category_code = 'jishu', category_name = '技术分享', username = '15121149571';