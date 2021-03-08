---
-- globals
-- convention:
--   - vx is for x velocity, a variable movement along x axis
--   - dx is for delta x, a base constant increment used to compute vx
--   - da is a base constant angular increment (delta alpha)

blinking_bullet_tile = 1
blinking_bullet_counter = 0
laser_counter = 0

laser_colors = {8, 11, 12}
laser_color_index = 1

ship = {
  x = 60,
  dx = 1,
  vx = 0,
  w = 8,
  y = 128*3/5,
  dy = 1,
  a = 0,
  da = 0.05,
  h = 8,
  is_alive = true,
}

enemy = {
  tile = 27,
  x = 0,
  dx = .5,
  w = 8,
  y = -100,
  dy = 2,
  h = 8,
  is_alive = true,
}

frame_counter = 0

ship_frames = {41, 40, 39, 38, 37}
pea_shots = {}
flame_shots = {}

explosion_frames = {53, 54, 55, 56, 57, 58, 59, 60, 61}
explosions = {}

---
-- main

function _init()
  ship_frame_index_from_angle = distributor(1, 5, -0.25, 0.25)
  stars = {}
  for i=1,20 do
    add(stars, {
      dy = rnd(1),
      tile = 23 + flr(rnd(3)),
      x = rnd(128),
      y = rnd(128)
    })
  end
  ship.shoot = pea_shoot
end

function _draw()
  cls()
  draw_stars()
  map()

  -- spr(blinking_bullet_tile,60,60)
  -- line(10, 64, 53, 64, laser_colors[laser_color_index])

  -- draw_angle(ship.a)

  draw_ship_shots()
  draw_enemy(enemy)
  draw_explosions()
  draw_hud()
  draw_ship(ship)
end

function _update()
  frame_counter = frame_counter + 1

  -- update_laser()
  -- update_blinking_bullet()

  if btn(0) then
    ship.vx = - ship.dx
    ship.x = ship.x + ship.vx
  elseif btn(1) then
    ship.vx = ship.dx
    ship.x = ship.x + ship.vx
  else
    ship.vx = 0
  end
  if btn(2) then
    ship.y = ship.y - ship.dy
  end
  if btn(3) then
    ship.y = ship.y + ship.dy
  end

  if btnp(4) then
    if ship.shoot == pea_shoot then
      ship.shoot = flame_shoot
    else
      ship.shoot = pea_shoot
    end
  end
  if btn(5) then
    ship.shoot()
  end

  update_enemy(enemy)
  update_explosions()
  update_ship_shots()
  update_angle(ship)
  update_stars()
end

---
-- draw & update functions

function draw_angle(a)
  local x, y = 5, 5
  local r = 5
  circ(x, y, r, 10)
  line(x, y, x + r*sin(a), y - r*cos(a))
end

function draw_explosions()
  for explosion in all(explosions) do
    spr(explosion_frames[explosion.i], explosion.x, explosion.y)
  end
end

function draw_hud()
  local dx = 0
  local x = 109
  local y = 5
  local w = 7
  local h = 12
  spr(pea_shot.tile, 112, 9)
  spr(flame_shot.tile, 120, 8)
  if ship.shoot == flame_shoot then
    x = x + 8
  end
  rect(x + 1, y + 1, x + w + 1, y + h + 1, 2)
  rect(x, y, x + w, y + h, 8)
end

function draw_ship(ship)
  local glow_y
  if 0 == frame_counter % 2 then
    glow_y = 8
  else
    glow_y = 7
  end
  spr(8, ship.x+2, ship.y+glow_y)
  local i = ship_frame_index_from_angle(ship.a)
  spr(ship_frames[i], ship.x, ship.y)
end

function draw_ship_shots()
  for shot in all(pea_shots) do
    draw_shot(shot)
  end
  for shot in all(flame_shots) do
    draw_shot(shot)
  end
end

function draw_shot(shot)
  if ((frame_counter + shot.age) % shot.rounds) == 0 then
    spr(shot.tile, shot.x, shot.y)
  end
end

function draw_stars()
  for star in all(stars) do
    spr(star.tile, star.x, star.y)
  end
end

function draw_enemy(enemy)
  if not enemy.is_alive then
    return
  end
  spr(enemy.tile, enemy.x, enemy.y, 2, 2)
end

function update_laser()
  laser_counter = laser_counter + .5

  if laser_counter >= 1 then
    laser_counter = 0
    laser_color_index = laser_color_index + 1

    if laser_color_index > #laser_colors then
      laser_color_index = 1
    end
  end
end

function update_blinking_bullet()
  blinking_bullet_counter = blinking_bullet_counter + .5

  if blinking_bullet_counter >= 1 then
    blinking_bullet_tile = blinking_bullet_tile + 1
    blinking_bullet_counter = 0
  end

  if blinking_bullet_tile > 4 then
    blinking_bullet_tile = 1
  end
end

function update_angle(ship)
  local da = ship.da
  if (ship.vx < 0) then
    ship.a = ship.a + da
  elseif (ship.vx > 0) then
    ship.a = ship.a - da
  else
    if (abs(ship.a) <= da) then
      ship.a = 0
    elseif (ship.a > 0) then
      ship.a = ship.a - da
    else
      ship.a = ship.a + da
    end
  end
  if (ship.a > 0.25) then
    ship.a = 0.25
  elseif (ship.a < -0.25) then
    ship.a = -0.25
  end
end

function update_explosions()
  for explosion in all(explosions) do
    explosion.i = explosion.i + 1
    if explosion.i > explosion.life then
      del(explosions, explosion)
    end
  end
end

function update_ship_shots()
  for shot in all(pea_shots) do
    update_shot(shot)
  end

  for shot in all(flame_shots) do
    update_shot(shot)
  end
end

function update_shot(shot)
  shot.y = shot.y + shot.dy
  shot.age = shot.age + 1
end

function update_stars()
  for star in all(stars) do
    star.y = star.y + star.dy
    if star.y > 128 then
      star.y = 0
    end
  end
end

function update_enemy(enemy)
  if not enemy.is_alive then
    return
  end

  enemy.x = enemy.x + enemy.dx
  enemy.y = enemy.y + enemy.dy

  if is_hit(enemy) then
    kill_enemy(enemy)
  elseif collides_with(enemy, ship) then
    die()
  end
end

---
-- gameplay

pea_shot = {
  max_shots = 6,
  tile = 6,
  rounds = 2,
  dy = -7,
  w = 3,
  h = 8,
}
pea_shot.__index = pea_shot

function pea_shoot()
  local shot = {
    x = ship.x+2,
    y = ship.y,
    age = 0,
  }
  setmetatable(shot, pea_shot)
  add(pea_shots, shot)
end

flame_shot = {
    max_shots = 99,
    tile = 5,
    rounds = 2,
    dy = -10,
    w = 3,
    h = 8,
}
flame_shot.__index = flame_shot

function flame_shoot()
  local shot = {
    x = ship.x+2,
    y = ship.y,
    age = 0,
  }
  setmetatable(shot, flame_shot)
  add(flame_shots, shot)
end

function is_hit(enemy)
  for shot_type in all({pea_shots, flame_shots}) do
    for shot in all(shot_type) do
      if collides_with(enemy, shot) then
        return true
      end
    end
  end

  return false
end

function kill_enemy(enemy)
  enemy.is_alive = false
  explode(enemy)
end

function die()
  ship.is_alive = false
end

function explode(box)
  add(explosions, {
    life = #explosion_frames,
    i = 1,
    x = box.x,
    y = box.y,
  })
end

---
-- math

function distributor(n1, n2, x1, x2)
  local a = (n2 - n1) / (x2 - x1)
  local b = n2 - a*x2

  return function(x)
    local y = a*x + b
    return flr(y+0.5)
  end
end

function collides_with(a, b)
  return a.x < b.x + b.w and
     a.x + a.w > b.x and
     a.y < b.y + b.h and
     a.h + a.y > b.y
end
