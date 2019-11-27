### Cài đặt Load Balancing trên NGINX

### A. Mô hình cài đặt
- Sử dụng 3 server
	- 2 Server dùng làm webserver
	- 1 Server cài Nginx từ source làm Load Balancing cho 2 server web.

- Địa chỉ mạng 
	- 2 Server cài webserver có IP lần lượt là 10.2.9.50 và 10.2.9.51
	- 1 Server cài Nginx Load Balancing có IP là 10.2.9.52


### B. Cài đặt Nginx từ source Load Balancing

##### p/s Cài Nginx từ source để hỗ trợ bổ sung thêm các module không có sẵn (vts , sts,stream sts). Bổ xung thêm các gói giám
sát traffic , để phục vụ bài toán giám sát loadbalancing trên Nginx.

### 1. Cài các gói cần thiết cho biên dịch và cài đặt NGINX

```
yum -y install make gcc gcc-c++ pcre-devel zlib-devel openssl-devel
yum groupinstall " Development Tools"  -y
yum install zlib-devel pcre-devel openssl-devel wget -y
yum install epel-release -y
yum install perl perl-devel perl-ExtUtils-Embed libxslt libxslt-devel libxml2 libxml2-devel gd gd-devel GeoIP GeoIP-devel -y

```

### 2. Cài đặt các gói vts , sts , stream sts và nginx

```
cd /usr/src
git clone https://github.com/vozlt/nginx-module-vts.git
git clone https://github.com/vozlt/nginx-module-sts.git
git clone https://github.com/vozlt/nginx-module-stream-sts.git
wget https://nginx.org/download/nginx-1.16.1.tar.gz
tar -xvzf nginx-1.16.1.tar.gz

```

### 3. Biên dịch và cài nginx từ source

```
cd /usr/src/nginx-1.16.1
./configure --user=nginx --group=nginx \
--add-module=/usr/src/nginx-module-sts/ \
--add-module=/usr/src/nginx-module-vts/ \
--add-module=/usr/src/nginx-module-stream-sts/ \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-mail \
--with-mail_ssl_module \
--with-file-aio \
--with-stream \
--with-http_geoip_module


make
make install

```

- Tạo user và thư mục chứa `cache nginx `, phân quyền cho thư mục
```
useradd nginx
mkdir -p /var/cache/nginx/client_temp/
chown nginx. /var/cache/nginx/client_temp/

```

### 4. Tạo quyền và phân quyền cho thư mục 
```
useradd nginx
chown -R nginx:nginx /etc/nginx/

```

### 5. Tạo file nginx.service trong /lib/systemd/system/nginx.service

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

#### 6. Kiểm tra các thông số cấu hình , start nginx

```
nginx -t
systemctl start nginx
systemctl enable nginx

```

### C. Cấu hình Load Balancing cho NGINX

- Sửa file cài đặt mặc định chạy service đầu tiên ` nginx.conf`

```

#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    # Stream traffic module
    stream_server_traffic_status_zone;

    # Stream web module
    vhost_traffic_status_zone;

    # filter geoip
    geoip_country /usr/share/GeoIP/GeoIP.dat;
    vhost_traffic_status_filter_by_set_key $geoip_country_code country::*;


    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    upstream backend {
        server 10.2.9.51:80;
        server 10.2.9.50:80;
    }

    server {
        listen 10.2.9.52:80;

        location / {
            proxy_pass http://backend;
        }
    }

    server {
        listen       8080;
        server_name  status-page;

        location / {
            root   html;
            index  index.html index.htm;
        }
        
        location /status-stream {
            stream_server_traffic_status_display;
            stream_server_traffic_status_display_format html;
        }

        vhost_traffic_status_filter_by_set_key $geoip_country_code country::$server_name;

        location /status-web {
            vhost_traffic_status_display;
            vhost_traffic_status_display_format html;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    
    }
}

```

- Module load balancing mặc định dùng thuật toán roud robin để cân bằng tải trong : ` Moduel upstream ` 

![](../images/21.png)



- Các server được nhóm lại bằng ` upstream module` định nghĩa bằng `server directive `
- Cấu hình chuyển requests tới server group , ở đây ta dùng `proxy_pass directive `

![](../images/22.png)


- Kiểm tra cấu hình và khởi động lại dịch vụ
```
nginx -t
systemctl start nginx
systemctl enable nginx

```


### D. Một số cách sử dụng thuật toán Load Balancing trong Nginx.
##### Mặc định load balancer sử dụng thuật toán Roud robin

```
upstream backend {
   ip_hash;
   server 10.2.9.50; 
   server 10.2.9.51;
}

```
```
upstream backend {
   least_conn;
   server 10.2.9.50; 
   server 10.2.9.51;
}

```
```
upstream backend {
   server 10.2.9.50 weight=4; 
   server 10.2.9.51 weight=1;
}

```


##### Một số chỉ thị trong  ` upstream backend ` đi kèm theo từng server
- ` weight ` : trọng số ưu tiên , ( số request được gửi đến tương đương với trọng số weigth). 
	- Ví dụ:  1 webserver  A weight=4;
	- 1 webserver B weight=1; 
	- Hai webserver này được nhóm vào 1 loadbalacing server C.
	- Khi các requests gửi tới C. Sẽ có 4 request gửi tới  A và chỉ có 1 resquest gửi tới B, việc này diễn ra lần lượt từ A<->B.
- ` max_fails `: Số lần tối đa mà load balancer không liên lạc được với server đó (trong khoảng fail_timeout) trước khi server này bị coi là down.

- ` fail_timeout ` : Khoảng thời gian mà một server phải trả lời load balancer , nếu không server này coi như bị down. Đây cũng là downtime của server này.

- ` backup ` : Những server nào có thông số này sẽ chỉ nhận request từ loadbalencer một khi tất cả các server khác bị down.

- ` down ` : Server này không thể sử lý request gửi tới. Nhưng load balancer không gửi request cho server này mà vẫn lưu server này trong danh sách cho tới khi được gỡ bỏ.



### E. Bảo toàn session người dùng.
> Khi đăng nhập ở server1 mà lúc sau request được chuyển sang server2 , quá trình đăng nhập bị mất. Để tránh tình trạng này , chúng ta có thể 
` session ` vào `memcached ` hoặc ` redis `.  Đôi khi cần phải replicate cả memcached mà tốc độ đồng bộ giữa các memcached giữa các server khác
nhau quá trậm. NGINX cung cấp ` sticky directive ` giúp Nginx tracks user sessions và đưa họ tới đúng upstream server.

- Nginx chỉ cung cấp ` sticky directive ` cho bản thương mại ;)))) NGINX Plus giá khoảng 2500$ . Do đó người ta nghĩ tới việc sử dụng `ip_hash `
để làm phương thức cân bằng tải.

- ` hash ` được sinh ra từ 3 octet đầu của IP . Do đó tât cả IP cùng C-class sẽ được điều hướng truy cập vào 1 webserver , các user phía sau một NAT
sẽ truy cập vào một webserver khác. Nếu ta mở thêm mới một backend , toàn bộ hash sẽ thay đổi và các session cũng biết mất. Dưới đây là cách giải
quyết vấn đề.


```
upstream backend {
    server 10.2.9.50;
    server 10.2.9.51;
}
map $cookie_backend $sticky_backend {
    backend1 10.2.9.50; || backend 10.2.9.50 || 10.2.9.50 10.2.9.50
    backend2 10.2.9.51; || backend 10.2.9.51 || 10.2.9.50 10.2.9.51
    default backend;
}
server {
    listen 80;
    server_name localhost;
    location / {
        set $target http://$sticky_backend;
        proxy_pass $target;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

```


### 1. Ý nghĩa các thông số trên:
- proxy_pass : Thông báo cho nginx biết địa chỉ của backend cần gửi yêu cầu truy cập tới, giá trị truyền vào có thể là IP hoặc domain nam , alias.

- proxy_set_header Host : Dòng này rất quan trọng, bởi khi đi qua reverse proxy, nếu giá trị $host empty (không được set), Nginx ở Backend sẽ không 
thể nhận diện request từ virtual host nào để mà đưa ra xử lý request.

- proxy_set_header X-Real-IP : Set IP của request client vào header khi gửi request vào backed

- proxy_set_header X-Forwarded-Proto : cho backend biết giao thức mà client gửi request tới proxy, http hay https.

### 2. Hoạt động xử lý 
- Khi user lần đầu tiên truy cập vào Master server , lúc đó sẽ không có backed_cookie nào đưa ra , và $sticky_backend Nginx variable sẽ được
chuyển hướng tới upstream group . Theo thuật toán mặc định roud robin thì request sẽ chuyển tới server1 hoặc server2.

- Trên các server1 và server2 , ta cấu hình ghi các cookie tương ứng với mỗi request đến. Khi resquest được pass vào backend nào thì trên client
sẽ ghi một cookie có name= backend & value=10.2.9.50 hoặc 10.2.9.51 tương ứng.

```

server {
    listen 80 default_server;
    ...
    location ~ ^/.+\.php(/|$) {
        add_header Set-Cookie "backend=10.2.9.50;Max-Age=3600";
        ...
    }
}

server {
    listen 80 default_server;
    ...
    location ~ ^/.+\.php(/|$) {
        add_header Set-Cookie "backend=10.2.9.51;Max-Age=3600";
        ...
    }
}

```

- Mỗi khi user request lại tới master , Nginx sẽ thực hiện `map $cookie_backend `với ` $sticky_backend` tương ứng và chuyển hướng người dùng đó
qua `proxy_pass`.
 



















