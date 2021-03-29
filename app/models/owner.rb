class Owner < ApplicationRecord
  has_many :supplies
  has_many :items, through: :supplies
  has_secure_password

  validates_uniqueness_of :username 
  validates_presence_of :username
  validates :username, format: {with: /\A^[a-z0-9]*$\z/, message: "Uppercase, Special Characters & Spaces are NOT allowed. Please try again"}
  vailda


end
