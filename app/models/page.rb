class Page < ApplicationRecord
  validates_presence_of :page_url

  has_many :tags
end
