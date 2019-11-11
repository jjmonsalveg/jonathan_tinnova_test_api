require 'rails_helper'

RSpec.describe BeersController, type: :controller do

  let(:current_user) { FactoryBot.create(:user) }
  let(:headers) { {'Authorization' => token_generator(user.to_token)} }
  let(:invalid_headers) { {'Authorization' => nil} }

  describe 'GET index' do
    context 'valid token' do
      before do
        request.headers.merge!(valid_headers)
      end

      it 'return success(200) status' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it '#call service' do
        expect(BeersQuery).to receive(:call)
        get :index
      end

      it 'respond not nil' do
        get :index
        expect(parsed_response).not_to be_nil
      end
    end

    context 'invalid token' do
      before do
        request.headers.merge!(invalid_headers)
      end

      it 'raise exception' do
        expect{ get :index }.to raise_error(NoMethodError)
      end
    end
  end

end
