class Elevator < ApplicationRecord
  belongs_to :column
  before_update :twilio_sms
  before_update :slack



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


  def slack
      if self.elevator_status_changed?
        require 'date'
        current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
        notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
        notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.elevator_status_was} to #{self.elevator_status} at #{current_time}."
  

      end
  end 
  
end


