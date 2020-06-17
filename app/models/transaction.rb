class Transaction < ApplicationRecord

  belongs_to :charity

  validates :charity_id,:donate_amount,:net_amount,:currency,:trans_id,:direction,:origin, presence:true
end
