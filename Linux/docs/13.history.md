### Lệnh history giúp ta xem lại những lệnh đã sử dụng, ngoài việc giúp tăng hiệu suất công việc, history cũng được vận dụng nhiều trong quá trình điều tra, xử lý các sự cố bảo mật. Sau đây là vài thủ thuật quan trọng, liệu bạn đã biết hết chưa?

### 1. Log lại thời gian cùng với lệnh được gõ: mặc định history chỉ lưu lệnh mà ko lưu thời gian, gây khó khăn trong quá trình điều tra sự cố. Để log thêm thời gian, chạy lệnh:
- $ echo 'export HISTTIMEFORMAT="%c "' >> ~/.bashrc

- Sau đó tắt terminal đi mở lại hoặc chạy lệnh source ~/.bashrc để có hiệu lực.

### 2. Xóa một dòng trong history: Trường hợp lệnh của mình chứa thông tin nhạy cảm, muốn "xóa dấu vết" trong history thì làm như sau:
- Chạy lệnh history để xác định số thứ tự của lệnh cần xóa (ví dụ: 99)
- Xóa dòng 99 bằng lệnh:
- $ history -d 99

### 3. Xóa toàn bộ history:
- $ history -c

### 4. Thực thi lại lệnh gần nhất với quyền sudo: nhiều trường hợp ta gõ lệnh xong mới phát hiện là không đủ quyền, cần phải sudo. Thay vì trở về lệnh cũ, lùi vào đầu dòng và gõ sudo, có thể dùng cách:
- $ sudo !!

### 5. Thực thi lại một lệnh trong history: xác định số thứ tự của lệnh trong history (ví dụ: 99), thực thi lại bằng cách:
- $ !99

### 6. Liệt kê 10 command gần nhất:
- $ history 10

- Thay 10 bằng con số bạn mong muốn.

### 7. history sẽ được lưu vào file `~/.bash_history` của mỗi user, nếu muốn xem history của user khác thì view file `~/.bash_history` của họ (nếu bạn có đủ quyền).
