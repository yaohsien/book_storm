class Api::BookStoreController < ApplicationController
  def hello
    api_response(200, 'hello', {})
  end

  def time
    result = Store.search_open(params[:datetime], params[:day], params[:time])

    api_response(200, 'success', result)
  end

  def openhours
    result = Store.seach_openhours(params[:hours], params[:more_or_less], params[:timespan])

    api_response(200, 'success', result)
  end

  def amount
    result = Store.search_amounts(params[:books_amount], params[:more_or_less], params[:price_min], params[:price_max])
    
    api_response(200, 'success', result)
  end

  def name
    result = Store.search_name(params[:name])

    api_response(200, 'success', result)
  end

  def transaction_volume
    result = Store.search_trans_volume(params[:rank_type])

    api_response(200, 'success', result)
  end
end