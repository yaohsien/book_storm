class Api::BookStoreController < ApplicationController
  def hello
    api_response(200, 'hello', {})
  end

  def time
    result = Store.search_open(params[:datetime], params[:day], params[:time])

    api_response(200, 'success', result)
  end

  def openhours
    params.require([:hours, :more_or_less, :timespan])
    result = Store.seach_openhours(params[:hours], params[:more_or_less], params[:timespan])

    api_response(200, 'success', result)
  end

  def amount
    params.require([:books_amount])
    result = Store.search_amounts(params[:books_amount], params[:more_or_less], params[:price_min], params[:price_max])
    
    api_response(200, 'success', result)
  end

  def name
    params.require([:name])
    result = Store.search_name(params[:name])

    api_response(200, 'success', result)
  end

  def transaction_volume
    params.require([:rank_type])
    result = Store.search_trans_volume(params[:rank_type])

    api_response(200, 'success', result)
  end
end