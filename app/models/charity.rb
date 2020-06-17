class Charity < ActiveRecord::Base
  validates :name, presence: true
  has_many :transactions

  def credit_amount(amount)
    update_column :total, total + amount
  end
end
