require 'rails_helper'

RSpec.describe Page, type: :model do
  describe 'Validations' do
    describe 'Attributes' do
      it { should validate_presence_of(:page_url) }
    end

    describe 'Associations' do
      it { should have_many(:tags) }
    end
  end

  describe 'Creation' do
    it 'create a new page' do
      page = create(:page)
      expect(page).to eq(Page.first)
    end

    it 'create a new page with tags' do
      page = create(:page, :with_tags)
      expect(page).to eq(Page.first)
      expect(page.tags.length).to eq(2)
    end
  end
end
