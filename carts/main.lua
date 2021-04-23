-- ~shmup~
-- by sroccaserra

---
-- globals

-- convention:
--   - vx is for x velocity, a variable movement along x axis
--   - dx is for delta x, a base constant increment used to compute vx
--   - da is a base constant angular increment (delta alpha)
--   - shots are the ship's shots
--   - bullets are ennemies' bullets

frame_counter = 0

ship_frames = {41, 40, 39, 38, 37}
explosion_frames = {53, 54, 55, 56, 57, 58, 59, 60, 61}

ship = {
  x = 60,
  dx = 2,
  vx = 0,
  w = 4,

  y = 128*3/5,
  dy = 2,
  start_dy = 1,
  h = 6,

  a = 0,
  da = 0.05,

  tile_dx = -1,
  tile_dy = -1,
  starting_frames = 0,
}

wave_configurations = {}

---
-- main

function _init()
  music(0)
  score = 0

  camera_y = 320
  level_y = 0

  ship_frame_index_from_angle = distributor(1, 5, -0.25, 0.25)
  ship.shoot = pea_shoot
  start_life()

  pea_shots = {}
  flame_shots = {}
  enemies = {} -- enemies on screen
  bullets = {}
  explosions = {}

  wave_configurations = {}
  for i=-15,-150,-15 do
    add(wave_configurations, create_wave_configuration(i))
  end

  stars = {}
  for i=1,20 do
    add(stars, {
      dy = rnd(1),
      tile = 23 + flr(rnd(3)),
      x = rnd(128),
      y = rnd(128)
    })
  end
end

function _draw()
  cls()
  draw_stars()

  camera(0, camera_y)
  map()
  camera(0, camera_y+256)
  map()
  camera()

  draw_ship_shots()
  draw_enemies()
  draw_explosions()
  draw_ship()
  draw_bullets()
  draw_hud()
end

function _update()
  frame_counter = frame_counter + 1

  local input = {
    left = btn(0),
    right = btn(1),
    up = btn(2),
    down = btn(3),
    shot_change = btnp(4),
    shoot = btn(5),
  }

  update_ship(input)

  update_background()
  update_bullets()
  update_waves()
  update_explosions()
  update_ship_shots()
  update_stars()
end

---
-- Draw functions

function draw_explosions()
  for explosion in all(explosions) do
    spr(explosion_frames[explosion.i], explosion.x, explosion.y)
  end
end

function draw_hud()
  print(score, 6, 6, 1)
  print(score, 5, 5, 7)

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

function draw_ship()
  if ship.starting_frames > 0 and 0 == (frame_counter % 2) then
    return
  end

  local glow_y
  if 0 == frame_counter % 2 then
    glow_y = 7
  else
    glow_y = 6
  end
  spr(8, ship.x + 1, ship.y + glow_y)
  local i = ship_frame_index_from_angle(ship.a)
  spr(ship_frames[i], ship.x + ship.tile_dx, ship.y + ship.tile_dy)
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

function draw_enemies()
  for enemy in all(enemies) do
    if 0 == (frame_counter % 2) then
      spr(enemy.tile-1, enemy.x+1, enemy.y+enemy.tile_dy)
    end
    spr(enemy.tile, enemy.x + enemy.tile_dx, enemy.y + enemy.tile_dy, 2, 2)
  end
end

function draw_bullets()
  for bullet in all(bullets) do
    spr(bullet_tiles[1 + bullet.tile_counter % #bullet_tiles], bullet.x, bullet.y)
  end
end

---
-- Update functions

function update_ship(input)
  if ship.starting_frames > 0 then
    ship.y = ship.y - ship.start_dy
    ship.starting_frames = ship.starting_frames - 1
    return
  end

  if input.left then
    ship.vx = - ship.dx
    ship.x = ship.x + ship.vx
  elseif input.right then
    ship.vx = ship.dx
    ship.x = ship.x + ship.vx
  else
    ship.vx = 0
  end

  ship.x = mid(0, ship.x, 121)

  if input.up then
    ship.y = ship.y - ship.dy
  end
  if input.down then
    ship.y = ship.y + ship.dy
  end

  ship.y = mid(0, ship.y, 120)

  if input.shot_change then
    if ship.shoot == pea_shoot then
      ship.shoot = flame_shoot
    else
      ship.shoot = pea_shoot
    end
  end
  if input.shoot then
    ship.shoot()
  end

  update_ship_angle()
end

function update_ship_angle()
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

  ship.a = mid(-0.25, ship.a, 0.25)
end

function update_background()
  local increment = -0.5

  level_y = level_y + increment

  camera_y = camera_y + increment
  if camera_y == -128 then
    camera_y = 128
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
    update_shot(shot, pea_shots)
  end

  for shot in all(flame_shots) do
    update_shot(shot, flame_shots)
  end
end

function update_shot(shot, shot_table)
  shot.y = shot.y + shot.dy
  shot.age = shot.age + 1
  if shot.y < -10 then
    del(shot_table, shot)
  end
end

function update_stars()
  for star in all(stars) do
    star.y = star.y + star.dy
    if star.y > 128 then
      star.y = 0
    end
  end
end

function update_waves()
  local new_waves = get_new_waves()

  for wave in all(new_waves) do
    add_enemies_from_wave(wave)
  end

  update_enemies()
end

function get_new_waves()
  local new_waves = {}

  for wave_configuration in all(wave_configurations) do
    if wave_configuration:must_start() then
      add(new_waves, wave_configuration.enemies)
    end
  end

  return new_waves
end

function add_enemies_from_wave(wave)
  for enemy in all(wave) do
    add(enemies, enemy)
  end
end

-- les ennemis peuvent démarrer offscreen
-- les ennemis suivent un chemin
-- un chemin est une fonction t -> (x, y) (permet de faire des courbes, des cercles)
function update_enemies()
  for enemy in all(enemies) do
    if enemy.has_entered and is_off_screen(enemy) then
      del(enemies, enemy)
      break
    end

    enemy.x = enemy.x + enemy.dx
    enemy.y = enemy.y + enemy.dy

    if is_hit(enemy) then
      kill_enemy(enemy)
    elseif collides_with(enemy, ship) then
      die()
    end

    local is_in_view = is_in_screen(enemy)
    if is_in_view then
      enemy.has_entered = true
    end

    enemy.next_shot = enemy.next_shot - 1
    if enemy.next_shot <= 0 and is_in_view then
      local xe, ye = center(enemy)
      local xs, ys = center(ship)
      fire_bullet_from_to(xe, ye, xs, ys)
      enemy.next_shot = enemy.fire_rate
    end
  end
end

function update_bullets()
  for bullet in all(bullets) do
    bullet.x = bullet.x + bullet.dx
    bullet.y = bullet.y + bullet.dy
    if 0 == (frame_counter % 2) then
      bullet.tile_counter = bullet.tile_counter + 1
    end
    if is_off_screen(bullet) then
      del(bullets, bullet)
    end
    if collides_with(bullet, ship) then
      die()
    end
  end
end

---
-- gameplay

function start_life()
  ship.starting_frames = 40
  ship.a = 0
  ship.x = 60
  ship.y = 128
end

pea_shot = {
  max_shots = 6,
  tile = 6,
  rounds = 2,
  dy = -7,
  w = 2,
  h = 5,
  tile_dx = 0,
  tile_dy = -1,
}
pea_shot.__index = pea_shot

function pea_shoot()
  if #pea_shots >= 6 then
    return
  end

  local shot = {
    x = ship.x + 1,
    y = ship.y - 1,
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
    w = 2,
    h = 8,
    tile_dx = 0,
    tile_dy = -1,
}
flame_shot.__index = flame_shot

function flame_shoot()
  local shot = {
    x = ship.x + 1,
    y = ship.y - 1,
    age = 0,
  }
  setmetatable(shot, flame_shot)
  add(flame_shots, shot)
end

base_enemy = {
  tile = 27,
  w = 5,
  h = 6,
  fire_rate = 20,
  tile_dx = -5,
  tile_dy = -5,
}
base_enemy.__index = base_enemy

function spawn_enemy()
  local instance = {
    x = rnd(128),
    y = -10,
    dy = 1,
    next_shot = 40,
    has_entered = false,
  }
  if instance.x > 60 then
    instance.dx = -1
  else
    instance.dx = 1
  end
  setmetatable(instance, base_enemy)

  return instance
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
  score = score + 10
  del(enemies, enemy)
  explode(enemy)
end

bullet_tiles = {16, 17, 18, 19}
bullet = {
  speed = 3,
  w = 4,
  h = 4,
}
bullet.__index = bullet

function fire_bullet_from_to(x1, y1, x2, y2)
  if ship.starting_frames > 0 then
    return
  end

  local norm = sqrt((x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1))
  local instance = {
    x = x1 - bullet.w/2,
    y = y1 - bullet.h/2,
    dx = bullet.speed*(x2 - x1)/norm,
    dy = bullet.speed*(y2 - y1)/norm,
    tile_counter = 0,
  }
  setmetatable(instance, bullet)

  add(bullets, instance)
end

function die()
  if 0 == ship.starting_frames then
    explode(ship)
    start_life()
  end
end

function explode(boxed)
  add(explosions, {
    life = #explosion_frames,
    i = 1,
    x = boxed.x + boxed.w/2 - 4,
    y = boxed.y + boxed.h/2 - 4,
  })
  sfx(10)
end

---
-- Wave configurations

function create_wave_configuration(start_y)
  return {
    start_y = start_y,
    enemies = {spawn_enemy()},
    must_start = function(self)
      return level_y == self.start_y
    end
  }
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

function center(boxed)
  return boxed.x + boxed.w/2, boxed.y + boxed.h/2
end

function is_in_screen(boxed)
  return boxed.x > 0 and boxed.y > 0 and
         boxed.x + boxed.w < 127 and boxed.y + boxed.h < 127
end

function is_off_screen(boxed)
  return boxed.x > 128 or boxed.y > 128 or
         boxed.x + boxed.w < 0 or boxed.y + boxed.h < 0
end
