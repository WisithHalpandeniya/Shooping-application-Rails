class AddColumnsToSaveds < ActiveRecord::Migration[5.2]
  def change
    add_column :saveds, :name, :string
    add_column :saveds, :price, :float
    add_column :saveds, :image_url, :string
  end
end
