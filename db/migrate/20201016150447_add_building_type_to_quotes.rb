class AddBuildingTypeToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :building_type, :string
  end
end
