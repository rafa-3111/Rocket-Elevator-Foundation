class Intervention < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :building, optional: true
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true
    belongs_to :employee, optional: true
    
end
    # after_create :new_intervention_ticket


    # ZENDESK SECTION FOR THE CONTACT FORM  

    def new_intervention_ticket
        client = ZendeskAPI::Client.new do |config|
          config.url = 'https://rocket1146.zendesk.com/'
          config.username = 'rschwarz6@gmail.com'
          config.token = ENV["zendesk_api"]
        end
  
        # This part is the configuration of zendesk api 

        ZendeskAPI::Ticket.create!(client,
        :subject => "#{self.full_name} from #{self.business_name}",
        :comment => {
          :value => "The contact #{self.full_name} from #{self.business_name} can be reached at email #{self.email} and at phone number #{self.phone}. \n #{self.department} has a project name #{self.project_name} which will require contribution from Rocket Elevators. \n Project Desciption : \n #{self.project_description} \n Attached message : \n #{self.message} \n The Contact uploaded an attachment #{self.attachment}" 
        },
        :requester => {
          "name": self.full_name,
          "email": self.email
        },


        # This is the priority for viewing tickets, if urgent, tickets will appear at the top of the list
        :priority => "normal",
        :type => "Question"
        )
    end

