# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_29_144748) do
  create_table "boards", force: :cascade do |t|
    t.integer "game_id"
    t.string "loc21"
    t.string "loc31"
    t.string "loc41"
    t.string "loc51"
    t.string "loc26"
    t.string "loc36"
    t.string "loc46"
    t.string "loc56"
    t.string "loc12"
    t.string "loc13"
    t.string "loc14"
    t.string "loc15"
    t.string "loc62"
    t.string "loc63"
    t.string "loc64"
    t.string "loc65"
    t.string "loc101"
    t.string "loc102"
    t.string "loc103"
    t.string "loc104"
    t.string "loc111"
    t.string "loc112"
    t.string "loc113"
    t.string "loc114"
    t.string "loc115"
    t.string "loc116"
    t.string "loc117"
    t.string "loc118"
    t.string "loc201"
    t.string "loc202"
    t.string "loc203"
    t.string "loc204"
    t.string "loc211"
    t.string "loc212"
    t.string "loc213"
    t.string "loc214"
    t.string "loc215"
    t.string "loc216"
    t.string "loc217"
    t.string "loc218"
    t.string "loc301"
    t.string "loc302"
    t.string "loc303"
    t.string "loc304"
    t.string "loc311"
    t.string "loc312"
    t.string "loc313"
    t.string "loc314"
    t.string "loc315"
    t.string "loc316"
    t.string "loc317"
    t.string "loc318"
    t.string "loc401"
    t.string "loc402"
    t.string "loc403"
    t.string "loc404"
    t.string "loc411"
    t.string "loc412"
    t.string "loc413"
    t.string "loc414"
    t.string "loc415"
    t.string "loc416"
    t.string "loc417"
    t.string "loc418"
    t.string "loc22"
    t.string "loc23"
    t.string "loc24"
    t.string "loc25"
    t.string "loc32"
    t.string "loc33"
    t.string "loc34"
    t.string "loc35"
    t.string "loc42"
    t.string "loc43"
    t.string "loc44"
    t.string "loc45"
    t.string "loc52"
    t.string "loc53"
    t.string "loc54"
    t.string "loc55"
    t.string "loc121"
    t.string "loc122"
    t.string "loc123"
    t.string "loc124"
    t.string "loc125"
    t.string "loc126"
    t.string "loc127"
    t.string "loc128"
    t.string "loc129"
    t.string "loc130"
    t.string "loc131"
    t.string "loc132"
    t.string "loc133"
    t.string "loc134"
    t.string "loc135"
    t.string "loc136"
    t.string "loc221"
    t.string "loc222"
    t.string "loc223"
    t.string "loc224"
    t.string "loc225"
    t.string "loc226"
    t.string "loc227"
    t.string "loc228"
    t.string "loc229"
    t.string "loc230"
    t.string "loc231"
    t.string "loc232"
    t.string "loc233"
    t.string "loc234"
    t.string "loc235"
    t.string "loc236"
    t.string "loc321"
    t.string "loc322"
    t.string "loc323"
    t.string "loc324"
    t.string "loc325"
    t.string "loc326"
    t.string "loc327"
    t.string "loc328"
    t.string "loc329"
    t.string "loc330"
    t.string "loc331"
    t.string "loc332"
    t.string "loc333"
    t.string "loc334"
    t.string "loc335"
    t.string "loc336"
    t.string "loc421"
    t.string "loc422"
    t.string "loc423"
    t.string "loc424"
    t.string "loc425"
    t.string "loc426"
    t.string "loc427"
    t.string "loc428"
    t.string "loc429"
    t.string "loc430"
    t.string "loc431"
    t.string "loc432"
    t.string "loc433"
    t.string "loc434"
    t.string "loc435"
    t.string "loc436"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "friender_id"
    t.integer "friendee_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friendee_id"], name: "index_friendships_on_friendee_id"
    t.index ["friender_id"], name: "index_friendships_on_friender_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "host_id"
    t.integer "board_id"
    t.integer "no_players"
    t.string "turn"
    t.integer "round"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_games_on_board_id"
    t.index ["host_id"], name: "index_games_on_host_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "response_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["response_id"], name: "index_messages_on_response_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.string "rank"
    t.boolean "first_move"
    t.integer "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_pieces_on_game_id"
    t.index ["player_id"], name: "index_pieces_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.string "status"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "pic_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "boards", "games"
  add_foreign_key "friendships", "users", column: "friendee_id"
  add_foreign_key "friendships", "users", column: "friender_id"
  add_foreign_key "games", "boards"
  add_foreign_key "games", "users", column: "host_id"
  add_foreign_key "messages", "messages", column: "response_id"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "pieces", "games"
  add_foreign_key "pieces", "players"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
end
