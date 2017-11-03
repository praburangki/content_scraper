FactoryGirl.define do
  factory :page do
    page_url 'kumpul.co'

    after(:create) { |page| create_list(:tag, 2, page: page) }
  end
end
