class Order < ApplicationRecord
  enum status: [:ordered, :received, :deployed]
  belongs_to :device
  belongs_to :provider
end
