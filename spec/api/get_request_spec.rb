require 'rails_helper'

describe API::Base do
  describe 'GET REQUEST' do
    let(:page) { create(:page, :with_tags) }

    before do
      @page = page
    end

    it 'returns all pages including the tags' do
      get '/api/v1/pages'
      expect(json_response.length).to eq(1)
      expect(response.status).to eq(200)
      first_page = json_response.first

      expect(
        first_page.reject { |attr| attr == 'tags' }
      ).to eq(@page.attributes.reject { |attr| %w[created_at updated_at].include? attr })

      expect(
        first_page['tags']
      ).to eq(@page.tags.map { |tag| tag.attributes.reject { |attr| %w[created_at updated_at page_id].include? attr } })
    end
  end
end
