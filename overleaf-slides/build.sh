#!/usr/bin/env bash
# ==============================================================================
# BIÊN DỊCH TOÀN BỘ CÁC BIẾN THỂ SLIDES BEAMER (PKI HK261 - S01 ĐẾN S09)
# Hỗ trợ 4 biến thể: release (sinh viên), notes (giáo án GV), dual (2 màn hình), present
# ==============================================================================

set -euo pipefail

DECKS="S01 S02 S03 S04 S05 S06 S07 S08 S09"

echo "=================================================================="
echo "    BIÊN DỊCH TOÀN BỘ SLIDES LATEX BEAMER PKI (HK261: S01--S09)   "
echo "=================================================================="

for d in $DECKS; do
  echo "------------------------------------------------------------------"
  echo "[*] Bắt đầu xử lý học liệu buổi: $d"
  for v in release present notes dual; do
    TEX_FILE="${d}_${v}.tex"
    if [ -f "$TEX_FILE" ]; then
      printf "  -> Đang build %-16s ... " "${d}_${v}"
      xelatex -interaction=nonstopmode "$TEX_FILE" >/dev/null 2>&1 || true
      xelatex -interaction=nonstopmode "$TEX_FILE" >/dev/null 2>&1 || true
      ERR_COUNT=$(grep -c '^!' "${d}_${v}.log" 2>/dev/null || true)
      OVERFULL_COUNT=$(grep -c 'Overfull' "${d}_${v}.log" 2>/dev/null || true)
      if [ "$ERR_COUNT" -eq 0 ] && [ -f "${d}_${v}.pdf" ]; then
        echo "[THÀNH CÔNG] (Overfull: ${OVERFULL_COUNT})"
      else
        echo "[LỖI: ${ERR_COUNT}]"
      fi
    fi
  done
done

echo "=================================================================="
echo "[+] Quá trình biên dịch toàn bộ học liệu slides hoàn tất!          "
echo "=================================================================="
