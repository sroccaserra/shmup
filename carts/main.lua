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
  w = 8,
  y = 128*3/5,
  dy = 2,
  start_dy = 1,
  a = 0,
  da = 0.05,
  h = 8,
  box = {
    dx = 1,
    dy = 1,
    w = 4,
    h = 6,
  },
  starting_frames = 0,
}

camera_y = 320

---
-- main

function _init()
  score = 0

  ship_frame_index_from_angle = distributor(1, 5, -0.25, 0.25)
  ship.shoot = pea_shoot
  start_life()

  pea_shots = {}
  flame_shots = {}
  enemies = {}
  bullets = {}
  explosions = {}

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
  camera_y = camera_y - 0.5
  if camera_y == -128 then
    camera_y = 128
  end

  frame_counter = frame_counter + 1
  if 0 == frame_counter % (3 * 10) then
    spawn_enemy()
  end

  local input = {
    left = btn(0),
    right = btn(1),
    up = btn(2),
    down = btn(3),
    shot_change = btnp(4),
    shoot = btn(5),
  }

  update_ship(input)

  update_bullets()
  update_enemies()
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

function draw_enemies()
  for enemy in all(enemies) do
    if 0 == (frame_counter % 2) then
      spr(enemy.tile-1, enemy.x+6, enemy.y)
    end
    spr(enemy.tile, enemy.x, enemy.y, 2, 2)
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
  box = {
    dx = 0,
    dy = 1,
    w = 2,
    h = 5,
  },
}
pea_shot.__index = pea_shot

function pea_shoot()
  if #pea_shots >= 6 then
    return
  end

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
    box = {
      dx = 0,
      dy = 1,
      w = 2,
      h = 8,
    },
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

enemy = {
  tile = 27,
  w = 8,
  h = 8,
  fire_rate = 20,
  box = {
    dx = 5,
    dy = 5,
    w = 5,
    h = 6,
  },
}
enemy.__index = enemy

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
  setmetatable(instance, enemy)
  add(enemies, instance)
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
  box = {
    dx = 0,
    dy = 0,
    w = 5,
    h = 5,
  }
}
bullet.__index = bullet

function fire_bullet_from_to(x1, y1, x2, y2)
  if ship.starting_frames > 0 then
    return
  end

  local norm = sqrt((x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1))
  local instance = {
    x = x1 - (bullet.box.dx + bullet.box.w/2),
    y = y1 - (bullet.box.dy + bullet.box.h/2),
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
    x = boxed.x + boxed.box.dx,
    y = boxed.y + boxed.box.dy,
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
  local xa = a.x + a.box.dx
  local ya = a.y + a.box.dy
  local xb = b.x + b.box.dx
  local yb = b.y + b.box.dy
  return xa < xb + b.box.w and
     xa + a.box.w > xb and
     ya < yb + b.box.h and
     a.box.h + ya > yb
end

function box(boxed)
  local x1 = boxed.x + boxed.box.dx
  local y1 = boxed.y + boxed.box.dy
  local x2 = x1 + boxed.box.w
  local y2 = y1 + boxed.box.h

  return x1, y1, x2, y2
end

function center(boxed)
  local x1, y1, x2, y2 = box(boxed)
  return (x1 + x2)/2, (y1 + y2)/2
end

function is_in_screen(boxed)
  local x1 = boxed.x + boxed.box.dx
  local y1 = boxed.y + boxed.box.dy
  local x2 = x1 + boxed.box.w
  local y2 = y1 + boxed.box.h

  return x1 > 0 and y1 > 0 and
         x2 < 127 and y2 < 127
end

function is_off_screen(boxed)
  local x1 = boxed.x + boxed.box.dx
  local y1 = boxed.y + boxed.box.dy
  local x2 = x1 + boxed.box.w
  local y2 = y1 + boxed.box.h

  return x1 > 128 or y1 > 128 or
         x2 < 0 or y2 < 0
end
