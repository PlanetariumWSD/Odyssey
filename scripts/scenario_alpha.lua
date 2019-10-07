-- Name: Project Alpha
-- Description: You are the first crew of a new and improved version of the Atlantis space explorer.
--- You must check out ship systems and complete an initial mission.
-- Type: Mission


--Nathan is the best bestses
--[[Problems
no rep at start....
Unclear who to contact for first mission
jump ship under attack after first jump
not clear that you need to escape
warp scramblers not visible
nebula in kraylor defense line makes it unclear
jump jammers not always blocking jump?
--]]

require("utils.lua")


--[[
Rundown of the mission:
==Phase 1: Test ship systems.
* Ship starts docked to the station, with 0 power in all systems.
* Engineering has to power up all systems to 100%.
* After that, undocking is possible.
* After undocking, flying to the supply package to pick up missiles.
* Then test the jump drive to jump towards the weapons testing area.
* At the weapons testing area, science needs to scan two dummy ships before they can be destroyed.
* Destroy the two dummy ships, one can only be destroyed with missile weapons.
* Have relay open communications to the station for the next objective.
==Phase 2: Discovery
* You first mission will be to investigate a strange signal from a nebula.
* As the nebula is in the outer space regions, you'll have you use a jump carrier.
* The jump carrier delivers you to the edge of a nebulea cloud. There are a few kraylor ships here for you to fight.
* The objective is to find an artifact within the nebulea, and scan it. This is a tough scan (level 3)
* In these nebulea, you can also encounter ghost ships. Which are just lost single ships. As well as two "dud" artifacts that are not the source of the signal.
* When you scan the proper artifact, it gives you 4 readings in the description. Relay needs to pass these readings to the JC-88 or Shipyard before the mission continues.
* When this is done, the artifact becomes unstable, and becomes a wormhole that sucks in the player.
==Phase 3: Lost in enemy space...
* After the wormhole, the player finds himself in Kraylor space.
* There are warp jammers blocking you from jumping away. And these jammers are well defended. You'll need to navigate or fight you way out of this.
* I highly recommend navigating. Really. There is some code in place that makes all enemies attack if you engage the jammers.
* JC88 will be waiting for you outside of the defense line. He will take you back to the shipyard.
* At the shipyard you will hand in your data, and get your new objective.
==Phase 4: Nice transport you have there, would be bad if something would happen to it...
* At this point a transport will be created and flying around the forwards stations of the Kraylor defense line.
* Your task is to destroy this transport and secure it's cargo.
* Engaging it at one of the stations will call the whole Kraylor fleet on your ass. So engage the transport between stations.
* Attacking it between stations will still call a taskforce on your ass, so you need to make haste to secure the cargo and get out of there.
==Phase 5:...
--]]

-- Init is run when the scenario is started. Create your initial world
function init()
    -- Create the main ship for the players.
    player = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Atlantis")
	player:setPosition(25276, 133850):setCallSign("Atlantis-1"):setRotation(-90):commandTargetRotation(-90)
    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
        player:setSystemPower(system, 0.0)
        player:commandSetSystemPowerRequest(system, 0.0)
    end
    player:setWeaponStorage("Homing", 0)
    player:setWeaponStorage("Nuke", 0)
    player:setWeaponStorage("EMP", 0)
    player:setWeaponStorage("Mine", 0)
    player:setWeaponStorage("HVLI", 0)

    --Starting area
    shipyard_gamma = SpaceStation():setTemplate("Medium Station"):setFaction("Human Navy"):setCallSign("Shipyard-Gamma"):setPosition(25276, 134550)
    shipyard_gamma:setCommsFunction(shipyardGammaComms)
    player:commandDock(shipyard_gamma)
	player:addReputationPoints(5)	--initial reputation
    supply_station_6 = SpaceStation():setTemplate("Small Station"):setFaction("Human Navy"):setCallSign("Supply-6"):setPosition(14491, 126412)
    supply_station_6.comms_data = { --Do not allow supply drops or reinforcements from the supply station.
        services = {
            supplydrop = "none",
            reinforcements = "none",
        }
    }

    mother_station = SpaceStation():setTemplate("Huge Station"):setFaction("Human Navy"):setCallSign("Command Station Terra 41"):setPosition(10000000, 1000000)

    Nebula():setPosition(32953, 146374)
    Nebula():setPosition(4211, 129108)
    createObjectsOnLine(37351, 125310, 39870, 137224, 1000, Mine, 2, 90)
    CpuShip():setFaction("Human Navy"):setTemplate("Phobos T3"):setCallSign("D-2"):setScanned(true):setPosition(12419, 124184):orderDefendTarget(supply_station_6):setCommsScript("")
    CpuShip():setFaction("Human Navy"):setTemplate("Phobos T3"):setCallSign("D-3"):setScanned(true):setPosition(16104, 127943):orderDefendTarget(supply_station_6):setCommsScript("")

    createObjectsOnLine(6333, 135054, 12390, 148498, 700, Asteroid, 5, 100, 2000)
    createObjectsOnLine(12390, 148498, 27607, 149902, 700, Asteroid, 5, 100, 2000)
    createObjectsOnLine(6333, 135054, 12390, 148498, 700, VisualAsteroid, 5, 100, 2000)
    createObjectsOnLine(12390, 148498, 27607, 149902, 700, VisualAsteroid, 5, 100, 2000)

    Nebula():setPosition(13314, 108306)
    Nebula():setPosition(30851, 94744)
    Nebula():setPosition(37574, 112457)
    transport_f1 = CpuShip():setFaction("Human Navy"):setTemplate("Flavia"):setCallSign("F-1"):setScanned(true):setPosition(28521, 114945):orderIdle()
    transport_f1:setCommsScript("")

    target_dummy_1 = CpuShip():setFaction("Kraylor"):setTemplate("MT52 Hornet"):setCallSign("Dummy-1"):setPosition(29269, 109499):orderIdle():setRotation(random(0, 360))
    target_dummy_2 = CpuShip():setFaction("Kraylor"):setTemplate("MT52 Hornet"):setCallSign("Dummy-2"):setPosition(31032, 109822):orderIdle():setRotation(random(0, 360))
    target_dummy_1:setHullMax(1):setHull(1):setShieldsMax(300):setScanningParameters(1, 1):setCommsScript("")
    target_dummy_2:setHullMax(1):setHull(1):setShieldsMax(300):setScanningParameters(1, 1):setCommsScript("")

    jc88 = CpuShip():setFaction("Human Navy"):setTemplate("Jump Carrier"):setCallSign("Juicy Double Eight"):setScanned(true):setPosition(18972, 135882):orderIdle()
    jc88:setCommsFunction(jc88Comms)

    --Sector B20
    CpuShip():setFaction("Kraylor"):setTemplate("WX-Lindworm"):setCallSign("S11"):setPosition(304666, -75558):orderDefendLocation(304666, -75558):setWeaponStorage("Homing", 0):setWeaponStorage("HVLI", 4)
    CpuShip():setFaction("Kraylor"):setTemplate("MU52 Hornet"):setCallSign("S10"):setPosition(306010, -74718):orderDefendLocation(306010, -74718)
    CpuShip():setFaction("Kraylor"):setTemplate("Adder MK5"):setCallSign("CCN8"):setPosition(304364, -74222):orderDefendLocation(304364, -74222):setWeaponStorage("HVLI", 3)
    b20_nebula_list = {}
    table.insert(b20_nebula_list, Nebula():setPosition(319259, -78069))
    table.insert(b20_nebula_list, Nebula():setPosition(321469, -70621))
    table.insert(b20_nebula_list, Nebula():setPosition(324743, -62928))
    table.insert(b20_nebula_list, Nebula():setPosition(335382, -61946))
    table.insert(b20_nebula_list, Nebula():setPosition(334809, -72258))
    table.insert(b20_nebula_list, Nebula():setPosition(325643, -88627))
    table.insert(b20_nebula_list, Nebula():setPosition(328671, -79788))
    table.insert(b20_nebula_list, Nebula():setPosition(315655, -85367))

    nebula = table.remove(b20_nebula_list, math.random(#b20_nebula_list))
    x, y = nebula:getPosition()
    b20_artifact = Artifact():setPosition(x + random(-1000, 1000), y + random(-1000, 1000))
    b20_artifact:setScanningParameters(3, 1)
    b20_artifact.nebula = nebula
    b20_artifact.beta_radiation = irandom(1, 10)
    b20_artifact.gravity_disruption = irandom(1, 10)
    b20_artifact.ionic_phase_shift = irandom(1, 10)
    b20_artifact.doppler_instability = irandom(1, 10)
    b20_artifact:setDescriptions("An odd object floating in space.", string.format([[Found it, this object is giving off strange readings.
Sensor readings:
Beta radiation: %i
Gravity disruption: %i
Ionic phase shift: %i
Doppler instability: %i]], b20_artifact.beta_radiation, b20_artifact.gravity_disruption, b20_artifact.ionic_phase_shift, b20_artifact.doppler_instability))

    x, y = table.remove(b20_nebula_list, math.random(#b20_nebula_list)):getPosition()
    b20_dummy_artifact_1 = Artifact():setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):setDescriptions("An odd object floating in space.", "This object seems to be inert, and not giving any readings on your sensors. The actual object must be somewhere else.")
    b20_dummy_artifact_1:setScanningParameters(3, 1)

    x, y = table.remove(b20_nebula_list, math.random(#b20_nebula_list)):getPosition()
    b20_dummy_artifact_2 = Artifact():setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):setDescriptions("An odd object floating in space.", "This object seems to be inert, and not giving any readings on your sensors. The actual object must be somewhere else.")
    b20_dummy_artifact_2:setScanningParameters(3, 1)

    x, y = table.remove(b20_nebula_list, math.random(#b20_nebula_list)):getPosition()
    CpuShip():setFaction("Ghosts"):setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):setTemplate("Phobos T3"):orderDefendLocation(x, y)

    x, y = table.remove(b20_nebula_list, math.random(#b20_nebula_list)):getPosition()
    CpuShip():setFaction("Ghosts"):setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):setTemplate("Piranha F12"):orderDefendLocation(x, y)

    x, y = table.remove(b20_nebula_list, math.random(#b20_nebula_list)):getPosition()
    CpuShip():setFaction("Ghosts"):setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):setTemplate("Starhammer II"):orderDefendLocation(x, y)

    --kraylor defense line.
    kraylor_defense_line = {
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(7657, -264940),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(9915, -289620),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(1822, -287037),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(-6615, -285401),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(-18324, -283593),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(-24522, -276878),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(-28138, -268613),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(-23403, -256302),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(-11608, -254149),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(46849, -260262),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(35571, -254924),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(22312, -254063),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(10842, -255239),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(65015, -272745),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(60452, -263189),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(56664, -280494),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(48829, -284454),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(22915, -287381),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(36690, -287554),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(-34202, -259093),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(29547, -294816),
        WarpJammer():setFaction("Kraylor"):setRange(18000):setPosition(54372, -255958)
    }
    kraylor_defense_line_ships = {}
    kraylor_defense_line_engaged = false
    for _, warp_jammer in ipairs(kraylor_defense_line) do
        x, y = warp_jammer:getPosition()
        ship = CpuShip():setFaction("Kraylor"):setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):orderDefendLocation(x, y)
        if random(0, 100) < 20 then
            ship:setTemplate("Defense platform")
        elseif random(0, 100) < 50 then
            ship:setTemplate("Atlantis X23")
        else
            ship:setTemplate("Starhammer II")
        end
        table.insert(kraylor_defense_line_ships, ship)
        for n=1,3 do
            ship2 = CpuShip():setFaction("Kraylor"):setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):orderDefendTarget(ship)
            if random(0, 100) < 50 then
                ship2:setTemplate("Phobos T3")
            elseif random(0, 100) < 20 then
                ship2:setTemplate("Piranha F12.M")
            else
                ship2:setTemplate("Piranha F12")
            end
            table.insert(kraylor_defense_line_ships, ship2)
        end
    end

    SpaceStation():setTemplate("Huge Station"):setFaction("Kraylor"):setPosition(32099, -291152)
    SpaceStation():setTemplate("Huge Station"):setFaction("Kraylor"):setPosition(-4252, -297462)
    SpaceStation():setTemplate("Huge Station"):setFaction("Kraylor"):setPosition(-27984, -262071)

    kraylor_forward_line = {
        SpaceStation():setTemplate("Small Station"):setFaction("Kraylor"):setPosition(-7278, -197898),
        SpaceStation():setTemplate("Large Station"):setFaction("Kraylor"):setPosition(-13839, -233328),
        SpaceStation():setTemplate("Large Station"):setFaction("Kraylor"):setPosition(29333, -240151),
        SpaceStation():setTemplate("Small Station"):setFaction("Kraylor"):setPosition(36681, -200260)
    }
    kraylor_transport = nil
    for _, station in ipairs(kraylor_forward_line) do
        x, y = station:getPosition()
        ship = CpuShip():setFaction("Kraylor"):setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):orderDefendLocation(x, y)
        if random(0, 100) < 20 then
            ship:setTemplate("Defense platform")
        elseif random(0, 100) < 50 then
            ship:setTemplate("Atlantis X23")
        else
            ship:setTemplate("Starhammer II")
        end
        table.insert(kraylor_defense_line_ships, ship)
        for n=1,3 do
            ship2 = CpuShip():setFaction("Kraylor"):setPosition(x + random(-1000, 1000), y + random(-1000, 1000)):orderDefendTarget(ship)
            if random(0, 100) < 50 then
                ship2:setTemplate("Phobos T3")
            elseif random(0, 100) < 20 then
                ship2:setTemplate("Piranha F12.M")
            else
                ship2:setTemplate("Piranha F12")
            end
            table.insert(kraylor_defense_line_ships, ship2)
        end
    end

    Nebula():setPosition(-21914, -272098)
    Nebula():setPosition(44037, -290617)
    Nebula():setPosition(28814, -261708)
    Nebula():setPosition(-13477, -290103)
    Nebula():setPosition(4322, -257282)
    createObjectsOnLine(48975, -270452, 40024, -267982, 1000, Mine, 3, 90)
    createObjectsOnLine(20887, -271892, 22225, -282695, 1000, Mine, 3, 90)
    createObjectsOnLine(-12037, -278682, 55663, -258414, 1000, Asteroid, 4, 90, 10000)

    --Set the initial mission state

    --mission_state = phase0FirstMessage

    mission_state = phase2SpawnWormhole





    defeat_timeout = 2.0 --The defeat timeout means it takes 2 seconds before a defeat is actually done. This gives some missiles and explosions time to impact.


    phase1_MessagePowerupTimer = 5
    phase1_SkippedTutorialMissionBreifTimer = 5
    phase3_AnalyzingDataTimer = 10
    phase3_AnalyzingDataTimer2 = 10
    phase3_EnemyFleetAttackTimer = 10

    phase3_FirstMessage = false
    phase3_SecondMessage = false
    phase3_ThirdMessage = false


    ship_jumped = false;
    --[[TEMP
    mission_state = phase2SeekArtifact
    player:setPosition(310000, -71000)
    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
        player:setSystemPower(system, 1.0)
        player:commandSetSystemPowerRequest(system, 1.0)
    end

    --TEMP
    mission_state = phase2WaitTillWormholeWarpedPlayer
    player:setPosition(30036, -270545)

    --TEMP
    mission_state = phase3ReportBackToShipyard
    player:setPosition(24000, 125000)
    --]]
end


function phase0FirstMessage(delta)

	mother_station:sendCommsMessage(player, [[Come in Atlantis-1. Congratulations on you and your crews promotion. You now have control of
one of the most advanced, and newest, medium frigiates in the Human Navy, the Atlantis Mark 3. With your promotion comes a new assigment.
You have been stationed at Forward Outpost Gamma, one of our new outposts closest to the Kraylor boarder. Contanct Shipyard-Gamma for your
first assigment.]])
	mission_state = phase0TutorialDecide

end

function phase0TutorialDecide(delta)
--shipyardGammaComms handles this
end


function phase1MessagePowerup(delta)
    if delta > 0 then
        shipyard_gamma:sendCommsMessage(player, [[Come in Atlantis-1.
Good, your communication systems seems to be working.
As you well know, you are aboard the newest version of the Atlantis space explorer.
We will take you through a few quick tests too see if the ship is operating as expected.

First, have your engineer power up all systems to 100%, as you are currently in powered down mode.]])
        mission_state = phase1WaitForPowerup
    end
end

function phase1WaitForPowerup(delta)
    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "frontshield", "rearshield"}) do
        if player:getSystemPower(system) < 1.0 then
            return
        end
    end
    --All system powered, give the next objective.
    shipyard_gamma:sendCommsMessage(player, [[Atlantis-1,
Good, we read all systems are go. You can safely undock now.
Head to sector K6, there is a supply drop there dropped by F-1. Pick this up to stock up on missile weapons.]])
    supply_drop = SupplyDrop():setFaction("Human Navy"):setPosition(29021, 114945):setEnergy(500):setWeaponStorage("Homing", 12):setWeaponStorage("Nuke", 4):setWeaponStorage("Mine", 8):setWeaponStorage("EMP", 6):setWeaponStorage("HVLI", 20)
    transport_f1:orderDock(supply_station_6)
	player:addReputationPoints(5)
    mission_state = phase1WaitForSupplyPickup
end

function phase1WaitForSupplyPickup(delta)
    --Keep the shields of the dummies charged.
    target_dummy_1:setShields(300)
    target_dummy_2:setShields(300)

    if not supply_drop:isValid() then
        shipyard_gamma:sendCommsMessage(player, [[Atlantis-1,
Ok, good. I see you are stocked up on missiles now.
There are two dummy ships in your near vicinity. Now, before we test your weapon systems, first we better ID the ships to make sure we do not destroy the wrong ships.
Have your science officer scan the Dummy-1 and Dummy-2 ships to properly identify them.]])
        mission_state = phase1ScanDummyShips
		player:addReputationPoints(5)
    end
end

function phase1ScanDummyShips(delta)
    --Keep the shields of the dummies charged. (Note, at this point, you could destroy them with nukes, which is why we keep the shields at 300)
    target_dummy_1:setShields(300)
    target_dummy_2:setShields(300)

    if target_dummy_1:isScannedBy(player) and target_dummy_2:isScannedBy(player) then
        shipyard_gamma:sendCommsMessage(player, [[Atlantis-1,
Perfect. They identify as Kraylor ships, as we put fake IDs in them. Now, take out Dummy-1 with your beam weapons. Use a homing missile to take out Dummy-2,
as the shields of Dummy-2 are configured so that your beam weapons will not penetrate them.]])
        mission_state = phase1DestroyDummyShips
        target_dummy_1:setShieldsMax(30)
        target_dummy_2:setShieldsMax(30)
		player:addReputationPoints(5)
    end
end

function phase1DestroyDummyShips(delta)
    if target_dummy_2:isValid() then
        --Keep the shield of Dummy-2 charged to 30, which means it can be taken out with a single blast from a homing missile or nuke, but not by beam weapons.
        target_dummy_2:setShields(30)
    end

    if not target_dummy_1:isValid() and not target_dummy_2:isValid() then
        shipyard_gamma:sendCommsMessage(player, [[Good, all weapons are operational.
Your ship seems to be in perfect operating condition.

Now, when you are ready to take on your first mission. Contact us.
(Feel free to dock with Supply-6 to resupply)]])
        mission_state = phase1WaitForContact
		player:addReputationPoints(5)
    end
end

function phase1WaitForContact(delta)
    --Wait for the shipyardGammaComms to handle this state.
end

--[[*********************************************************************--]]

function phase1SkippedTutorialMissionBreif(delta)

	phase1_SkippedTutorialMissionBreifTimer = phase1_SkippedTutorialMissionBreifTimer - delta

	if phase1_SkippedTutorialMissionBreifTimer < 0 then
		shipyard_gamma:sendCommsMessage(player, [[We have been detecting faint signals from a nearby dense nebula cluster.
Juicy Double Eight will transport you to sector B20 which is nearby the nebula.
Your job will be to find the source of the readings and report back. Dock with Juicy Double Eight to begin.]])
		mission_state = phase2WaitForJump
	end

end

function phase2WaitForJump(delta)
    if handleJumpCarrier(jc88, 24000, 125000, 310000, -71000, [[Hold on tight, heading for sector B20.]]) then
        --Good, continue.
        jc88:sendCommsMessage(player, [[Atlantis-1,
Here we are. B20. Looks like there are some lingering Kraylors here.
As we are outside of the no-fire zone, and we are at war with the Kraylor, you are free to take them out.

Report back when you have found the source of the odd sensor readings.]])
        mission_state = phase2SeekArtifact
    end
end

function phase2SeekArtifact(delta)
    if b20_artifact:isScannedBy(player) then
        mission_state = phase2ReportArtifactReadings
		player:addReputationPoints(5)
    end
end

function phase2ReportArtifactReadings(delta)
    --Readings will be reported in comms functions, so do nothing here.
end

function phase2WaitTillNearObject(delta)
    if distance(player, b20_artifact) < 2000 then
        phase2SpawnWormhole()
    end
end

function phase2WaitTillAwayFromObject(delta)
    if distance(player, b20_artifact) > 2000 and distance(player, b20_artifact) < 2200 then
        phase2SpawnWormhole()
    end
end

function phase2SpawnWormhole()
    jc88:sendCommsMessage(player, [[Atlantis-1? What is happening?
We are reading a huge gravity surge from your direction. Get the hell out of there.]])
    x, y = b20_artifact:getPosition()
    b20_artifact:explode()
    b20_artifact.nebula:destroy() --Remove the nebula, else it will get sucked into the wormhole. Now it just looks like the wormhole replaces the nebula.
    WormHole():setPosition(x, y):setTargetPosition(688636,-194683) --Wormhole to to ZK22

    --The explosion damages all systems, but makes sure the impulse, warp and jumpdrive are non-functional. This prevents the player from escaping the grasp of the wormhole.
    --We made sure we are around 2U of the wormhole before this function is called.
    player:setSystemHealth("reactor", player:getSystemHealth("reactor") - random(0.0, 0.5))
    player:setSystemHealth("beamweapons", player:getSystemHealth("beamweapons") - random(0.0, 0.5))
    player:setSystemHealth("maneuver", player:getSystemHealth("maneuver") - random(0.0, 0.5))
    player:setSystemHealth("missilesystem", player:getSystemHealth("missilesystem") - random(0.0, 0.5))
    player:setSystemHealth("impulse", player:getSystemHealth("impulse") - random(1.3, 1.5))
    player:setSystemHealth("warp", player:getSystemHealth("warp") - random(1.3, 1.5))
    player:setSystemHealth("jumpdrive", player:getSystemHealth("jumpdrive") - random(1.3, 1.5))
    player:setSystemHealth("frontshield", player:getSystemHealth("frontshield") - random(0.0, 0.5))
    player:setSystemHealth("rearshield", player:getSystemHealth("rearshield") - random(0.0, 0.5))


    mission_state = phase2WaitTillWormholeWarpedPlayer
end


function phase2WaitTillWormholeWarpedPlayer(delta)


    if distance(player, 688636,-194683) < 2000 then  --Change the coordinates to match whatever new area we make
        shipyard_gamma:sendCommsMessage(player, scrambleMessage([[Atlantis-1, We are detecting Kraylor ships in your vicinity! You must destroy them! ]]))


          wormhole_creation_station = SpaceStation():setTemplate("Medium Station"):setFaction("Kraylor"):setCallSign("Wormhole Creation Station"):setPosition(693145,-194086):setShieldsMax(200)
          wormholeguard1 = CpuShip():setFaction("Kraylor"):setTemplate("Adder MK5"):setCallSign("WC1"):setPosition(690000,-190000):orderDefendLocation(693145,-194086):setWeaponStorage("Homing", 0):setWeaponStorage("HVLI", 4)
          wormholeguard2 = CpuShip():setFaction("Kraylor"):setTemplate("Adder MK5"):setCallSign("WC2"):setPosition(690000,-190000):orderDefendLocation(693145,-194086)
          wormholeguard3 = CpuShip():setFaction("Kraylor"):setTemplate("Adder MK5"):setCallSign("WC3"):setPosition(690000,-190000):orderDefendLocation(693145,-194086):setWeaponStorage("HVLI", 3)



        mission_state = phase3DestroyShips
    end
end


function phase3DestroyShips(delta)

    if not((wormholeguard1:isValid()) and (wormholeguard2:isValid()) and (wormholeguard3:isValid())) then
        shipyard_gamma:sendCommsMessage(player, scrambleMessage([[ YAYYYYYYY ]]))
        mission_state = phase3destroyStationMessage
      else
    end
end


function phase3destroyStationMessage(delta)
      shipyard_gamma:sendCommsMessage(player, [[Excellent job. Now destroy that station!]])
      mission_state = phase3DestroyStation

end

function phase3DestroyStation(delta)

      if not(wormhole_creation_station:isValid()) then
        shipyard_gamma:sendCommsMessage(player, [[Again, excellent work. Go collect the remains of the station. There is valuable intel there.]])
        valuable_intel = SupplyDrop():setFaction("Human Navy"):setPosition(693145,-194086)
        mission_state = phase3CollectRemains
      end
end



function phase3CollectRemains(delta)
      jc88:setPosition(0,0)
      if not(valuable_intel:isValid()) then
        shipyard_gamma:sendCommsMessage(player, [[Thank you. JC88 is coming to bring you home.]])
        mission_state = phase3Escape
      end

end


-- function phase3Escape(delta)
--   jc88:setPosition(693000,-194000)
--   if(player:isDocked(jc88))then
--     jc88:sendCommsMessage(player, [[Heading Home!]])
--     jc88:setPosition(18972, 135882)
--     mission_state = phase3AnalizingData
--   end
-- end

function phase3Escape(delta)


      if(betterHandleJumpCarrier(jc88,0,0,[[We are heading home!]])) then


        jc88:sendCommsMessage(player,[[Yay! We are home!]])

        mission_state = phase3AnalizingData
      end
end



function phase3AnalizingData(delta)
  if(player:isDocked(shipyard_gamma)) then
    if(phase3_FirstMessage == false) then
      shipyard_gamma:sendCommsMessage(player, [[We have recived the intel you collected and are decrypting the data, hold on.]])
      phase3_FirstMessage = true
    end
    phase3_AnalyzingDataTimer = phase3_AnalyzingDataTimer - delta
    if(phase3_AnalyzingDataTimer < 0) then
      if(phase3_SecondMessage == false) then
        shipyard_gamma:sendCommsMessage(player, [[It seems like the station you destroyed was testing a prototype weapon of some sorts. We will further
      analyze it.]])
        phase3_SecondMessage = true
      end
      phase3_AnalyzingDataTimer2 = phase3_AnalyzingDataTimer2 - delta
      if(phase3_AnalyzingDataTimer2 < 0) then
        if(phase3_ThirdMessage == false) then
          shipyard_gamma:sendCommsMessage(player, [[This station was the cause of the whormhole, it looks like they are testing a new weapon that can launch wormholes.
          If used correctly the Kraylor could send their entire fleet right ontop of Earth! There is a little more here please hold.]])
          phase3_ThirdMessage = true
        end
        mission_state = phase4_AttackOnBase
      end
    end
  end

end

function phase4_AttackOnBase(delta)

end




--[[*********************************************************************--]]
function shipyardGammaComms()

  setCommsMessage([[Good day Atlantis-1.
Please continue with your current objective.]])

    if mission_state == phase0TutorialDecide then
      setCommsMessage([[Atlantis-1, welcome to FO-Gamma, it is a pleasure to have one of the newest ships
  in the fleet stationed here.
  Before we begin we have to go through some basic test procedures, would you like us to go through them with you?]])
      addCommsReply("Yes", function()
        setCommsMessage([[Ok, prepare for test sequence.]])
        mission_state = phase1MessagePowerup
      end)
      addCommsReply("No", function()
        setCommsMessage([[Ok, prepare for mission breifing.]])
        for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
          player:setSystemPower(system, 1.0)
          player:commandSetSystemPowerRequest(system, 1.0)
        end
        mission_state = phase1SkippedTutorialMissionBreif
      end)
    end
    if mission_state == phase3FindHoleInTheKraylorDefenseLine then
        return false
    end
    --comms_source
    --comms_target
    if mission_state == phase1WaitForContact then
        setCommsMessage([[Atlantis-1, all ready and set to go on your first mission?]])
        addCommsReply("Yes", function()
            setCommsMessage([[Good.
Your first mission will be to seek out odd readings comming from the nebula cloud in sector B20.
Your ship is not equipped to travel this distance by itself, so we have tasked the Jump carrier JC-88 to take you there.
Dock with JC-88 and it will handle the rest.]])
            mission_state = phase2WaitForJump
        end)
        addCommsReply("No", function()
            setCommsMessage([[Then hail us again when you are ready.]])
        end)
        return
    end
    if mission_state == phase2SeekArtifact or mission_state == phase2ReportArtifactReadings then
        artifactReportComms()
        return
    end


end

function jc88Comms()
    if mission_state == phase3FindHoleInTheKraylorDefenseLine then
        return false
    end

    if mission_state == phase2SeekArtifact or mission_state == phase2ReportArtifactReadings then
        artifactReportComms()
        return
    end
    setCommsMessage([[Jump carrier JC-88 reporting in.
All system nominal.]])
end

function artifactReportComms()
    setCommsMessage([[Atlantis-1,
Did you find the source of the odd sensor readings?]])
    addCommsReply("Yes", function()
        setCommsMessage([[Great, as our sensor readings are inconclusive. Can you report back your readings to us?

First off, what is the beta radiation reading?]])
        for beta=1,10 do
            addCommsReply(beta, function()
                setCommsMessage([[Next up, what is your Ionic phase shift reading?]])
                for ionic=1,10 do
                    addCommsReply(ionic, function()
                        setCommsMessage([[Next up, what is your gravity disruption reading?]])
                        for gravity=1,10 do
                            addCommsReply(gravity, function()
                                setCommsMessage([[Finally, what is your reading on doppler instability?]])
                                for doppler=1,10 do
                                    addCommsReply(doppler, function()
                                        if b20_artifact.beta_radiation == beta and b20_artifact.gravity_disruption == gravity and b20_artifact.ionic_phase_shift == ionic and b20_artifact.doppler_instability == doppler then
                                            if distance(player, b20_artifact) < 2000 then
                                                setCommsMessage([[Are you sure? Those readings are really off the normal scale.
Please move away from it, as these readings show it is very unstable!]])
                                                mission_state = phase2WaitTillAwayFromObject
                                            else
                                                setCommsMessage([[Are you sure? Those readings are really off the normal scale.
Can you move closer to the object to see if you can improve those readings. The nebula might be interfering with your sensors.]])
                                                mission_state = phase2WaitTillNearObject
                                            end
                                        else
                                            setCommsMessage([[Are you sure? Can you double check this and get back to us. As this does not match with our readings.]])
                                        end
                                    end)
                                end
                            end)
                        end
                    end)
                end
            end)
        end
    end)
    addCommsReply("No", function()
        setCommsMessage([[Then continue looking for it.]])
    end)
end

function scrambleMessage(message)
    for n=1,7 do
        local pos = irandom(1, #message - 3)
        message = message:sub(0, pos) .. "---" .. message:sub(pos + 3)
    end
    for n=1,5 do
        local pos = irandom(1, #message - 1)
        message = message:sub(0, pos) .. "." .. message:sub(pos + 1)
    end
    for n=1,3 do
        local pos = irandom(1, #message - 1)
        message = message:sub(0, pos) .. "*" .. message:sub(pos + 1)
    end
    for n=1,3 do
        local pos = irandom(1, #message - 1)
        message = message:sub(0, pos) .. "$" .. message:sub(pos + 1)
    end
    message = [[(The transmission is loaded with static noise)
]] .. message
    return message
end

--[[ Assistance function to help with the details of the player using a jump carrier. --]]
--[[jumping_state = 'wait_for_dock'
function handleJumpCarrier(jc, source_x, source_y, dest_x, dest_y, jumping_message)
    if jumping_state == 'wait_for_dock' then
        if player:isDocked(jc) then
            jc:orderFlyTowardsBlind(dest_x, dest_y)
            jc:sendCommsMessage(player, jumping_message)
            jumping_state = 'wait_for_jump'
        end
    elseif jumping_state == 'wait_for_jump' then
        if distance(jc, dest_x, dest_y) < 100000000 then
            --We check for the player 1 tick later, as it can take a game tick for the player position to update as well.
            jumping_state = 'check_for_player'
        end
    elseif jumping_state == 'check_for_player' then
        jumping_state = 'wait_for_dock'
        if distance(player, dest_x, dest_y) < 100000000 then
            --Good, continue.
            return true
        else
            --You idiot. JC-88 will fly back.
            jc88:orderFlyTowardsBlind(source_x, source_y)
            jc88:sendCommsMessage(player, [[Looks like the docking couplers detached pre-maturely.
This happens sometimes. I am on my way so we can try again.]]--[[)
        end
    end
    return false
end]]

function betterHandleJumpCarrier(jc, x, y, message)


    if((player:isDocked(jc)) and (not ship_jumped)) then
      ship_jumped = true
      jc:orderFlyTowardsBlind(x, y)
      jc:sendCommsMessage(player, message)
    end
    if(jc:getPosition() == x, y)
    return true
  end


end





function update(delta)
    if mission_state ~= nil then
        mission_state(delta)
    end
end
