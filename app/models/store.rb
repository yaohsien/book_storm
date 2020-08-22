class Store < ApplicationRecord
  has_many :books
  has_many :open_times
end
