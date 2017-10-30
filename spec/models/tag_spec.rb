require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject(:tag) { create(:tag) }

  describe 'Validations' do
    describe 'Attributes' do
      it { should define_enum_for(:content_type).with([:h1, :h2, :h3, :anchor]) }
    end

    describe 'Associations' do
      it { should belong_to(:page) }
    end
  end
end
