class Checkout
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket[item] += 1
  end

  def total
    total = 0

    basket.each do |item, count|
      if item == :apple || item == :pear
        total += two_for_one(item, count)
      elsif item == :banana || item == :pineapple
        if item == :pineapple
          total += half_price_for_one_item(item, count)
        else
          total += half_price(item, count)
        end
      elsif item == :mango
        total += buy_three_get_one_free(item, count)
      else
        total += prices.fetch(item) * count
      end
    end

    total
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

  def basket
    @basket ||= Hash.new(0)
  end
end
