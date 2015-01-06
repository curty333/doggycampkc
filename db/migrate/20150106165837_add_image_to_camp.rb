class AddImageToCamp < ActiveRecord::Migration
  def change
    add_column :camps, :image, :string
  end
end
