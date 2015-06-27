module Facebook
  extend self
  attr_accessor :key, :secret, :redirect_uri, :response_type, :scope

  def setup(params)
    self.key = params[:key]
    self.secret = params[:secret]
    self.redirect_uri = params[:redirect_uri]
    self.scope = params[:scope]
    self.response_type = params[:response_type] || "code"
  end

  def authorization_url
    "#{oauth_base_url}#{auth_request_params}"
  end

  def get_access_token(authorization_code)
    params = uri_encode(access_token_params(authorization_code))
    response = HTTParty.get("#{oauth_api_base_url}access_token?#{params}")
    response.parsed_response
  end

  def user_profile(access_token)
    profile = HTTParty.get("#{api_base_url}me?#{access_token}")
    profile.parsed_response
  end

  private

  def oauth_base_url
    "https://www.facebook.com/dialog/oauth?"
  end

  def oauth_api_base_url
    "https://graph.facebook.com/oauth/"
  end

  def api_base_url
    "https://graph.facebook.com/v2.3/"
  end

  def auth_request_params
    "#{uri_encode(authorization_params)}"
  end

  def authorization_params
    {
      client_id: self.key,
      redirect_uri: self.redirect_uri,
      scope: self.scope,
      response_type: self.response_type,
      state: state,
    }
  end

  def state
    SecureRandom.base64
  end

  def uri_encode(params)
    params.reduce("") do |uri, (k,v)|
      uri << "&#{k}=#{v}"
      uri
    end
  end

  def access_token_params(authorization_code)
    {
      client_id: self.key,
      redirect_uri: self.redirect_uri,
      client_secret: self.secret,
      code: authorization_code,

    }
  end

end