class Building < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin_contact, class_name: "Employee", optional: true
  belongs_to :technical_contact, class_name: "Employee", optional: true

  has_one :address, :dependent => :delete
  has_one :building_detail, :dependent => :delete
  has_many :batteries, :dependent => :delete_all
end