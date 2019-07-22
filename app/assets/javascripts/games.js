$(document).ready(function() {
  createGame()
  loadGames()
  nextGame()
  changeColor()
  orderGames()
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
      const gameDetails = newGame.newGameForm()
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
  $('.games_data').on('click', function(event) {
    event.preventDefault()
    history.pushState(null, '', 'games')
      fetch(`/games.json`)
      .then(resp => resp.json())
      .then(games => {
        $('#renecades-container').html('')

        games.forEach(game => {
          let newGame = new Game(game)
          let gameHtml = newGame.formatGame()
          $('#renecades-container').append(gameHtml)
      })
    })
  })
}

// Prototype Object to Format Games Index //
Game.prototype.formatGame = function() {
  return (`
    <a href="/games/${this.id}" data-id="${this.id}" class="show_games"><h3>${this.name}</h3></a>
    <p>${this.description}</p>
    <p>${this.reward_points} Reward Points</p>
  `)
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
  $('#order_select').on('click', function(event) {
    event.preventDefault()
      fetch(`/games.json`)
      .then(resp => resp.json())
      .then(games => {

        games.sort(function(a, b) {
          return a.name.localeCompare(b.name)
          // return (a.name > b.name ) ? 1 : -1 //
        })
        console.log(games)

        $('#renecades-container').html('')
        games.forEach(game => {
          let sortedGame = new Game(game)
          let gameDetails = sortedGame.formatGame()
          $('#renecades-container').append(gameDetails)
          console.log("Order Games")
      })
    })
  })
}

function changeColor() {
  $('#change-color').on('click', function(event) {
    event.preventDefault()
    console.log(document.body)
    document.body.style.backgroundColor = "#146780"
    document.body.style.color = "black"
    document.getElementsByTagName('H1')[0].style.color = "black"
    document.getElementsByTagName('nav')[0].style.backgroundColor = "#981010"
    document.getElementsByTagName('nav')[0].style.borderStyle = "solid"
  })
}

// Game Prototype for Existing Game //
Game.prototype.formatShow = function() {
  let userHtml = this.users.map (user => {
    return (`
      Current Players: ${user.username}
      `)
  }).join('')

  return(`
    <h2>${this.name}</h2>
    <p>${this.description}</p>
    <p>${this.objective}</p>
    <p>Number of Players: ${this.number_of_players}</p>
    <p>Rewards Points: ${this.reward_points}</p>
    <p>${this.genre}</p>
    ${userHtml}
  `)
}

// Game Prototype for New Game //
Game.prototype.newGameForm = function() {
  let postHtml = `
  <h2>${this.name}</h2>
  <p>${this.description}</p>
  <p>${this.objective}</p>
  <p>Number of Players: ${this.number_of_players}</p>
  <p>Rewards Points: ${this.reward_points}</p>
  <p>${this.genre}</p>
  `
  return postHtml
}
