# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
geralt = User.create(username: "Geralt of Rivia", email: "geralt@gmail.com", bio: "Loves Role-playing Games", favorite_game: "The Witcher", password: "geralt")
yoshi = User.create(username: "Yoshi", email: "yoshi@gmail.com", bio: "Nintendo is my childhood", favorite_game: "Mario Kart", password: "nintendo")

board_games = Category.create(name: "Board Games")
video_games = Category.create(name: "Video Games")
table_games = Category.create(name: "Table Games")

air_hockey = Game.create(name: "Air Hockey", description: "Players face off with paddles and a puck", objective: "First player to score 7 goals wins the game", number_of_players: "2", reward_points: "100", genre: "Sport")
