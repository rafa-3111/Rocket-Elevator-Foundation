class RenameMultipleFields < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :firstname, :first_name
    rename_column :users, :lastname, :last_name
    rename_column :users, :user, :is_user
    rename_column :users, :employee, :is_employee
    rename_column :users, :admin, :is_admin
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
