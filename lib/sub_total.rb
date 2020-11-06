require 'discount_rules'

class Sub_total
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def calculate(item, count)
    return self.send(discount_type(item), item, count) if discount?(item)
    count * prices.fetch(item)
  end

  private

  def two_for_one(item, count)
    ((count / 2) + (count % 2)) * prices.fetch(item)
  end

  def half_price(item, count)
    (count / 2.0) * prices.fetch(item)
  end

  def half_price_for_one_item(item, count)
    (count - 0.5) * prices.fetch(item)
  end

  def buy_three_get_one_free(item, count)
    (count - (count / 4).floor) * prices.fetch(item)
  end

  def discount_rules
    @discount_rules ||= Discount_rules.new
  end

  def discount_type(item)
    discount_rules.find_by_name(item)[:discount]
  end

  def discount?(item)
    discount_rules.find_by_name(item)
  end
end