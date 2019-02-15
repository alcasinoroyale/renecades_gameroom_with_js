function Game(id, name, description, objective, number_of_players, reward_points, genre){
  this.id = id;
  this.name = name;
  this.description = description;
  this.objective = objective;
  this.number_of_players = number_of_players;
  this.reward_points = reward_points;
  this.genre = genre;
};

$(function() {
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
