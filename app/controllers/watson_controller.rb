require "json"
require "ibm_watson"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

class WatsonController < ActionController::Base
        
    def speak
        authenticator = Authenticators::IamAuthenticator.new(
        apikey: ENV["waston_api_key"]
        )
        text_to_speech = TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = ENV["watson_api_url"]

        message = "Greeting user #{current_user.id}. There is #{Elevator::count} elevators in #{Building::count} buildings of your 
                    #{Customer::count} customers. Currently, #{Elevator.where(elevator_status: 'Intervention').count} elevators are not in 
                    Running Status and are being serviced. You currently have #{Quote::count} quotes awaiting processing.
                    You currently have #{Lead::count} leads in your contact requests. 
                    #{Battery::count} Batteries are deployed across 
                    #{Address.where(id: Building.select(:address_id).distinct).select(:city).distinct.count} cities"
        ##message = "Hello there!"
        response = text_to_speech.synthesize(
            text: message,
            accept: "audio/wav",
            voice: "en-US_AllisonV3Voice"
        ).result

        File.open("#{Rails.root}/public/greetings.wav", "wb") do |audio_file|
                        audio_file.write(response)
                    end
    end
end