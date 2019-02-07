
class IdentityCRM::Client
  def initialize user: nil, token: nil, url: nil
    @url = url.chomp('/')
    raise 'Identity URL is not valid' if URI.parse(@url).host.blank?
    raise 'A username and token is mandatory' unless [user, token].all? &:present?

    @user = user
    @token = token
  end
  
  def base_url
    "#{@url}/api/v2"
  end
  
    def self.resource path
      define_method path do
        IdentityCRM::Resource.new "#{base_url}/#{path}", @user, @token
      end
    end
  
  resource 'donations'
  resource 'regular_donations'
  resource 'members'
  resource 'actions'
end
