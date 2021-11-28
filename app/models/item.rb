class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :item_category
    belongs_to :item_sale_status
    belongs_to :fee_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery
  



  belongs_to :user
  # has_one :purchase_record
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :detail, presence: true
  validates :item_category_id, numericality: { other_than: 1 }, presence: true
  validates :item_sale_status_id, numericality: { other_than: 1 }, presence: true
  validates :fee_status_id, numericality: { other_than: 1 }, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }, presence: true
  validates :scheduled_delivery_id, numericality: { other_than: 1 }, presence: true
  validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
