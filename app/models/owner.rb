class Owner < ApplicationRecord
  has_many :supplies
  has_many :items, through: :supplies
  has_secure_password

  validates_uniqueness_of :username
  validates_presence_of :username

end
