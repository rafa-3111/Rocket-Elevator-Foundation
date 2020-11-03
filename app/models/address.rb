class Address < ApplicationRecord
  belongs_to :building, optional: true
  belongs_to :customer, optional: true

  def custom_label_method
    "#{number_and_street}"
  end
end