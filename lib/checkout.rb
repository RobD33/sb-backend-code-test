require 'sub_total'

class Checkout
  attr_reader :sub_total
  private :sub_total

  def initialize(prices)
    @sub_total = Sub_total.new(prices)
  end

  def scan(item)
    basket[item] += 1
  end

  def total
    total = 0

    basket.each do |item, count|
      total += sub_total.calculate(item, count)
    end

    total
  end

  private

  def basket
    @basket ||= Hash.new(0)
  end
end
