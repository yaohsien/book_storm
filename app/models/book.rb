class Book < ApplicationRecord
  belongs_to :store
  has_many :transcations

  def self.search_price(price_from, price_to, sort_by_price)
    if ActiveModel::Type::Boolean.new.cast(sort_by_price) == false || sort_by_price.nil?
      target = Book.where("price >= ? AND price <= ?", price_from.to_f, price_to.to_f).order(:name)
    else
      target = Book.where("price >= ? AND price <= ?", price_from.to_f, price_to.to_f).order(:price)
    end

    target
  end
end
