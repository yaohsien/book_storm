class DumpDataController < ApplicationController
  def create_store
    file = File.read("#{Rails.root}/config/original_file/book_store_data.json")
    json_file = JSON.parse(file)

    json_file.each do |data|
      s = Store.new
      s.cash_balance = data['cashBalance']
      s.name = data['storeName']
      s.save
    end

    api_response(200, 'create store success', {})
  end

  def create_book
    file = File.read("#{Rails.root}/config/original_file/book_store_data.json")
    json_file = JSON.parse(file)
    
    json_file.each do |data|
      data['books'].each do |book|
        b = Book.new
        b.store_id = Store.find_by(name: data['storeName']).id
        b.price = book['price']
        b.name = book['bookName']
        b.save  
      end
    end

    api_response(200, 'create book success', {})
  end

  def create_open_time
    file = File.read("#{Rails.root}/config/original_file/book_store_data.json")
    json_file = JSON.parse(file)
    
    json_file.each do |data|
      data['opening_hours'].each do |open|
        puts open
        o = OpenTime.new        
        o.store_id = Store.find_by(name: data['storeName']).id
        o.day = open['day']
        o.start_time = open['open']
        o.end_time = open['close']
        o.save
      end
    end

    api_response(200, 'create open_time success', {})
  end

  def create_open_time
    file = File.read("#{Rails.root}/config/original_file/book_store_data.json")
    json_file = JSON.parse(file)
    
    json_file.each do |data|
      data['opening_hours'].each do |open|
        puts open
        o = OpenTime.new        
        o.store_id = Store.find_by(name: data['storeName']).id
        o.day = open['day']
        o.start_time = open['open']
        o.end_time = open['close']
        o.save
      end
    end

    api_response(200, 'create open_time success', {})
  end

  def create_user
    file = File.read("#{Rails.root}/config/original_file/user_data.json")
    json_file = JSON.parse(file)
    
    json_file.each do |data|
      u = User.new
      u.id = data['id']
      u.name = data['name']
      u.cash_balance = data['cashBalance']
      u.save
    end

    api_response(200, 'create user success', {})
  end

  def create_trans
    file = File.read("#{Rails.root}/config/original_file/user_data.json")
    json_file = JSON.parse(file)
    
    json_file.each do |data|
      data['purchaseHistory'].each do |trans|
        store = Store.find_by(name: trans['storeName'])
        book = store.books.find_by(name: trans['bookName'])
        
        t = Transcation.new
        t.store_id =  store.id
        t.book_id = book.id
        t.user_id = data['id']
        t.amount = trans['transactionAmount']
        t.trans_time = trans['transactionDate']

        t.save
      end
    end

    api_response(200, 'create trans success', {})
  end
end