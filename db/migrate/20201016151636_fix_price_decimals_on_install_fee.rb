class FixPriceDecimalsOnInstallFee < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :install_fee, :decimal, :precision => 8, :scale => 2
  end
end
