require 'spec_helper'

describe Invitation do
  let(:file_path) { './input/customer_data.txt' }
  let(:unit) { 'km' }
  let(:office_latitude) { 53.339428 }
  let(:office_longitude) { -6.257664 }
  let(:invite) { Invitation.new(file_path, office_latitude, office_longitude, distance, unit) }
  let(:customers) { invite.call }

  describe 'it should find_customer_list' do

     context 'customers maximum distance in 10km' do
      let(:distance) { 10 }

      describe 'returns correct values' do
        it 'returns an empty hash' do
          expect(customers).to be_empty
        end
      end
    end

    context 'customers maximum distance in 50km' do
      let(:distance) { 50 }

      describe 'customer returns with valid data' do
        it 'it should returns User ID and names of find customers list' do
          expect(customers.length).to eq(8)
          expect(customers.first[0]).to eq(4)
          expect(customers.first[1]).to eq('Ian Kehoe')
        end

        it 'check if its returns in ascending User ID' do
          expect(customers.first[0] < customers.last[0]).to be_truthy
        end
      end
    end

    context 'customers maximum distance in 100km' do
      let(:distance) { 100 }

      describe 'customer returns with valid data' do
        it 'it should returns User ID and names of find customers list' do
          expect(customers.length).to eq(16)
          expect(customers.first[0]).to eq(4)
          expect(customers.first[1]).to eq('Ian Kehoe')
          expect(customers.last[0]).to eq(39)
          expect(customers.last[1]).to eq('Lisa Ahearn')
        end

        it 'check if its returns in ascending User ID' do
          expect(customers.first[0] < customers.last[0]).to be_truthy
        end
      end
    end

  end
end
