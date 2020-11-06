require 'spec_helper'
require 'sub_total'
require 'discount_rules'

RSpec.describe Sub_total do
  describe '#calculate' do
    subject(:calculate) { Sub_total.calculate(item, count) }

    let(:discount_rules) { double('Discount_rules') }
    let(:apple_record) { { name: :apple, discount: 'two_for_one' } }

    before(:each) do
      allow(Discount_rules).to receive(:new).and_return(discount_rules)
      allow(discount_rules).to receive(:find_by_name).with(:apple).and_return(apple_record)
    end

    context 'when passed 5 apples' do
      let(:item) { :apple }
      let(:count) { 5 }

      it 'calls #twoforone' do
        expect_any_instance_of(Sub_total).to receive(:two_for_one)

        subject
      end
    end

    context 'when passed an item with no discount' do
      let(:item) { :orange }
      let(:count) { 3 }

      before do
        allow(discount_rules).to receive(:find_by_name).with(:orange).and_return(nil)
      end

      it 'return the base price times the count' do
        expect(subject).to eq(60)
      end
    end
  end
end
