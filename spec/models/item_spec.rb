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
  end
end