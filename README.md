# PRIME PARTNER — コーポレートサイト ソースコード

Figmaデザイン「PRIME-PARTNER」（PC 1440px / SP 390px）を元に作成した静的サイトです。

## ファイル構成

```
prime-partner/
├── index.html      … 全セクション（HERO / LOGO / ABOUT / BUSINESS / FLOW / MESSAGE / MEMBER / CTA / COMPANY / footer）
├── css/style.css   … PC・SP両対応のレスポンシブCSS（ブレークポイント: 900px）
├── js/main.js      … スクロール時ヘッダー切り替え・SPハンバーガーメニュー
└── README.md
```

## 表示方法

`index.html` をブラウザで開くだけで表示できます。
（ローカルサーバー推奨: `python3 -m http.server` など）

## ⚠️ ホスト前に必須: 画像のダウンロード

HTMLは `assets/` 内のローカル画像を参照する構成になっていますが、
画像ファイル本体はFigmaの一時URLから取得する必要があります（**URLは約7日で失効**）。

### 手順（Mac / Linux / WSL / Git Bash）

```bash
bash download_assets.sh
```

これで24枚の画像が `assets/` に保存され、そのままホストできる状態になります。

### 失効してしまった場合

Figmaで該当レイヤーを選択 → 右パネル「Export」からPNG書き出しし、
`assets/` に以下のファイル名で保存してください:

hero-bg.png / logo-white-pc.svg / logo-white-sp.svg / logo-navy-pc.svg / logo-navy-sp.svg / logo-company.svg /
client-logo-01〜06.png / about-photo.png / about-side-photo.png / business-icon-01〜02.png / business-bg.png /
message-photo.png / member-advisor.png / member-coo.png / member-ceo.png / sns-facebook.svg / sns-linkedin.svg / sns-other.svg

## フォントについて

- 日本語: **Noto Sans JP**（Google Fonts）
- 欧文見出し: デザインで使用されている **Momo Trust Sans** は一般配布されていないため、
  代替として **Montserrat** を読み込んでいます。
  ライセンスをお持ちの場合は `@font-face` で差し替え、`--font-en` 変数を変更してください。

## デザイントークン（CSS変数）

| 変数 | 値 | 用途 |
|---|---|---|
| `--navy` | `#000e33` | メインカラー（紺） |
| `--gold` | `#d2bf6c` | アクセント（金） |
| `--gold-dark` | `#af9f5b` | ネームプレート枠・フッター文字 |
| `--beige` | `#eeece5` | メンバー背景・フッター背景 |
| `--gray` | `#f5f5f5` | セクション背景 |
| `--flow-1〜4` | `#86b1dc / #4779aa / #1d548c / #d2bf6c` | FLOWステップカラー |

## 実装メモ

- FLOWの矢印バナー、CONTACTボタンの二重枠、SCROLLインジケーター、キャレット・封筒アイコンは
  画像に依存しない **CSS / インラインSVG** で再現しています。
- MEMBERセクションはPCで「Advisor → COO → CEO」、SPで「CEO → COO → Advisor」と
  デザイン通りに並び順が変わります（CSS `order` で制御）。
- BUSINESSのサービスアイコン2点は複雑な合成イラストのため、Figmaレンダリング画像（PNG）を使用しています。
