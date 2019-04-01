$(document).ready(function() {
  createGame()
  loadGames()
  loadCategories()
  displayGame()
  nextGame()
  orderGames()
  displayPlayers()
  validateGameUser()
})

// Render a Form for Creating a New Game //
function createGame() {
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
      console.log("Game Created")
      console.log(json)
      let newGame = new Game(json);
      $('#renecades-container').html('')
      const gameDetails = newGame.formatShow()
      $('#renecades-container').html(gameDetails)
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
    this.users = attr.users;
  };
};


// Render Games Index with JS //
function loadGames() {
  console.log("Load Games")
  $.ajax({
    url: 'http://localhost:3000/games',
    method: 'GET',
    dataType: 'json',
    success: function(response) {
    }
  })
}

// Load Categories with JS //
function loadCategories() {
  console.log("Load Categories")
}

// Render Show Page for Each Game //
function displayGame() {
  $(".js-more").on("click", function() {
    const id = $(this).data("id");
      $.get("/games/" + id + ".json", function(g) {
    const moreInfo = "<h3>" + g["name"] + "</h3>" + g["reward_points"] + " Reward Points" + "<br>" + "<a href='/games/" + id +"'>All Game Info</a>"
      $("#game-" + id).html(moreInfo);
    console.log(`${moreInfo}`);
    })
  });
}

// Feature Button to jump to Next Game //
function nextGame() {
  console.log("Next Game")
  $(".js-nextGame").on("click", function(){
    const nextId = parseInt($(".js-nextGame").attr("data-id")) + 1;
      $.get("/games/" + nextId + ".json", function(data){
      console.log(data);
      let newGame = new Game(data);
      $('#renecades-container').html('')
      const gameDetails = newGame.formatShow()
      $('#renecades-container').html(gameDetails)
    });
  });
}

// Render Order Games Function using JS //
function orderGames() {
  console.log("Order Games")
  $('.order_select').on('change', function(event) {
      console.log(event);
  });
}

// Render has-many relationship on Game Show Page //
function displayPlayers(){
  document.getElementById('CP')
  console.log("Display Current Players")
  console.log(document.getElementById('CP'))
}

// Prototype Object Function //
Game.prototype.formatShow = function() {
  let postHtml = `
  <h2>${this.name}</h2>
  <p>${this.description}</p>
  <p>${this.objective}</p>
  <p>Number of Players: ${this.number_of_players}</p>
  <p>Rewards Points: ${this.reward_points}</p>
  <p>${this.genre}</p>
  <p>Current Players: ${this.users}</p>
  `
  return postHtml
}

function validateGameUser()  {
  let user = document.getElementById('player').innerHTML
  console.log(user)
}

// Potentially make an if statement inside prototype object. If user(s) exists for the game, display users.username and if there are no current players, display the creator instead.

// Category Constructor and Prototype

class Category {
  constructor(attr) {
    this.id = attr.id;
    this.name = attr.name;
    this.games = attr.games;
  };
};

Category.prototype.formatShow = function() {
  console.log(this)
  let postHtml = `
  <h2>${this.name}</h2>
  `
  return postHtml
}
