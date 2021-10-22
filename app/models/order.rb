class Order < ApplicationRecord
  validates :user_id, :value, :imei, :model, :installments, :presence => true
  belongs_to :user
end
