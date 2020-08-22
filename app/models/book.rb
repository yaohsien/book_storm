class Book < ApplicationRecord
  belongs_to :store
  has_many :transcations
end
