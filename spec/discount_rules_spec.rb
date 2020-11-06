require 'spec_helper'
require 'discount_rules'

RSpec.describe Discount_rules do
  describe '#find_by_name' do
    subject(:find_by_name) { discount_rules.find_by_name(item) }
    let(:discount_rules) { Discount_rules.new }

    context 'when passed a name not in the discount table' do
      let(:item) { :orange }

      it 'returns nil' do
        expect(find_by_name).to eq(nil)
      end
    end

    context 'when passed :apple' do
      let(:item) { :apple }
      let(:apple_record) { { name: :apple, discount: 'two_for_one'} }

      it 'returns the apple record' do
        expect(find_by_name).to eq(apple_record)
      end
    end

    context 'when passed :pineapple' do
      let(:item) { :pineapple }
      let(:pineapple_record) { { name: :pineapple, discount: 'half_price_for_one_item' } }

      it 'returns the pineapple record' do
        expect(find_by_name).to eq(pineapple_record)
      end
    end
  end
end
