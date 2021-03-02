require 'spec_helper'

describe DistanceCalculator do
  let(:office_coordinates) { [53.339428, -6.257664] }
  let(:customer) {{"latitude" => 53.2451022, "user_id" => 4, "name" => "Ian Kehoe", "longitude" => -6.238335}}
  let(:customer_coordinates) { [customer['latitude'], customer['longitude']]}

  context 'maximum distance is 100km' do
    let(:distance) { 100 }
    describe 'given customer location and office location' do
      it 'returns truthy when customer is within given maximum distance' do
        cus_distance = DistanceCalculator.calculate_distance(customer_coordinates, office_coordinates)
        expect(cus_distance <= distance).to be_truthy
      end
    end
  end

end

