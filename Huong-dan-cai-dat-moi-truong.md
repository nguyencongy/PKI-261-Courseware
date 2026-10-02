# Hướng dẫn Cài đặt Môi trường Thực hành PKI & PQC

Học phần sử dụng môi trường chuẩn hóa trên nền **Docker** và bộ công cụ mã nguồn mở mới nhất hỗ trợ mật mã hậu lượng tử.

---

## 1. Yêu cầu công cụ tối thiểu

```text
┌─────────────────┬──────────────────────┬────────────────────────────────────────────┐
│ Công cụ         │ Phiên bản yêu cầu    │ Mục đích sử dụng                           │
├─────────────────┼──────────────────────┼────────────────────────────────────────────┤
│ Docker Desktop  │ >= 24.0 (Compose v2) │ Chạy các dịch vụ CA, Reverse Proxy, HSM    │
│ Git             │ >= 2.40              │ Đồng bộ bài thực hành và đồ án qua GitHub  │
│ OpenSSL         │ 3.5.x (hoặc Docker)  │ Phân tích ASN.1, sinh khóa FIPS 203/204/205│
│ Step CLI / CA   │ >= 0.25              │ Quản trị CA nội bộ và thử nghiệm ACME      │
└─────────────────┴──────────────────────┴────────────────────────────────────────────┘
```

---

## 2. Khởi tạo môi trường Docker chuẩn

Học viên có thể sử dụng Docker image chuẩn bị sẵn chứa đầy đủ **OpenSSL 3.5**, `step-ca`, và `softhsm2`:

```bash
# Kéo hoặc build container làm việc
docker run -it --name pki-lab -v $(pwd):/workspace ubuntu:24.04 bash

# Kiểm tra phiên bản OpenSSL
openssl version
```

---

## 3. Cấu hình Git và Khóa SSH

Mỗi học viên cần thiết lập khóa SSH để tương tác với repo bài nộp:

```bash
# Tạo cặp khóa SSH Ed25519
ssh-keygen -t ed25519 -C "CHAT4P0xx@kma.edu.vn"

# In khóa công khai để điền vào Form khảo sát lớp
cat ~/.ssh/id_ed25519.pub
```
