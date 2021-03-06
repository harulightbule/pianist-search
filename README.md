# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_one :pianist
- has_many :comments


## pianists テーブル

| Column   | Type   | Options     |
| -------- | -----  | ----------  |
| school   | text   | null: false |
| repert   | text   | null: false |
| area     | string | null: false |
| money    | text   | null: false |
| message  | text   |             |
| video    | text   |             |

### Association

- belongs_to :user
- has_many :comments



# comments テーブル

| Column   | Type      | Options           |
| ---------|-----------|-------------------|
| user     | reference | foreign_key: true |
| pianist  | reference | foreign_key: true |
| text     | text      |                   |

### Association

- belongs_to :user
- belongs_to :pianist

# ER図  
[![Image from Gyazo](https://i.gyazo.com/5d19b3a41d4883c915a67f34c55f38ff.png)](https://gyazo.com/5d19b3a41d4883c915a67f34c55f38ff)  

# アプリケーションの概要
声楽家がコンサートやレッスン等でピアノの伴奏者が必要な際に伴奏者を探す事が出来る、  
又は、伴奏者として登録する事が出来るアプリケーションを作成しました。  
ユーザー登録すると伴奏者として登録する事が出来、編集と消去が出来ます。  
又、お問い合わせフォームから管理者にフォームを送る事で伴奏者と直接やり取りが出来る様になります。  

## 接続先情報
*   https://pianist-search-app.herokuapp.com/

### ID/Pass
* ID: haru
* Pass: 0326
### テスト用アカウント等
* 伴奏者用
  * メールアドレス: dddddd@sample.com
  * パスワード: asd10231
* これから伴奏者として登録するユーザー
  * メールアドレス: nanana@sample.com
  * パスワード: qwe10231
* 伴奏者を探しているユーザー
  * メールアドレス: lololo@sample.com
  * パスワード: zxc10231

## 利用方法
* WebブラウザGoogle Chromeの最新版をアクセスして利用してください。
* ただしデプロイ等で接続出来ないタイミングもございます。その際は、少し時間をおいてから接続してください
* 接続先およびログイン情報については、上記の通りです。
* 同時に複数の方がログインしている場合に、ログインできない可能性があります。
* テストアカウントでログイン(伴奏者用)→トップページから詳細ページ→編集又は消去
* テストアカウントでログイン(これから伴奏者として登録するユーザー)→  
  トップページから伴奏者登録ボタン→伴奏者登録
* テストアカウントでログイン(伴奏者を探しているユーザー)→トップページから検索→  
  クリックして詳細ページ→お問い合わせフォーム
* 確認後、ログアウト処理をお願いします。  

## 目指した課題解決
* どの様な人
  * 声楽家で伴奏者を探している人  
  * 伴奏の仕事をやりたい人
* どの様な課題か
  * 個人で声楽を習っていてピアニストの知り合いがいなく伴奏を頼める人がいない、  
    普段伴奏を依頼している人の予定が空いていなかった等の理由から伴奏者を探す事に  
    苦労している人の負担をアプリケーションにより軽くしたい
  * 伴奏の仕事をやりたくても宣伝をする場があまりない事が多いので宣伝する場を  
    アプリケーションにより可能にする

## 洗い出した要件
1. **機能: 新規登録機能**  
    **目的:**  
   登録機能を実装する事によりログインしたユーザーのみがアプリケーションを使用できる様にし  
   プライバシーを保護する為  
    **詳細:**  
     * 新規登録ページでフルネーム、メールアドレス、パスワードを必須で記入し登録できる
     * ログインページでは、メールアドレスとパスワードを必須で記入しログインできる
     * ログアウトできる
     * エラーメッセージを表示させる  
  **ストーリー(ユースケース):**  
     * トップページから新規登録ボタンをクリックすると新規登録ページに移動
     * フルネーム、メールアドレス、パスワードを記入し登録ボタンを押すと再びトップページに移動
     * トップページのメニューバーに登録したユーザー名とログアウトボタンが表示される様になる
     * ログアウトボタンを押すと再び新規登録ボタンとログインボタンが表示される
     * ログインボタンをクリックするとログインページに移動しメールアドレスと  
       パスワードを記入する事でログインできトップページのメニューバーにログインした  
       ユーザー名とログアウトボタンが表示される様になる  
  **所要時間:** 1日  

2. **機能: 伴奏者情報登録機能**  
    **目的:**  
    伴奏者として登録したい人が必要情報を入力する事により伴奏者としての経験等を  
    伴奏をして欲しい側のユーザーに知らせる為  
    **詳細:**  
     * 写真、学歴、レパートリー、活動地域、伴奏依頼金、紹介動画、メッセージを入力して登録できる
     * 紹介動画、メッセージは、任意で写真、学歴、レパートリー、活動地域、伴奏依頼金は必須項目
     * エラーメッセージを表示させる
     * 画像は、Activehashで保存する  
   **ストーリー(ユースケース):**  
     * 新規登録かログインをしてログイン状態になっていると伴奏者登録画面に移動できる
     * 伴奏者登録画面では写真、学歴、レパートリー、活動地域、伴奏依頼金は必須、動画、メッセージは  
       任意で記入して登録ボタンをクリックする
     * トップページに戻る  
    **所要時間:** 1日  

3. **機能: 伴奏者一覧表示機能**  
  **目的:**  
   トップページに一覧を表示させる事により伴奏をしてもらいたいユーザーがどの様な伴奏者が  
   登録しているのか大まかに把握する事が出来、利用しやすくする為  
   **詳細:**  
   伴奏者の写真、名前、活動地域が、最新に登録した順番で表示される  
   **ストーリー(ユースケース):**  
   伴奏者登録をするとトップページに表示される  
   **所要時間:** 1時間  

4. **機能: 伴奏者詳細表示機能**  
    **目的:**  
     * 伴奏者が登録した情報を閲覧出来る事で伴奏をしてもらいユーザーが伴奏者を選択しやすくする為
     * ログインしているユーザーのみ閲覧出来る様にする事で登録している伴奏者のプライバシーを保護する為  
   **詳細:**  
   伴奏者の名前、写真、学歴、レパートリー、活動地域、伴奏依頼金、紹介動画、  
   メッセージが表示されている  
   **ストーリー(ユースケース):**  
     * ログイン状態でトップページの一覧の伴奏者の写真か名前か活動地域をクリックすると詳細ページに移動
     * 伴奏者の名前、写真、学歴、レパートリー、活動地域、伴奏依頼金、紹介動画、メッセージを  
       閲覧する事が出来る  
    **所要時間:** 1時間  

5. **機能: 活動地域検索機能**  
   **目的:**  
   伴奏者の詳細は様々だが検索機能で地域を絞って探す事が出来るので伴奏者を見つけやすくする為  
   **詳細:**  
   トップページの検索欄で活動地域を検索する事が出来る  
   **ストーリー(ユースケース):**  
   トップページの検索欄で活動地域を入力すると検索結果が表示される  
   **所要時間:** 1時間  

6. **機能: お問い合わせ機能**  
    **目的:**  
      両ユーザーのプライバシーを保護する為、一度依頼の連絡を運営側で引き受ける為  
    **詳細:**  
     * googleフォームを利用し、メールアドレス、依頼したい伴奏者の名前、  
       依頼したユーザーの名前、依頼内容を必須項目で記述出来る様にする  
     * ログインしているユーザーのみ依頼が出来る様に詳細ページに依頼フォームを設置する  
   **ストーリー(ユースケース):**  
     * ログイン状態で詳細ページへ移動する  
     * 依頼フォームに、メールアドレス、依頼したい伴奏者の名前、依頼したユーザーの名前、  
       依頼内容を記載し送信する
     * ユーザーが回答した内容がユーザー本人と運営側に送信される  
     * 運営側が伴奏者とやり取りを行いユーザーと伴奏者にお互いのメールアドレスを知らせ、  
       個人でやり取りが出来る様になる  
    **所要時間:** 1時間  

7. **機能: 伴奏者情報編集機能**  
    **目的:**
      レパートリーが増えたりなど、登録情報を変更したい際に編集出来る様にする  
    **詳細:**  
     * 登録している本人のみ詳細ページに編集ボタンが表示され編集ページに移動出来る
     * 編集画面では登録した際の情報が表示されており編集が出来る
     * 必須項目が記入されていないとエラーメッセージが表示される  
   **ストーリー(ユースケース):**  
     * 登録している本人がトップページから詳細ページをクリックする
     * 登録している本人だと詳細ページに編集ボタンが表示されているのでクリックすると編集ページの移動する
     * 伴奏者登録機能と同様の情報を編集出来、変更するボタンを押すと詳細ページに移動し情報が更新される  
    **所要時間:** 1時間  

8. **機能: 伴奏者情報消去機能**  
   **目的:**  
    伴奏者が依頼を受付出来る状態でない時に公開している情報を消去したい際に消去出来る様にする為  
   **詳細:**  
   登録している本人のみ詳細ページに消去ボタンが表示されている  
   **ストーリー(ユースケース):**  
     * 登録している本人がトップページから詳細ページをクリックする
     * 登録している本人だと詳細ページに消去ボタンが表示されているのでクリックすると消去され  
       トップページに移動する  
    **所要時間:** 1時間  

9. **機能: エラーメッセージの日本語化**  
   **目的:**  
      新規登録、ログイン、伴奏者登録編集画面のエラーメッセージは通常は  
      英語で表示されてしまうが日本語化する事でユーザーにエラーメッセージを分かりやすくする為  
   **詳細:**  
     * railsをgemを使い日本語化する
     * 登録画面で入力した内容に誤りがある際に日本語でエラーメッセージが表示される  
   **ストーリー(ユースケース):**  
     * 新規登録、ログイン、伴奏者登録編集画面で入力した内容に誤りがある際に  
     日本語でエラーメッセージが表示される  
    **所要時間:** 1時間  

10. **機能: 画像をAWSのS3に保存する**  
   **目的:**  
   Heroku上で扱う画像ファイルなどは、アプリがデプロイされるか、  
   もしくはアプリが再起動（24時間に1回自動で行われる）される度に  
   消えてしまう仕様になっているので常に表示される様にする為  
   **詳細:**  
   Herokuに外部のサービスを紐付けることで、画像ファイルなどをそのサービスに保存する。  
  「AWS」のS3というサービスを利用する  
  **ストーリー(ユースケース):**  
  登録した写真が常に表示される様になりユーザーが利用しやすくなる  
  **所要時間:** 1時間  

11. **機能: 伴奏者へのコメント機能**  
   **目的:**  
   伴奏者の詳細ページにコメント欄を設置し、伴奏者へのお礼メッセージや評価を  
   記載出来る様にする事で 別のユーザーが伴奏者を判断する材料になる為  
   **詳細:**  
   詳細ページにフォームを設置し、送信するとフォームの下に  
   コメントしたユーザーの名前とコメントが表示される  
   **ストーリー(ユースケース):**  
     * ログイン状態で詳細ページを開く
     * コメントのフォーム欄にコメントを記載する
     * フォーム欄の下にコメントしたユーザーの名前とコメントが表示される  
    **所要時間:** 1時間  
    
# 実装した機能についての説明  

## 新規登録機能
### 会員情報登録ページで必須情報を入力し登録するとトップページに移動しユーザー名が表示される↓  
[![Image from Gyazo](https://i.gyazo.com/a23371c4089996649d434473bb208a98.gif)](https://gyazo.com/a23371c4089996649d434473bb208a98)  
### ログインページで必須情報を入力しログインボタンを押すとトップページに移動しユーザー名が表示される↓  
[![Image from Gyazo](https://i.gyazo.com/8656ae1ff8346d7841623538bbe04e85.gif)](https://gyazo.com/8656ae1ff8346d7841623538bbe04e85)  

## 伴奏者情報登録機能  
### 伴奏者情報入力ページで必須情報を入力し登録するとトップページに移動、  
### 伴奏者一覧に画像、名前、活動地域が表示される↓  
[![Image from Gyazo](https://i.gyazo.com/4247cdf9840cb5c30d903f58e4496630.gif)](https://gyazo.com/4247cdf9840cb5c30d903f58e4496630)  

## 伴奏者情報詳細表示機能  
### 登録した伴奏者情報を伴奏者一覧の画像又は名前、活動地域をクリックすると  
### 詳細ページに移動し閲覧する事が出来る↓  
[![Image from Gyazo](https://i.gyazo.com/552b883f16ac25e164dbbef7161b3839.gif)](https://gyazo.com/552b883f16ac25e164dbbef7161b3839)  

## 伴奏者情報編集機能  
### 登録している伴奏者本人が自身の詳細ページに移動すると情報の編集が出来る↓  
[![Image from Gyazo](https://i.gyazo.com/bd580793b1998ba918100c38acaee391.gif)](https://gyazo.com/bd580793b1998ba918100c38acaee391)  

## 伴奏者情報消去機能  
### 登録している伴奏者本人が自身の詳細ページに移動すると消去が出来る↓  
[![Image from Gyazo](https://i.gyazo.com/e9118dcf23b771cc4b04fb32443bb9fd.gif)](https://gyazo.com/e9118dcf23b771cc4b04fb32443bb9fd)  

## 伴奏者活動地域検索機能  
### トップページの検索欄から伴奏者の活動地域を検索出来る↓  
[![Image from Gyazo](https://i.gyazo.com/205acf34b46f863d86c51ed605609c12.gif)](https://gyazo.com/205acf34b46f863d86c51ed605609c12)  

## エラーメッセージの日本語化  
### 新規登録、ログイン、伴奏者登録画面で必須の項目が不足していると  
### エラーメッセージが表示される↓  
* 新規登録画面  
[![Image from Gyazo](https://i.gyazo.com/fa22da5c9c778b19f2d3d6bebe274704.gif)](https://gyazo.com/fa22da5c9c778b19f2d3d6bebe274704)  
* ログイン  
[![Image from Gyazo](https://i.gyazo.com/30b1f4ad33754fa78c25d24c1a39634a.gif)](https://gyazo.com/30b1f4ad33754fa78c25d24c1a39634a)  
* 伴奏者登録画面  
[![Image from Gyazo](https://i.gyazo.com/4eb5dbd0a038855922fc757a6947dac9.gif)](https://gyazo.com/4eb5dbd0a038855922fc757a6947dac9)  

## お問い合わせ機能  
### お問い合わせ機能は情報を登録している本人以外の詳細にページに移動した際に表示される↓  
[![Image from Gyazo](https://i.gyazo.com/bf9601d44ad0fb4deb55c50aab1a76f5.gif)](https://gyazo.com/bf9601d44ad0fb4deb55c50aab1a76f5)  

## 伴奏者へのコメント機能  
### 詳細ページにあるコメント欄にコメントをすると名前とコメントが表示される↓  
[![Image from Gyazo](https://i.gyazo.com/3ef4acc9f8bd0d576021ae4b61f851f2.gif)](https://gyazo.com/3ef4acc9f8bd0d576021ae4b61f851f2)  

# 開発状況  
  * Ruby/RubyonRails/MySQL/Github/AWS/VisualStudioCode/HTML/CSS  
