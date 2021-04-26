require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }
  let(:destination) do
    create(
      :destination,
      prices: [product.price],
      references: [product.reference],
      names: ['dasdas']
    )
  end
  let(:destination1) { create(:destination, names: [product.name]) }
  let(:destination2) { create(:destination, categories: [product.category]) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:reference) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:destination).optional(true) }
  end

  context 'instance methods' do
    describe '.find_destination' do
      it 'search for best suitable destination' do
        destination
        destination1
        destination2

        expect(product.find_destination).to eq([{'id' => destination.id, 'rating' => 3}])
      end
    end

    describe '.set_destination' do
      it 'sets best suitable destination' do
        allow(product).to receive(:find_destination).and_return([{'id' => destination.id, 'rating' => 3}])

        expect { product.set_destination }.to change { product.destination_id }.to(destination.id)
      end

      it 'sets no destination if destinations rating is 0 ' do
        allow(product).to receive(:find_destination).and_return([{'id' => destination.id, 'rating' => 0}])

        expect { product.set_destination }.not_to change { product.destination_id }
      end
    end
  end
end
