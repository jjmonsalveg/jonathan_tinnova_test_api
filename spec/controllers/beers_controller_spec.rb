require 'rails_helper'

RSpec.describe BeersController, type: :controller do

  let(:current_user) { FactoryBot.create(:user) }
  let(:headers) { {'Authorization': token_generator(user.to_token)} }
  let(:invalid_headers) { {'Authorization': nil} }

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
        expect { get :index }.to raise_error(NoMethodError)
      end
    end
  end

  describe 'GET show beers/:id' do
    context 'when beet exists' do

      context 'valid token' do
        let(:beer_id) { create(:beer).id }

        before do
          request.headers.merge!(valid_headers)
          get :show, params: { id: beer_id }
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns the item' do
          expect(parsed_response['id']).to eq(beer_id)
        end
      end

      context 'invalid token' do
        it 'raise exception' do
          expect { get :show, params: { id: 1 } }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when beer not exists' do

      context 'valid token' do
        before do
          request.headers.merge!(valid_headers)
          get :show, params: { id: 1 }
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(:not_found)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Beer/)
        end
      end

      context 'invalid token' do
        it 'raise exception' do
          expect { get :show, params: { id: 1 } }.to raise_error(NoMethodError)
        end
      end
    end

    describe 'seen_at ' do
      let(:beer) { create(:beer) }

      before do
        request.headers.merge!(valid_headers)
      end

      context 'without previously visit' do
        it { expect { get :show, params: { id: beer.id } }.to change { BeerUser.count }.by(1) }
      end

      context 'previously visit' do
        let!(:beer_user) { create(:beer_user, user: current_user, beer: beer) }
        it { expect { get :show, params: { id: beer.id } }.not_to change { BeerUser.count } }
        it { expect { get :show, params: { id: beer.id } }.to change { beer_user.reload.seen_at } }
      end
    end
  end

  describe 'POST /beers/:id/favorite' do
      context 'when beet exists' do

        context 'valid token' do
          let(:beer_id) { create(:beer).id }

          before do
            request.headers.merge!(valid_headers)
            get :favorite, params: { id: beer_id }
          end

          it 'returns status code 200' do
            expect(response).to have_http_status(200)
          end

          it 'returns the item' do
            expect(parsed_response['id']).to eq(beer_id)
          end
        end

        context 'invalid token' do
          it 'raise exception' do
            expect { get :favorite, params: { id: 1 } }.to raise_error(NoMethodError)
          end
        end
      end

      context 'when beer not exists' do

        context 'valid token' do
          before do
            request.headers.merge!(valid_headers)
            get :favorite, params: { id: 1 }
          end

          it 'returns status code 404' do
            expect(response).to have_http_status(:not_found)
          end

          it 'returns a not found message' do
            expect(response.body).to match(/Couldn't find Beer/)
          end
        end

        context 'invalid token' do
          it 'raise exception' do
            expect { get :show, params: { id: 1 } }.to raise_error(NoMethodError)
          end
        end
      end

      describe 'seen_at ' do
        let(:beer) { create(:beer) }

        before do
          request.headers.merge!(valid_headers)
        end

        context 'without previously visit' do
          it { expect { get :favorite, params: { id: beer.id } }.to change { BeerUser.count }.by(1) }
          it { expect { get :favorite, params: { id: beer.id } }.to change { BeerUser.last&.favorite }.from(nil).to(true) }
        end

        context 'previously visit' do
          let!(:beer_user) { create(:beer_user, user: current_user, beer: beer) }
          it { expect { get :favorite, params: { id: beer.id } }.not_to change { BeerUser.count } }
          it { expect { get :favorite, params: { id: beer.id } }.to change { beer_user.reload.seen_at } }
          it { expect { get :favorite, params: { id: beer.id } }.to change { BeerUser.last.favorite }.from(false).to(true) }
        end
      end
  end

end
