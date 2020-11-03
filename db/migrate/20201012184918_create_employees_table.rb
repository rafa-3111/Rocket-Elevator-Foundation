class CreateEmployeesTable < ActiveRecord::Migration[5.2]

  def change
    create_table :employees do |t|

      t.string :first_name                                          #First Name
      t.string :last_name                                           #Last Name
      t.string :function                                            #The principal function
      t.string :phone
      t.string :email
      t.timestamps null: false



    end
  end
end


# "Users" table that allows users to authenticate. 
# This table is responsible for keeping authentication data such as email, encrypted password, token, etc.