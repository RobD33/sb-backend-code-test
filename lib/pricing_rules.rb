class Pricing_rules

  PRICES = [
      { name: :apple, price: 10 },
      { name: :orange, price: 20 },
      { name: :pear, price: 15 },
      { name: :banana, price: 30 },
      { name: :pineapple, price: 100 },
      { name: :mango, price: 200 }
  ]

  def find_by_name(item)
      PRICES.find {|record| record[:name] == item}
  end
end