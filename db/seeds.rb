#USERS:
user_1 = User.create(username: "Geralt of Rivia", email: "geralt@gmail.com", bio: "Loves Role-playing Games", favorite_game: "The Witcher", reward_points: "30", password: "geralt")
user_2 = User.create(username: "Yoshi", email: "yoshi@gmail.com", bio: "Nintendo is my childhood", favorite_game: "Mario Kart", reward_points: "20", password: "nintendo")
user_3 = User.create(username: "Jon Snow", email: "jonsnow@gmail.com", bio: "King in the North!", favorite_game: "Ping Pong", reward_points: "40", password: "bastard")
user_4 = User.create(username: "Zelda", email: "zelda@gmail.com", bio: "Princess of Destiny", favorite_game: "Breath of the Wild", reward_points: "15", password: "castle")

board = Category.create(name: "Board Games")
connect_four = Game.create(name: "Connect Four", description: "Players choose a color and insert their discs into the grid", objective: "Form a horizontal, vertical, or diagonal line of four of your own discs", number_of_players: "2", reward_points: "50", genre: "Strategy", category_id: "1")

video = Category.create(name: "Video Games")
skyrim = Game.create(name: "Skyrim", description: "The game's main story revolves around the player character's quest to defeat Alduin the World-Eater, a dragon who is prophesied to destroy the world.", objective: "Explore the world and complete the character's journey through missions and side quests.", number_of_players: "1", reward_points: "100", genre: "Role-Playing", category_id: "2")

table = Category.create(name: "Table Games")
air_hockey = Game.create(name: "Air Hockey", description: "Players face off with paddles and a puck", objective: "First player to score 7 goals wins the game", number_of_players: "2", reward_points: "100", genre: "Sport", category_id: "3")
foosball = Game.create(name: "Foosball", description: "Players control knobs to move the ball into the opponent's goal", objective: "First player to score 10 goals wins the game", number_of_players: "2", reward_points: "100", genre: "Sport", category_id: "3")
