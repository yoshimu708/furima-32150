require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
      it '商品画像を1枚つけることが必須であること' do 
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do 
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報が必須であること' do 
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it '配送料の負担についての情報が必須であること' do 
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域についての情報が必須であること' do 
        @item.shipment_source_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end
      it '発送までの日数についての情報が必須であること' do 
        @item.estimated_arrival_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated arrival must be other than 1")
      end
      it '価格についての情報が必須であること' do 
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること' do 
        @item.price ='10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること' do 
        @item.price ='200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it '販売価格は半角数字のみ保存可能であること' do 
        @item.price ='１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で入力してください", "Price is not a number")
      end
      #it '入力された販売価格によって、販売手数料や販売利益の表示が変わること' do 
      #end
      #it 'エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）' do
      #end
      #it '入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること  ' do 
      #end
      #it 'ログイン状態のユーザーだけが、商品出品ページへ遷移できること' do 
        #@message.user = nil
        #@message.valid?
        #expect(@message.errors.full_messages).to include("User must exist")
      #end
      #it 'ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること' do 
      #end
            #bundle exec rspec spec/models/item_spec.rb 
  end
end