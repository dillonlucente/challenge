require 'digest'

module PeopleHelper
  def gravatar_url_for(email)
    hash = Digest::MD5.digest(email.downcase.strip)
    "http://www.gravatar.com/avatar/" + hash
  end

end
