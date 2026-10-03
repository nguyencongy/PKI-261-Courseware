# Lecture Notes S05: Bảo vệ Khóa Riêng tư: SoftHSMv2, PKCS#11 & Chuyển dịch PQC

**Học phần:** Cơ sở hạ tầng khóa công khai (ATHK 512) · Lớp CHAT4P  
**Giảng viên:** Nguyễn An Khương (Khoa Khoa học & Kỹ thuật Máy tính, Trường ĐHBK Tp. HCM · [ORCID: 0000-0002-9910-6387](https://orcid.org/0000-0002-9910-6387))  
**Trợ giảng:** Nguyễn Hữu Hoàng Huy  

---

## 1. Cấu trúc Đối tượng trong Chuẩn PKCS#11

Trong mô hình PKCS#11, phần cứng bảo mật quản lý các đối tượng dưới dạng cây phân cấp:
* **Slot (Khe cắm):** Đại diện cho một cổng đọc vật lý hoặc logic.
* **Token (Thẻ thông minh):** Thiết bị logic được khởi tạo trong slot, bảo vệ bằng mã PIN (User PIN và Security Officer PIN).
* **Cryptographic Objects:**
  * `CKO_PRIVATE_KEY`: Khóa riêng tư, có thuộc tính `CKA_PRIVATE = TRUE` và `CKA_EXTRACTABLE = FALSE`.
  * `CKO_PUBLIC_KEY`: Khóa công khai, phục vụ xác minh chữ ký.
  * `CKO_CERTIFICATE`: Chứng chỉ X.509 lưu kèm khóa.

---

## 2. Kích thước Dữ liệu và Thách thức Phân mảnh TCP của Chữ ký PQC

So sánh định lượng kích thước chữ ký và khóa công khai (Bytes):

| Thuật toán | Loại thuật toán | Khóa Công khai (Bytes) | Chữ ký Số (Bytes) | Tỷ lệ Dôi dư so với ECDSA P-256 |
|---|---|:---:|:---:|:---:|
| **ECDSA P-256** | Đường cong Elip (Cổ điển) | 91 | 72 | **1.0x (Chuẩn tham chiếu)** |
| **RSA-2048** | Phân tích số nguyên (Cổ điển) | 280 | 256 | **3.6x** |
| **ML-DSA-44** | Mạng tinh thể (NIST Level 2) | 1,312 | 2,420 | **33.6x** |
| **ML-DSA-65** | Mạng tinh thể (NIST Level 3) | 1,952 | 3,309 | **46.0x** |
| **ML-DSA-87** | Mạng tinh thể (NIST Level 5) | 2,592 | 4,627 | **64.3x** |

**Hệ quả Kỹ thuật:** Với kích thước gói tin chuẩn MTU mạng Internet là 1.500 Bytes, một chứng chỉ X.509 sử dụng ML-DSA-65 hoặc chuỗi 3 cấp chứng chỉ PQC sẽ vượt quá 8 KB, dẫn tới hiện tượng phân mảnh gói tin TCP (TCP Packet Segmentation) và làm gia tăng độ trễ kết nối.

---

## 3. Tài liệu Tham khảo Mở rộng

1. **OASIS PKCS #11 v3.0 Specification.**
2. **NIST FIPS 203, FIPS 204, FIPS 205 (August 2024).**
3. **Open Quantum Safe:** [openquantumsafe.org](https://openquantumsafe.org)
