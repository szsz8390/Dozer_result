Dozer - RESULT "NOT" SIMPLE FM
ver. 1.0.0


■背景画像、レイヤ画像
対応するフォルダは
	AAA: Dozer_result\background\AAA
	AA: Dozer_result\background\AA
	A: Dozer_result\background\A
	CLEAR: Dozer_result\background\CLEAR
	FAILED: Dozer_result\background\FAILED
	ALL: Dozer_result\background\ALL
となります。
レイヤ画像の場合、background フォルダを layer フォルダに読み替えてください。

■表示対象の背景画像、レイヤ画像
・According to Rank
	STAGE FAILED の場合、FAILED フォルダ
	クリアランクが AAA～A の場合、対応するフォルダ
	クリアランクが B 以下の場合、CLEAR フォルダ
・Clear or Failed
	STAGE FAILED の場合、FAILED フォルダ
	クリアした場合 CLEAR フォルダ
・All
	クリアランクやクリア成否に関わらず ALL フォルダ

■背景画像、レイヤ画像のサイズについて
読み込み時に幅や高さを指定せずに読み込んでいるので、
表示される時に勝手に 1920 x 1080 になります。
また、レイヤ画像については Dozer_result\layer\animation\*\layer.lua ファイルで
表示のさせ方を定義できるので、それで任意のサイズ任意の場所に表示させる事も可能です。
ただし、レイヤ画像を Random で表示させる場合、
対象のすべての画像はサイズが揃っている必要があります。

■ステージファイル代替画像
Dozer_result\parts\StageFileSurrogate フォルダ png ファイルを配置すると、
Stage File Surrogate のカスタマイズから設定することができます。
こちらも任意のサイズの画像を指定できますが、
表示される時に 400 x 300 になります。

■lua カスタマイズについて
レイヤ画像の表示方法とランク表示は lua ファイルによるカスタマイズが可能です。
lua の記述方法については、プリセットの lua ファイルも参考にしてください。

・レイヤ画像の表示方法
	Dozer_result\layer\animation\(任意のフォルダ名)\layer.lua
	ファイルを作成し、記述してください。
	戻り値となるローカル変数の parts には destination のみ定義することができます。

	load 関数の引数 ids と ops はペアで、destination に設定すべき id と op の
	リストが渡されます。ふたつのリストは要素数が等しいので、同じ添字で
	アクセスすれば対応する id と op が引き出せます。
	ただしその要素数は表示場合分けのカスタマイズ内容によるので、
	ipairs 関数を使うなどして任意数に対応する必要があります。

・ランク表示
	Dozer_result\parts\rank\(任意のフォルダ名)\rank.lua
	ファイルを作成し、記述してください。
	こちらは rank.png とペアで定義します。戻り値となるローカル変数の parts には
	image と destination を定義することができます。

	load 関数の引数は srcId と basePosLeftInfo です。
	srcId は、image 定義の src に設定する値です。この通りに設定すれば
	lua ファイルと同フォルダ内の rank.png が使われます。
	basePosLeftInfo はデフォルトの左オフセットで、グラフを表示する部分の
	ベースとなる半透明のフレームの x 位置が渡されます。
	この値をもとに destination の x 値を設定すると、
	Graph Side のカスタマイズ内容の変更に応じて
	ランクの表示位置を変更することができます。

