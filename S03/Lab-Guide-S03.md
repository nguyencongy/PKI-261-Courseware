# Lab Guide S03: Khởi tạo Hạ tầng CA 2 Tầng & Cấp phát Chứng thư Tự động qua Step-CA

**Mục tiêu:** Xây dựng hệ thống CA 2 tầng bằng Step-CA trên Docker, kích hoạt dịch vụ ACME và cấp phát chứng chỉ tự động cho máy chủ Nginx.

---

## 1. Khởi chạy Step-CA Container

Học viên sử dụng tệp `docker-compose.yml` để khởi chạy Step-CA:

```yaml
services:
  step-ca:
    image: smallstep/step-ca:latest
    container_name: step-ca
    ports:
      - "9000:9000"
    volumes:
      - ./step-data:/home/step
    environment:
      - DOCKER_STEPCA_INIT_NAME=KMA Enterprise CA
      - DOCKER_STEPCA_INIT_DNS_NAMES=localhost,step-ca.kma.internal
      - DOCKER_STEPCA_INIT_PROVISIONER_NAME=admin@kma.edu.vn
```

---

## 2. Kích hoạt Provisioner ACME

Bên trong container hoặc thông qua công cụ `step-cli`:

```bash
# Kích hoạt tính năng ACME Server trên Step-CA
step ca provisioner add acme --type ACME

# Khởi động lại dịch vụ Step-CA để nạp cấu hình mới
```

---

## 3. Cấp phát Chứng thư cho Nginx qua Certbot

```bash
certbot certonly --standalone \
    --server https://localhost:9000/acme/acme/directory \
    -d test.kma.internal \
    --no-verify-ssl
```

---

## 4. Tiêu chí Đánh giá Bài Lab S03

1. Khởi chạy thành công Step-CA với đầy đủ chuỗi Root CA và Intermediate CA.
2. Certbot lấy thành công chứng chỉ từ Step-CA thông qua giao thức ACME.
3. Cấu hình Nginx sử dụng chứng chỉ vừa cấp và truy cập HTTPS thử nghiệm thành công.
