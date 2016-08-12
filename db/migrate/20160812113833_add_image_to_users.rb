class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    remove_reference :users, :image
  end
end
