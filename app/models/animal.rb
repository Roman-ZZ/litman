class Animal < ApplicationRecord

    # response = HTTParty.get('https://axoltlapi.herokuapp.com/ ')

# puts response.body, response.code, response.message, response.headers.inspect

  include HTTParty
  
  def self.fetch
    response = HTTParty.get('https://axoltlapi.herokuapp.com/')
    response = JSON.parse(response.to_json)
    animal = Animal.new(
      url:response["url"].to_s,
      facts:response["facts"].to_s,
      pics_repo:response["pics_repo"].to_s,
      api_repo:response["api_repo"].to_s
      )
    animal.save!
    # Animal.create([])
  end
end
