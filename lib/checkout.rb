require 'sub_total'

class Checkout

  def scan(item)
    basket[item] += 1
  end

  def total
    total = 0

    basket.each do |item, count|
      total += Sub_total.calculate(item, count)
    end

    total
  end

  private

  def basket
    @basket ||= Hash.new(0)
  end
end
