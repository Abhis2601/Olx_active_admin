class AddColumnToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :alphanumeric_id, :string
  end
end
