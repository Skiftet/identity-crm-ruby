class IdentityCRM::Resource
  def initialize url, user, token
    @url = url.chomp('/')
    @user = user
    @token = token
  end 

  def create params: {}, options: {}
    request :post, body: params, options: options
  end

  def get id = nil, params: {}, options: {}
    request :get, path: id.to_s, query: params, options: options
  end

  private

  def request method, path: '', query: {}, options: {}, body: nil
    url = @url
    if path.present?
      url += '/' + path
    end

    request = {
      method: method,
      url: url,
      user: @user,
      password: @token,
      headers: {
        params: query,
      },
    }
    if body.present?
      request[:payload] = body.as_json
      request[:content_type] = :json
    end

    if options.include? :timeout
      request[:timeout] = options[:timeout]
    end

    JSON.parse RestClient::Request.execute(request).body, object_class: OpenStruct
  end
end
