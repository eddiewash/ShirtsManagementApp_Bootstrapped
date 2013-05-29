class AddReferenceToShirt < ActiveRecord::Migration
  def change
    add_reference :shirts, :vendor, index: true
  end
end
