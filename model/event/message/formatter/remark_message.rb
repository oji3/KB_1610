
class RemarkMessage
  def output_message(context)
    {
        type: 'text',
        text: choice_serif
    }
  end

  def choice_serif
    serifs = [
        'ゆっくりでもいい。自分の力でやり遂げろ！',
        'オレは絶対にあきらめん',
        'キミは牧をも超える器だ！！オレはそう信じている！！',
        'キミは切れる!!相当切れる!!',
        '１年にしてすでにこれほどゲームに影響力を及ぼすプレイヤーはそうはいないだろう…キミはとてつもないスターになる…　そんな予感がする…',
        'よし！！行こうか！　練習だ！！',
        'オレの監督歴の中で今年のチームが１番練習した １番キツかったはずだ　よくがんばった そろそろMGMが王者になっていいころだ',
        '敗因はこの私！！MGMの選手たちは最高のプレイをした！！',
        'あいつも３年間がんばってきた男なんだ 侮ってはいけなかった...',
        'キミの肉体が…　いや…　細胞が瞬間的に反応した',
        'そう…　今でいえば　オレが仙道　キミが流川みたいなもんだ',
        'それはお前だ　「ビッグ・ジュン」',
        'なぜキミがそこにいるんだぁ!?',
        '小暮はある程度はなしといていい!!',
        'キミをでかくすることはできない。たとえオレがどんな名コーチでもな',
        'もーーー我慢できんっ!!!',
    ]
    serifs.sample
  end
end