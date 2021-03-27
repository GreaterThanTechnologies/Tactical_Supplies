class Item < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_many :supplies
  has_many :owners, through: :supplies

  accepts_nested_attributes_for :supplies

  




end
