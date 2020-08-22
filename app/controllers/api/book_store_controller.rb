class Api::BookStoreController < ApplicationController
  def hello
    api_response(200, 'hello', {})
  end

  def time
    binding.pry
    result = Store.search_open(params[:datetime], params[:day], params[:time])

    api_response(200, 'success', result)
  end

end