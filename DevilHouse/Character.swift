//
//  Character.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/07.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class Character {
    /*
    let text1:[String]=["a","b","c","d","e"]
    let text2:[String]=["ab","ac","ad","ae","af","ag"]
    let text3:[String]=["ba","bb","bc"]
    let text4:[String]=["cja","chb","ccg","cda","cew","cfd","cr","ck","cg","cx","cj"]
    let text5:[String]=["abx","yth","btwny","nty","vdaf","trb","muet","rtwgs","bgs","rbn","nrb","nrwytbtr","nty","nty"]
    let text6:[String]=["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","ら","り","る","れ","ろ","や","ゆ","よ","わ","を","ん"]
    */
// 実際の文章はここに表示
    let text1:[String]=["ここが魔王の城か","魔王はどこだろう","敵か！？","ゴブリンだ","肩慣らしには丁度いいな","早く魔王を見つけないと","俺の剣を受けてみろ","メガスマッシュ","グランドストーム","トルネードキャノン","クリムゾンアロー","デスナックル","魔王はどこだ","侵入者だ","くらえ！","やってやるぜ","休む暇もないな","あたれ！","こいつ！","そこだ！","いまだ！","あまい！","くっこんなとろこで","負けるわけにはいかない","俺に勝てるかな","バーニングクロス","ライフスピリット","ゴブリンが現れた","ゴブリンが現れた","ここが魔王の城か","くらえ！","デビルスラッシュ","ソニックバレッド","ウォータレイン","薄汚いな","ここはどこだ","朝飯前だ","必殺技を使うぞ","受けてみろ","さけられるかな","ゴブリンごときに"]
    let text2:[String]=["よーしレベルが上がったぞ","村のみんな心配してるかな","二階にきたぞ","ガーゴイルが現れた","ガーゴイルが現れた","くらえ！","受けてみろ！","やってやるぜ","必殺！","あたれ！","こいつ！","そこだ！","いまだ！","あまい！","魔王はどこだ","トルネードキャノン","アイスキャノン","トルネードナックル","グランドストーム","クリムゾンアロー","デスナックル","侵入者だ","ライフスピリット","デビルスラッシュ","ウォータレイン","バーニングクロス","デビルブレイク","ブレイブソウル","ブレイブスマッシュ","ブレイブアタック","ブレイブナックル","ブレイブショット","ブレイブクロス","くたばれ！","薄暗いな","まだまだ余裕だな","こんな敵余裕だぜ","お金を手に入れた","経験値を手に入れた"]
    
    let text3:[String]=["魔王様のところへ行かせはしないぞ","骨の魔法使いか？","厄介だな","敵も強くなってきたな","かすり傷を食らったぜ","敵は魔法を使ってくるのか","ようやく半分だな","結構ダメージを食らったな","くらえ！","受けてみろ！","やってやるぜ","必殺！","あたれ！","こいつ！","そこだ！","いまだ！","あまい！","魔王はどこだ","トルネードキャノン","アイスキャノン","トルネードナックル","グランドストーム","クリムゾンアロー","デスナックル","侵入者だ","ライフスピリット","デビルスラッシュ","ウォータレイン","バーニングクロス","デビルブレイク","ブレイブソウル","ブレイブスマッシュ","ブレイブアタック","ブレイブナックル","ブレイブショット","ブレイブクロス","くたばれ！","薄暗いな","まだまだ先は長い","諦めてたまるか","絶対に魔王を倒すんだ","必殺だ！","お金を手に入れた","経験値を手に入れた","敵を倒したぞ","受けて立つ","これで終わりだ","魔法使いが現れた","魔法使いが現れた"]
    let text4:[String]=["ドラゴンだ！","あと少しで魔王のところだぞ","あと少しで魔王のところだ","炎を吐いてくるぞ","炎を吐いてくるぞ","骨のドラゴンが現れた","骨のドラゴンが現れた","負けはしないぞ","くっ体力が減ってきた","くっ体力が減ってきた","まだ負けるわけにはいかない","まだ負けるわけにはいかない","薬草を使う","薬草を使う","くらえ！","受けてみろ！","やってやるぜ","必殺！","あたれ！","こいつ！","そこだ！","いまだ！","あまい！","魔王はどこだ","トルネードキャノン","アイスキャノン","トルネードナックル","グランドストーム","クリムゾンアロー","デスナックル","侵入者だ","ライフスピリット","デビルスラッシュ","ウォータレイン","バーニングクロス","デビルブレイク","ブレイブソウル","ブレイブスマッシュ","ブレイブアタック","ブレイブナックル","ブレイブショット","ブレイブクロス","くたばれ！","まだまだ先は長い","諦めてたまるか","絶対に魔王を倒すんだ","必殺だ！","お金を手に入れた","経験値を手に入れた","敵を倒したぞ","受けて立つ","これで終わりだ"]

    let text5:[String]=["よくきたな小僧","お前が魔王か！","貴様ごときに負けはしないぞ","真の恐怖を教えてやろう","ここで死ぬわけにはいかない","受けてみろ俺の必殺","ククク、我を本気にさせたな","地獄に堕ちるがいい","俺の力はこんなものでは、、、","貴様に世界の半分をやろう","静まれ！俺の右手よ","最後に命乞いをさせてやろう","くらえ！","受けてみろ！","やってやるぜ","必殺！","あたれ！","こいつ！","そこだ！","いまだ！","あまい！","クリムゾンアロー","デスナックル","侵入者だ","ブレイブソウル","ブレイブスマッシュ","ブレイブアタック","ブレイブナックル","ブレイブショット","ブレイブクロス","くたばれ！","おまえが魔王か","地獄に落ちるがいい","魔王が現れた","魔王が現れた","静まれ！俺の右手よ","よくも村のみんなを","よくも村のみんなを","モータルスマッシュ","貴様には負けない","桜ノ太刀！","雪ノ太刀！","霧ノ太刀！","おまえの力はそんなものか","おまえの力はそんなものか","我に勝てるかな","世の中の破滅を","全ては塵となれ","これで終わりにする","受けて立とう","","",""]
     let text6:[String]=["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","に","ぬ","ね","の","は","ひ","ふ","へ","ほ","ま","み","む","め","も","ら","り","る","れ","ろ","や","ゆ","よ","わ","を","ん"]
}