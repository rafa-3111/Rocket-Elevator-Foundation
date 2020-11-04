class Elevator < ApplicationRecord
  belongs_to :column
  before_update :twilio_sms



  def twilio_sms
    if self.elevator_status == "Intervention"
      account_sid = ENV["twilio_account_sid"]
      auth_token = ENV["twilio_auth_token"] 

      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.messages.create(
          body: "The elevator with Serial Number #{self.serial_number} require maintenance.",
          to: self.column.battery.building.technical_contact_phone,
          from: "+12058909021")  # Use this Magic Number for creating SMS
      
      puts message.sid
      
    end
  end
end


