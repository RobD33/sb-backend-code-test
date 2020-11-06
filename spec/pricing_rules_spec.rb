require 'spec_helper'
require 'pricing_rules'

RSpec.describe Pricing_rules do
  describe '#find_by_name' do
    subject(:find_by_name) { pricing_rules.find_by_name(item) }
    let(:pricing_rules) { Pricing_rules.new }

    context 'when passed a name not in the pricing table' do
      let(:item) { :peach }

      it 'returns nil' do
        expect(find_by_name).to eq(nil)
      end
    end

    context 'when passed :apple' do
      let(:item) { :apple }
      let(:apple_record) { { name: :apple, price: 10 } }

      it 'returns the apple record' do
        expect(find_by_name).to eq(apple_record)
      end
    end

    context 'when passed :pineapple' do
      let(:item) { :pineapple }
      let(:pineapple_record) { { name: :pineapple, price: 100 } }

      it 'returns the pineapple record' do
        expect(find_by_name).to eq(pineapple_record)
      end
    end
  end
end
