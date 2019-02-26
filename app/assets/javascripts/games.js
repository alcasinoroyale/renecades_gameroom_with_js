$(document).ready(function() {
  loadGames()
  displayGame()
  nextGame()
})

// Render Games Index with JS //
function loadGames() {
  console.log("all-games")
  $.ajax({
    url: 'http://localhost:3000/games',
    method: 'GET',
    dataType: 'json',
    success: function(response) {
      $("all-games")
    }
  })
}

// Render Show Page for Each Game //
function displayGame() {
  console.log("Show Game Users")
}

// Render Create a Game Form //
class Game {
  constructor(attr) {
    this.id = attr.id;
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

// Render Order Games Function using JS //
$('order_select').on('change', function(event) {
    console.log(event);
});

// Feature Button to jump to Next Game //
function nextGame() {
  console.log("addListener")
  $('button.nextGame').on("click", function(e){
    e.preventDefault();
    let nextId = parseInt($("button.nextGame").attr("data-id")) + 1;
      $.get(`/games/${nextId}.json`, function(data){
    let game = data;
      $(".gameName").text(game["name"]);
      $(".gameDescription").text(game["description"]);
      $(".gameObjective").text(game["objective"]);
      $(".gameNumberOfPlayers").text(game["number_of_players"]);
      $(".gameRewardPoints").text(game["reward_points"]);
      $(".gameGenre").text(game["genre"]);
      $("nextGame").attr("data-id", game["id"]);
    });
  });
}
