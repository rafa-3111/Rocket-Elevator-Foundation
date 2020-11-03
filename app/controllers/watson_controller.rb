class WatsonController < ApplicationController
    require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

    def greeting
        authenticator = Authenticators::IamAuthenticator.new(
        apikey: "{apikey}"
        )
        text_to_speech = TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = "{url}"
    end