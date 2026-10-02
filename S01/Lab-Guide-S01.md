# Lab Guide S01: Onboarding Môi trường Thực hành PKI

**Mục tiêu:** Thiết lập công cụ dòng lệnh, xác thực tài khoản GitHub và kiểm tra cấu trúc mã nguồn phòng lab.

---

## 1. Yêu cầu Tiên quyết

Học viên chuẩn bị môi trường máy trạm cá nhân:
* Hệ điều hành: Linux (Ubuntu 22.04 / 24.04), macOS, hoặc Windows WSL2.
* Công cụ bắt buộc: `git`, `docker`, `docker compose`, `openssl` (phiên bản 3.x), `python3`, `curl`, `jq`.

---

## 2. Kiểm tra Công cụ Dòng lệnh

Chạy lệnh kiểm tra tính sẵn sàng của môi trường:

```bash
# Kiểm tra phiên bản OpenSSL (Yêu cầu phiên bản 3.0 trở lên)
openssl version

# Kiểm tra Docker Engine và Docker Compose
docker --version
docker compose version

# Kiểm tra công cụ quản trị Git và Python
git --version
python3 --version
```

---

## 3. Khởi tạo Khóa SSH và Kết nối GitHub

Học viên sử dụng thuật toán Ed25519 hiện đại để tạo cặp khóa SSH phục vụ đẩy mã nguồn và ký số commit:

```bash
# 1. Sinh cặp khóa SSH Ed25519
ssh-keygen -t ed25519 -C "mahv_chat4p@kma.edu.vn"

# 2. Xem và sao chép khóa công khai để thêm vào tài khoản GitHub
cat ~/.ssh/id_ed25519.pub

# 3. Kiểm tra kết nối an toàn tới GitHub
ssh -T git@github.com
```

---

## 4. Tiêu chí Đánh giá Bài Lab S01

1. Môi trường máy trạm đáp ứng đầy đủ OpenSSL 3.x và Docker.
2. Kết nối thành công tới GitHub thông qua SSH Public Key.
3. Chạy thành công kịch bản xác thực `./verify.sh` tại thư mục bài lab.
