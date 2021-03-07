require 'spec/harness'
require 'tmp/main'

describe('ditribution of a float range [0, 2] to two discrete values {1, 2}', function()
  local distribute

  before_each(function()
    distribute = distributor(1, 2, 0, 2)
  end)

  it('0 returns 1', function()
    local result = distribute(0)
    assert.is.equal(1, result)
  end)

  it('2 returns 2', function()
    local result = distribute(2)
    assert.is.equal(2, result)
  end)

  it('0.1 returns 1', function()
    local result = distribute(0.1)
    assert.is.equal(1, result)
  end)

  it('1.9 returns 2', function()
    local result = distribute(1.9)
    assert.is.equal(2, result)
  end)

  it('0.9 returns 1', function()
    local result = distribute(0.9)
    assert.is.equal(1, result)
  end)

  it('1.1 returns 2', function()
    local result = distribute(0.9)
    assert.is.equal(1, result)
  end)
end)
