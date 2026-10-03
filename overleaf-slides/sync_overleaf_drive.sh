#!/usr/bin/env bash
# ==============================================================================
# ĐỒNG BỘ HAI CHIỀU SLIDES PKI (HK261) GIỮA OVERLEAF VÀ GOOGLE DRIVE
# Kế thừa kiến trúc sync_overleaf_drive.sh từ môn CO5115 của Thầy Nguyễn An Khương
# Tác giả: Nguyễn An Khương <nakhuong@gmail.com> (ORCID: 0000-0002-9910-6387)
# ==============================================================================

set -euo pipefail

GOC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OVERLEAF_DIR="${HOME}/Library/CloudStorage/Dropbox/Apps/Overleaf/PKI-261-Courseware-Slides"

EXCL=(
  --exclude='.DS_Store'
  --exclude='*.aux'
  --exclude='*.log'
  --exclude='*.nav'
  --exclude='*.out'
  --exclude='*.snm'
  --exclude='*.toc'
  --exclude='*.vrb'
  --exclude='*.synctex.gz'
  --exclude='*.fls'
  --exclude='*.fdb_latexmk'
  --exclude='__pycache__'
  --exclude='S??_release.pdf'
  --exclude='S??_notes.pdf'
  --exclude='S??_dual.pdf'
  --exclude='S??_present.pdf'
)

echo "=================================================================="
echo "    ĐỒNG BỘ HAI CHIỀU OVERLEAF <-> GOOGLE DRIVE (PKI HK261)       "
echo "=================================================================="
echo "  Thư mục cục bộ  : ${GOC}"
echo "  Thư mục Overleaf: ${OVERLEAF_DIR}"
echo "=================================================================="

if [ ! -d "${OVERLEAF_DIR}" ]; then
  echo "[*] Thư mục Dropbox Overleaf chưa tồn tại, đang tạo mới: ${OVERLEAF_DIR}..."
  mkdir -p "${OVERLEAF_DIR}"
fi

# Đồng bộ hai chiều: tệp mới hơn sẽ thắng (newer file wins)
echo "[*] Đang đồng bộ Drive -> Overleaf..."
rsync -rtu "${EXCL[@]}" "${GOC}/" "${OVERLEAF_DIR}/"

echo "[*] Đang đồng bộ Overleaf -> Drive..."
rsync -rtu "${EXCL[@]}" "${OVERLEAF_DIR}/" "${GOC}/"

echo "[+] Hoàn tất đồng bộ Overleaf & Drive lúc: $(date '+%Y-%m-%d %H:%M')"
