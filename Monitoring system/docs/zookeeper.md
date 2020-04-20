### Zookeeper

### A. Tổng quan về Zookeeper
### 1. Giới thiệu về Zookeeper

> Zookeeper là một dịch vụ (một server) tập chung cho việc duy trì thông tin cấu hình , đặt tên , cung cấp sự đồng bộ phân tán , cung cấp dịch vụ nhóm. Zookeeper là một open source và được viết bằng JAVA 


- Các đặc tính chính của Zookeeper : 
	- Duy trì thông tin cấu hình : Duy trì thông tin cấu hình cụm được chia sẻ với tất cấu hình các node . 
	- Đặt tên : Có thể dùng Zookeeper để đặt tên cho node
	- Cung cấp đồng bộ hóa phân tán : Sử dụng khóa , hàng đợi ... để quản lý và giải quyết vấn đề đồng bộ hóa.
	- Cung cấp dịch vụ nhóm : Cung cấp khả năng làm việc theo nhóm giữa các node với nhau 

### 2. Các chế độ của Zookeeper
#### 2.1 Chế độ độc lập 

![](../images/36.png)  

- Ở chế độ này , tất cả các máy client kết nối trực tiếp với một máy chủ duy nhất.( Mô hình Client -Server bình thường )

#### 2.2 Chế độ nhân rộng

![](../images/37.png)


- Trong chế độ này các máy trong cụm phải biết về nhau , giao tiếp và duy trì cũng như chụp nhanh hình ảnh cụm giao tiếp . Nếu muốn ghi gì đó vào máy chủ thì cần phải thông qua máy chủ Master (leader).


### B. Cài đặt và thiết lập cụm Zookeeper
### 1. Các trường trong Zookeeper

- Các trường cài đặt có trong  file Kafka  ` config/zookeeper.properies ` 
- dataDir : Nơi muốn lưu Zookeeper
- clientPort : Cổng mà client có thể kết nối vào . Mặc định 2181
- maxClientCnxns : Giới hạn số lượng kết nối client tới máy chủ . Default là 60
- server.x = xxxx:2888:3888 ( mỗi zookeeper đề có một mục cấu hình như vậy )
	- x trong server.x là ip của nut zookeeper . Tạo x trong tệp myid và giá trị x trong dataDir phải là duy nhất
	- cổng 2888:3888 cổng để các server trong zookeeper giao tiếp với nhau và dùng để bầu cử lead server.
	- xxxx là địa chỉ Ip của nút Zookeeper .

 	
### 2. Các bươc thiết lập cấu hình Zookeeper
- Chuyển tới thu mục của Kafka ` config/server.properies `

- broker.id :id của broker
- listeners=PLAINTEXT://:9092  : Lắng nghe kết nối kafka tại cổng này (vi du : =PLAINTEXT://10.2.9.53:9092 . 10.2.9.53 là ip của kafka )
- Log.dirs : Thư mục kafka muốn gửi thông của chính nó .
- zookeeper.connect : Danh sách các node Zookeeper riêng biệt.
- advertised.host.name : Tên hoặc ip của broker gửi lên zookeeper








