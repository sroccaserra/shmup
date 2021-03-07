---
-- globals
-- convention:
--   - vx is for x velocity, a variable movement along x axis
--   - dx is for delta x, a base constant increment used to compute vx
--   - da is a base constant angular increment (delta alpha)

n = 1
x = 0
fc = 0

lc = 1
lcs = {8, 11, 12}

ship = {
  x = 60,
  dx = 1,
  vx = 0,
  y = 128*3/5,
  dy = 1,
  a = 0,
  da = 0.05,
}

ship_frames = {41, 40, 39, 38, 37}

---
-- main

function _init()
  compute_frame_index = distributor(1, 5, -0.25, 0.25)
  stars = {}
  for i=1,20 do
    add(stars, {dy = rnd(1), tile = 23+flr(rnd(3)), x= rnd(128), y = rnd(128)})
  end
end

function _draw()
  cls()
  draw_stars()
  map()

  -- spr(n,60,60)
  -- line(10, 64, 53, 64, lcs[lc])
  -- draw_angle(ship.a)

  draw_ship(ship)
end

function _update()
  fc = fc + .5
  if fc >= 1 then
    fc = 0
    lc = lc + 1
    if lc > #lcs then
      lc = 1
    end
  end

  x = x + .5
  if x >= 1 then
    n = n + 1
    x = 0
  end
  if n > 4 then
    n = 1
  end

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
  update_angle(ship)
  update_stars()
end

---
-- core

function draw_angle(a)
  local x, y = 5, 5
  local r = 5
  circ(x,y,r,10)
  line(x,y,x+r*sin(a), y-r*cos(a))
end

function draw_ship(ship)
  ship_frame_index = compute_frame_index(ship.a)
  spr(ship_frames[ship_frame_index], ship.x, ship.y, 1, 2)
end

function draw_stars()
  for star in all(stars) do
    spr(star.tile, star.x, star.y)
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

function update_stars()
  for star in all(stars) do
    star.y = star.y + star.dy
    if star.y > 128 then
      star.y = 0
    end
  end
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
