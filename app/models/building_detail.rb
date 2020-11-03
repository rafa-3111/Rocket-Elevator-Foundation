class BuildingDetail < ApplicationRecord
  belongs_to :building, optional: true

  def custom_label_method
    "#{information_key}: #{value}"
  end

end
