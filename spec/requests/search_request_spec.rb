require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET #index' do
    context 'search successfully' do
      value = 'challenge'

      it 'search with both engines' do
        engine = 'both'
        get("/search?engine=#{engine}&value=#{value}")

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'search with google engine' do
        engine = 'google'
        get("/search?engine=#{engine}&value=#{value}")

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'search with bing engine' do
        engine = 'bing'
        get("/search?engine=#{engine}&value=#{value}")

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'search failed' do
      it 'engine parameter empty' do
        value = 'challenge'
        engine = ''

        expect {
          get("/search?engine=#{engine}&value=#{value}")
        }.to raise_error(ActionController::ParameterMissing)
      end

      it 'value parameter empty' do
        value = ''
        engine = 'bing'

        expect {
          get("/search?engine=#{engine}&value=#{value}")
        }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
