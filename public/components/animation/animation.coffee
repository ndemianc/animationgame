class Animation
  constructor: ($root) ->
    @stage = $root
    @enemyX = 10
    @enemyY = -25

  start: ->
    for num in [1..5]
      setTimeout @_createEnemy, 1000*num

  createDefense: (x, y) ->
    $defense = $('<div />')
    .addClass('defense')
    .css(
      'top': x + 'px'
      'left': y + 'px'
    )
    .appendTo @stage

  fire: ->
    @_fireBullet

  _animateEnemy: (enemy) ->
    TweenMax.to(enemy, 4, { y: 300 })

  _createEnemy: =>
    $enemy = $('<div />')
    .addClass('enemy')
    .css(
      'top': @enemyY + 'px'
      'left': @enemyX + 'px'
    )
    .appendTo @stage
    @enemyX += 30
    @_animateEnemy($enemy)

  _fireBullet: ->

module.exports = Animation
