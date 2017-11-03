require 'rails_helper'

describe API::Base do
  describe 'POST REQUEST' do
    describe 'send a post request' do
      it 'save the contents' do
        VCR.use_cassette('scraper/get_page') do
          url = 'https://www.kumpul.co'
          post '/api/v1/pages', params: { page_url: url }
          expect(response.status).to eq(200)
          expect(json_response['id']).to eq(2)
          expect(json_response['page_url']).to eq(url)
          expect(json_response['tags'].select { |tag| tag['content_type'] == 'h1' }.size).to eq(1)
          expect(json_response['tags'].select { |tag| tag['content_type'] == 'h2' }.size).to eq(11)
          expect(json_response['tags'].select { |tag| tag['content_type'] == 'h3' }.size).to eq(6)
          expect(json_response['tags'].select { |tag| tag['content_type'] == 'anchor' }.size).to eq(30)
        end
      end
    end
  end
end
