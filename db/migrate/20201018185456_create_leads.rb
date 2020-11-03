class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :business_name
      t.string :project_name
      t.string :department
      t.text :project_description
      t.text :message
      t.string :attachment
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
