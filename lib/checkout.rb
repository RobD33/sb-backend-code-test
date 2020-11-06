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
        total += ((count / 2) + (count % 2)) * prices.fetch(item)
      elsif item == :banana || item == :pineapple
        if item == :pineapple
          total += (prices.fetch(item) / 2)
          total += (prices.fetch(item)) * (count - 1)
        else
          total += (prices.fetch(item) / 2) * count
        end
      elsif item == :mango
        total += (count - (count / 4).floor) * prices.fetch(item)
      else
        total += prices.fetch(item) * count
      end
    end

    total
  end

  private

  def basket
    @basket ||= Hash.new(0)
  end
end
