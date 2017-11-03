class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :content
      t.integer :content_type
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
