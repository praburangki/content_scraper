class Tag < ApplicationRecord
  enum content_type: { h1: 0, h2: 1, h3: 2, anchor: 3 }

  belongs_to :page
end
