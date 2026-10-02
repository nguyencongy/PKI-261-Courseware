# Phiếu Thu thập Thông tin Học viên & Đăng ký Nguyện vọng Đồ án (KMA · CHAT4P)

Học phần: **Cơ sở hạ tầng khóa công khai (ATHK 512)**  
Lớp: **CHAT4P** (Chất lượng cao An toàn thông tin, Phân hiệu Học viện KTMM tại TP.HCM)  
Đối tượng: **17 học viên**  
Hạn chót hoàn thành: **23:59 Chủ Nhật, ngày 04/10/2026**

---

## 1. Mục đích thu thập

1. Cấp phát kho mã nguồn cá nhân trên tổ chức GitHub: `https://github.com/KMA-PKI-261/PKI-261-<MSHV>`.
2. Thiết lập khóa SSH Public Key để học viên đẩy bài thực hành Lab bảo mật.
3. Ghi nhận nguyện vọng chọn 1 trong 5 chủ đề Đồ án chuyên đề nhóm (ưu tiên nguyện vọng 1, 2, 3).
4. Phân chia nhóm đồ án chính thức (5 nhóm, 3–4 học viên/nhóm).

---

## 2. Cấu trúc câu hỏi của Google Form

### Phần I: Thông tin Định danh & Công tác
* **Câu 1 (Bắt buộc - Menu thả xuống):** Mã số học viên (MSHV)
  * *Danh sách 17 MSHV:* `CHAT4P001`, `CHAT4P002`, `CHAT4P003`, `CHAT4P005`, `CHAT4P006`, `CHAT4P009`, `CHAT4P010`, `CHAT4P011`, `CHAT4P012`, `CHAT4P013`, `CHAT4P014`, `CHAT4P015`, `CHAT4P016`, `CHAT4P017`, `CHAT4P018`, `CHAT4P020`, `CHAT12234`.
* **Câu 2 (Bắt buộc - Trả lời ngắn):** Họ và tên học viên.
* **Câu 3 (Bắt buộc - Trả lời ngắn):** Địa chỉ Email chính (để nhận thư mời vào tổ chức GitHub).
* **Câu 4 (Bắt buộc - Trả lời ngắn):** Số điện thoại liên hệ (Zalo).
* **Câu 5 (Bắt buộc - Trả lời ngắn):** Cơ quan công tác & Vị trí chuyên môn hiện tại *(Ví dụ: Công ty Opswat - Malware Analyst, Trung tâm 286 - Kỹ sư ATTT...)*.

### Phần II: Thông tin Kỹ thuật & Tài khoản GitHub
* **Câu 6 (Bắt buộc - Trả lời ngắn):** GitHub Username *(Ví dụ: `triennguyen` - đảm bảo đã tạo tài khoản trên github.com)*.
* **Câu 7 (Bắt buộc - Đoạn):** SSH Public Key *(Dán toàn bộ nội dung tệp `~/.ssh/id_ed25519.pub` hoặc `~/.ssh/id_rsa.pub`, bắt đầu bằng `ssh-ed25519 AAAAC3Nza...`)*.
* **Câu 8 (Bắt buộc - Trắc nghiệm):** Tình trạng chuẩn bị môi trường Docker & OpenSSL 3.5:
  * [ ] Đã cài đặt Docker và chạy thử thành công.
  * [ ] Đã cài đặt nhưng chưa thử nghiệm.
  * [ ] Gặp khó khăn kỹ thuật, cần TA (Mr. Huy) hỗ trợ.

### Phần III: Đăng ký Nhóm & Nguyện vọng Đề tài (Preferences)
*Danh mục 5 chủ đề đồ án chuyên đề:*
1. **Chủ đề 1:** Hạ tầng CA 2 tầng tự động hóa quy mô lớn với Step-CA, ACME và kiểm toán chính sách CP/CPS (RFC 3647, RFC 8555).
2. **Chủ đề 2:** Kiến trúc Zero Trust & mTLS Gateway cho hệ thống Microservices bảo vệ bởi SoftHSMv2 / PKCS#11.
3. **Chủ đề 3:** Thử nghiệm chuyển đổi Hậu lượng tử (PQC Migration) cho Web PKI: Đo lường hiệu năng chuỗi chứng thư ML-DSA (RFC 9881) và ML-KEM (FIPS 203/204).
4. **Chủ đề 4:** Hệ thống kiểm tra và giám sát vòng đời chứng thư số tự động (ZLint, OCSP Stapling, CT Log Monitor).
5. **Chủ đề 5:** Mô phỏng tấn công và phòng thủ hạ tầng PKI: Khóa CA bị xâm phạm, thu hồi khẩn cấp CRL/OCSP và cơ chế ứng phó sự cố.

* **Câu 9 (Bắt buộc - Trắc nghiệm):** Nguyện vọng 1 (Ưu tiên cao nhất) *(Chọn 1 trong 5 chủ đề)*.
* **Câu 10 (Bắt buộc - Trắc nghiệm):** Nguyện vọng 2 (Ưu tiên thứ hai) *(Chọn 1 trong 5 chủ đề)*.
* **Câu 11 (Bắt buộc - Trắc nghiệm):** Nguyện vọng 3 (Dự phòng) *(Chọn 1 trong 5 chủ đề)*.
* **Câu 12 (Tùy chọn - Trả lời ngắn):** Thành viên nhóm dự kiến *(Nếu bạn đã thảo luận trước với 1–2 bạn trong lớp, hãy ghi tên các bạn vào đây. Nếu chưa có nhóm, ghi "Nhờ Thầy/TA ghép nhóm ngẫu nhiên")*.
* **Câu 13 (Tùy chọn - Đoạn):** Đề xuất điều chỉnh hoặc ý kiến chuyên môn riêng gửi Thầy Khương và TA.

> **Cơ chế xử lý trùng đề tài (Conflict Resolution):**  
> Mỗi chủ đề đồ án phân bổ từ 1 đến 2 nhóm phụ trách. Trong trường hợp có nhiều nhóm/học viên cùng chọn một chủ đề ở Nguyện vọng 1 vượt quá chỉ tiêu, Giảng viên sẽ căn cứ vào:
> 1. Tính liên đới với lĩnh vực công tác thực tế của học viên tại cơ quan;
> 2. Thứ tự ưu tiên đăng ký (thời gian gửi form);
> 3. Điều phối sang Nguyện vọng 2 hoặc bốc thăm công khai tại lớp Buổi 2.

---

## 3. Mã Google Apps Script (Tạo Form Tự Động Trong 5 Giây)

Thầy hoặc TA có thể tạo biểu mẫu tự động bằng cách:
1. Mở trang [script.google.com](https://script.google.com) và tạo dự án mới (New Project).
2. Dán đoạn mã bên dưới vào tệp `Code.gs`.
3. Bấm **Run** (`taoGoogleFormPKI`). Toàn bộ Google Form với đầy đủ 13 câu hỏi, danh sách 17 học viên và 5 chủ đề sẽ được sinh tự động. Link biên tập và link gửi học viên sẽ in tại thanh Execution log!

```javascript
function taoGoogleFormPKI() {
  const form = FormApp.create('[KMA - CHAT4P] Phiếu Thu thập Thông tin Học viên & Nguyện vọng Đồ án · PKI (HK261)');
  form.setDescription(
    'Học phần: Cơ sở hạ tầng khóa công khai (ATHK 512)\n' +
    'Lớp: CHAT4P (Chất lượng cao An toàn thông tin, Phân hiệu Học viện KTMM tại TP.HCM)\n\n' +
    'Mục đích: Thu thập tài khoản GitHub cá nhân, khóa SSH để cấp phát kho bài tập, ' +
    'và đăng ký nguyện vọng chủ đề Đồ án chuyên đề nhóm.\n' +
    'Hạn hoàn tất: 23:59 Chủ Nhật, ngày 04/10/2026.'
  );
  form.setAllowResponseEdits(true);

  // --- PHẦN I: THÔNG TIN ĐỊNH DANH ---
  form.addSectionHeaderItem().setTitle('Phần I: Thông tin Định danh & Công tác');
  
  // Câu 1: MSHV
  const dsMSHV = [
    'CHAT4P001 - Vũ Thị Diệu Anh',
    'CHAT4P002 - Nguyễn Tuấn Anh',
    'CHAT4P003 - Diệp Kim Chi',
    'CHAT4P005 - Nguyễn Vĩnh Hiển',
    'CHAT4P006 - Nguyễn Ngọc Hoài',
    'CHAT4P009 - Nguyễn Trần Hoàng Long',
    'CHAT4P010 - Võ Thông Minh',
    'CHAT4P011 - Huỳnh Trần Trọng Nghĩa',
    'CHAT4P012 - Tăng Triển Nguyên (Lớp trưởng)',
    'CHAT4P013 - Võ Minh Nhật',
    'CHAT4P014 - Nguyễn Trường Phú',
    'CHAT4P015 - Nguyễn Đình Quân',
    'CHAT4P016 - Nguyễn Ngọc Sơn',
    'CHAT4P017 - Hồ Quốc Thái',
    'CHAT4P018 - Trần Minh Triết',
    'CHAT4P020 - Nguyễn Công Ý',
    'CHAT12234 - Đoàn Quang Phúc'
  ];
  const mshvItem = form.addListItem();
  mshvItem.setTitle('1. Mã số và Họ tên học viên (MSHV)').setChoiceValues(dsMSHV).setRequired(true);

  // Câu 2: Email
  form.addTextItem().setTitle('2. Địa chỉ Email chính (dùng cho GitHub và thông báo)').setRequired(true);

  // Câu 3: Số điện thoại
  form.addTextItem().setTitle('3. Số điện thoại liên hệ (Zalo)').setRequired(true);

  // Câu 4: Đơn vị công tác
  form.addTextItem().setTitle('4. Đơn vị công tác & Vị trí chuyên môn hiện tại (Ví dụ: Doanh nghiệp CNTT - Kỹ sư Bảo mật, Khối Tài chính - Chuyên viên An toàn Mạng...)').setRequired(true);

  // --- PHẦN II: THIẾT LẬP KỸ THUẬT & GITHUB ---
  form.addSectionHeaderItem().setTitle('Phần II: Thiết lập Kỹ thuật & Kho GitHub');

  // Câu 5: GitHub Username
  form.addTextItem().setTitle('5. GitHub Username (Ví dụ: triennguyen - chính xác tài khoản trên github.com)').setRequired(true);

  // Câu 6: SSH Public Key
  form.addParagraphTextItem().setTitle('6. Khóa công khai SSH (SSH Public Key)').setHelpText('Dán toàn bộ nội dung tệp ~/.ssh/id_ed25519.pub hoặc id_rsa.pub (bắt đầu bằng ssh-ed25519 hoặc ssh-rsa)').setRequired(true);

  // Câu 7: Trạng thái Docker
  const dockerItem = form.addMultipleChoiceItem();
  dockerItem.setTitle('7. Tình trạng chuẩn bị môi trường Docker & OpenSSL 3.5')
    .setChoiceValues([
      'Đã cài đặt Docker và chạy thử thành công',
      'Đã cài đặt nhưng chưa thử nghiệm',
      'Gặp khó khăn kỹ thuật, cần TA hỗ trợ'
    ])
    .setRequired(true);

  // --- PHẦN III: NGUYỆN VỌNG ĐỀ TÀI & NHÓM ---
  form.addSectionHeaderItem().setTitle('Phần III: Đăng ký Nguyện vọng Đồ án Chuyên đề');

  const deTaiOptions = [
    'Chủ đề 1: Hạ tầng CA 2 tầng tự động hóa với Step-CA, ACME và kiểm toán CP/CPS (RFC 3647, RFC 8555)',
    'Chủ đề 2: Kiến trúc Zero Trust & mTLS Gateway cho Microservices bảo vệ bởi SoftHSMv2/PKCS#11',
    'Chủ đề 3: Chuyển đổi Hậu lượng tử (PQC Migration) cho Web PKI: Benchmark ML-DSA & ML-KEM',
    'Chủ đề 4: Hệ thống kiểm tra & giám sát vòng đời chứng thư số tự động (ZLint, OCSP Stapling, CT Logs)',
    'Chủ đề 5: Mô phỏng tấn công & phòng thủ PKI: Khóa CA bị xâm phạm, thu hồi khẩn cấp CRL/OCSP'
  ];

  // Câu 8: Nguyện vọng 1
  form.addMultipleChoiceItem().setTitle('8. Nguyện vọng 1 (Ưu tiên cao nhất)').setChoiceValues(deTaiOptions).setRequired(true);

  // Câu 9: Nguyện vọng 2
  form.addMultipleChoiceItem().setTitle('9. Nguyện vọng 2 (Ưu tiên thứ hai)').setChoiceValues(deTaiOptions).setRequired(true);

  // Câu 10: Nguyện vọng 3
  form.addMultipleChoiceItem().setTitle('10. Nguyện vọng 3 (Dự phòng)').setChoiceValues(deTaiOptions).setRequired(true);

  // Câu 11: Thành viên nhóm dự kiến
  form.addTextItem().setTitle('11. Thành viên nhóm dự kiến (Ghi tên 2-3 bạn nếu đã bàn trước; hoặc ghi "Nhờ Thầy/TA ghép nhóm ngẫu nhiên")').setRequired(false);

  // Câu 12: Ghi chú
  form.addParagraphTextItem().setTitle('12. Đề xuất điều chỉnh hoặc ý kiến chuyên môn gửi Giảng viên & TA').setRequired(false);

  Logger.log('Đã tạo Google Form thành công!');
  Logger.log('Link biên tập (Edit URL): ' + form.getEditUrl());
  Logger.log('Link gửi học viên (Published URL): ' + form.getPublishedUrl());
}
```
