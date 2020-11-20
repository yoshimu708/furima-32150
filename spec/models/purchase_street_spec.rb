require 'rails_helper'

RSpec.describe PurchaseStreet, type: :model do
  describe '#create' do
    before do
      @purchase_street = FactoryBot.build(:purchase_street)
    end
    it 'phone_numberが空だと保存できないこと'do
        @purchase_street.phone_number = nil
        @purchase_street.valid?
        expect(@purchase_street.errors.full_messages).to include("Phone number can't be blank", "Phone number ハイフンなしの11文字で入力してください")
    end

    it 'phone_numberがハイフンが不要で11桁であること'do
      @purchase_street.phone_number =983-8475-9374
      @purchase_street.valid?
      expect(@purchase_street.errors.full_messages).to include("Phone number ハイフンなしの11文字で入力してください")
    end

    it 'post_codeが空だと保存できない事'do
      @purchase_street.post_code = nil
      @purchase_street.valid?
      expect(@purchase_street.errors.full_messages).to include("Post code can't be blank", "Post code ハイフンありの数字７桁で入力してください")
    end

    it 'post_codeがハイフンが必要である事'do
      @purchase_street.post_code = 8937495
      @purchase_street.valid?
      expect(@purchase_street.errors.full_messages).to include("Post code ハイフンありの数字７桁で入力してください")
    end

    it 'adressが空だと保存できない'do
      @purchase_street.adress = nil
      @purchase_street.valid?
      expect(@purchase_street.errors.full_messages).to include("Adress can't be blank")
    end
    
    it 'municipal_districtが空だと保存できない' do
      @purchase_street.municipal_district = nil
      @purchase_street.valid?
      expect(@purchase_street.errors.full_messages).to include("Municipal district can't be blank")
    end
    it 'prefecture_idが空だと保存できない'do
      @purchase_street.prefecture_id = 1
      @purchase_street.valid?
      expect(@purchase_street.errors.full_messages).to include("Prefecture must be other than 1")
    end
  end
end
