require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    # ユーザー情報
    it 'nicknameが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに一意性がないと登録できない' do
      user = FactoryBot.build(:user)
      user.save
      another_user = User.new(nickname: 'メカ太郎', email: 'test1@gmail.com', password: '000dayo', password_confirmation: '000dayo', first_name: '山田', last_name: '太郎', first_name_reading: 'ヤマダ', last_name_reading: 'タロウ', birthday: '1997.09.20')
      another_user.email = user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken', 'Email has already been taken')
    end

    it 'emailに@が含まれないと登録できない' do
      user = FactoryBot.build(:user)
      user.email = 'test.com'
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが６文字以上でないと登録できない' do
      user = FactoryBot.build(:user)
      user.password = '000ny'
      user.password_confirmation = '000ny'
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合でないと登録できない' do
      user = FactoryBot.build(:user)
      user.password = '000000'
      user.password_confirmation = '000000'
      user.valid?
      expect(user.errors.full_messages).to include('Password 半角数字混合で入力してください')
    end

    it 'passwordは確認ようを含めて２回入力すること' do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation doesn't match Password")
    end

    it 'passwordとpassword-canfomationが一致しないと登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = '708gogogogo'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation doesn't match Password")
    end

    # 本人情報確認
    it 'first_nameが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
    end

    it 'last_nameが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）での入力でないといけない' do
      user = FactoryBot.build(:user)
      user.first_name = 'yoshimura'
      user.last_name = '708'
      user.valid?
      expect(user.errors.full_messages).to include('First name 全角文字を使用してください', 'Last name 全角文字を使用してください')
    end

    it 'first_name_readingが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_reading = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name reading can't be blank", 'First name reading 全角(カタカナ)を使用してください')
    end

    it 'last_name_readingが空だと登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_reading = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name reading can't be blank", 'Last name reading 全角(カタカナ)を使用してください')
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）での入力でないといけない' do
      user = FactoryBot.build(:user)
      user.first_name_reading = 'yoshimura'
      user.last_name_reading = 'なおや'
      user.valid?
      expect(user.errors.full_messages).to include('First name reading 全角(カタカナ)を使用してください', 'Last name reading 全角(カタカナ)を使用してください')
    end

    it '生年月日が空だと登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
