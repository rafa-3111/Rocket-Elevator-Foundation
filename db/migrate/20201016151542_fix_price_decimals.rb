class FixPriceDecimals < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :total_price, :decimal, :precision => 8, :scale => 2
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
