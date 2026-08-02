#!/bin/bash
# =========================================================
# Figma一時URLから画像を assets/ に一括ダウンロードするスクリプト
# ⚠️ URLは発行から約7日で失効します。早めに実行してください。
# 使い方:  bash download_assets.sh
# =========================================================
set -e
cd "$(dirname "$0")"
mkdir -p assets

BASE="https://www.figma.com/api/mcp/asset"

declare -A FILES=(
  ["hero-bg.png"]="ecd1af7a-2eb8-48ad-ad74-dc1455adf565"
  ["logo-white-pc.png"]="634cd2b4-b70c-47bf-af49-a6b8cdb93f4c"
  ["logo-white-sp.png"]="2409e7ab-3af5-4a30-86b3-17ce8e374036"
  ["logo-navy-pc.png"]="9f43b7f8-3e0b-4a17-92e0-4487a7a89229"
  ["logo-navy-sp.png"]="6be074b1-f973-44ad-bdcc-b74692506686"
  ["logo-company.png"]="50033749-08f1-43fb-9600-4b387b8bb062"
  ["client-logo-01.png"]="ad062848-1083-4bc7-98f2-efbe7eac8a03"
  ["client-logo-02.png"]="b96e8563-f8cb-4508-a706-5cd58d87e72c"
  ["client-logo-03.png"]="04b6fa93-b3ca-474c-9b8f-6239a8791649"
  ["client-logo-04.png"]="c21acb92-eeed-4f61-b494-4308a1513811"
  ["client-logo-05.png"]="68b6f33b-c201-44cd-b533-c01b743a53a6"
  ["client-logo-06.png"]="67f0dc66-78eb-4406-a340-a4097f8c977c"
  ["about-photo.png"]="e6523973-c840-4ab1-bad7-b17da04bd68a"
  ["about-side-photo.png"]="dd53ba38-729e-4432-8d93-6936a70814ee"
  ["business-icon-01.png"]="7e32fb52-d417-4362-a7f4-645de0dc5a90"
  ["business-icon-02.png"]="a9bc13ea-e355-4134-bbcb-b533cfe375f4"
  ["business-bg.png"]="14162fa2-985d-44bb-82af-871e6c5307e5"
  ["message-photo.png"]="fa3dfa3b-604e-4490-ad2d-ef8923daa6db"
  ["member-advisor.png"]="764b4879-9d07-4103-b8a2-70d8de49b1cb"
  ["member-coo.png"]="947b8f1f-81f5-4a01-bb6d-7cd9fa8b6c0c"
  ["member-ceo.png"]="df460208-3a77-40d8-8746-6b16b40c6050"
  ["sns-facebook.png"]="f8233249-a599-44fe-b5a8-f75d99daa580"
  ["sns-linkedin.png"]="62c6824f-991e-4fbd-92de-932ea73d908b"
  ["sns-other.png"]="7936c109-44f1-4896-a291-a8a400c14c57"
)

ok=0; ng=0
for name in "${!FILES[@]}"; do
  url="$BASE/${FILES[$name]}"
  echo "downloading: $name"
  if curl -fsSL -o "assets/$name" "$url"; then
    ok=$((ok+1))
  else
    echo "  !! 失敗: $name ($url)"
    ng=$((ng+1))
  fi
done

echo ""
echo "完了: 成功 $ok 件 / 失敗 $ng 件"
if [ $ng -gt 0 ]; then
  echo "失敗があった場合はURLが失効している可能性があります。"
  echo "その場合はFigmaから該当画像を直接エクスポートして assets/ に同名で保存してください。"
fi
