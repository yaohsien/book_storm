class Transcation < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :book
end
