class Api::BookController < ApplicationController

  def price
    params.require([:price_from, :price_to])
    result = Book.search_price(params[:price_from], params[:price_to], params[:sort_by_price])

    api_response(200, 'success', result)
  end
end