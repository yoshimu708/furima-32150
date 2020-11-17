class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipmentSource
  belongs_to_active_hash :estimatedArrival
  belongs_to_active_hash :deliveryFee

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id,numericality: { other_than: 1 } 
  validates :shipment_source_id, numericality: { other_than: 1 } 
  validates :estimated_arrival_id, numericality: { other_than: 1 } 
  validates :price, presence: true,format: { with:/\A[0-9]+\z/,message: '半角数字で入力してください'}, numericality: {only_integer:true, greater_than:300,less_than:9999999}
  validates :image, presence: true
  
end
