# nginx-rtmp-module 搭建RTMP视频直播/点播服务器

## 1. 环境说明

+ CenntOS Linux release 7.7.1908

+ nginx/1.16.0

+ Nginx-rtmp-module

​      Nginx本身是一个非常出色的HTTP服务器，FFMPEG是非常好的音视频解决方案，这里两个东西通过nginx的模块nginx-rtmp-module组合在一起即可以搭建一个功能相对比较完善的流媒体服务器，这个流媒体服务器可以支持RTMP和HLS(Live Http Stream)。

 

## 2. Nginx服务器的搭建

### 安装依赖

+ yum update

+ yum install pcre pcre-devel

+ yum install openssl openssl-devel
+ yum install zlib zlib-devel

### 下载软件源码包

nginx-1.16.0.tar.gz

nginx-rtmp-module

###  安装

1. 解压ngixn包

   tar -zxvf nginx-1.16.0.tar.gz -C /usr/local

2. 将nginx-rtmp-module拷贝到解压后的nginx目录下

   cp -r nginx-rtmp-module /usr/local/nginx-1.16.0/

3. 进入到ngixn源码目录

   cd /usr/local/nginx-1.16.0 && ./configure --add-module=/usr/local/nginx-1.16.0/nginx-rtmp-module --prefix=/usr/local

4. 编译源码

   cd /usr/local/nginx-1.16.0 && make && make install

5. 查看编译结果

   cd /usr/local/nginx && ./sbin/nginx -V

   查看是否带有configure arguments: --add-module=/usr/local/nginx-1.16.0/nginx-rtmp-module

### 点播视频服务器配置

cd /usr/local/nginx && √vi conf/nginx.conf

### 视频目录权限配置

 sudo chmod  - R  777  / nginxData / mp4

由于 nginx 的子进程属于 nobody（权限极低），所以本次实验将视频文件的所有权限都放开

``` nginx
rtmp {          #RTMP服务
        server {
                listen 1935;                    #服务端口
                chunk_size 4096;                #数据传输块大小
                application vod {
                        play /vedio/vod;        #视频文件存放位置
                }
                application live {
                        live on;
                        hls on;                 #这个参数把直播服务器改造成实时回放服务器
                        wait_key on;            #对视频切片进行保护,这样就不会产生马赛克
                        hls_path /vedio/hls;    #切片视频存储位置
                        hls_fragment 10s;       #每个视频切片时长
                        hls_playlist_length 60s;#总共可以回看的事件,这里设置1分钟
                        hls_continuous on;      #连续模式
                        hls_cleanup on;         #对多余切片进行删除
                        hls_nested on;          #嵌套模式
                }

        }
}


http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile on;
    #access_log  logs/access.log  main;
    keepalive_timeout  65;
    #gzip  on;

    server {
        listen       8090;
        server_name  fourhu.xyz;
        #charset koi8-r;
        location /stat {
                rtmp_stat all;
                rtmp_stat_stylesheet stat.xsl;
        }

        location /stat.xsl {
                root /usr/local/nginx-1.16.0/nginx-rtmp-module;
        }

        location /live {
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Credentials' 'true';
            types {
                application/vnd.apple.mpegurl m3u8;
                video/mp2t ts;
            }
            alias /vedio/hls;
            expires -1;
            add_header Cache-Control no-cache;
        }

        error_page  404              /404.html;
        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

    }
}
```



视频点播地址: rtmp://193.112.253.67/vod/test.mp4

推流地址:rtmp://193.112.253.67/live

视频直播地址: http://193.112.253.67:8090/live/index.m3u8