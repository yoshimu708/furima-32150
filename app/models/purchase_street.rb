class PurchaseStreet
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:phone_number,:post_code,:adress,:municipal_district,:building,:prefecture_id,:purchases_id
 
  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :phone_number, format:{with:/\A\d{11}\z/,message:}
    validates :post_code,  format:{with: /\A\d{3}[-]\d{4}\z/,message:}
    validates :adress
    validates :municipal_district  
    validates :prefecture_id

    #validates :item_id
    #validates :user_id
    #validates :purchases_id     
  end
    #validates :building

  def save
    # 各テーブルにデータを保存する処理を書く
     # 購入者情報を保存
    # Purchase.create(item_id: item_id, user_id: user.id)
     # 住所の情報を保存
    # Street.create(phone_number: phone_number,post_code: post_code,adress: adress,municipal_district: municipal_district,building: building,prefecture_id: prefecture_id,purchases_id: purchases_id)
  end
end