class Shirt < ActiveRecord::Base
  validates :name, :description, :image, presence: true
  validates :description, length: { minimum: 10 }
  validates :image, format: { with: /\A\w+.png\z/ }
end
