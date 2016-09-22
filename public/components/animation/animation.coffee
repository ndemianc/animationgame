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
    @interval = setInterval @_fireBullet, 2000

  _animateEnemy: (enemy) ->
    TweenMax.to(enemy, 2, { y: 300 })

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

  _fireBullet: =>
    if $('.enemy:visible').length
      $defense = $('.defense')
      $bullet = $('<div class="bullet" />')
        .css(
          top: $defense.css('top')
          left: $defense.css('left')
        )
        .appendTo(@stage)
      $nearest = $defense.nearest('.enemy');
      @_animateBullet($bullet, $nearest.position().left+15, $nearest.position().top+75)

  _animateBullet: ($b, x, y) ->
    TweenMax.to($b, 1,
      top: y
      left: x
      onUpdate: @_detectBulletCollision
      onUpdateParams: [$b]
    )

  _detectBulletCollision: ($bullet) =>
    $('.enemy:visible').each (index, val) =>
      $enemy = $(val);
      unless @_checkIfNoIntersection($enemy, $bullet)
        $enemy.hide()
        $bullet.hide()

  _checkIfNoIntersection: (e, b) ->
    e =
      p:
        l: e.position().left
        t: e.position().top
      h: e.height()
      w: e.width()
    b =
      p:
        l: b.position().left
        t: b.position().top
      h: b.height()
      w: b.width()

    e.p.l > (b.p.l + b.w) or (e.p.l + e.w) < b.p.l or e.p.t > (b.p.t + b.h) or (e.p.t + e.h) < b.p.t

module.exports = Animation
