module ControllerHelper
  def parsed_response
    JSON.parse(response.body)
  end

  # generate tokens from user id
  def token_generator(params)
    Auth::JsonWebToken.encode(params)
  end

  # return valid headers
  def valid_headers
    {
        "Authorization" => "Bearer #{token_generator(current_user.to_token)}",
        "Content-Type" => "application/json"
    }
  end

  # return invalid headers
  def invalid_headers
    {
        "Authorization" => nil,
        "Content-Type" => "application/json"
    }
  end

end
