# Lecture Notes S09: Báo cáo Tổng kết Đồ án Chuyên sâu & Đối soát Điểm Công khai

**Học phần:** Cơ sở hạ tầng khóa công khai (ATHK 512) · Lớp CHAT4P  
**Giảng viên:** Nguyễn An Khương (Khoa Khoa học & Kỹ thuật Máy tính, Trường ĐHBK Tp. HCM)  
**Trợ giảng:** Nguyễn Hữu Hoàng Huy  

---

## 1. Yêu cầu Demo Trực tiếp trước Hội đồng

Mỗi nhóm bắt buộc phải chuẩn bị kịch bản demo trực tiếp (Live Demonstration) với các bước:
1. `docker compose down -v`: Xóa sạch trạng thái cũ để chứng minh tính tái lập độc lập.
2. `docker compose up -d`: Khởi chạy toàn bộ hệ thống từ con số 0.
3. Chạy kịch bản `./verify.sh`: Toàn bộ các bước cấp phát chứng chỉ, kiểm thử bắt tay TLS và sinh báo cáo đo kiểm phải vượt qua thành công với mã thoát 0.
4. Trả lời các câu hỏi tình huống bất ngờ từ Hội đồng (ví dụ: mô phỏng thu hồi một chứng chỉ hoặc kiểm tra hành vi khi chứng chỉ hết hạn).

---

## 2. Công thức Tính Điểm Học phần Chuẩn KMA

$$	ext{Điểm Quá trình (DQT)} = 	ext{ROUND}(	ext{Chuyên cần} 	imes 0.7 + 	ext{Điểm Lab TP1} 	imes 0.3, 1)$$

$$	ext{Điểm Học phần Tổng kết} = 	ext{ROUND}(	ext{DQT} 	imes 0.3 + 	ext{Điểm Đồ án KTHP} 	imes 0.7, 1)$$

* Học viên đạt môn khi: Điểm thi kết thúc học phần (KTHP) $\ge 4.0$ và Điểm tổng kết học phần $\ge 4.0$.
