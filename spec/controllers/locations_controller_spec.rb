require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  describe '#index' do
    subject { response.body }

    context 'no location' do
      before do
        get(:index)
      end

      it { is_expected.to eq('[]') }
    end

    context 'has location' do
      let(:location) { create(:location) }
      let!(:expected_res) do
        "[{\"id\":#{location.id},\"name\":\"#{location.name}\",\"desc\":\"#{location.desc}\"}]"
      end

      it 'returns all available parkings' do
        get(:index)
        expect(subject).to eq(expected_res)
      end
    end
  end

  describe '#show' do
    subject { response.body }

    context 'no location' do
      before do
        get(:show, params: { id: 1 })
      end

      it { is_expected.to eq('{"error":"No location with that id available"}')}

      it 'response with a 404' do
        expect(response.status).to be(404)
      end
    end

    context 'has location' do
      let(:location) { create(:location) }
      let!(:expected_res) do
        "{\"id\":#{location.id},\"name\":\"#{location.name}\",\"desc\":\"#{location.desc}\"}"
      end

      it 'returns all available parkings' do
        get(:show, params: { id: location.id })
        expect(subject).to eq(expected_res)
      end
    end
  end
end