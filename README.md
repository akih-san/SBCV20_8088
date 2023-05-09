＜ROMへの書き込み＞<br>
<br>
unimon_8086_all.hexファイルをROMに書き込みます。<br>
<br>
・512KROMの場合<br>
ROM上の8000Hから書き込みます。HEXファイルのアドレスは<br>
8000Hからになっていますので、そのまま書き込むことが出来ます。<br>
<br>
・256KROMの場合<br>
ROM上の0000Hから書き込みます。HEXファイルをロードするROM<br>
アドレスを0番地に指定する必要があります。<br>
<br>
<br>
＜SBCV20について＞<br>
<br>
SBCV20は、電脳伝説さん（@vintagechips）が作成した、V20または8088が動作する<br>
シングルボードコンピューターです。V20(10MHz)が動作し、Z80高速エミュレーション<br>
を楽しむことが出来ます。オレンジピコさんで、ボードが入手できます。<br>
<br>
入手先<br>
https://store.shopping.yahoo.co.jp/orangepicoshop/pico-a-037.html<br>
<br>
電脳伝説さんのページ<br>
https://vintagechips.wordpress.com/category/8088-v20/<br>
<br>
SBCV20技術資料はこちらです。<br>
http://www.amy.hi-ho.ne.jp/officetetsu/storage/sbcv20_techdata.pdf<br>
<br>
SBCV20データパックはこちらです。<br>
http://www.amy.hi-ho.ne.jp/officetetsu/storage/sbcv20_datapack.zip<br>
<br>
<br>
＜Universal Monitorについて＞<br>
<br>
Universal Monitorはasanoさんが作成したモニターで、まざまなプロセッサで同一<br>
コマンドで動作します。とてもシンプルで、シングルボーコンピューターの動作確認には<br>
とても適したモニターとなっています。<br>
今回のSBCV20でも、8086バージョンのUniversal Monitorを動作させています。<br>
<br>
Universal Monitorの詳細は、こちらです。<br>
https://electrelic.com/electrelic/node/1317<br>
<br>
<br>
＜豊四季タイニーＢＡＳＩＣ＞<br>
<br>
リファレンスは電脳伝説さん（@vintagechips）のページにあります。<br>
詳細は電脳伝説さんのページをご覧ください。<br>
<br>
https://vintagechips.wordpress.com/2015/12/06/%E8%B1%8A%E5%9B%9B%E5%AD%A3%E3%82%BF%E3%82%A4%E3%83%8B%E3%83%BCbasic%E7%A2%BA%E5%AE%9A%E7%89%88/<br>
<br>
今回は、「sugaのジャンク部屋」で公開されているソースコードを利用しました。<br>
http://www.ne.jp/asahi/suga/junkyard/sbc/sbcz8002/SBCZ8002-ttbasic.zip<br>
<br>
sugaのジャンク部屋<br>
http://www.ne.jp/asahi/suga/junkyard/sbc/sbcz8002/<br>
<br>
<br>
＜GAME-86について＞<br>
<br>
・GAME-IIIについて<br>
<br>
GAME-IIIは1978年7月号の月刊アスキーで6800用のインタプリタ(機能的に はBASIC)とし<br>
て大西博氏によってアセンブラソースとともに公開されました．その後8080, z80, 6809,<br>
6502と多くのCPUに移植されました。<br>
<br>
・GAME80<br>
<br>
GAME80は、高岡洋一さんによってTK-80BS用に作成されたもので、ASCII誌の1979年1月号<br>
に掲載されました。ソースは非公開（と思われる）ですが、バイナリを2022年12月末に、<br>
EMUZ80上で動作するGAME80と、GAME80コンパイラを公開しました。<br>
こちらも、是非ご堪能ください。<br>
<br>
GAME-86は、SBCV20上で動作するGAMEインタープリタです。<br>
GAME-86は、「たけおか ぼちぼち日記」さんがＣ言語で記述されたソースを元に、SBCV20<br>
で動作するようにしました。<br>
<br>
・「たけおか ぼちぼち日記」<br>
https://ameblo.jp/takeoka/entry-11004344172.html<br>
<br>
<br>
＜VTLについて＞<br>
<br>
著者である電脳伝説さんの「モトローラ6800伝説　第二章　Chapter3プログラムの再現」<br>
でVTLが紹介されていますが、とてもコンパクトなインタプリタです。<br>
<br>
また、T. Nakagawa氏がWeb、「VTL(Very Tiny Language)の作成」にてＣ言語で書かれた<br>
ＶＴＬを公開されています。<br>
<br>
今回は、このソースをSBCV20で動作するようにしました。<br>
<br>
T. Nakagawa氏のWebには、ＶＴＬの基本的なことや、インプリメント方法、サンプルプロ<br>
グラム等がありますので、是非ご覧ください。<br>
<br>
また、シロピョン氏のページ「超ミニ言語で遊ぼう（４）みんなで「スタ☆トレ」」で<br>
ＭＳＸ版のＶＴＬで「STAR TREK」を紹介しています。<br>
（これを動かしたくて、ＶＴＬをSBCV20で動かそうと思ったのですが（笑））<br>
<br>
・「VTL(Very Tiny Language)の作成」<br>
http://middleriver.chagasi.com/electronics/vtl.html<br>
<br>
・超ミニ言語で遊ぼう（４）みんなで「スタ☆トレ」<br>
https://ameblo.jp/siropyon/entry-11917965564.html<br>
<br>
