require 'rails_helper'

RSpec.describe Page, type: :model do
  # subject(:page) { create(:page) }

  describe 'Validations' do
    describe 'Attributes' do
      it { should validate_presence_of(:page_url) }
    end

    describe 'Associations' do
      it { should have_many(:tags) }
    end
  end
end
