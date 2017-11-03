FactoryGirl.define do
  factory :tag do
    content { Faker::Lorem.sentence }
    content_type { Tag.content_types.keys.sample.to_sym }
  end
end
