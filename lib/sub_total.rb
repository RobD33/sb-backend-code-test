require 'discount_rules'
require 'pricing_rules'

class Sub_total

  attr_reader :item, :count
  private :item, :count

  def initialize(item, count)
    @item = item
    @count = count
  end

  def self.calculate(item, count)
    new(item, count).calculate
  end

  def calculate
    return self.send(discount_type) if discount?
    count * price
  end

  private

  def two_for_one
    ((count / 2) + (count % 2)) * price
  end

  def half_price
    (count / 2.0) * price
  end

  def half_price_for_one_item
    (count - 0.5) * price
  end

  def buy_three_get_one_free
    (count - (count / 4).floor) * price
  end

  def discount_rules
    @discount_rules ||= Discount_rules.new
  end

  def discount_type
    discount_rules.find_by_name(item)[:discount]
  end

  def discount?
    discount_rules.find_by_name(item)
  end

  def pricing_rules
    @pricing_rules ||= Pricing_rules.new
  end

  def price
    pricing_rules.find_by_name(item)[:price]
  end
end