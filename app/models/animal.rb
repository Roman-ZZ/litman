class Animal < ApplicationRecord

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
  end

  def push_remote
    body = {
      body:{
      url:url,
      facts:facts,
      pics_repo:pics_repo,
      api_repo:api_repo
        }
      }
    # animal = Animal.first
    # puts url
    # puts animal.facts
    # raise animal.to_json

   
   HTTParty.post('http://requestbin.net/r/3378xohx',body)
   #  body: { 
        
   #  }.to_json,
   #  )
 end
end
