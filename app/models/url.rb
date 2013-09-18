class Url < ActiveRecord::Base
  # Remember to create a migration!

  include ActiveModel::Validations
  validates :original, presence: true
  validates_with UrlValidator

  before_save :update_original_url

    def update_original_url
      # suffix = FAKER::Internet(domain_suffix(%w(co.uk com us uk ca biz info name).rand))
      bitly = Array.new(5){[*'0'..'9',*'a'..'z',*'A'..'Z'].sample}.join 
      self.updated = bitly
    end    

end
