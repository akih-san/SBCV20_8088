＜ROMへの書き込み＞

unimon_8086_all.hexファイルをROMに書き込みます。

・512KROMの場合
ROM上の8000Hから書き込みます。HEXファイルのアドレスは
8000Hからになっていますので、そのまま書き込むことが出来ます。

・256KROMの場合
ROM上の0000Hから書き込みます。HEXファイルをロードするROM
アドレスを0番地に指定する必要があります。



＜SBCV20について＞


SBCV20は、電脳伝説さん（@vintagechips）が作成した、V20または8088が動作する
シングルボードコンピューターです。V20(10MHz)が動作し、Z80高速エミュレーション
を楽しむことが出来ます。オレンジピコさんで、ボードが入手できます。

入手先

https://store.shopping.yahoo.co.jp/orangepicoshop/pico-a-037.html

電脳伝説さんのページ

https://vintagechips.wordpress.com/category/8088-v20/

SBCV20技術資料はこちらです。

http://www.amy.hi-ho.ne.jp/officetetsu/storage/sbcv20_techdata.pdf

SBCV20データパックはこちらです。

http://www.amy.hi-ho.ne.jp/officetetsu/storage/sbcv20_datapack.zip


＜Universal Monitorについて＞


Universal Monitorはasanoさんが作成したモニターで、まざまなプロセッサで同一
コマンドで動作します。とてもシンプルで、シングルボーコンピューターの動作確認には
とても適したモニターとなっています。
今回のSBCV20でも、8086バージョンのUniversal Monitorを動作させています。

Universal Monitorの詳細は、こちらです。

https://electrelic.com/electrelic/node/1317


＜豊四季タイニーＢＡＳＩＣ＞


リファレンスは電脳伝説さん（@vintagechips）のページにあります。
詳細は電脳伝説さんのページをご覧ください。

https://vintagechips.wordpress.com/2015/12/06/%E8%B1%8A%E5%9B%9B%E5%AD%A3%E3%82%BF%E3%82%A4%E3%83%8B%E3%83%BCbasic%E7%A2%BA%E5%AE%9A%E7%89%88/

今回は、「sugaのジャンク部屋」で公開されているソースコードを利用しました。

http://www.ne.jp/asahi/suga/junkyard/sbc/sbcz8002/SBCZ8002-ttbasic.zip

sugaのジャンク部屋

http://www.ne.jp/asahi/suga/junkyard/sbc/sbcz8002/


＜GAME-86について＞

・GAME-IIIについて


GAME-IIIは1978年7月号の月刊アスキーで6800用のインタプリタ(機能的に はBASIC)とし
て大西博氏によってアセンブラソースとともに公開されました．その後8080, z80, 6809,
 6502と多くのCPUに移植されました。


・GAME80


GAME80は、高岡洋一さんによってTK-80BS用に作成されたもので、ASCII誌の1979年1月号
に掲載されました。ソースは非公開（と思われる）ですが、バイナリを2022年12月末に、
EMUZ80上で動作するGAME80と、GAME80コンパイラを公開しました。
こちらも、是非ご堪能ください。


GAME-86は、SBCV20上で動作するGAMEインタープリタです。
GAME-86は、「たけおか ぼちぼち日記」さんがＣ言語で記述されたソースを元に、SBCV20
で動作するようにしました。

・「たけおか ぼちぼち日記」

https://ameblo.jp/takeoka/entry-11004344172.html


＜VTLについて＞

著者である電脳伝説さんの「モトローラ6800伝説　第二章　Chapter3プログラムの再現」
でVTLが紹介されていますが、とてもコンパクトなインタプリタです。

また、T. Nakagawa氏がWeb、「VTL(Very Tiny Language)の作成」にてＣ言語で書かれた
ＶＴＬを公開されています。

今回は、このソースをSBCV20で動作するようにしました。

T. Nakagawa氏のWebには、ＶＴＬの基本的なことや、インプリメント方法、サンプルプロ
グラム等がありますので、是非ご覧ください。

また、シロピョン氏のページ「超ミニ言語で遊ぼう（４）みんなで「スタ☆トレ」」で
ＭＳＸ版のＶＴＬで「STAR TREK」を紹介しています。。
（これを動かしたくて、ＶＴＬをSBCV20で動かそうと思ったのですが（笑））

・「VTL(Very Tiny Language)の作成」
http://middleriver.chagasi.com/electronics/vtl.html

・超ミニ言語で遊ぼう（４）みんなで「スタ☆トレ」
https://ameblo.jp/siropyon/entry-11917965564.html



ソースコードは、ライセンスフリーです。
オリジナルのソースコードについては、公開元のライセンスアグリーメントに従うものと
します。
