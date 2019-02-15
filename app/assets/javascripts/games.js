class Game {
  constructor(id, name, description, objective, number_of_players, reward_points, creator_id, category_id, genre) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.objective = objective;
    this.number_of_players = number_of_players;
    this.reward_points = reward_points;
    this.creator_id = creator_id;
    this.category_id = category_id;
    this.genre = genre;
};

function nextGame(){
  $(".js-nextgame").on("click", function() {
    const nextId = $(this).data("id") + 1;
    $.get("/games" + nextId + ".json", function(data){
      const game = data;
      $(".gameName").text(game["name"]);
      $(".gameDescription").text(game["description"]);
      $(".gameObjective").text(game["objective"]);
      $(".gameNumberOfPlayers").text(game["number_of_players"]);
      $(".gameRewardPoints").text(game["reward_points"]);
      $(".gameGenre").text(game["genre"]);
      $(".js-nextgame").attr("data-id", game["id"]);
    });
    });
  });
