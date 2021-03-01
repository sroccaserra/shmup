n = 1
x = 0
fc = 0

lc = 1
lcs = {8, 11, 12}

function _draw()
  cls()

  spr(n,60,60)

  line(10, 63, 53, 63, lcs[lc])
  line(10, 64, 53, 64, lcs[lc])
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
end
