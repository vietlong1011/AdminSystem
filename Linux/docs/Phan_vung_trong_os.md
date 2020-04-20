### A. Tổng quan về phân vùng đĩa cứng trong Linux
### 1. Lý thuyết về phân vùng.

- ` Quá trình khởi động ` : Khi cấp nguồn cho máy tính (Power) , `BIOS` sẽ được khởi động đầu tiên và kiểm tra các phần cứng như (ổ cứng đĩa, ram
bàn phím..) đã được kết nối vào máy tính hay chưa . Những phần cứng này sẽ được nap lần lượt vào driver (trình điều khiển _BIOS đã có sẵn driver rồi)
để có thể sử dụng được ngay khi khởi động xong, đồng thời BIOS cũng đi tìm một đoạn chương trình bé xíu được đặt tại phần đầu của đĩa mềm (Boot sector), 
đĩa cứng (MBR – Master Boot Record) để “đùn đẩy trách nhiệm” khởi động tiếp.

- Riêng đối với đĩa cứng, ngoài MBR còn có thêm Boot sector nữa, Boot Sector này “tạm trú” ngay đầu của mỗi phân vùng Primary (sẽ nói sau) và Boot Sector 
của Primary đầu tiên sẽ nằm sau MBR. Tại đây, ta không nói đến đĩa mềm vì quá đơn giản, chỉ cần nạp xong Boot Sector là OK. Đĩa cứng thì phức 
tạp hơn, MBR không nạp ngay hệ điều hành mà còn “bận” phải xác định xem trong đĩa cứng hiện có bao nhiêu phân vùng và phân vùng nào sẽ được 
ưu tiên khởi động. Mỗi phân vùng Primary sẽ “cầm” một cái cờ tên là Active, trong một thời điểm khởi động chỉ có một Primary được phất cờ 
thôi, và khi MBR nhận ra được “em” nào phất thì tức khắc “tống” ngay tiến trình khởi động sang cho Boot Sector của Primary đó làm tiếp. Lúc 
này, Boot Sector mới tìm những tập tin khởi động của hệ điều hành (nếu có) để “chuyển giao công đoạn” và chấm dứt khởi động, phận ai người 
nấy lo mà.


- ` Số lượng phân vùng ` đối với mỗi ổ đĩa cứng, có hai loại phân vùng là: Primary (phân vùng chính) và Extended (phân vùng mở rộng). Primary 
là phân vùng có khả năng khởi động (đã nói ở trên đó). Về mặt vật lý, ổ đĩa cứng chỉ có thể chia làm bốn phân vùng, tức là chỉ cài được tối 
đa bốn hệ điều hành trên một đĩa cứng mà thôi. Tuy nhiên, nếu không có “ham muốn” dùng nhiều hệ điều hành mà chỉ có “ý định” chia nhiều ổ 
đĩa thì có thể dùng phân vùng Extended, phân vùng này cho phép chia bên trong nó nhiều phân vùng con gọi là Logical.


### 2.Lý thuyết phân vùng trong Windows (cấu trúc Basic Disk )

- Tên phân vùng : Hệ điều hành DOS/windows gọi là phân vùng "phất" cờ Active là ổ C . Các phân vùng F , D , E .. gọi là phân vùng logic.

- Ẩn phân vùng Primary  Dos/windows không cho phép 2 phân vùng Primary cùng hoạt động , nên nếu muốn sử dụng được phân vùng logich thì đặt
Acitve cho một Primary thì các Primary khác sẽ "mất tich " hệ thống hoạt động bình thường.

### 3.Lý thuyết phân vùng trong Linux 

- Tên phân vùng : Kerenl của Linux/Unit xây dựng cơ chế truy xuất tất cả các loại đĩa và thiết bị đề ở dạng tập tin. "Chú chim cánh cụt" đặt tên
cho ổ đĩa mềm là `fd` (floppy disk) , ổ đĩa thứ nhất là `fd0` ổ đĩa thứ hai là `fd1` ( chỉ có tối đa 2 ổ đĩa mềm). Đến ổ cứng IDE có tên `hd`(hard disk),
còn nếu ổ cứng SCSI thì có tên là `sd`(SCSI disk). Ổ đĩa cứng hd và sd sẽ có 4 phân vùng Primary lần lượt là sd/hda1 sd/hda2 sd/hda3 sd/hda4.

- Phân vùng tráo dổi SWAP (RAM ảo): Nếu BOS/windows dùng tập tin tráo đổi SWAP để lưu tạm bộ nhớ thì Linux dùng cả phân vùng SWAP (nằm trên Extend tức
là logical) và có kích thước gấp 2 lần kích thước bộ nhớ Ram hiện có trên máy tính. Với những máy tính có dung lượng Ram từ 32G trở lên thì linux
khuyết khích đặt kích thước vụng SWAP bằng với dung lượng RAM.

- Giải phân mảnh (defragment) : Khi làm việc với Windows , ta thường xuyên làm việc "dồn đĩa" giải phân mảnh để tăng tốc độ hệ thống. Tuy nhiên
trong linux đã có đoạn chương trình tự động chống phân mảnh trong khi làm việc. Nhưng phải trả 10% cho dung lượng để phân vùng.