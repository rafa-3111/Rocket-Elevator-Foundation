# frozen_string_literal: true

require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"

# If using IAM
authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
  apikey: "{iam_api_key}"
)

# If you have username & password in your credentials use:
# authenticator = IBMWatson::Authenticators::BasicAuthenticator.new(
#   username: "{username}",
#   password: "{password}"
# )

# If you have username & password in your credentials use:
text_to_speech = IBMWatson::TextToSpeechV1.new(
  authenticator: authenticator
)
text_to_speech.service_url = "{service_url}"

puts JSON.pretty_generate(text_to_speech.list_voices.result)

File.new("output.wav", "w+") do |audio_file|
  response = text_to_speech.synthesize(
    text: "Hello world!",
    accept: "audio/wav",
    voice: "en-US_AllisonVoice"
  ).result
  audio_file << response
end

# puts JSON.pretty_generate(text_to_speech.get_pronunciation(text: "Watson", format: "spr").result)

# puts JSON.pretty_generate(text_to_speech.list_voice_models.result)

# puts JSON.pretty_generate(text_to_speech.create_voice_model(name: "test-customization").result)

# puts JSON.pretty_generate(text_to_speech.update_voice_model(customization_id: "YOUR CUSTOMIZATION ID", name: "new name").result)

# puts JSON.pretty_generate(text_to_speech.get_voice_model(customization_id: "YOUR CUSTOMIZATION ID").result)

# puts JSON.pretty_generate(text_to_speech.list_words(customization_id: "YOUR CUSTOMIZATION ID").result)

# puts JSON.pretty_generate(text_to_speech.add_words( # rubocop:disable Style/AsciiComments
#   customization_id: "YOUR CUSTOMIZATION ID",
#   words: [
#     {
#       "word" => "resume",
#       "translation" => "rɛzʊmeɪ"
#     }
#   ]
# ).result)

# puts JSON.pretty_generate(text_to_speech.add_word(
#   customization_id: "YOUR CUSTOMIZATION ID",
#   word: "resume",
#   translation: "rɛzʊmeɪ"
# ).result) # rubocop:enable Style/AsciiComments

# puts JSON.pretty_generate(text_to_speech.get_word(customization_id: "YOUR CUSTOMIZATION ID", word: "resume").result)

# puts JSON.pretty_generate(text_to_speech.delete_word(customization_id: "YOUR CUSTOMIZATION ID", word: "resume"))

# puts JSON.pretty_generate(text_to_speech.delete_voice_model(customization_id: "YOUR CUSTOMIZATION ID"))
