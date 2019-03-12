$(document).ready(function() {
  createGame()
  loadGames()
  displayGame()
  appendGames()
  displayPlayers()
  nextGame()
})

// Render a Form for Creating a New Game //
function createGame() {
  console.log("Game Created")
  $("form#new_game").on("submit", function(e) {
    e.preventDefault()
    let $form = $(this);
    let action = $form.attr("action")
    let params = $form.serialize()
    $.ajax({
      url: 'http://localhost:3000/games',
      data: params,
      dataType: "json",
      method: "POST"
    })

    .done(function(json) {  
      console.log(json)
      let newGame = new Game(json);
      $('.all-games').append(newGame)
    })

    .error(function(response) {
      console.log("Not working", response)
    })
  })
}

// Constructor for a Game Object //
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


// Render Games Index with JS //
function loadGames() {
  console.log("all-games")
  $.ajax({
    url: 'http://localhost:3000/games',
    method: 'GET',
    dataType: 'json',
    success: function(response) {
    }
  })
}

// Render Show Page for Each Game //
function displayGame() {
  $(".js-more").on("click", function() {
           const id = $(this).data("id");
        $.get("/games/" + id + ".json", function(g) {
             const moreInfo = "<h2>" + g["name"] + "</h2>" + g["reward_points"] + " Reward Points" + "<br>" + "<a href='/games/" + id +"'>All Game Info</a>"
            $("#game-" + id).html(moreInfo);
    })
  });
}

// Iterate All Games and Append Them to the DOM //
function appendGames(){
  $("h4").append($('.all-games').html());
}

// Feature Button to jump to Next Game //
function nextGame() {
  console.log("Next Game")
  $(".js-nextGame").on("click", function(){
    const nextId = parseInt($(".js-nextGame").attr("data-id")) + 1;
      $.get("/games/" + nextId + ".json", function(data){
    const game = data;
      $(".gameName").text(game["name"]);
      $(".gameDescription").text(game["description"]);
      $(".gameObjective").text(game["objective"]);
      $(".gameNumberOfPlayers").text(game["number_of_players"]);
      $(".gameRewardPoints").text(game["reward_points"]);
      $(".gameGenre").text(game["genre"]);
      $(".js-nextGame").attr("data-id", game["id"]);
    });
  });
}

// Render Order Games Function using JS //
$('order_select').on('change', function(event) {
    console.log(event);
});

// Render Has-many relationship on Game Show Page //
function displayPlayers(){
  document.getElementById("CP").style.fontWeight = "900";
  console.log("Display Current Players")
}

// Prototype Object Function //

Game.prototype.renderLi = function() {
  return Game.template(this)
}
