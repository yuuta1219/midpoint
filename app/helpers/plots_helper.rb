module PlotsHelper
  def create_cards(plot)
    40.times do |n|
      plot.cards.create(scene: n+1)
    end
    names = [
              "オープニング",
              "セットアップ",
              "きっかけ",
              "悩みの時",
              "第一ターニングポイント",
              "サブプロット開始",
              "お楽しみ",
              "ミッドポイント",
              "迫り来る悪い奴ら",
              "全てを失って",
              "心の暗闇",
              "第二ターニングポイント",
              "フィナーレ",
              "エンディング"
            ]
    explanations = [
                      "物語の世界に導入される場面であり、登場人物や世界観が紹介されます。読者は物語の世界に没頭する前に、この情報を受け取り、物語の基本的な設定を把握することができます。", 
                      "物語の舞台が設定され、主要な登場人物の現在の状況が説明されます。この部分で、読者は物語の雰囲気や世界観を理解し、物語に必要な背景情報を得ることができます。",
                      "物語の鍵となる出来事が発生する場面です。主人公は物語の主軸として、この場面で何らかの困難や問題に直面し、物語の進行方向が決定されます。",
                      "主人公が置かれた状況に対して葛藤する場面であり、物語の進行方向を決定する重要な場面です。主人公の苦悩が描かれることで、読者は共感し、物語に没頭することができます。", 
                      "物語の展開が大きく変化する場面です。この場面で、主人公が新しい目標を見つけたり、新たな問題が生じたり、物語の方向性が変化するなど、物語の流れに影響を与える大きなイベントが起こります。",          
                      "物語の中に独立したストーリーラインが存在する場合、そのストーリーが始まる場面です。サブプロットは、物語のテーマを強化し、物語に深みを与えることが多いです。",          
                      "物語の中で主人公が幸せを感じる場面です。この場面は、物語のテンションを上げ、読者を楽しませることが多いです。",         
                      "物語の中間地点に達する場面です。この場面で、物語の進行状況を振り返り、主人公がどのように変化したかを見ることができます。また、この場面で物語の後半の方向性が明確になることがあります。",          
                      "物語の主人公が物語の敵対勢力に対峙する場面です。この場面で、主人公は敵と戦うために必要な力を見つけることが多いです。また、読者は主人公の成長や強さをより感じることができます。",          
                      "主人公が物語の中で最も苦しむ場面の1つです。この場面で、主人公が失うことになるものは物語によって異なりますが、主人公の苦難が物語をより深く感じることができます。",          
                      "主人公が自分自身との戦いを続ける場面です。主人公は、過去のトラウマや自己犠牲など、自分自身を克服するための戦いをします。",          
                      "物語の2度目の大きな転換点です。この場面で、物語の展開が大きく変化し、主人公が新たな目標を見つけたり、問題を解決するための方法を見つけたりします。",          
                      "物語の最高潮に達する場面です。この場面で、主人公は最も重要な決断を下し、物語の問題が解決されます。この場面が物語のハイライトとなり、読者を魅了することが多いです。",         
                      "物語の最後の場面です。この場面で、主人公が物語を通じて成長したことが示され、読者は物語の結末に満足感を感じることができます。"
                    ]

    names.each_with_index do |name, index|
      plot.eighteen_lines.create(number: index+1, name: name, explanation: explanations[index])
    end
  end
end