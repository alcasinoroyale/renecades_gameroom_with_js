class Game {
  constructor(attr) {
    this.game.id = attr.game.id;
    this.name = attr.name;
    this.description = attr.description;
    this.objective = attr.objective;
    this.number_of_players = attr.number_of_players;
    this.reward_points = attr.reward_points;
    this.creator_id = attr.creator_id;
    this.category_id = attr.category_id;
    this.genre = attr.genre;
  };
};

function nextGame(){
  $("nextGame").on("click", 'nextGame', function(e) {
    e.preventDefault();
    const nextId = $(this).data("id") + 1;
    $.get("/games" + nextId + ".json", function(data){
      const game = data;
      $(".gameName").text(game["name"]);
      $(".gameDescription").text(game["description"]);
      $(".gameObjective").text(game["objective"]);
      $(".gameNumberOfPlayers").text(game["number_of_players"]);
      $(".gameRewardPoints").text(game["reward_points"]);
      $(".gameGenre").text(game["genre"]);
      $("nextGame").attr("data-id", game["id"]);
      debugger
    });
  });
});
