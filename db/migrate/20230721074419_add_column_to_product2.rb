class AddColumnToProduct2 < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :status, :string
  end
end
