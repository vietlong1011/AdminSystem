### B. Cài đặt Graylog 3.0 trên CentOS 7.

#### 1. Mô hình và các modul cài đặt.
- Sử dụng mô hình triển khai trên 1 máy server ( All - in - one)
- Cài đặt MongoDB 4.0 : Nơi lưu trữ metadata cấu hình , chắng hạn như thông tin người dùng hoặc cấu hình luồng.
- Cài đặt Elasticsearch 6.x: Công cụ tìm kiếm và phân tích Graylog một bộ lưu trữ dữ liệu nhật ký trung tâm.

### 2. Cài dặt MongoDB 4 trên CentOS 7.

- Thêm kho lưu trữ MongoDB
```
vi /etc/yum.repos.d/mongodb-org-4.0.repo

[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc

```

- Cài đặt MongoDB 4 bằng gói mongodb-org , gói này sẽ tự động cài thêm  mongodb-org-server , mongodb-org-mongos , mongodb-org-shell và mongodb-org-tools.

```
yum install mongodb-org 
systemctl start mongod
systemctl enable  mongod
systemctl status mongod
mongod --version

```

### 3.Cài đặt Elasticsearch 6.x trên CentOS 7.

### 3.1 Cài đặt Java 12 trên CentOS 7.

```
yum install java-1.8.0-openjdk-headless

java -version
```

### 3.2 Cài đặt Elasticsearch 6.x
- Thêm kho lưu trữ Elasticsearch 

```
vi /etc/yum.repos.d/elasticsearc-6.repo

[elasticsearch-6.x]
name=Elasticsearch repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

```
- Nhập khóa ký tên repo của Elasticsearch PGP và cài đặt Elasticsearch 6.x
```
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

yum install elasticsearch

```

### 4. Config Elasticsearch
- Trong cấu hình cơ bản , Graylog yêu cầu đổi tên cụm Elasticsearch thành Graylog trong thư mục ` etc/elasticsearch/elasticsearch.yml `

![](../images/17.png)


- Khởi động elasticsearch
```
systemctl daemon-reload 
systemctl restart elasticsearch 
systemctl enable elasticsearch

```

- Kiểm tra elasticsearch đã hoạt động bình thương chưa sử dụng lệnh: 
```
curl -X GET http://localhost:9200
```
- Kết quả 

![](../images/18.png)


### 5. Cài đặt Graylog 3.0

- Thêm kho lưu trữ cho Graylog 3.x RPM  và cài đặt Graylog 3.0

``` 
rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-3.0-repository_latest.rpm

yum install graylog-server

```
### 5.1 Config Graylog
- Cần có 1 mật khẩu bí mật và băm mật khẩu người dùng root . Để tạo mật khẩu bí mật ngẫu nhiên dùng lệnh ` pwgen `
```
yum install epel-release
yum install pwgen

```

- Tạo khóa bí mật bằng cách chạy lệnh:  ` pwgen -N 1 -s 96 `
- Băm mật khẩu thành sha256 : ` echo -n "hse@12345" | sha256sum  `

- Kết quả thu được 
	- 5KnU84m0zxT2x90e1JMUTxoREdkEFoZBKsV2nmpe554s4vTBMCNIdhcdugFEQZJWo5JtjWB37zdarkL8iTSk6c24GCdAasCG
	- 82fba6cc9259b2198e0d30ed03f82eaac290110cdf280e4f1a80d9fecf3de524

![](../images/19.png)


- Sửa file cấu hình Graylog trong file ` etc/graylog/server/server.conf `
```
...
password_secret = 5KnU84m0zxT2x90e1JMUTxoREdkEFoZBKsV2nmpe554s4vTBMCNIdhcdugFEQZJWo5JtjWB37zdarkL8iTSk6c24GCdAasCG
...
...
root_password_sha2 = 82fba6cc9259b2198e0d30ed03f82eaac290110cdf280e4f1a80d9fecf3de524

```
- Chuyển địa chỉ Http_bind_address để cho truy caapjj graylog server

![](../images/20.png)

- Mô hình chạy 1 nút elasticsearch nên để giá trị ` elasticsearch_shards ` thành 1 .

![](../images/21.png)



- Cài đặt Rsyslog và thực hiện đẩy qua cổng 8514 ( trong phần cổng lắng nghe UDP và TCP của /etc/rsyslog.conf)

https://github.com/letran3691/Graylog
https://kifarunix.com/install-graylog-3-0-on-centos-7/
https://github.com/letran3691/Graylog























