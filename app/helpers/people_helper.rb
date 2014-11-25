require 'digest'

module PeopleHelper
  def gravatar_url_for(email)
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase.strip)}.png?s=64&d=mm"
  end

end
