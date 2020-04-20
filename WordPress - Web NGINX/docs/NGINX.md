### 1. Giới thiệu NGINX
> NGINX là phần mềm web-server mã nguồn mở , được dùng làm để phục vụ web-HTTP . Tuy nhiên , ngày nay được dùng để làm reverse proxy, HTTP load
balancer và  email proxy như IMAP , POP3 và SMTP. NGINX sử dụng kiến trúc hướng sự kiện (event-driven) không đồng bộ (asynchronous) giúp server
trở nên tin cậy , tốc độ và khả năng mở rộng lớn nhất.

### 2. Cách hoạt động của NGINX
- NGINX hoạt động theo kiến trúc hướng sự kiện (event-driven) không đồng bộ (asynchronous) , kiến trúc này sẽ gộp những threads tương đồng
nhau vào một tiến trình(process) , mỗi tiến trình(process) sẽ chứa các thực thể nhỏ hơn là worker connections.
- Một worker connection có thể xử lý được 1024 yêu cầu tương tự nhau.Phù hợp cho thương mại điện tử , wordpress, cloud...

### 3. Tương quan NGINX server và APACHE server
- ` Hệ điều hành `: Cả Apache và Nginx đều chạy được trên nhiều distro khác nhau của Linux/Unix. Nhưng Nginx hoạt động trên Windows kém hiệu
quả hơn trên Linux/Unix

- ` Hỗ trợ người dùng ` : Cả hai đều có hệ thống mailling hỗ trợ và Stack Overflow , nhưng Apache thiếu sự hỗ trợ của cty chính của nó.

- ` Hiệu năng ` : NGINX xử lý cùng lúc 1000 kết nối tới nôi dung tĩnh nhanh hơn 2 lần so với Apache và dùng ít bộ nhớ hơn. Khi so sánh trên
nội dung đọng thì cả hai co tốc độ bằng nhau. NGINX được lựa chọn cho web tĩnh nhiều hơn.

