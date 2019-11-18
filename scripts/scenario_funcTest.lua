function init()

  player = PlayerSpaceship():setTemplate("Atlantis"):setPosition(0, 0):setFaction("Human Navy")
  station = SpaceStation():setTemplate("Small Station"):setPosition(0, -100):setFaction("Human Navy")
  enemy = CpuShip():setTemplate("Adder MK5"):setPosition(0, 200):setFaction("Kraylor"):orderIdle()


end

function update(delta)

  if(testFunc()) then
    station:sendCommsMessage(player, [[It worked!]])
  end

end



function testFunc()

  if(not enemy:isValid()) then
    return true;
  end

end
