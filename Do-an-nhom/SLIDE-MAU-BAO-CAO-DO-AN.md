---
marp: true
theme: default
paginate: true
header: "Học viện KTMM - CHAT4P | Báo cáo Đồ án Chuyên đề PKI (ATHK 512)"
footer: "Giảng viên phụ trách: Nguyễn An Khương (Khoa KH&KT Máy tính, Trường ĐHBK Tp. HCM)"
---

# BÁO CÁO ĐỒ ÁN CHUYÊN ĐỀ PKI
## Đề tài: [TÊN ĐỀ TÀI CỦA NHÓM]

**Nhóm thực hiện:** Nhóm [X]  
**Thành viên:**
1. [Họ và tên thành viên 1] - Trưởng nhóm
2. [Họ và tên thành viên 2] - Thành viên
3. [Họ và tên thành viên 3] - Thành viên

---

# 1. Đặt Vấn Đề & Bối Cảnh Thực Tiễn

* **Thực trạng tại doanh nghiệp / hạ tầng hiện nay:**
  * Thách thức quản lý khóa, chu kỳ chứng chỉ hoặc nguy cơ mất an toàn.
  * Yêu cầu tự động hóa và tuân thủ các tiêu chuẩn quốc tế.
* **Mục tiêu nghiên cứu và triển khai:**
  * Xây dựng hệ thống giải quyết triệt để bài toán.
  * Đo lường hiệu năng và đánh giá an toàn.

---

# 2. Kiến Trúc Hệ Thống Tổng Thể

* **Sơ đồ phân tầng chuỗi tin cậy (Trust Hierarchy):**
  * Root CA (Offline / HSM).
  * Intermediate CA / Issuing CA.
  * End-Entity Services (mTLS / Web / Workload Identity).
* **Các giao thức & Tiêu chuẩn áp dụng:**
  * IETF RFCs / NIST FIPS tương ứng.

---

# 3. Thiết Kế Kỹ Thuật & Tự Động Hóa

* **Container hóa & Triển khai:**
  * Kiến trúc Docker Compose / Kubernetes.
* **Tự động hóa qua Makefile & Shell scripts:**
  * `make up`, `make test`, `make bench`.
* **Cơ chế bảo vệ Khóa riêng tư (Private Key Security):**
  * Không lưu trữ plain-text trên đĩa.
  * Phân quyền truy cập theo nguyên tắc Least Privilege.

---

# 4. Kịch Bản Trình Diễn Thực Tế (Live Demo)

* **Kịch bản 1: Cấp phát chứng chỉ thành công**
  * Luồng yêu cầu, phê duyệt và cấp phát.
* **Kịch bản 2: Bắt tay bảo mật / Xác thực dịch vụ**
  * Phân tích gói tin bắt tay TLS / mTLS.
* **Kịch bản 3: Xử lý sự cố / Thu hồi / Phòng thủ**
  * Chứng minh khả năng phát hiện lỗi hoặc từ chối chứng chỉ không hợp lệ.

---

# 5. Kết Quả Đo Lường & So Sánh (Benchmarks)

* **Hiệu năng & Độ trễ (Latency / Overhead):**
  * Thời gian sinh khóa, cấp chứng chỉ.
  * Kích thước chứng chỉ và gói tin bắt tay mạng.
* **Bảng so sánh định lượng:**
  * Đánh giá trước và sau khi tối ưu hóa.

---

# 6. Kết Luận & Hướng Phát Triển

* **Kết quả đạt được:**
  * Làm chủ công nghệ và triển khai thành công hệ thống.
  * Đáp ứng đầy đủ các yêu cầu an toàn theo chuẩn quốc tế.
* **Khả năng ứng dụng thực tế:**
  * Ứng dụng tại doanh nghiệp, ngân hàng, cơ quan chủ quản.
* **Xin trân trọng cảm ơn Thầy và các bạn đã lắng nghe!**
