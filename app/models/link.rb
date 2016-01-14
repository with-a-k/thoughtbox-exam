require 'uri'

class Link < ActiveRecord::Base
  validate :url_location_must_be_valid

  private

  def url_location_must_be_valid
    check = URI.parse(url)
    errors.add(:url, "is not valid") unless check.scheme && check.host
  rescue URI::InvalidURIError
    errors.add(:url, "is not valid")
  end
end
