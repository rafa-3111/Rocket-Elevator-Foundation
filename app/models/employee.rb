class Employee < ActiveRecord::Base

  def custom_label_method
    "#{first_name} #{last_name}"
  end

  belongs_to :user, optional: true
  has_many :buildings, foreign_key: :admin_contact_id
  has_many :buildings, foreign_key: :technical_contact_id
end
