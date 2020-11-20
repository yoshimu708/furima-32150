class PurchaseStreet
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :phone_number, :post_code, :adress, :municipal_district, :building, :prefecture_id, :purchases_id

  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :adress
    validates :municipal_district
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
  end
  validates :phone_number, presence: true, format: { with: /\d{11}/, message: 'ハイフンなしの11文字で入力してください' }
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'ハイフンありの数字７桁で入力してください' }
  # validates :item_id
  # validates :user_id
  # validates :purchases_id
  # validates :building

  def save
    # 各テーブルにデータを保存する処理を書く
    # 購入者情報を保存

    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    #  binding.pry
    Street.create(phone_number: phone_number, post_code: post_code, adress: adress, municipal_district: municipal_district, building: building, prefecture_id: prefecture_id, purchase_id: purchase.id)
  end
end
