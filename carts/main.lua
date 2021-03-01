n = 1
x = 0
fc = 0

lc = 1
lcs = {8, 10, 11, 12}

ship = {
  x = 10,
  y = 10
}

function _draw()
  cls()

  spr(n,60,60)

  line(10, 63, 53, 63, lcs[lc])
  line(10, 64, 53, 64, lcs[lc])

  spr(17, ship.x, ship.y, 2, 2)
end

function _update()
  fc = fc + 1
  if 0 == fc % 2 then
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
    ship.x = ship.x - 1
  end
  if btn(1) then
    ship.x = ship.x + 1
  end
  if btn(2) then
    ship.y = ship.y - 1
  end
  if btn(3) then
    ship.y = ship.y + 1
  end
end
