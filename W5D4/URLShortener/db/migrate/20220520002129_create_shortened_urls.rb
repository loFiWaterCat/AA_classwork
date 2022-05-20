class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_urls, null: false
      t.string :short_urls, null: false
      t.timestamp
    end

  add_index :shortened_urls, :short_urls, unique: true
  end
end
