class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,           presence: true
  validates :explanation,    presence: true
  validates :category_id,    presence: true
  validates :condition_id,   presence: true
  validates :postage_id,     presence: true
  validates :prefecture_id,  presence: true
  validates :preparation_id, presence: true
  validates :price,          presence: true
  validates :image,          presence: true
end
