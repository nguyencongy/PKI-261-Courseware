#!/bin/bash
echo "=========================================="
echo "   KIỂM TRA MÔI TRƯỜNG BÀI LAB S01 - PKI   "
echo "=========================================="

echo -n "[1] OpenSSL: "
openssl version || echo "Chưa cài đặt"

echo -n "[2] Docker Engine: "
docker --version || echo "Chưa cài đặt"

echo -n "[3] Docker Compose: "
docker compose version || echo "Chưa cài đặt"

echo -n "[4] Git Version: "
git --version || echo "Chưa cài đặt"

echo -n "[5] Python3: "
python3 --version || echo "Chưa cài đặt"

echo -n "[6] Kết nối SSH GitHub: "
ssh -T git@github.com 2>&1 | grep -q "successfully authenticated" && echo "Thành công (OK)" || echo "Thất bại"

echo "=========================================="
echo "            XÁC THỰC HOÀN TẤT             "
echo "=========================================="
