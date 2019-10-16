module GamesHelper
  def to_dollars(price)
    "$#{price/100.to_f}"
  end
end
