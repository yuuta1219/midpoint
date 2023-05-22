module PlotsHelper
  def create_cards(plot)
    length_type = plot.length_type
    person = plot.person
    timeline = plot.timeline
    plot.notes.create(title: plot.name, content: "" )
    names = [
              "ACT1[オープニング]",
              "ACT1[テーマの提示]",
              "ACT1[セットアップ]",
              "ACT1[きっかけ]",
              "ACT1[悩みの時]",
              "ACT1[第一ターニングポイント]",
              "ACT2[サブプロット開始]",
              "ACT2[第一の事件(小さいの問題の解決)]",
              "ACT2[第二の事件(大きい問題の解決)]",
              "ACT2[ミッドポイント]",
              "ACT2[転落の始まり]",
              "ACT2[全てを失う]",
              "ACT2[心の暗闇]",
              "ACT2[第二ターニングポイント(最大の問題の解決)]",
              "ACT3[フィナーレ(全ての問題の解決)]",
              "ACT3[エンディング]",
            ]
    explanations = [
                      "全体の約1%を占めます。脚本であれば1ページです。物語の世界に導入される場面であり、登場人物や世界観が紹介されます。読者は物語の世界に没頭する前に、この情報を受け取り、物語の基本的な設定を把握することができます。", 
                      "全体の約1%を占めます。脚本であれば5ページです。物語のテーマを説明します。直接的ではなく、モブの台詞などが好ましいです。", 
                      "全体の約10%を占めます。脚本であれば1~10ページです。物語の舞台が設定され、主要な登場人物の現在の状況が説明されます。この部分で、読者は物語の雰囲気や世界観を理解し、物語に必要な背景情報を得ることができます。",
                      "全体の約1%を占めます。脚本であれば12ページです。物語の鍵となる出来事が発生する場面です。主人公は物語の主軸として、この場面で何らかの困難や問題に直面し、物語の進行方向が決定されます。",
                      "全体の約13%を占めます。脚本であれば12~25ページです。主人公が置かれた状況に対して葛藤する場面であり、物語の進行方向を決定する重要な場面です。主人公の苦悩が描かれることで、読者は共感し、物語に没頭することができます。", 
                      "全体の約1%を占めます。脚本であれば25ページです。物語の展開が大きく変化する場面です。この場面で、主人公が新しい目標を見つけたり、新たな問題が生じたり、物語の方向性が変化するなど、物語の流れに影響を与える大きなイベントが起こります。",          
                      "全体の約1%を占めます。脚本であれば30ページです。物語の中に独立したストーリーラインが存在する場合、そのストーリーが始まる場面です。サブプロットは、物語のテーマを強化し、物語に深みを与えることが多いです。",          
                      "全体の約12%を占めます。脚本であれば30~45ページです。物語の中で主人公が幸せを感じる場面です。この場面の主人公は負けることなく、最初の問題を解決していきます。",         
                      "全体の約12%を占めます。脚本であれば46~55ページです。物語の中で主人公が幸せを感じる場面です。この場面でも、主人公は負けることなく、大きな問題を解決しながら、物語のテンションを上げ、読者を楽しませることが多いです。",      
                      "全体の約1%を占めます。脚本であれば55ページです。物語の中間地点に達する場面です。この場面で、物語の進行状況を振り返り、主人公がどのように変化したかを見ることができます。また、この場面で物語の後半の方向性が明確になることがあります。",          
                      "全体の約20%を占めます。脚本であれば55~75ページです。物語の主人公が物語の敵対勢力に対峙する場面です。大体の場合はこの場面で主人公は敗北や転落していきます。この場面で、主人公は敵と戦うために必要な力を見つけることが多いです。",          
                      "全体の約1%を占めます。脚本であれば75ページです。主人公が物語の中で最も苦しむ場面の1つです。この場面で、主人公が失うことになるものは物語によって異なりますが、主人公の苦難が物語をより深く感じることができます。",          
                      "全体の約1%~10%を占めます。脚本であれば75~85ページです。主人公が自分自身との戦いを続ける場面です。主人公は、過去のトラウマや自己犠牲など、自分自身を克服するための戦いをします。",          
                      "全体の約1%を占めます。脚本であれば85ページです。物語の2度目の大きな転換点です。この場面で、物語の展開が大きく変化し、主人公が新たな目標を見つけたり、問題を解決するための方法を見つけたりします。",          
                      "全体の約25%を占めます。脚本であれば85~110ページです。物語の最高潮に達する場面です。この場面で、主人公は最も重要な決断を下し、物語の問題が解決されます。この場面が物語のハイライトとなり、読者を魅了することが多いです。",         
                      "全体の約1%を占めます。脚本であれば110ページです。物語の最後の場面です。この場面で、主人公が物語を通じて成長したことが示され、読者は物語の結末に満足感を感じることができます。"
                    ]
    modified_explanations = explanations.dup

    case length_type
    when "長編"
      selected_indexes = (0...names.size).to_a
      40.times do |n|
        plot.cards.create(scene: n + 1, point_of_view: person, time_start: timeline , time_end: timeline)
      end
    when "中編"
      selected_indexes = [0, 2, 5, 6, 7, 8, 9, 10, 13, 14, 15]
      20.times do |n|
        plot.cards.create(scene: n + 1, point_of_view: person, time_start: timeline , time_end: timeline)
      end
      modified_explanations[2] = "全体の約10%を占めます。脚本であれば1~10ページです。物語の舞台が設定され、主要な登場人物の現在の状況が説明されます。この部分で、読者は物語の雰囲気や世界観を理解し、物語に必要な背景情報を得ることができます。"
      modified_explanations[5] = "全体の約15%を占めます。脚本であれば10~25ページです。物語の展開が大きく変化する場面です。この場面で、主人公が新しい目標を見つけたり、新たな問題が生じたり、物語の方向性が変化するなど、物語の流れに影響を与える大きなイベントが起こります。"
      modified_explanations[7] = "全体の約12%を占めます。脚本であれば30~45ページです。物語の中で主人公が幸せを感じる場面です。この場面の主人公は負けることなく、最初の問題を解決していきます。"
      modified_explanations[8] = "全体の約12%を占めます。脚本であれば46~55ページです。物語の中で主人公が幸せを感じる場面です。この場面でも、主人公は負けることなく、大きな問題を解決しながら、物語のテンションを上げ、読者を楽しませることが多いです。"
      modified_explanations[9] = "全体の約1%を占めます。脚本であれば55ページです。物語の中間地点に達する場面です。この場面で、物語の進行状況を振り返り、主人公がどのように変化したかを見ることができます。また、この場面で物語の後半の方向性が明確になることがあります。"
      modified_explanations[13] = "全体の約1%を占めます。脚本であれば85ページです。物語の2度目の大きな転換点です。この場面で、物語の展開が大きく変化し、主人公が新たな目標を見つけたり、問題を解決するための方法を見つけたりします。"
      modified_explanations[14] = "全体の約25%を占めます。脚本であれば85~110ページです。物語の最高潮に達する場面です。この場面で、主人公は最も重要な決断を下し、物語の問題が解決されます。この場面が物語のハイライトとなり、読者を魅了することが多いです。"
      modified_explanations[15] = "全体の約1%を占めます。脚本であれば110ページです。物語の最後の場面です。この場面で、主人公が物語を通じて成長したことが示され、読者は物語の結末に満足感を感じることができます。"
    when "短編"
      selected_indexes = [2, 5, 7, 8, 9, 13, 14, 15]
      8.times do |n|
        plot.cards.create(scene: n + 1, point_of_view: person, time_start: timeline , time_end: timeline)
      end
      modified_explanations[2] = "全体の約10%を占めます。脚本であれば1~10ページです。物語の舞台が設定され、主要な登場人物の現在の状況が説明されます。この部分で、読者は物語の雰囲気や世界観を理解し、物語に必要な背景情報を得ることができます。"
      modified_explanations[5] = "全体の約15%を占めます。脚本であれば10~25ページです。物語の展開が大きく変化する場面です。この場面で、主人公が新しい目標を見つけたり、新たな問題が生じたり、物語の方向性が変化するなど、物語の流れに影響を与える大きなイベントが起こります。"
      modified_explanations[7] = "全体の約12%を占めます。脚本であれば30~45ページです。物語の中で主人公が幸せを感じる場面です。この場面の主人公は負けることなく、最初の問題を解決していきます。"
      modified_explanations[8] = "全体の約12%を占めます。脚本であれば46~55ページです。物語の中で主人公が幸せを感じる場面です。この場面でも、主人公は負けることなく、大きな問題を解決しながら、物語のテンションを上げ、読者を楽しませることが多いです。"
      modified_explanations[9] = "全体の約20%を占めます。脚本であれば55~75ページです。物語の中間地点に達する場面と、転落していく場面です。この場面で、物語の進行状況を振り返り、主人公がどのように変化したかを見ることができます。また、この場面で物語の後半の方向性が明確になることがあります。"
      modified_explanations[13] = "全体の約1%を占めます。脚本であれば85ページです。物語の2度目の大きな転換点です。この場面で、物語の展開が大きく変化し、主人公が新たな目標を見つけたり、問題を解決するための方法を見つけたりします。"
      modified_explanations[14] = "全体の約25%を占めます。脚本であれば85~110ページです。物語の最高潮に達する場面です。この場面で、主人公は最も重要な決断を下し、物語の問題が解決されます。この場面が物語のハイライトとなり、読者を魅了することが多いです。"
      modified_explanations[15] = "全体の約1%を占めます。脚本であれば110ページです。物語の最後の場面です。この場面で、主人公が物語を通じて成長したことが示され、読者は物語の結末に満足感を感じることができます。"
    end
    selected_indexes.each_with_index do |selected_index, index|
      plot.eighteen_lines.create(number: index + 1, name: names[selected_index], explanation: modified_explanations[selected_index])
    end
  end

  def tutorials_create_cards(plot)
    length_type = plot.length_type
    person = plot.person
    timeline = plot.timeline

    plot.cards.create(scene: 1, title: "ニャンタウン紹介", body: "ニャンタウンの様子が紹介され、猫たちが楽しく過ごす様子が描かれる。", emotional_value: 20, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 2, title: "主人公登場:", body: "主人公ニャン太が登場し、彼の性格や日常が紹介される。", emotional_value: 25, point_of_view: person, time_start: timeline , time_end: timeline)
    card_first_start = plot.cards.create(scene: 3, title: "友達登場", body: "ニャン太の友達が登場し、それぞれの個性や関係が紹介される。", emotional_value:30, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 4, title: "映画制作チーム到着", body: "映画制作チームがニャンタウンに来て、猫たちが興味津々で見ている。", emotional_value: 35, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 5, title: "職業への興味", body: "猫たちが職業に興味を持ち始め、それぞれが夢を持つようになる。", emotional_value: 40, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 6, title: "ニャン太の決意", body: "ニャン太が映画監督になりたいと決意し、仲間たちに宣言する。", emotional_value: 45, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 7, title: "仲間の夢", body: "仲間たちもそれぞれ職業を目指すことを決意し、夢を語り合う。", emotional_value: 50, point_of_view: person, time_start: timeline , time_end: timeline)
    card_second_start = plot.cards.create(scene: 8, title: "準備と計画", body: "猫たちがそれぞれの職業に必要な知識やスキルを学ぶための準備を始める。", emotional_value: 55, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 9, title: "励まし合い", body: "猫たちが互いに励まし合い、夢を追い求める決意を固める。", emotional_value: 55, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 10, title: "冒険の始まり", body: "猫たちがそれぞれの職業への道を歩み始める。", emotional_value: 60, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 11, title: "映画監督への挑戦:", body: "ニャン太が映画監督としての勉強を始め、初めての挑戦に苦戦する。", emotional_value: 65, point_of_view: person, time_start: timeline , time_end: timeline)
    card_third_start = plot.cards.create(scene: 12, title: "仲間の努力", body: "仲間たちもそれぞれの職業に向けて努力し始めるが、困難に直面する。", emotional_value: 65, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 13, title: "助け合い", body: "猫たちが互いに助け合いながら、困難を乗り越えていく。", emotional_value: 70, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 14, title: "成長", body: "猫たちがそれぞれの職業で成長し始めるが、まだ道半ばであることを実感する。", emotional_value: 75, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 15, title: "ニャン太の葛藤", body: "ニャン太が映画監督としての才能に自信を持てずに悩む。", emotional_value: 80, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 16, title: "仲間の悩み", body: "仲間たちもそれぞれの道で悩みや挫折を経験するが、お互いに助け合う姿が描かれる。", emotional_value: 85, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 17, title: "ニャン太の決意再び", body: "ニャン太が仲間たちと共に励まし合い、映画監督への道を進む決意を新たにする。", emotional_value: 90, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 18, title: "小さな成功", body: "猫たちがそれぞれの職業で小さな成功を収めるが、まだ目標には程遠いことを実感する。", emotional_value: 95, point_of_view: person, time_start: timeline , time_end: timeline)
    card_fourth_start = plot.cards.create(scene: 19, title: "仲間の支え", body: "仲間たちが互いに支え合い、困難を乗り越える力を見つける。", emotional_value: 70, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 20, title: "ミッドポイント", body: "ニャンタウンでお祭りが開かれ、猫たちの成功を祝う。", emotional_value: 50, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 21, title: "自由とは何か", body: "猫たちが自由の本当の意味を理解し始め、自己成長を実現する。", emotional_value: 30, point_of_view: person, time_start: timeline , time_end: timeline)
    card_fifth_start = plot.cards.create(scene: 22, title: "成功の兆し", body: "猫たちがそれぞれの道で成功を収める兆しを見せるが、まだ完全には達成していない。", emotional_value: 0, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 23, title: "挫折:", body: "物語のクライマックスに向け、猫たちが一度挫折を味わう。", emotional_value: 55, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 24, title: "再起:", body: "猫たちが再び立ち上がり、自分たちの夢を追い求める決意をする。", emotional_value: 60, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 25, title: "仲間との協力", body: "猫たちが互いに協力し合い、それぞれの道で困難に立ち向かう。", emotional_value: 65, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 26, title: "ニャン太の脚本", body: "ニャン太が「自由とは何か」をテーマにした映画の脚本を完成させる。", emotional_value: 70, point_of_view: person, time_start: timeline , time_end: timeline)
    card_second_end = plot.cards.create(scene: 27, title: "撮影開始", body: "ニャン太たちが映画の撮影を始め、多くの困難に立ち向かう。", emotional_value: 75, point_of_view: person, time_start: timeline , time_end: timeline)
    card_third_end = plot.cards.create(scene: 28, title: "仲間の協力で乗り越える", body: "仲間たちが助け合いながら困難を乗り越え、映画制作を進める。", emotional_value: 75, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 29, title: "映画制作のクライマックス", body: "ニャン太たちが映画のクライマックスシーンを撮影する。", emotional_value: 80, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 30, title: "映画完成", body: "ニャン太たちが映画制作を完成させる。", emotional_value: 85, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 31, title: "映画上映", body: "ニャン太たちが作った映画がニャンタウンで上映される。", emotional_value: 90, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 32, title: "好評の声:", body: "映画が大成功を収める", emotional_value: 95, point_of_view: person, time_start: timeline , time_end: timeline)
    card_fourth_end = plot.cards.create(scene: 33, title: "仲間の成功", body: "仲間たちもそれぞれの道で成功を収め、夢を実現させる。", emotional_value: 80, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 34, title: "自由の実現:", body: "猫たちが自分たちの夢を追い求めることで、自由を手に入れる。", emotional_value: 85, point_of_view: person, time_start: timeline , time_end: timeline)
    card_first_end = plot.cards.create(scene: 35, title: "ニャン太の成長", body: "ニャン太が映画監督として成長し、自分の夢を達成する姿が描かれる。", emotional_value: 90, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 36, title: "猫たちの幸せ", body: "猫たちがそれぞれの道で成功し、ニャンタウンに幸せが広がる。", emotional_value: 85, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 37, title: "友情の絆", body: "猫たちの友情がより深まり、互いに支え合う姿が描かれる。", emotional_value: 90, point_of_view: person, time_start: timeline , time_end: timeline)
    card_fifth_end = plot.cards.create(scene: 38, title: "ニャンタウンの祝賀会", body: "猫たちの成功を祝うために、ニャンタウンで祝賀会が開かれる。", emotional_value: 95, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 39, title: "自由の意味", body: "猫たちが自分たちの夢を追い求める中で、自由の真の意味を理解し、お互いに敬意を払い合う。", emotional_value: 100, point_of_view: person, time_start: timeline , time_end: timeline)
    plot.cards.create(scene: 40, title: "エンディング", body: "ニャン太と仲間たちが新たな冒険に出発し、物語が幸せな終わりを迎える。", emotional_value: 100, point_of_view: person, time_start: timeline , time_end: timeline)



    names = [
      "ACT1[オープニング]",
      "ACT1[テーマの提示]",
      "ACT1[セットアップ]",
      "ACT1[きっかけ]",
      "ACT1[悩みの時]",
      "ACT1[第一ターニングポイント]",
      "ACT2[サブプロット開始]",
      "ACT2[第一の事件(小さいの問題の解決)]",
      "ACT2[第二の事件(大きい問題の解決)]",
      "ACT2[ミッドポイント]",
      "ACT2[転落の始まり]",
      "ACT2[全てを失う]",
      "ACT2[心の暗闇]",
      "ACT2[第二ターニングポイント(最大の問題の解決)]",
      "ACT3[フィナーレ(全ての問題の解決)]",
      "ACT3[エンディング]",
    ]
    bodies = [
              "ニャンタウンで自由に暮らす猫たちが登場する。",
              "町に映画制作チームが来て、猫たちが職業に興味を持ち始める。",
              "ニャン太が映画監督になりたいと決意し、仲間たちもそれぞれ職業を目指す。",
              "猫たちは職業への挑戦に苦労し、挫折しそうになる。",
              "仲間たちと助け合いながら、猫たちは職業に成功し始める。",
              "猫たちは自由とは何かというテーマを探求し始める。",
              "猫たちはそれぞれの職業で成功し、自由の本当の意味を学び始める。",
              "ニャンタウンでお祭りが開かれ、猫たちの成功が祝われる。",
              "猫たちが自由の本当の意味を理解し、自己成長を実現する。",
              "物語のクライマックスに向け、猫たちが一度挫折を味わう。",
              "猫たちは自分たちがどれだけ成長したかを見つめ直す。",
              "猫たちは再び立ち上がり、自分たちの夢を追い求める決意をする。",
              "ニャン太たちが「自由とは何か」をテーマにした映画を制作し、大成功を収める。",
              "ニャン太たちが新たな夢に向かって旅立つ姿で物語が幕を閉じる。"
            ]
    explanations = [
                      "全体の約1%を占めます。脚本であれば1ページです。物語の世界に導入される場面であり、登場人物や世界観が紹介されます。読者は物語の世界に没頭する前に、この情報を受け取り、物語の基本的な設定を把握することができます。", 
                      "全体の約1%を占めます。脚本であれば5ページです。物語のテーマを説明します。直接的ではなく、モブの台詞などが好ましいです。", 
                      "全体の約10%を占めます。脚本であれば1~10ページです。物語の舞台が設定され、主要な登場人物の現在の状況が説明されます。この部分で、読者は物語の雰囲気や世界観を理解し、物語に必要な背景情報を得ることができます。",
                      "全体の約1%を占めます。脚本であれば12ページです。物語の鍵となる出来事が発生する場面です。主人公は物語の主軸として、この場面で何らかの困難や問題に直面し、物語の進行方向が決定されます。",
                      "全体の約13%を占めます。脚本であれば12~25ページです。主人公が置かれた状況に対して葛藤する場面であり、物語の進行方向を決定する重要な場面です。主人公の苦悩が描かれることで、読者は共感し、物語に没頭することができます。", 
                      "全体の約1%を占めます。脚本であれば25ページです。物語の展開が大きく変化する場面です。この場面で、主人公が新しい目標を見つけたり、新たな問題が生じたり、物語の方向性が変化するなど、物語の流れに影響を与える大きなイベントが起こります。",          
                      "全体の約1%を占めます。脚本であれば30ページです。物語の中に独立したストーリーラインが存在する場合、そのストーリーが始まる場面です。サブプロットは、物語のテーマを強化し、物語に深みを与えることが多いです。",          
                      "全体の約12%を占めます。脚本であれば30~45ページです。物語の中で主人公が幸せを感じる場面です。この場面の主人公は負けることなく、最初の問題を解決していきます。",         
                      "全体の約12%を占めます。脚本であれば46~55ページです。物語の中で主人公が幸せを感じる場面です。この場面でも、主人公は負けることなく、大きな問題を解決しながら、物語のテンションを上げ、読者を楽しませることが多いです。",      
                      "全体の約1%を占めます。脚本であれば55ページです。物語の中間地点に達する場面です。この場面で、物語の進行状況を振り返り、主人公がどのように変化したかを見ることができます。また、この場面で物語の後半の方向性が明確になることがあります。",          
                      "全体の約20%を占めます。脚本であれば55~75ページです。物語の主人公が物語の敵対勢力に対峙する場面です。大体の場合はこの場面で主人公は敗北や転落していきます。この場面で、主人公は敵と戦うために必要な力を見つけることが多いです。",          
                      "全体の約1%を占めます。脚本であれば75ページです。主人公が物語の中で最も苦しむ場面の1つです。この場面で、主人公が失うことになるものは物語によって異なりますが、主人公の苦難が物語をより深く感じることができます。",          
                      "全体の約1%~10%を占めます。脚本であれば75~85ページです。主人公が自分自身との戦いを続ける場面です。主人公は、過去のトラウマや自己犠牲など、自分自身を克服するための戦いをします。",          
                      "全体の約1%を占めます。脚本であれば85ページです。物語の2度目の大きな転換点です。この場面で、物語の展開が大きく変化し、主人公が新たな目標を見つけたり、問題を解決するための方法を見つけたりします。",          
                      "全体の約25%を占めます。脚本であれば85~110ページです。物語の最高潮に達する場面です。この場面で、主人公は最も重要な決断を下し、物語の問題が解決されます。この場面が物語のハイライトとなり、読者を魅了することが多いです。",         
                      "全体の約1%を占めます。脚本であれば110ページです。物語の最後の場面です。この場面で、主人公が物語を通じて成長したことが示され、読者は物語の結末に満足感を感じることができます。"
                    ]

    names.each_with_index do |name, index|
      plot.eighteen_lines.create(number: index+1, name: name, body: bodies[index], explanation: explanations[index])
    end

    foreshadowing_first = plot.foreshadowings.create(name: "伝説の映画監督", body:"ニャン太が伝説の映画監督について語り、彼の作品に憧れを抱いていることが明らかになる。ニャン太が映画監督として成長し、伝説の映画監督に憧れていたことが彼の成功への原動力となる。")
    foreshadowing_second = plot.foreshadowings.create(name: "ミケちゃんの秘密の才能", body:"ミケちゃんが物語の中でスピーチが上手いことがほのめかされる。ミケちゃんがスピーチの才能を活かし、猫たちを勇気づける重要な場面で立ち上がる。")
    foreshadowing_third = plot.foreshadowings.create(name: "コタローの秘密の趣味", body:"コタローが物語の中で絵を描くことが好きだとほのめかされる。コタローが漫画家になることを決意し、その才能が物語の中で重要な役割を果たす。")
    foreshadowing_fourth = plot.foreshadowings.create(name: "ルナの夢", body:" ルナが小説家になる夢を持っているが、まだ自分に自信がないことが明かされる。ルナがついに自分の夢を達成し、小説家として成功を収める。")
    foreshadowing_fifth = plot.foreshadowings.create(name: "シロの恩人", body:"シロが過去に助けられた恩人がいることがほのめかされる。シロの恩人が登場し、シロの過去が明かされ、物語に深みが加わる。")

    ForeshadowingCard.create(card: card_first_start, foreshadowing: foreshadowing_first)
    ForeshadowingCard.create(card: card_first_end, foreshadowing: foreshadowing_first)
    ForeshadowingCard.create(card: card_second_start, foreshadowing: foreshadowing_second)
    ForeshadowingCard.create(card: card_second_end, foreshadowing: foreshadowing_second)
    ForeshadowingCard.create(card: card_third_start, foreshadowing: foreshadowing_third)
    ForeshadowingCard.create(card: card_third_end, foreshadowing: foreshadowing_third)
    ForeshadowingCard.create(card: card_fourth_start, foreshadowing: foreshadowing_fourth)
    ForeshadowingCard.create(card: card_fourth_end, foreshadowing: foreshadowing_fourth)
    ForeshadowingCard.create(card: card_fifth_start, foreshadowing: foreshadowing_fifth)
    ForeshadowingCard.create(card: card_fifth_end, foreshadowing: foreshadowing_fifth)

    image_path = Rails.root.join('app', 'assets', 'images', 'booknekosan.png')
    avatar_image = File.open(image_path)
    plot.characters.create(name:"ニャン太",
      role:"主人公",
      age:"３歳",
      occupation: "無職（冒険を始める前）",
      appearance: "ピンク色",
      personality: "好奇心旺盛で、常に新しいことを学びたがる。チャレンジ精神旺盛で、失敗を恐れず、積極的に挑戦する。人懐っこく、誰とでも仲良くなれる社交的な性格。",
      motivation:" 自分の才能を見つけ、様々な職業に挑戦して、自由で充実した人生を送る",
      relationship: "ミーちゃん（幼馴染）: ニャン太とともに冒険を楽しむ親友で、いつも支え合っている。
                    シャムくん（ライバル）: 自慢話が得意な猫で、ニャン太とはライバル関係。しかし、困った時は助け合う。
                    トラ（先輩）: 経験豊富な猫で、ニャン太たちに様々な知識やスキルを教える役割。
                    ルル（弟子）: ニャン太に憧れ、彼の冒険に参加することになる若い猫。",
      body:"ニャン太は幼い頃から冒険に憧れており、様々な職業に挑戦することで、自分の人生を豊かにするために冒険を始める。物語の中で、彼は映画監督や小説家、漫画家、スピーチの達人を目指すなど、多様な職業に挑戦していく。",
      avatar: avatar_image)
  end
end
