require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

class WatsonController < ApplicationController
        
    def speak
        authenticator = Authenticators::IamAuthenticator.new(
        apikey: ENV["waston_api_key"]
        )
        text_to_speech = TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = ENV["watson_api_url"]

        ## message = "Greetings, there are currently #(elevators.to_s) elevators deployed in the #(buildings.to_s) of your #(customers.to_s). Currently, #(not_active_elevators.to_s) elevators are not in Running Status and are being serviced. You currently have #(quotes.to_s) quotes awaiting processing. You currently have #(leads.to_s) leads in your contact requests. #(batteries.to_s) Batteries are deployed across #(cities.to_s) cities. "
        message = "Hello there!"
        response = text_to_speech.synthesize(
            text: message,
            accept: "audio/mp3",
            voice: "en-US_AllisonV3Voice"
        ).result

        File.open("app/assets/audios/outputs.mp3", "wb") do |audio_file|
                        audio_file.write(response)
                    end

        soundFile = File.open("app/assets/audios/outputs.mp3", "r")
        binary = soundFile.read

        send_data binary, filename: 'outputs.mp3', type: 'audio/mp3', disposition: 'inline'
        
    end
end