class Elevator < ApplicationRecord
  belongs_to :column
  before_update :twilio_sms



  def twilio_sms
    if self.elevator_status == "Intervention"
      account_sid = "AC7d9da698cbaaba98d7fc37e9dd0f2768" 
      auth_token = "0562c52229f4394bd77881db812a0144" 

      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.messages.create(
          body: "The elevator with Serial Number #{self.serial_number} require maintenance.",
          to: self.column.battery.building.technical_contact_phone,    
          from: "+12058909021")  
      
      puts message.sid
      
    end
  end
end


