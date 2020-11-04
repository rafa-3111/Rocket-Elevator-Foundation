class Address < ApplicationRecord
  belongs_to :building, optional: true
  belongs_to :customer, optional: true

  def custom_label_method
    "#{number_and_street}"
  end

  geocoded_by :full_address # full_address is a method which take some model's attributes to get a formatted address for example

  # the callback to set longitude and latitude
  after_validation :geocode

  # the full_address method
  def full_address
    "#{number_and_street}, #{postal_code}, #{city}, #{country}"
  end
end