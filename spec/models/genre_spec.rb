require 'rails_helper'

RSpec.describe Genre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  #it 'ログイン状態のユーザーだけが、商品出品ページへ遷移できること' do 
    #user = FactoryBot.build(:user)
      #user.nickname = ''
      #user.valid?
      #expect(user.errors.full_messages).to include("Nickname can't be blank")
  #end
  it 'ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること' do 
  end
  it '商品画像を1枚つけることが必須であること' do 
  end
  it '商品名が必須であること' do 
  end

  it '商品の説明が必須であること' do 
  end
  it 'カテゴリーの情報が必須であること' do 
  end
  it '商品の状態についての情報が必須であること' do 
  end
  it '配送料の負担についての情報が必須であること' do 
  end

  it '発送元の地域についての情報が必須であること' do 
  end
  it '発送までの日数についての情報が必須であること' do 
  end
  it '価格についての情報が必須であること' do 
  end
  it '価格の範囲が、¥300~¥9,999,999の間であること' do 
  end
  it '販売価格は半角数字のみ保存可能であること' do 
  end
  it '入力された販売価格によって、販売手数料や販売利益の表示が変わること' do 
  end
  it 'エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）' do 
  end
  it '入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること  ' do 
  end
end
