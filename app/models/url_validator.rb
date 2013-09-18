require 'uri'
require 'net/http'

class UrlValidator < ActiveModel::Validator 

  def validate(url) 

    unless url[:original].match(URI.regexp(['http', 'https']))
      url.errors[:original] << 'URL must start with http or https'
    end

    begin 
      uri = URI.parse(url[:original])
      Net::HTTP.get_response(uri)
    rescue
      url.errors[:original] << 'This website is not currently online.'
    end 
    
  end


end
