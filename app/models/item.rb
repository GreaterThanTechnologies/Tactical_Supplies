class Item < ApplicationRecord

  has_many :supplies
  has_many :owners, through: :supplies

  accepts_nested_attributes_for :supplies

  validates_presence_of :name
  validates_uniqueness_of :name

  




end
