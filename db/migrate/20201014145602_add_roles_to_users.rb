class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :admin, :boolean, default: false
    add_column :users, :employee, :boolean, default: false
    add_column :users, :user, :boolean, default: true
  end
end