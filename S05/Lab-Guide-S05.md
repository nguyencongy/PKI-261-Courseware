# Lab Guide S05: Khởi tạo Token SoftHSMv2, Ký số qua PKCS#11 & Benchmark Thuật toán PQC

**Mục tiêu:** Cấu hình SoftHSMv2, khởi tạo token an toàn, thực hiện sinh khóa và ký chứng thư CA thông qua engine PKCS#11, đo đạc kích thước thuật toán ML-DSA.

---

## 1. Khởi tạo Token trong SoftHSMv2

```bash
# 1. Khởi tạo khe cắm token mới
softhsm2-util --init-token --slot 0 --label "KMA-Root-Token" \
    --so-pin 12345678 --pin 1234

# 2. Kiểm tra danh sách token
softhsm2-util --show-slots
```

---

## 2. Ký Chứng thư qua Module PKCS#11 của OpenSSL

```bash
# Sinh cặp khóa và ký chứng chỉ trực tiếp bên trong SoftHSMv2
openssl req -new -x509 -days 3650 \
    -engine pkcs11 -keyform engine \
    -key "pkcs11:token=KMA-Root-Token;object=ca-key;type=private;pin-value=1234" \
    -out root-ca-hsm.crt \
    -subj "/CN=KMA HSM Root CA"
```

---

## 3. Tiêu chí Đánh giá Bài Lab S05

1. Token SoftHSMv2 được khởi tạo đúng chuẩn với User PIN bảo vệ.
2. Chứng chỉ được ký thành công thông qua engine PKCS#11 mà không cần xuất khóa riêng tư ra tệp ngoài đĩa.
3. Chạy thành công chương trình đo kiểm kích thước khóa và chữ ký ML-DSA.
