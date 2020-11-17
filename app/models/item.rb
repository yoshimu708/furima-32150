class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipmentSource
  belongs_to_active_hash :estimatedArrival
  belongs_to_active_hash :deliveryFee

  default_scope -> { order(created_at: :desc) }


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :estimated_arrival_id
  end

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
end
