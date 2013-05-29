class Vendor < ActiveRecord::Base
  has_many :shirts, dependent: :destroy
end
