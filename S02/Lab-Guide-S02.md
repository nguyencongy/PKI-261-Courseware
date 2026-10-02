# Lab Guide S02: Phân tích Cấu trúc Nhị phân ASN.1 & Tạo Chứng chỉ với SAN

**Mục tiêu:** Sử dụng OpenSSL phân tích cấu trúc DER của chứng chỉ mẫu, cấu hình tệp cấu hình sinh chứng chỉ máy chủ có SAN và Basic Constraints chuẩn mực.

---

## 1. Thiết lập Tệp Cấu hình `openssl-custom.cnf`

Học viên tạo tệp cấu hình chỉ định phần mở rộng:

```ini
[req]
distinguished_name = req_distinguished_name
prompt = no
x509_extensions = v3_req

[req_distinguished_name]
C = VN
ST = Ho Chi Minh
O = KMA Cryptography Academy
CN = api.kma.internal

[v3_req]
basicConstraints = critical, CA:FALSE
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = api.kma.internal
DNS.2 = localhost
IP.1 = 127.0.0.1
```

---

## 2. Thực thi Lệnh Tạo Khóa và Chứng chỉ

```bash
# 1. Sinh khóa riêng tư ECDSA trên đường cong P-256
openssl ecparam -name prime256v1 -genkey -noout -out server.key

# 2. Tạo chứng thư tự ký áp dụng phần mở rộng
openssl req -x509 -new -key server.key -out server.crt -days 365 -config openssl-custom.cnf

# 3. Dùng asn1parse để kiểm tra cấu trúc TLV
openssl asn1parse -in server.crt -inform PEM -i | head -n 30
```

---

## 3. Tiêu chí Đánh giá Bài Lab S02

1. Chứng chỉ xuất ra có trường `basicConstraints = critical, CA:FALSE`.
2. Kiểm tra `openssl x509 -in server.crt -noout -ext subjectAltName` hiển thị đúng đầy đủ danh sách DNS và IP.
3. Giải thích được ít nhất 3 mã Tag nhị phân xuất hiện trong kết quả `asn1parse`.
