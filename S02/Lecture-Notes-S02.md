# Lecture Notes S02: Cấu trúc Dữ liệu X.509 v3, Mở rộng ASN.1 & Phân tích Nhị phân

**Học phần:** Cơ sở hạ tầng khóa công khai (ATHK 512) · Lớp CHAT4P  
**Giảng viên:** Nguyễn An Khương (Khoa Khoa học & Kỹ thuật Máy tính, Trường ĐHBK Tp. HCM)  
**Trợ giảng:** Nguyễn Hữu Hoàng Huy  

---

## 1. Cấu trúc Khung Mã hóa TLV (Tag - Length - Value)

Trong chuẩn DER, mỗi phần tử dữ liệu đều được biểu diễn tuần tự dưới dạng 3 trường:
* **Tag (Thẻ nhận dạng):** Xác định kiểu dữ liệu. Ví dụ: `0x02` (INTEGER), `0x03` (BIT STRING), `0x04` (OCTET STRING), `0x06` (OBJECT IDENTIFIER), `0x30` (SEQUENCE).
* **Length (Độ dài):** Số lượng byte của phần dữ liệu Value. Nếu độ dài < 128 byte, dùng dạng ngắn (1 byte). Nếu $\ge$ 128 byte, byte đầu tiên có bit 7 bật (`0x80 | n`) chỉ số byte tiếp theo chứa giá trị độ dài.
* **Value (Giá trị):** Chuỗi byte dữ liệu nhị phân thực tế.

```text
[ TAG : 1 Byte ] [ LENGTH : 1 hoặc nhiều Bytes ] [ VALUE : Chuỗi nội dung ]
```

---

## 2. Giải phẫu SubjectPublicKeyInfo (SPKI)

Khối `SubjectPublicKeyInfo` lưu trữ khóa công khai trong chứng chỉ, có cấu trúc độc lập với thuật toán:

```text
SubjectPublicKeyInfo ::= SEQUENCE {
    algorithm         AlgorithmIdentifier,
    subjectPublicKey  BIT STRING
}

AlgorithmIdentifier ::= SEQUENCE {
    algorithm         OBJECT IDENTIFIER,
    parameters        ANY DEFINED BY algorithm OPTIONAL
}
```

* Đối với **RSA:** Thuật toán có OID `1.2.840.113549.1.1.1`, tham số là `NULL`. `subjectPublicKey` chứa cấu trúc DER của `RSAPublicKey` (gồm Modulus $n$ và Exponent $e$).
* Đối với **ECC (ECDSA):** OID `1.2.840.10045.2.1`, tham số chứa OID của đường cong (ví dụ: `secp256r1` có OID `1.2.840.10045.3.1.7`). `subjectPublicKey` chứa tọa độ điểm trên đường cong $Q = (x, y)$.
* Đối với **ML-DSA (PQC FIPS 204 / RFC 9881):** OID chỉ định mức an toàn (ví dụ: ML-DSA-65 có OID `2.16.840.1.101.3.4.3.18`), tham số vắng mặt (omitted), `subjectPublicKey` chứa chuỗi byte đa thức mạng tinh thể kích thước 1.952 bytes.

---

## 3. Lệnh Mổ xẻ Cấu trúc Chứng thư trên Dòng lệnh

Học viên sử dụng các lệnh chuẩn của OpenSSL để phân tích tầng nhị phân:

```bash
# 1. Trích xuất toàn bộ cây ASN.1 DER dưới dạng bảng thụt đầu dòng
openssl asn1parse -in certs/server.crt -inform PEM -i

# 2. Xem toàn văn các phần mở rộng X.509
openssl x509 -in certs/server.crt -noout -text

# 3. Trích xuất băm khóa công khai (Subject Key Identifier)
openssl x509 -in certs/server.crt -noout -pubkey | openssl pkey -pubin -outform DER | openssl dgst -sha256
```

---

## 4. Tài liệu Tham khảo Mở rộng

1. **RFC 5280:** *X.509 PKI Profile*. [rfc-editor.org/rfc/rfc5280](https://www.rfc-editor.org/rfc/rfc5280)
2. **ITU-T Rec. X.690:** *ASN.1 Encoding Rules (DER)*.
3. **Burton S. Kaliski Jr.:** *A Layman's Guide to a Subset of ASN.1, BER, and DER*, RSA Laboratories, 1993.
