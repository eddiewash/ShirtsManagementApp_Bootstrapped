class Shirt < ActiveRecord::Base
  validates :name, :description, :image, presence: true
  validates :description, length: { minimum: 10 }
  validates :image, format: { with: /\A\w+.png\z/ }
  belongs_to :vendor

  def self.search_for(query)
    where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
  end
end
