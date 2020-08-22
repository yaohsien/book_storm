class ApplicationController < ActionController::API
  def api_response(status, message, data={})
    render status: status, json: {message: message, data: data}
  end
end
