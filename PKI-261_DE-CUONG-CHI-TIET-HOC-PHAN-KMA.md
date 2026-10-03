# ĐỀ CƯƠNG CHI TIẾT HỌC PHẦN
# CƠ SỞ HẠ TẦNG KHÓA CÔNG KHAI (PKI)

**Học viện Kỹ thuật Mật mã · Khoa An toàn Thông tin**  
**Chương trình đào tạo:** Cao học An toàn Thông tin (Lớp CHAT4P) · Học kỳ 261  
**Giảng viên phụ trách:** Nguyễn An Khương (Khoa KH&KT Máy tính, Trường ĐHBK Tp. HCM · [ORCID: 0000-0002-9910-6387](https://orcid.org/0000-0002-9910-6387))  
**Trợ giảng học phần:** Nguyễn Hữu Hoàng Huy ([@HuyLHP](https://github.com/HuyLHP))  

---

## 1. Thông Tin Chung Học Phần

| Thuộc tính | Nội dung quy định |
|:---|:---|
| **Tên học phần** | **Cơ sở hạ tầng khóa công khai** *(Public Key Infrastructure - PKI)* |
| **Mã số học phần** | **ATHK 512** |
| **Số tín chỉ** | **02 (1,1)** |
| **Phân bổ giờ giảng** | **45 tiết** (15 tiết Lý thuyết, 30 tiết Thực hành / Bài tập / Thảo luận) |
| **Khoa, Bộ môn phụ trách** | **Khoa An toàn Thông tin** — Học viện Kỹ thuật Mật mã |
| **Tổ chức GitHub học phần** | [KMA-PKI-261](https://github.com/KMA-PKI-261) |
| **Kho học liệu chính thức** | [PKI-261-Courseware](https://github.com/KMA-PKI-261/PKI-261-Courseware) |
| **Văn bản gốc ban hành** | File PDF chính thức: [`PKI-261_DE-CUONG-CHI-TIET-HOC-PHAN-KMA.pdf`](PKI-261_DE-CUONG-CHI-TIET-HOC-PHAN-KMA.pdf) |

---

## 2. Mục Tiêu Học Phần

Cung cấp các kiến thức cơ bản và chuyên sâu về cơ sở hạ tầng khóa công khai. Qua đó người học có thể nghiên cứu, thiết kế, triển khai và đánh giá ứng dụng cơ sở hạ tầng khóa công khai trong lĩnh vực An toàn Thông tin.

---

## 3. Mô Tả Tóm Tắt Học Phần

Học phần này bao gồm **03 nội dung chính**:
1. **Các kiến thức cơ bản của PKI:** thành phần, kiến trúc phân tầng, các tiêu chuẩn định dạng (X.509, PKCS, RFC 5280).
2. **Quản lý và ứng dụng PKI:** chức năng CA/RA/VA, vòng đời chứng thư số (cấp phát, thu hồi qua CRL/OCSP), tự động hóa quản trị qua ACME RFC 8555 và tích hợp các hệ thống PKI mã nguồn mở.
3. **Các vấn đề an toàn và bảo mật đối với PKI:** an toàn khóa bí mật, mô-đun phần cứng HSM (PKCS#11, SoftHSMv2), kiểm toán chứng chỉ (Certificate Transparency RFC 6962, ZLint), an ninh Active Directory Certificate Services (AD CS) và lộ trình chuyển dịch mật mã hậu lượng tử (PQC NIST FIPS 203/204).

---

## 4. Phân Bổ Nội Dung Chi Tiết (Theo Đề Cương Chính Thức KMA)

| TT | Nội dung chi tiết | Lý thuyết (LT) | Bài tập / Thảo luận (BT/TL) | Thực hành (TH) | Cộng (tiết) | Tài liệu tham khảo |
|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **1** | **Chương 1. Tổng quan về cơ sở hạ tầng khóa công khai**<br>1.1. Giới thiệu<br>1.2. Mật mã khóa công khai<br>1.3. Các định nghĩa và thành phần của PKI<br>1.4. Kiến trúc của PKI<br>1.5. Các loại chứng thư số<br>1.6. Chính sách chứng thư số<br>1.7. Các giải pháp và chuẩn cho PKI<br>1.8. Bài tập thực hành | 4 | 0 | 5 | **9** | [1], [2], [3], [4], [5], [6] |
| **2** | **Chương 2. Quản lý và ứng dụng PKI**<br>2.1. Chức năng của CA/RA/RAO<br>2.2. Quản lý và kiểm tra chứng thư số<br>2.3. Quy trình tổng thể cho việc cấp phát, quản lý và hủy bỏ chứng thư số<br>2.4. Các dịch vụ sử dụng PKI<br>2.5. Giới thiệu về một số CA công cộng<br>2.6. Các hệ thống PKI mã nguồn mở<br>2.7. Bài tập thực hành | 5 | 0 | 15 | **20** | [1], [2], [3], [4], [5], [6] |
| **3** | **Chương 3. Các vấn đề an toàn và đối với PKI**<br>3.1. An ninh, an toàn và bảo mật tổng thể cho một hệ thống PKI<br>3.2. Các tiêu chuẩn và thuật toán mật mã<br>3.3. Vấn đề sinh khóa<br>3.4. Vấn đề lưu khóa bí mật<br>3.5. Lưu trữ và phục hồi khóa<br>3.6. Vấn đề thỏa hiệp khóa bí mật<br>3.7. Hardware Security Module<br>3.8. Các vấn đề an toàn và tin cậy của CA<br>3.9. Một số vấn đề và nguy cơ an toàn khác<br>3.10. Bài tập thực hành | 6 | 0 | 10 | **16** | [1], [2], [3], [4], [6] |
| **TỔNG CỘNG** | | **15** | **0** | **30** | **45** | |

---

## 5. Ma Trận Đối Chiếu Giữa Đề Cương KMA và Lộ Trình 9 Buổi Học Thực Chiến

Để hiện thực hóa 45 tiết chuẩn quy định thành năng lực thực chiến cao học, Giảng viên cấu trúc nội dung thành **9 chuyên đề tương tác gắn liền với Lab Container và Đồ án chuyên sâu**:

| Buổi | Tên Chuyên Đề & Bài Thực Hành | Chương KMA tương ứng | Trọng tâm Kỹ thuật & Chuẩn Quốc tế |
|:---:|:---|:---:|:---|
| **S01** | Khung kiến trúc PKI & An toàn hệ thống tin cậy | Chương 1 (§1.1–§1.4) | QĐ 1875/QĐ-TTg, RFC 5280, X.509 v3, Docker Onboarding |
| **S02** | Phân tầng CA, Cấu trúc X.509 & Mật mã nền tảng | Chương 1 (§1.5–§1.8) | Root CA -> Intermediate CA, ASN.1/DER/PEM, Extensions |
| **S03** | Quản lý vòng đời & Cơ chế thu hồi chứng chỉ | Chương 2 (§2.1–§2.3) | CRL (RFC 5280), OCSP (RFC 6960), OCSP Stapling, Nginx |
| **S04** | Giao thức tự động hóa ACME & Web PKI | Chương 2 (§2.4–§2.6) | ACME (RFC 8555), Step-CA, Certbot, HTTP-01/DNS-01 |
| **S05** | Chính sách & Quy chế chứng thực (CP/CPS Framework) | Chương 1 (§1.6) & Chương 2 (§2.3) | RFC 3647, CA/Browser Forum Baseline Requirements |
| **S06** | Mật mã Hậu lượng tử (PQC) & Chuyển dịch Web PKI | Chương 3 (§3.1–§3.3) | NIST FIPS 203 (ML-KEM), FIPS 204 (ML-DSA), OpenSSL 3.5 + liboqs |
| **S07** | Certificate Transparency Logs & Kiểm định tuân thủ | Chương 2 (§2.2) & Chương 3 (§3.8) | RFC 6962, SCT, Merkle Audit Proof, Kiểm định ZLint |
| **S08** | Bảo vệ Khóa bí mật & Hardware Security Module (HSM) | Chương 3 (§3.4–§3.7) | PKCS#11, SoftHSMv2, HashiCorp Vault, Zero Trust mTLS |
| **S09** | Đánh giá an ninh PKI & Báo cáo Đồ án Chuyên đề | Chương 3 (§3.8–§3.10) | Tấn công ESC1-ESC8 Active Directory CS, Khắc phục lỗi CA |

---

## 6. Danh Mục Tài Liệu Tham Khảo Chính Thức (KMA)

* **[1]** Aditi Gupta, *“Design and Implementation of Public Key Infrastructure on Smart Card Operating System”*, Department of Computer Science and Engineering, Indian Institute of Technology, 2008.
* **[2]** Andre Karamanian, Srinivas Tenneti, Francois Dessart, *“PKI Uncovered: Certificate-Based Security Solutions for Next-Generation Networks”*, Cisco Press, 2011; Carlisle Adams and Mike Just, *“PKI: Ten Years Later”*, 2004.
* **[3]** Carlisle Adams and Steve Lloyd, *“Understanding PKI: Concepts, Standards, and Deployment Considerations”*, 2nd Edition, Addison-Wesley, 2010.
* **[4]** Yvo G. Desmedt (Ed.), *“Secure Public Key Infrastructure, Standards, PGP and Beyond”*, Springer-Verlag, 2013.
* **[5]** Donald E. Sheehy and Michael Greene, *“Trust Service Principles and Criteria for Certification Authorities”*, AICPA/CICA Public Key Infrastructure (PKI) Assurance Task Force, Version 2.0, March 2011.

---

## 7. Phương Pháp Đánh Giá Học Phần

Theo quy định chính thức của Học viện Kỹ thuật Mật mã:

1. **Kiểm tra giữa học phần (Điểm quá trình — Hệ số theo quy chế):**
   * **Hình thức:** 01 Bài tiểu luận / Đồ án kỹ thuật chuyên đề theo nhóm 3 học viên.
   * **Căn cứ đánh giá:**
     - Mã nguồn và báo cáo đồ án nộp trên GitHub (`pki261-nhom*-*`).
     - Kết quả thực nghiệm hệ thống, báo cáo kỹ thuật và nhật ký commit có ký số GPG/SSH.
     - Điểm bài tập thực hành cá nhân hằng tuần (`pki261-lab-*`).
2. **Thi kết thúc học phần:**
   * **Hình thức:** Thi tự luận theo lịch tổ chức tập trung của Học viện.
