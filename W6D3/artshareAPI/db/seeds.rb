# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create_table "artwork_shares", force: :cascade do |t|
#     t.integer "artwork_id", null: false
#     t.integer "viewer_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artwork_id"], name: "index_artwork_shares_on_artwork_id"
#     t.index ["viewer_id", "artwork_id"], name: "index_artwork_shares_on_viewer_id_and_artwork_id", unique: true
#   end

#   create_table "artworks", force: :cascade do |t|
#     t.string "title", null: false
#     t.string "image_url", null: false
#     t.integer "artist_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artist_id", "title"], name: "index_artworks_on_artist_id_and_title", unique: true
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "username", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["username"], name: "index_users_on_username", unique: true
#   end


User.create!(username: "Alan")
User.create!(username: "Charlie")
User.create!(username: "Danny")
User.create!(username: "Evee")
User.create!(username: "Wendy")
User.create!(username: "Chris")
User.create!(username: "Ignacio")
User.create!(username: "Megaman")
User.create!(username: "Snake")
User.create!(username: "Naruto")

Artwork.create!(title: "Giant Squid and the Titanic", image_url: "www.ilovesquids.com", artist_id: 1)
Artwork.create!(title: "I'll be Back", image_url: "www.skynet.org", artist_id: 2)
Artwork.create!(title: "Perfection", image_url: "www.terminallove.com", artist_id: 1)
Artwork.create!(title: "Les Miserables", image_url: "www.appacademysurvivors.com", artist_id: 4)
Artwork.create!(title: "The Good Cat", image_url: "www.catawesome.com", artist_id: 9)

ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
ArtworkShare.create!(artwork_id: 1, viewer_id: 4)
ArtworkShare.create!(artwork_id: 2, viewer_id: 5)
ArtworkShare.create!(artwork_id: 4, viewer_id: 6)
ArtworkShare.create!(artwork_id: 5, viewer_id: 1)

Comment.create!(user_id: 1, artwork_id: 1, body: "I like to eat ASSociations")
Comment.create!(user_id: 2, artwork_id: 1, body: "Woah man save some for me")
Comment.create!(user_id: 1, artwork_id: 1, body: "I got u homie")
Comment.create!(user_id: 4, artwork_id: 3, body: "Terminal is love")
Comment.create!(user_id: 9, artwork_id: 4, body: "Never forget")
