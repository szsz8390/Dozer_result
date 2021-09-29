Dozer - RESULT "NOT" SIMPLE FM
ver. 1.1.0

■このスキンについて

	beatoraja 用のリザルトスキンです。
	RESULT SIMPLE FM をベースに、FullHD (1928 x 1080) で表示できるようにしてあります。
	フォントに採用した x14y20pxScoreDozer がスキン名の元ネタになっています。
	なお、色々付け加えた結果あまりシンプルでもなくなったので "NOT" を付けています。

■特徴

	・レイアウトを大幅に変更
		差分表示を中央に配置し、見やすいようにしています。

	・レイヤ画像の表示
		モバイル音ゲーのように、背景の上にキャラクタなどの画像を
		合わせて表示することができます。

	・FunctionModified 要素
		レイヤ画像のアニメーションやランク画像表示は lua ファイルにより定義されており、
		単なる画像差し替え以上のカスタマイズが可能です。

■導入方法

	"Dozer_result" フォルダを beatoraja の skin フォルダに配置してください。

■カスタマイズ項目の説明

○Main Customize

・Background Image
	・According to Rank
		クリアランクに応じた背景画像を表示します。
	・Clear or Failed
		クリア成否に応じた背景画像を表示します。
	・All
		クリアランクやクリア成否に関わらず、同じフォルダの背景画像を表示します。

・Layer Image
	背景画像の上 (手前) に表示するレイヤ画像の場合分けを設定します。
	設定の種類および効果は Background Image の項目と同様になります。

・Graph Side
	・Left
		グラフを左、ステージファイルを右に表示します。
	・Right
		グラフを右、ステージファイルを左に表示します。

・Difficulty 5 (INSANE) String
	bms ファイルの #DIFFICULTY 定義が 5 にあたる難易度の表記を設定します。
	・INSANE
		bms 式。INSANE (紫色) の表記になります。
	・(BLACK) ANOTHER
		某 DX 式。ANOTHER (黒色) の表記になります。

・Timing (FAST/SLOW) String
	タイミングが早い場合・遅い場合の表記を設定します。
	・FAST/SLOW
		某 DX 式。FAST/SLOW (青色/赤色) の表記になります。
	・EARLY/LATE
		某ボルテ式。EARLY/LATE (赤色/青色) の表記になります。

・Show Current Time
	現在日時の表示を設定します。
	・Off
		現在日時を表示しません。
	・Show Date (y/M/d)
		年月日を表示します。
	・Show Date and Time (y/M/d H:m:s)
		年月日に加え、時分秒も表示します。

・Ending Animation
	リザルト画面を終了する時のアニメーション表示を設定します。
	・Fade Out
		通常のフェードアウト表示です。
	・ModernChic Shutter (needs ModernChic Select Skin)
		ModernChic セレクトスキンのシャッターを利用し、
		シャッターが閉じるアニメーションを表示します。
		このオプションを使うには ModernChic セレクトスキンが必要です。

○Background Image Customize

	背景画像の各フォルダから、表示する画像を設定します。

○Layer Image Customize

	レイヤ画像の各フォルダから、表示する画像を設定します。

○Other

	・Layer Animation
		レイヤ画像表示時のアニメーションを設定します。
		・Guruguru
			画像が中央から回転しながら現れます。その後、落下します。
			lua カスタマイズでできることのデモとして作成しました。
		・LeftToRight
			少し左から右へ減速しつつスライド移動します。
		・NoAnimation
			アニメーションせずに表示します。
		・RightToLeft
			少し右から左へ減速しつつスライド移動します。

	・Rank Image
		グラフ部分に表示される大きいランク表示画像を設定します。
		・Default
			デフォルトのランク画像です。
		・Gray
			デフォルトをグレースケール化したランク画像です。
		・Mono
			デフォルトを白黒のみにしたランク画像です。

	・Stage File Surrogate
		bms にステージファイルが存在しない場合、代わりに表示する画像を設定します。

■カスタムオフセット

	このスキンにはカスタムオフセット定義はありません。
	何か必要だと思ったら、作者に直接要求したり
	"Dozer" "beatoraja" といった単語を含めて Twitter でツイートしたり
	すると標準機能として搭載されるかもしれません。

■注意事項

	元スキン作成者さまの「流用・改変・再配布は自由」というスタンスを継承します。
	このスキンも流用・改変・再配布は自由です。
	ただし、それにより発生した問題について当方は責任を負いかねます。
	また、このスキンについて、元スキン作成者さまに問い合わせることを固く禁じます。

■改変時の注意

	このスキンは動作速度向上を図るため、通常は minify 版 (result_min.lua) をロードします。
	このソースは大変読みにくいため、改変を行う場合は result_src.lua を呼び出すように
	result.luaskin の記述を変更した上で、result_src.lua に変更を加えていくことをオススメします。
	なお、実際に動作速度が向上しているかどうかは未知数です。

■既知の問題点

・リプレイ再生の場合、ゲージオプションが正しくない

	恐らくリプレイのゲージ種別を取得する方法がありません。
	また、リザルト画面の時点ではリプレイかどうかを判別することもできません。
	この問題は、現時点では仕様となります。

■クレジット

(以降、全て敬称略)

	■改変元スキン

	改変と言っていますが、流用しているもの (物理的なリソース) は一応ひとつもありません。

	resalt simple
	vertigo
	http://vertigo_.web.fc2.com/

	RESULT SIMPLE FM
	少々＠星
	http://www.nicovideo.jp/watch/sm23679106

	RESULT SIMPLE FM for beatoraja
	ノラ
	https://twitter.com/noriwo765

	■参考スキン

	ModernChic
	カサコン
	https://www.kasacontent.com/

	■参考資料

	LR2beta3 スキンcsv仕様書 第九版
	.RED
	http://right-stick.sub.jp/lr2skinhelp.html

	beatoraja wiki
	exch-bms2
	https://github.com/exch-bms2/beatoraja/wiki

	■フォント

	源真ゴシック
	© 2014 自家製フォント工房 by MM.
	http://jikasei.me/font/genshin/

	x14y20pxScoreDozer
	© 2018-2019 hicc 患者長ひっく
	http://www17.plala.or.jp/xxxxxxx/00ff/

	■画像

	(CLEAR / FAILED / ALL)
	Triangle Staircase
	Burst
	https://isorepublic.com/photo/triangle-staircase/

	(Rank A)
	Wood Holiday Ornament
	Birch Landing Home
	https://isorepublic.com/photo/wood-holiday-ornament/

	(Rank AA)
	White Horse in Pasture
	Bernard Spragg
	https://isorepublic.com/photo/white-horse-in-pasture/

	(Rank AAA)
	Vintage Car Interior
	Travis Soule
	https://isorepublic.com/photo/vintage-car-interior/

	■lua 関係

	Lua Minifier
	GoOnlineTools
	https://goonlinetools.com/lua-minifier/

■作成者

悠木 鈴
https://twitter.com/suzu_sn_yuuki
https://sz8390.hatenablog.com/


■更新履歴

ver 1.1.0
	beatoraja 0.8.1 のカテゴリ表示に対応
	一部譜面オプション (R-RANDOM / S-RANDOM / SPIRAL / H-RANDOM) が
	正しく反映されていなかった問題を修正

ver 1.0.2
	最終ゲージ値の表示条件が意図通りになっていなかった問題を修正
		(クリア時のみ表示→緑ゲージの場合非クリア時も表示する)
	リプレイの場合、IR RANK 欄に DISABLED を表示するように変更
		(IR オンラインかつ IR 接続が開始されない場合、リプレイ再生と判断)

ver 1.0.1
	IR 接続中の表示が順位表示後も消えない問題を修正

ver 1.0.0
	初版公開
