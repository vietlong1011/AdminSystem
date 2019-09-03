### 1.Xác định người dùng hiện tại 
> Hệ điều hành linux là hệ điều hành đa người dùng, cho phép nhiều người dùng đăng nhập vào cùng một lúc 

1. Xác định người dùng hiện tại, sử dụng lệnh:

` whoami `

2. Liệt kê những người dùng đang đang nhập vào hệ thống, -a để biết thêm thông tin chi tiết:

`who -a`

### 2.Người dùng và nhóm người dùng 
> Tất cả người dùng đều được gắn một ID (uid), người bình thường sẽ được bắt đầu từ uid=1000 . Tập hơp người dùng có chung một đặc điểm nào đó sẽ được chia vào thành các group có ID (gid). Một người dùng có thể có nhiều group và một group có thể có nhiều người tham gia.Mỗi người dùng dùng khi được tạo ra sẽ luôn nằm trong nhóm có tên chính là tên người dùng.

1. Hiển thi danh sách nhóm và thành viên của nhóm được chứa trong tệp

` etc/group `

2. gid được liên kết với tên người sử dụng thông qua các tập tin:

` etc/group và etc/passwd `

### 3.Cách tạo và xóa người dùng

> Tất cả các câu lệnh phải được thực hiện bởi quyền hệ thống root.

1. Cách tạo user

` useradd tên_user`

2. Đặt mật khẩu cho user

` passwd tên_user`

3. Xóa user

` userdel tên_user `

4. Cách tạo nhóm 

` groupadd tên_group `

5. Xóa nhóm 

` groupdel tên_group `

6. Thêm người dùng vào group 

` usermod -a -G tên_group tên_user `

### 4.Lệnh chage và getent

#### 4.1 Lệnh chage
> Lệnh chage dùng để thay đổi thông tin hết hạn mật khẩu

- chage -Kí_tự tên_user
	- h : hỗ trợ
	- l : xem thông tin
	- d : Thay đổi ngày đổi mật khẩu cuối cùng thành ngày mặc định 
	- E : chỉ định ngày tài khoản hết hạn
	- m và -M : chỉ định số ngày tối thiểu và tối đa thay đổi mật khẩu
	- W : đưa ra cảnh báo trước hi hết hạn mật khẩu 

#### 4.2 Lệnh getent

> Lệnh getent nhận các mục từ cơ sở dữ liệu administrative. Các cơ sở dữ liệu mà nó tìm kiếm là: ahosts, ahostsv4, ahostsv6, bí danh(aliases), ethers(địa chỉ Ethernet), group, gshadow, hosts, netgroup, networks, passwd, protocols, rpc, services và shadow.

- Cấu trúc lệnh getent 

` getent [database..] [key..] `

vd: 
1. DỊch vụ đang được dùng tại cổng cụ thể

`gentent service 22`

2. Nhận thông tin cho người đăng nhập hiện tại 

`getent passwd `howami` `

3. Thực hiện tra tra cứu người DNS

`getent hosts domain_name `

### 5. Bốn file chính trong quản lý người dùng 

#### 5.1 File passwd 

> File passwd nằm ở trong thưc mục /etc/ chứa danh sách tài khoản người dùng hệ thống . Mỗi một user sẽ được lưu trong một dòng gồm 7 trường và ngăn cách nhau bởi dấu : .Nội dung của các trường đó lần lượt từ trái sang phải sẽ là

- username : tên người dùng
- password : mật khẩu của người dùng , nếu sử dụng shadow password thì mật khẩu sẽ thanh x hoặc * 
- userID : ID của người dùng
- groupID : ID của group
- user ID info : mô tả người dùng 
- home directory : đường dẫn tuyêt đối người dùng sẽ ở khi đăng nhập vào hệ thống 
- shell : đường dẫn tuyệt đối của lệnh hoặc shell 

#### 5.2 File shadow 

> shadown phương thức khác của Linux để lưu trữ mật khẩu của người dùng . Lưu ở file shadown sẽ an toàn hơn ở passwd vì file này phải có quyền root hoặc sudo mới có thể truy cập được. Nội dung của một user sẽ gồm 8 trường ngăn cách nhau bởi dấu : .Nội dung của từng trường lần lượt từ trái sang phải sẽ là

- username
- password đã được mã hóa . Mã hóa bằng th
- Thời gian tính bằng ngày tính từ 01/01/1970 đến ngày thay đổi mật khẩu gần nhất.
- Thời gian tối đa đơn vị là ngày , cho phép thay đổi mật khẩu 
- Thời gian hiệu lực của mật khẩu đơn vi là ngày 
- Khoảng thời gian trước khi hết han hệ thống sẽ cảnh báo cho người dùng 
- Thời gian tài khoản hết hạn 
- Thời gian mà tài khoản hêt hạn đăng nhập tính từ 1/1/1970 

#### 5.3 File group 
> File chứa các bản ghi các nhóm trên hệ thống. Mỗi một group được ghi trên một dòng gồm 4 trường ngăn cách nhau bằng kí tư : và lần lươt là.

- tên group
- mật khẩu của group
- gid ( group ID )
- Danh sách người dùng của nhóm 

#### 5.4 File skel 









































