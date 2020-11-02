class ChangeProductLineToString < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :product_line, :string
  end
end
