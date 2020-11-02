class Quote < ApplicationRecord
  belongs_to :user, optional: true
  #after_save: :save_to_dwh

#def save_to_dwh
#  FactQuote.create!({quote_id: self.id})
#end

end