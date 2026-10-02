# Lab Guide S04: Triển khai OCSP Responder & Kiểm định Tuân thủ Chứng chỉ với ZLint

**Mục tiêu:** Cấu hình dịch vụ OCSP Responder, thực hiện thao tác thu hồi chứng chỉ và sử dụng công cụ ZLint để phát hiện các lỗi vi phạm cấu hình X.509.

---

## 1. Khởi chạy Dịch vụ OCSP Responder

Học viên sử dụng OpenSSL để dựng máy chủ OCSP Responder thử nghiệm:

```bash
# Khởi chạy OCSP Responder trên cổng 8888
openssl ocsp -index demoCA/index.txt -port 8888 \
    -rsigner ocsp.crt -rkey ocsp.key \
    -CA ca.crt -text
```

---

## 2. Thực hiện Thu hồi và Xác minh

```bash
# 1. Thu hồi chứng chỉ máy chủ trong cơ sở dữ liệu CA
openssl ca -revoke certs/compromised.crt -keyfile ca.key -cert ca.crt

# 2. Truy vấn kiểm tra trạng thái thu hồi
openssl ocsp -issuer ca.crt -cert certs/compromised.crt \
    -url http://127.0.0.1:8888 -CAfile ca.crt
```

---

## 3. Kiểm định Tuân thủ Chuẩn mực với ZLint

```bash
# Chạy ZLint kiểm tra chứng chỉ
zlint -pretty certs/server.crt > results/zlint_report.json

# Lọc các lỗi vi phạm nghiêm trọng (ERROR)
jq '. | to_entries[] | select(.value.result == "ERROR")' results/zlint_report.json
```

---

## 4. Tiêu chí Đánh giá Bài Lab S04

1. OCSP Responder phản hồi chính xác trạng thái `good` trước khi thu hồi và `revoked` sau khi thu hồi.
2. Báo cáo ZLint phân tích rõ ràng các cảnh báo hoặc lỗi vi phạm nếu có.
