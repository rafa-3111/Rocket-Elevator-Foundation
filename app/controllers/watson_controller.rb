class WatsonController < ApplicationController
    require "ibm_watson/authenticators"
    require "ibm_watson/text_to_speech_v1"
    include IBMWatson

    def greeting
        authenticator = Authenticators::IamAuthenticator.new(
        apikey: "waston_api_key"
        )
        text_to_speech = TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = "watson_api_url"
        elevators = Elevator.count
        buildings = Building.count
        customers = Customer.count
        not_active_elevators = Elevator.where.not(elevator_status:'active').count
        quotes = Quote.count
        leads = Lead.count
        batteries = Battery.count
        cities = Address.count(city)

        File.open("app/assets/audios/greetings.wav", "wb") do |audio_file|
            response = text_to_speech.synthesize(
                text: " Greetings,
                        There are currently #(elevators.to_s) elevators deployed in the #(buildings.to_s) of your #(customers.to_s). 
                        Currently, #(not_active_elevators.to_s) elevators are not in Running Status and are being serviced. 
                        You currently have #(quotes.to_s) quotes awaiting processing. 
                        You currently have #(leads.to_s) leads in your contact requests.
                        #(batteries.to_s) Batteries are deployed across #(cities.to_s) cities. ",
                accept: "audio/wav",
                voice: "en-US_AllisonV3Voice"
            )
            audio_file.write(response.results)
        end
    end
end