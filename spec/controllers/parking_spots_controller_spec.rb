# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParkingSpotsController, type: :controller do
  describe '#index' do
    subject { response.body }

    context 'no location' do
      before do
        get(:index, params: { location_id: 1 })
      end

      it { is_expected.to eq('[]') }
    end

    context 'has location' do
      let!(:spot) { create(:parking_spot) }
      let(:expected_res) do
        "[{\"id\":#{spot.location_id},\"number\":\"#{spot.number}\",\"aws_id\":\"#{spot.aws_id}\",\"location_id\":#{spot.location_id}}]"
      end

      before do
        get(:index, params: { location_id: spot.location_id })
      end

      it 'returns all available parkings' do
        expect(subject).to eq(expected_res)
      end
    end
  end
end
