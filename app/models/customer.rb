class Customer < ApplicationRecord
  has_many :buildings
  has_one :address, :dependent => :delete
  belongs_to :user, optional: true

  def custom_label_method
    "#{User.find(user_id).first_name} #{User.find(user_id).last_name}"
  end
end