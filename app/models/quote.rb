class Quote < ApplicationRecord
  belongs_to :user, optional: true
  # after_create :new_quote_ticket
  #after_save: :save_to_dwh

#def save_to_dwh
#  FactQuote.create!({quote_id: self.id})
#end


  # When a user enters data in the submission page, this information is sent to the zendesk application depending on the type of building
   
  def new_quote_ticket

    if self.building_type == "Residential" 
      comment = { :value => "#{self.user.first_name} #{self.user.last_name} sent us a quote request and can be reached at #{self.user.email}. \nThis quotes was created in #{self.created_at}. The type of building is #{building_type} and the gamme choosen was #{self.product_line}. \n Here are the parameters : \n Number of apartments : #{self.apartments} \n Number of floor : #{self.floors} \n Number of Basement : #{self.basements} \n Total Elevators Required : #{elevator_number}    Total cost is : #{self.total_price} $" }
    
    elsif self.building_type == "Commercial"
      comment = { :value => "#{self.user.first_name} #{self.user.last_name} sent us a quote request and can be reached at #{self.user.email}. \nThis quotes was created in #{self.created_at}. The type of building is #{building_type} and the gamme choosen was #{self.product_line}. \n Here are the parameters : \n Number of floor : #{self.floors}\n Number of Basement : #{self.basements} \n Number of Buisnesses : #{self.businesses} \n Number of Elevator Shafts : #{self.elevator_shafts} \n Number of parking spaces : #{self.parking_spaces} \n Total Elevators Required : #{elevator_number}    Total cost is : #{self.total_price} $" }
    
    elsif self.building_type == "Corporate"
      comment = { :value => "#{self.user.first_name} #{self.user.last_name} sent us a quote request and can be reached at #{self.user.email}. \nThis quotes was created in #{self.created_at}. The type of building is #{building_type} and the gamme choosen was #{self.product_line}. \n Here are the parameters : \n Number of floor : #{self.floors}\n Number of Basement : #{self.basements} \n Number of Buisnesses : #{self.businesses} \n Number of parking spaces : #{self.parking_spaces} \n Number of occupants : #{self.occupants} \n Total Elevators Required : #{elevator_number}    Total cost is : #{self.total_price} $" }
    
    elsif self.building_type == "Hybrid"
      comment = { :value => "#{self.user.first_name} #{self.user.last_name} sent us a quote request and can be reached at #{self.user.email}. \nThis quotes was created in #{self.created_at}. The type of building is #{building_type} and the gamme choosen was #{self.product_line}. \n Here are the parameters : \n Number of floor : #{self.floors}\n Number of Basement : #{self.basements} \n Number of Buisnesses : #{self.businesses} \n Number of parking spaces : #{self.parking_spaces} \n Number of occupants : #{self.occupants} \n Opening hours : #{self.opening_hours} \n Total Elevators Required : #{elevator_number}    Total cost is : #{self.total_price} $" }

    end

    # This part is the configuration of zendesk api 
   

    client = ZendeskAPI::Client.new do |config|
      config.url = 'https://rocketelevator1.zendesk.com/api/v2'
      config.username = 'friminazaddi@gmail.com'
      config.token = ENV["zendesk_api"]
    end

    # This part create a ticket with a subject and the body, the body come from the comment at the top of the page depending on the type of building


    ZendeskAPI::Ticket.create!(client,
    :subject => "Quote Request", 
    :comment => comment,
    
    # This is the priority for viewing tickets, if urgent, tickets will appear at the top of the list

    :priority => "normal",
    :type => "Question"
    )
  end


end

