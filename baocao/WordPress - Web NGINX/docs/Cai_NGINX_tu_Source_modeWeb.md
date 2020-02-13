### Cài đặt NGINX từ Source
- Cài NGINX từ Source vì :
	- Hiểu cách cài đặt  , bố trí vị trí cấu hình
	- Cài đặt Nginx từ gói Pre-Build giúp cài đặt nhanh, dễ dàng và bao gồm các module chính cần thiết nhưng nhược điểm không tích hợp 
	sẵn các module mở rộng, có thể tiềm ẩn bug mà chưa được fix.
	- Cài đặt từ source thì ngược lại với pre-build: Khó hơn, lâu hơn nhưng tận dụng tính năng mở rộng module (cái này cần thiết khi làm 
	việc với hệ thống lớn, cần nhiều module khác nhau), tận dụng được tính năng mới nhất, bugfix và luôn up-to-date.

### A. Cài đặt NGINX từ source
#### 1. Cài đặt các gói cần thiết cho biên dịch và NGINX
> Cài đặt các gói thư viện cho biên dịch , cũng như cá gói cần thiết cho các Module mở rộng NGINX

- ` Thư viện PCRE ` : cần cho module core và rewrite của nginx và hỗ trợ regular expressions (biểu thức chính quy).
- ` Thư viện zlib `:  được yêu cầu từ module Gzip cho nén các header.
- ` Thư viện openssl `: được yêu cầu cho module SSL để hỗ trợ giao thức HTTPS.

` yum -y install make gcc gcc-c++ pcre-devel zlib-devel openssl-devel` 

```
yum groupinstall " Development Tools"  -y
yum install zlib-devel pcre-devel openssl-devel wget -y
yum install epel-release -y

```

#### 2. Cài đặt các gói thành phần phần phụ thuộc của nginx
```
yum install perl perl-devel perl-ExtUtils-Embed libxslt libxslt-devel libxml2 libxml2-devel gd gd-devel GeoIP GeoIP-devel -y
```

#### 3. Download NGINX
- Download source nginx từ trang chủ : http://nginx.org/download/ 

```
cd /usr/src/
wget https://nginx.org/download/nginx-1.16.1.tar.gz
tar -xvzf nginx-1.16.1.tar.gz
```
- Truy cập vào được dẫn chứa source ngĩn và config từ scrip

```
cd nginx-1.16.1/

./configure --prefix=/etc/nginx \
--pid-path=/var/run/nginx.pid \
--conf-path=/etc/nginx/nginx.conf \
--sbin-path=/usr/sbin/nginx \
--error-log-path=/var/log/nginx/error.log  \
--lock-path=/var/run/nginx.lock \
--user=nginx \
--group=nginx \
--with-pcre \
--with-file-aio \
--with-http_realip_module \
--with-http_gzip_static_module \
--with-http_ssl_module \
--with-http_gzip_static_module \
--with-http_stub_status_module 

make
make install

```

- Tạo user và phân quyền cho thư mục

```
useradd nginx
chown -R nginx:nginx /etc/nginx/

```

- Tạo file nginx.service trong ` usr/lib/systemd/system/nginx.service`

```
[Unit]
Description=nginx - high performance web server
Documentation=http://nginx.org/en/docs/
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s QUIT $MAINPID

[Install]
WantedBy=multi-user.target

```

- Kiểm tra các thông số cấu hình , start nginx

```
nginx -t
systemctl start nginx
systemctl enable nginx
```



### B. Cài đặt NGINX làm WEB Server
### 1. Tạo thư mục chứa nội dung của trang web.
- ` mkdir /var/www/html/ `
- Cấp quyền cho thư mục chứa web.
` chown -R nginx:nginx /var/www/html/ `

### 2. Cấu hình NGINX hoạt động web_server
#### P/S : Lưu ý vị trị file `nginx.conf` và thư mục ` conf.d` .

- Truy cập và sửa file ` /etc/nginx/nginx.conf ` sửa theo nội dung sau để cấu hình Virtual Host cho Nginx

```
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}

``` 

- Tạo thư mục ` /etc/nginx/conf.d ` và file `default.conf ` để chạy trang web.

``` 
server {
    listen       80;
    server_name  loacalhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /var/www/html/;
        index index.php index.html index.htm;
        try_files $uri $uri/ /index.php?q=$uri&$args;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /var/www/html/;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
        root           /var/www/html/;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  document_root$fastcgi_script_name;
        include        fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}


```




















