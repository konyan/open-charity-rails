class App

  def count_charities
    Charity.count
  end

  def find_charity(id)
    Charity.find_by(id: id)
  end
end
