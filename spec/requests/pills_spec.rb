# spec/requests/pills_spec.rb
require 'rails_helper'

RSpec.describe 'Pills API', type: :request do
  # add pills owner
  let(:user) { create(:user) }
  let!(:pills) { create_list(:pill, 10, created_by: user.id) }
  let(:pill_id) { pills.first.id }
  let(:headers) { valid_headers }

  describe 'GET /pills' do
    # update request with headers
    before { get '/pills', params: {}, headers: headers }
  end

  describe 'GET /pills/:id' do
    before { get "/pills/#{pill_id}", params: {}, headers: headers }
    end


  describe 'POST /pills' do
    let(:valid_attributes) do
      # send json payload
      { title: 'Learn Elm', created_by: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/pills', params: valid_attributes, headers: headers }
    end

    context 'when request is invalid' do
      let(:valid_attributes) { { title: nil }.to_json }
      before { post '/pills', params: valid_attributes, headers: headers }
      # [...]
    end
  end

  describe 'PUT /pills/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/pills/#{pill_id}", params: valid_attributes, headers: headers }
      # [...]
    end
  end

  describe 'DELETE /pills/:id' do
    before { delete "/pills/#{pill_id}", params: {}, headers: headers }
    # [...]
  end
end
