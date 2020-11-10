class Lead < ApplicationRecord
    belongs_to :user, optional: true
    validates :full_name, presence: true, allow_blank: false
    validates :email, presence: true, allow_blank: false
    validates :phone, presence: true, allow_blank: false
    validates :business_name, presence: true, allow_blank: false
    validates :project_name, presence: true, allow_blank: false
    validates :department, presence: true, allow_blank: false
    validates :project_description, presence: true, allow_blank: false
    validates :message, presence: true, allow_blank: false

    mount_uploader :attachment, AttachmentUploader

    # after_create :new_lead_ticket


    # ZENDESK SECTION FOR THE CONTACT FORM  

    def new_lead_ticket
        client = ZendeskAPI::Client.new do |config|
          config.url = 'https://rocketelevator1.zendesk.com/api/v2'
          config.username = 'friminazaddi@gmail.com'
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
end

