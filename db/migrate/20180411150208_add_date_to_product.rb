class AddDateToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :date, :date
  end
end
