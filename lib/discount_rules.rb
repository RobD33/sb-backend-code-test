class Discount_rules

  DISCOUNTS = [
      { name: :apple, discount: 'two_for_one' },
      { name: :pear, discount: 'two_for_one' },
      { name: :banana, discount: 'half_price' },
      { name: :pineapple, discount: 'half_price_for_one_item' },
      { name: :mango, discount: 'buy_three_get_one_free' }
  ]

  def find_by_name(item)
      DISCOUNTS.find {|record| record[:name] == item}
  end
end