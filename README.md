# KHO HỌC LIỆU CHÍNH THỨC: CƠ SỞ HẠ TẦNG KHÓA CÔNG KHAI (PKI) & PQC

**Mã học phần:** ATHK 512 · **Lớp:** CHAT4P · **Học kỳ:** HK261 (2026–2027)  
**Địa điểm:** Phân hiệu Học viện Kỹ thuật Mật mã tại TP. Hồ Chí Minh  
**Thời gian:** 13h30 – 18h30 Thứ Bảy hàng tuần  

---

## Đội Ngũ Giảng Dạy & Hướng Dẫn

* **Giảng viên phụ trách học phần:**  
  **Nguyễn An Khương**  
  Khoa Khoa học & Kỹ thuật Máy tính, Trường Đại học Bách khoa — ĐHQG-HCM  
  *Mã định danh học thuật:* [ORCID: 0000-0002-9910-6387](https://orcid.org/0000-0002-9910-6387)

* **Trợ giảng học phần (TA):**  
  **Nguyễn Hữu Hoàng Huy**  
  Cựu học viên CHAT3P · [LinkedIn Profile](https://www.linkedin.com/in/nguyen-huu-hoang-huy-abb138366/)  
  *Kênh hỗ trợ:* GitHub Issues / Pull Requests và kênh thảo luận nội bộ lớp.

---

## Tài Liệu Học Tập & Hướng Dẫn Trọng Tâm

0. **Đề Cương Chi Tiết Học Phần Chính Thức (ATHK 512 - KMA):**
   * [Bản văn bản Markdown chuẩn hóa](PKI-261_DE-CUONG-CHI-TIET-HOC-PHAN-KMA.md) — Chi tiết 45 tiết (15 LT, 30 TH), mục tiêu, 3 chương nội dung, 5 tài liệu tham khảo và hình thức thi.
   * [Bản gốc PDF ban hành của KMA](PKI-261_DE-CUONG-CHI-TIET-HOC-PHAN-KMA.pdf) — Đề cương chi tiết học phần chính thức do Học viện Kỹ thuật Mật mã ban hành.
   * [Bản Web HTML](PKI-261_DE-CUONG-CHI-TIET-HOC-PHAN-KMA.html) · [Bản Word DOCX](PKI-261_DE-CUONG-CHI-TIET-HOC-PHAN-KMA.docx)

1. **Tài Liệu Học Tập Chính Thức (Master Textbook - 46 Trang):**
   * [Bản in ấn PDF Chất lượng cao](PKI-261_TAI-LIEU-HOC-TAP-CO-SO-HA-TANG-KHOA-CONG-KHAI.pdf) — Soạn thảo chuẩn lớp `hcmut-textbook.cls`, bìa vector tỉ lệ vàng $\varphi \approx 1.618$, hệ màu `#032B91`, font Schola.
   * [Bản đọc Web HTML Tương tác](PKI-261_TAI-LIEU-HOC-TAP-CO-SO-HA-TANG-KHOA-CONG-KHAI.html) — Hỗ trợ đọc trên trình duyệt di động, công thức toán MathJax sắc nét.
   * [Bản soạn thảo Word DOCX](PKI-261_TAI-LIEU-HOC-TAP-CO-SO-HA-TANG-KHOA-CONG-KHAI.docx)
   * Mã nguồn LaTeX đầy đủ có thể đồng bộ Overleaf tại thư mục [`tai-lieu-hoc-tap/`](tai-lieu-hoc-tap/).

2. **Cẩm Nang Học Viên Toàn Diện (Course Handbook):**
   * [PKI-261_CAM-NANG-HOC-VIEN-TOAN-DIEN.pdf](PKI-261_CAM-NANG-HOC-VIEN-TOAN-DIEN.pdf) — Toàn bộ quy chế, thang điểm, hướng dẫn học tập, danh mục chuẩn RFC.

3. **Hướng Dẫn Cài Đặt Môi Trường Thực Hành:**
   * [Huong-dan-cai-dat-moi-truong.md](Huong-dan-cai-dat-moi-truong.md) — Hướng dẫn cài đặt Docker Compose, OpenSSL 3.5, Step-CA, SoftHSMv2.

---

## Lộ Trình 9 Buổi Học & Kho Tài Liệu Từng Buổi

| Buổi | Ngày học | Chuyên đề trọng tâm | Slide Beamer ĐHBK | Handout & Ghi chú | Bài thực hành |
|:---:|:---:|:---|:---:|:---:|:---:|
| **S01** | 03/10/2026 | Kiến trúc PKI, Mô hình Tin cậy & Đe dọa | [Slide S01](S01/S01-Slides-Beamer.pdf) | [Handout](S01/Handout-S01.pdf) · [Notes](S01/Lecture-Notes-S01.pdf) | [Lab 1 Guide](S01/Lab-Guide-S01.pdf) |
| **S02** | 10/10/2026 | X.509 v3, Cấu trúc ASN.1 DER & Path Validation | [Slide S02](S02/S02-Slides-Beamer.pdf) | [Handout](S02/Handout-S02.pdf) · [Notes](S02/Lecture-Notes-S02.pdf) | [Lab 2 Guide](S02/Lab-Guide-S02.pdf) |
| **S03** | 17/10/2026 | Chính sách CP/CPS (RFC 3647) & Giao thức ACME | [Slide S03](S03/S03-Slides-Beamer.pdf) | [Handout](S03/Handout-S03.pdf) · [Notes](S03/Lecture-Notes-S03.pdf) | [Lab 3 Guide](S03/Lab-Guide-S03.pdf) |
| **S04** | 24/10/2026 | Thu hồi Khóa (CRL/OCSP Stapling) & FIPS 140-3 HSM | [Slide S04](S04/S04-Slides-Beamer.pdf) | [Handout](S04/Handout-S04.pdf) · [Notes](S04/Lecture-Notes-S04.pdf) | [Lab 4 Guide](S04/Lab-Guide-S04.pdf) |
| **S05** | 31/10/2026 | TLS 1.3 Handshake, mTLS & SPIFFE/SPIRE | [Slide S05](S05/S05-Slides-Beamer.pdf) | [Handout](S05/Handout-S05.pdf) · [Notes](S05/Lecture-Notes-S05.pdf) | [Lab 5 Guide](S05/Lab-Guide-S05.pdf) |
| **S06** | 07/11/2026 | Certificate Transparency (RFC 6962) & Tấn công PKI | [Slide S06](S06/S06-Slides-Beamer.pdf) | [Handout](S06/Handout-S06.pdf) · [Notes](S06/Lecture-Notes-S06.pdf) | [Lab 6 Guide](S06/Lab-Guide-S06.pdf) |
| **S07** | 14/11/2026 | Mật mã Hậu lượng tử (PQC NIST) & Bảo vệ Đồ án Đợt 1 | [Slide S07](S07/S07-Slides-Beamer.pdf) | [Handout](S07/Handout-S07.pdf) · [Notes](S07/Lecture-Notes-S07.pdf) | Bảo vệ Nhóm 1 & 2 |
| **S08** | 21/11/2026 | PKI trong Kubernetes, Service Mesh & Bảo vệ Đợt 2 | [Slide S08](S08/S08-Slides-Beamer.pdf) | [Handout](S08/Handout-S08.pdf) · [Notes](S08/Lecture-Notes-S08.pdf) | Bảo vệ Nhóm 3 & 4 |
| **S09** | 28/11/2026 | PKI Quốc gia, Hợp đồng thông minh & Bế mạc | [Slide S09](S09/S09-Slides-Beamer.pdf) | [Handout](S09/Handout-S09.pdf) · [Notes](S09/Lecture-Notes-S09.pdf) | Bảo vệ Nhóm 5 & Bế mạc |

*Mã nguồn LaTeX Beamer của toàn bộ 36 biến thể slide (Release, Present, Notes, Dual) lưu trữ tập trung tại [`overleaf-slides/`](overleaf-slides/).*

---

## Đồ Án Chuyên Đề Nhóm (Capstone Projects)

Thư mục [`Do-an-nhom/`](Do-an-nhom/) chứa toàn bộ khung kỹ thuật, mẫu slide báo cáo và rubric đánh giá cho 5 nhóm:
* **Nhóm 1:** [HashiCorp Vault & mTLS Microservices](Do-an-nhom/Nhom-1-Vault-mTLS-SoftHSM/)
* **Nhóm 2:** [AD CS Vulnerability Analysis (ESC1–ESC8) & Active Directory PKI](Do-an-nhom/Nhom-2-RootCA-Attack-Defense/)
* **Nhóm 3:** [PQC Hybrid X.509 Certificate Migration (ML-KEM / ML-DSA)](Do-an-nhom/Nhom-3-PQC-Root-of-Trust/)
* **Nhóm 4:** [Enterprise Automated ACME Infrastructure (Step-CA)](Do-an-nhom/Nhom-4-CAP-StepCA-ACME/)
* **Nhóm 5:** [Certificate Transparency Log Verification & ZLint Compliance](Do-an-nhom/Nhom-5-TYN-ZLint-CTLogs/)
* **Tiêu chuẩn đánh giá:** [RUBRIC-DANH-GIA-DO-AN-CHUYEN-DE.pdf](Do-an-nhom/RUBRIC-DANH-GIA-DO-AN-CHUYEN-DE.pdf)
* **Mẫu Slide báo cáo:** [SLIDE-MAU-BAO-CAO-DO-AN.pdf](Do-an-nhom/SLIDE-MAU-BAO-CAO-DO-AN.pdf)

---

## Cơ Cấu Đánh Giá Kết Quả Học Tập

Khớp 100% với biểu mẫu quy định của Ban Khảo thí & ĐBCLĐT (Phân hiệu KMA tại TP.HCM):
* **Điểm Quá Trình (30%):**
  * `TP1` (70% của QT): 5 bài Lab thực hành cá nhân (S02 đến S06).
  * `TP2` (30% của QT): Chuyên cần 9 buổi + Quiz tương tác tại lớp.
* **Điểm Kết Thúc Học Phần (70%):**
  * Báo cáo đồ án chuyên đề nhóm, kiểm thử đối kháng và chấm chéo kỹ thuật (S07, S08, S09).\n