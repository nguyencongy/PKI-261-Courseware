# Lecture Notes S07: Đánh giá Tiến độ Đồ án Giữa kỳ & Thẩm định Thiết kế Kiến trúc

**Học phần:** Cơ sở hạ tầng khóa công khai (ATHK 512) · Lớp CHAT4P  
**Giảng viên:** Nguyễn An Khương (Khoa Khoa học & Kỹ thuật Máy tính, Trường ĐHBK Tp. HCM)  
**Trợ giảng:** Nguyễn Hữu Hoàng Huy  

---

## 1. Phương pháp Đánh giá Ngang hàng Chéo Kép (Peer Review)

Trong môi trường học thuật sau đại học, việc phản biện chéo giữa các nhóm kỹ thuật mang lại giá trị đào tạo sâu sắc:
* Mỗi nhóm đóng vai trò là một "Hội đồng Thẩm định An toàn Độc lập" đối với nhóm được phân công chấm chéo.
* Việc tìm ra lỗ hổng kiến trúc trong bài làm của nhóm bạn chứng minh năng lực hiểu biết sâu sắc của người đánh giá.
* Điểm phản biện chéo được chuẩn hóa và tính trực tiếp vào cột điểm thành phần TP2 theo công thức KMA.

---

## 2. Tiêu chuẩn Thẩm định Mã nguồn và Hồ sơ Báo cáo

Hội đồng thẩm định tập trung vào 4 khía cạnh:
1. **Khả năng Chạy Tái lập (Reproducibility):** Dự án có khởi chạy thành công bằng lệnh duy nhất `docker compose up -d` hay không?
2. **Độ Bao phủ Kịch bản Tự động (Automation Coverage):** Có sẵn các kịch bản kiểm thử hay phải thao tác gõ lệnh thủ công?
3. **Tuân thủ Chuẩn mực RFC/NIST:** Có sử dụng các trường OID và cấu trúc dữ liệu đúng chuẩn quốc tế hay không?
4. **Văn phong Báo cáo Kỹ thuật:** Báo cáo mạch lạc, có trích dẫn tài liệu tham khảo chính thống, không sử dụng biệt ngữ phi học thuật.
