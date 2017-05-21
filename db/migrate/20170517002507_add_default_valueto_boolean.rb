class AddDefaultValuetoBoolean < ActiveRecord::Migration[5.0]
  def change
   change_column :products, :in_stock, :boolean, default: true
  end
end
