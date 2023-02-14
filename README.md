■ サービス概要
* 小説、漫画、脚本などを執筆してる人が
* 三幕構成で簡単にプロットを作成できる
* プロット作成補助アプリ【Midpoint】です。

■メインのターゲットユーザー
* 小説、漫画、脚本などを執筆してる人。
* プロットを重視している人。

■ユーザーが抱える課題
* 物語を作りたいが、作り方がわからない。視覚的に分かりやすい作成アプリがない。

■解決方法
* グラフを用いて複雑に絡みある情報を視覚的に表現して分かりやすくする。
* 三幕構成について書かれている本をアプリに落とし込むので作成補助的役割も担う。

■実装予定の機能
* 未ログインユーザー
	* ユーザーがLPを閲覧できる
		* ユーザーは会員登録ができる
		* ユーザーはログインができる。
* ログインユーザー
	* ホーム（作品一覧）画面。
		* 使い方の解説を読む事ができる。
		* プロット一覧の表示、詳細表示、検索、新規作成、編集、削除ができる。
			* プロット詳細画面１。
				* 作品テーマの、編集ができる。
				* ログラインの、編集ができる。
				* 作品タイトルの、編集ができる。
				* 作品ジャンルの、編集ができる。
				* メモの、編集ができる。
				* 作品を１８シーンに分解した項目の、編集ができる。
			* プロット詳細画面２。
				* バックグラウンドストーリーを編集、表示、非表示ができる。
				* 作中時間軸の編集、表示、非表示ができる。
				* グラフの表示、切り替え、非表示ができる。
					* 画面A　x軸、シーン１~40　y軸、感情値　グラフの表示。
					* 画面B　x軸、シーン１~40　y軸、伏線　グラフの表示。
				* 伏線の一覧、編集、削除、表示、非表示ができる。
				* 登場人物の一覧、編集、削除、表示、非表示ができる。
				* ４０枚のシーンカードを編集、表示、非表示ができる。
					* シーンのページ枚数の編集ができる。
					* 場所の編集ができる。
					* 作中時間の編集ができる。
					* 視点の編集ができる。
					* シーンによる感情値の編集ができる。
					* シーンに関連する伏線のタグ付け編集ができる。
					* シーン内容の編集ができる。
					* 出来事を知っている登場人物一覧、編集ができる。
	* マイページ。
		* 登録状況の確認ができる。
		* 名前、メールアドレス、パスワードの編集ができる。
		* ログアウトができる。
		* 退会ができる。
* 管理ユーザー
	* 登録ユーザーの、検索、一覧、詳細、編集、削除ができる。
	* 管理ユーザーの一覧、詳細、作成、編集、削除ができる。

■なぜこのサービスを作りたいのか？
* プロット管理アプリは数多くありますが、視覚的に分かりやすいアプリが無いからです。メインであるグラフを活かして視覚的に分かりやすい管理を可能にしていきたいです。

■スケジュール
* 企画〜技術調査：2/15〆切
* README〜ER図作成：2/15 〆切
* メイン機能実装：2/15 - 3/15
* β版をRUNTEQ内リリース（MVP）：3/15〆切
* 本番リリース：3月末

■画面遷移図
* https://www.figma.com/file/RJaSiVaXYQy1GtwHw1oaBn/%E7%84%A1%E9%A1%8C?node-id=0%3A1&t=jIvmyETzPs7MTGBO-1

■ER図
* https://drive.google.com/file/d/14UvE2D77f59dGzwQPLKvvXuU30XF-DDT/view?usp=sharing