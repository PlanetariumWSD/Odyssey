model = ModelData()
model:setName("space_station_4")
model:setMesh("space_station_4/space_station_4.model")
model:setTexture("space_station_4/space_station_4_color.jpg")
model:setSpecular("space_station_4/space_station_4_specular.jpg")
model:setIllumination("space_station_4/space_station_4_illumination.jpg")
model:setRenderOffset(0, 0, 5)
model:setScale(10)
model:setRadius(300)
model:setCollisionBox(400, 400)

model = ModelData()
model:setName("space_station_3")
model:setMesh("space_station_3/space_station_3.model")
model:setTexture("space_station_3/space_station_3_color.jpg")
model:setSpecular("space_station_3/space_station_3_specular.jpg")
model:setIllumination("space_station_3/space_station_3_illumination.jpg")
model:setRenderOffset(10, 0, 5)
model:setScale(20)
model:setRadius(1000)
model:setCollisionBox(1200, 1000)

model = ModelData()
model:setName("space_station_2")
model:setMesh("space_station_2/space_station_2.model")
model:setTexture("space_station_2/space_station_2_color.jpg")
model:setSpecular("space_station_2/space_station_2_specular.jpg")
model:setIllumination("space_station_2/space_station_2_illumination.jpg")
model:setRenderOffset(10, 0, 5)
model:setScale(20)
model:setRadius(1300)
model:setCollisionBox(1400, 1000)

model = ModelData()
model:setName("space_station_1")
model:setMesh("space_station_1/space_station_1.model")
model:setTexture("space_station_1/space_station_1_color.jpg")
model:setSpecular("space_station_1/space_station_1_specular.jpg")
model:setIllumination("space_station_1/space_station_1_illumination.jpg")
model:setRenderOffset(0, 0, 5)
model:setScale(20)
model:setRadius(1500)
model:setCollisionBox(2000, 1800)

model = ModelData()
model:setName("small_fighter_1")
model:setMesh("small_fighter_1.model")
model:setTexture("small_fighter_1_color.jpg")
model:setSpecular("small_fighter_1_specular.jpg")
model:setIllumination("small_fighter_1_illumination.jpg")
model:setScale(3)
model:setRadius(40)

-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(23, 0, -1.8)
model:addEngineEmitter(-8, 0, 0.5,  1.0, 0.2, 0.2, 1.5)


model = ModelData()
model:setName("space_tug")
model:setMesh("space_tug.model")
model:setTexture("space_tug_color.jpg")
--model:setSpecular("space_tug_illumination.jpg")
model:setIllumination("space_tug_illumination.jpg")
model:setScale(6)
model:setRadius(80)

model:addEngineEmitter(-13, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
model:addEngineEmitter(-13,  2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)



model = ModelData()
model:setName("space_frigate_6")
model:setMesh("space_frigate_6.model")
model:setTexture("space_frigate_6_color.png")
model:setSpecular("space_frigate_6_specular.png")
model:setIllumination("space_frigate_6_illumination.png")
model:setScale(6)
model:setRadius(100)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(-1.6, -8, -2)
model:addBeamPosition(-1.6,  8, -2)
model:addTubePosition(18, 0, -3.5)
model:addTubePosition(18, 0, -3.5)
model:addEngineEmitter(-18, 0, -1,  0.2, 0.2, 1.0, 6.0)


model = ModelData()
model:setName("space_cruiser_4")
model:setMesh("space_cruiser_4.model")
model:setTexture("space_cruiser_4_color.jpg")
--model:setSpecular("space_cruiser_4_illumination.jpg")
model:setIllumination("space_cruiser_4_illumination.jpg")
model:setScale(8)
model:setRadius(100)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addTubePosition(2, -10, -2.3)
model:addTubePosition(2,  10, -2.3)
model:addEngineEmitter(-13, -2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)
model:addEngineEmitter(-13, 2.1500, 0.3,  0.2, 0.2, 1.0, 3.0)

model = ModelData()
model:setName("dark_fighter_6")
model:setMesh("dark_fighter_6.model")
model:setTexture("dark_fighter_6_color.png")
model:setSpecular("dark_fighter_6_specular.png")
model:setIllumination("dark_fighter_6_illumination.png")
model:setScale(5)
model:setRadius(140)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(21, -28.2, -2)
model:addBeamPosition(21,  28.2, -2)
model:addEngineEmitter(-28, -1.5, -5,  1.0, 0.2, 0.2, 3.0)
model:addEngineEmitter(-28,  1.5, -5,  1.0, 0.2, 0.2, 3.0)


model = ModelData()
model:setName("battleship_destroyer_1_upgraded")
model:setMesh("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded.model")
model:setTexture("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_1_upgraded/battleship_destroyer_1_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(34, -17, -7)
model:addBeamPosition(34,  17, -7)
model:addBeamPosition(-5, -33, -1)
model:addBeamPosition(-5,  33, -1)
model:addTubePosition(5, -7, -11)
model:addTubePosition(5,  7, -11)
model:addEngineEmitter(-30, 0, -3,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-33, 12, -1,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-33,-12, -1,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-33, 22, -1,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-33,-22, -1,  1.0, 0.2, 0.1, 14.0)

model = ModelData()
model:setName("battleship_destroyer_2_upgraded")
model:setMesh("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded.model")
model:setTexture("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_2_upgraded/battleship_destroyer_2_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(37, -14.5, -3.5)
model:addBeamPosition(37,  14.5, -3.5)
model:addBeamPosition(10, -12, -15)
model:addBeamPosition(10,  12, -15)
model:addBeamPosition(-9, -28, -3)
model:addBeamPosition(-9,  28, -3)
model:addEngineEmitter(-33, 0, -3,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-36, 14, -4,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-36,-14, -4,  1.0, 0.2, 0.1, 17.0)

model = ModelData()
model:setName("battleship_destroyer_3_upgraded")
model:setMesh("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded.model")
model:setTexture("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_3_upgraded/battleship_destroyer_3_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(22,  22, -4.5)
model:addBeamPosition(22, -22, -4.5)
model:addBeamPosition(12,  22, -4.5)
model:addBeamPosition(12, -22, -4.5)

model:addEngineEmitter(-34, 0, 0,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-36, 13, 0,  1.0, 0.2, 0.1, 17.0)
model:addEngineEmitter(-36,-13, 0,  1.0, 0.2, 0.1, 17.0)

model = ModelData()
model:setName("battleship_destroyer_4_upgraded")
model:setMesh("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded.model")
model:setTexture("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_4_upgraded/battleship_destroyer_4_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(4, -27, -0.5)
model:addBeamPosition(4,  27, -0.5)
model:addTubePosition(30, -11, -0.5)
model:addTubePosition(30,  11, -0.5)
model:addEngineEmitter(-27, 0, -4,  1.0, 0.2, 0.1, 14.0)
model:addEngineEmitter(-32, 11.5, -1.5,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-32,-11.5, -1.5,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-30, 20, -1.5,  1.0, 0.2, 0.1, 10.0)
model:addEngineEmitter(-32,-20, -1.5,  1.0, 0.2, 0.1, 10.0)

model = ModelData()
model:setName("battleship_destroyer_5_upgraded")
model:setMesh("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded.model")
model:setTexture("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded_color.jpg")
model:setSpecular("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded_specular.jpg")
model:setIllumination("battleship_destroyer_5_upgraded/battleship_destroyer_5_upgraded_illumination.jpg")
model:setScale(4)
model:setRadius(200)

-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(4, -27, -0.5)
model:addBeamPosition(4,  27, -0.5)
model:addTubePosition(27, 0, -0.5)
model:addTubePosition(27, 0, -0.5)
model:addEngineEmitter(-33, 0, 0,  1.0, 0.2, 0.1, 16.0)
model:addEngineEmitter(-28, 13, -0,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-28,-13, -0,  1.0, 0.2, 0.1, 13.0)
model:addEngineEmitter(-27, 24, 0,  1.0, 0.2, 0.1, 5.0)
model:addEngineEmitter(-27,-24, 0,  1.0, 0.2, 0.1, 5.0)


model = ModelData()
model:setName("Ender Battlecruiser")
model:setMesh("Ender Battlecruiser.obj")
model:setTexture("Ender Battlecruiser.png")
model:setSpecular("Ender Battlecruiser_illumination.png")
model:setIllumination("Ender Battlecruiser_illumination.png")
model:setScale(5)
model:setRadius(1000)
model:setCollisionBox(2000, 600)
-- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
model:addBeamPosition(66, -71, 12)
model:addBeamPosition(66, -71, -12)
model:addBeamPosition(66,  71, 12)
model:addBeamPosition(66,  71, -12)
model:addBeamPosition(-32, -71, 12)
model:addBeamPosition(-32, -71, -12)
model:addBeamPosition(-32,  71, 12)
model:addBeamPosition(-32,  71, -12)
model:addBeamPosition(-112, -71, 12)
model:addBeamPosition(-112, -71, -12)
model:addBeamPosition(-112,  71, 12)
model:addBeamPosition(-112,  71, -12)
model:addEngineEmitter(-180, -30, 1.2,  0.2, 0.2, 1.0, 30.0)
model:addEngineEmitter(-180,  30, 1.2,  0.2, 0.2, 1.0, 30.0)


model = ModelData()
model:setName("sci_fi_alien_ship_1")
model:setMesh("sci_fi_alien_ship_1/sci_fi_alien_ship_1.model")
model:setTexture("sci_fi_alien_ship_1/sci_fi_alien_ship_1_color.jpg")
model:setSpecular("sci_fi_alien_ship_1/sci_fi_alien_ship_1_specular.jpg")
model:setIllumination("sci_fi_alien_ship_1/sci_fi_alien_ship_1_illumination.jpg")
model:setScale(3)
model:setRadius(180)

model = ModelData()
model:setName("sci_fi_alien_ship_2")
model:setMesh("sci_fi_alien_ship_2/sci_fi_alien_ship_2.model")
model:setTexture("sci_fi_alien_ship_2/sci_fi_alien_ship_2_color.jpg")
model:setSpecular("sci_fi_alien_ship_2/sci_fi_alien_ship_2_specular.jpg")
model:setIllumination("sci_fi_alien_ship_2/sci_fi_alien_ship_2_illumination.jpg")
model:setScale(3)
model:setRadius(180)

model = ModelData()
model:setName("sci_fi_alien_ship_3")
model:setMesh("sci_fi_alien_ship_3/sci_fi_alien_ship_3.model")
model:setTexture("sci_fi_alien_ship_3/sci_fi_alien_ship_3_color.jpg")
model:setSpecular("sci_fi_alien_ship_3/sci_fi_alien_ship_3_specular.jpg")
model:setIllumination("sci_fi_alien_ship_3/sci_fi_alien_ship_3_illumination.jpg")
model:setScale(3)
model:setRadius(150)

model = ModelData()
model:setName("sci_fi_alien_ship_4")
model:setMesh("sci_fi_alien_ship_4/sci_fi_alien_ship_4.model")
model:setTexture("sci_fi_alien_ship_4/sci_fi_alien_ship_4_color.jpg")
model:setSpecular("sci_fi_alien_ship_4/sci_fi_alien_ship_4_specular.jpg")
model:setIllumination("sci_fi_alien_ship_4/sci_fi_alien_ship_4_illumination.jpg")
model:setScale(3)
model:setRadius(150)

model = ModelData()
model:setName("sci_fi_alien_ship_5")
model:setMesh("sci_fi_alien_ship_5/sci_fi_alien_ship_5.model")
model:setTexture("sci_fi_alien_ship_5/sci_fi_alien_ship_5_color.jpg")
model:setSpecular("sci_fi_alien_ship_5/sci_fi_alien_ship_5_specular.jpg")
model:setIllumination("sci_fi_alien_ship_5/sci_fi_alien_ship_5_illumination.jpg")
model:setScale(3)
model:setRadius(150)

model = ModelData()
model:setName("sci_fi_alien_ship_6")
model:setMesh("sci_fi_alien_ship_6/sci_fi_alien_ship_6.model")
model:setTexture("sci_fi_alien_ship_6/sci_fi_alien_ship_6_color.jpg")
model:setSpecular("sci_fi_alien_ship_6/sci_fi_alien_ship_6_specular.jpg")
model:setIllumination("sci_fi_alien_ship_6/sci_fi_alien_ship_6_illumination.jpg")
model:setScale(3)
model:setRadius(150)

model = ModelData()
model:setName("sci_fi_alien_ship_7")
model:setMesh("sci_fi_alien_ship_7/sci_fi_alien_ship_7.model")
model:setTexture("sci_fi_alien_ship_7/sci_fi_alien_ship_7_color.jpg")
model:setSpecular("sci_fi_alien_ship_7/sci_fi_alien_ship_7_specular.jpg")
model:setIllumination("sci_fi_alien_ship_7/sci_fi_alien_ship_7_illumination.jpg")
model:setScale(6)
model:setRadius(330)

model = ModelData()
model:setName("sci_fi_alien_ship_8")
model:setMesh("sci_fi_alien_ship_8/sci_fi_alien_ship_8.model")
model:setTexture("sci_fi_alien_ship_8/sci_fi_alien_ship_8_color.jpg")
model:setSpecular("sci_fi_alien_ship_8/sci_fi_alien_ship_8_specular.jpg")
model:setIllumination("sci_fi_alien_ship_8/sci_fi_alien_ship_8_illumination.jpg")
model:setScale(6)
model:setRadius(350)

model = ModelData()
model:setName("ammo_box")
model:setRadius(50)
model:setMesh("ammo_box.obj")
model:setTexture("ammo_box.png")
model:setSpecular("ammo_box_specular.png")
model:setIllumination("ammo_box_illumination.png")

model = ModelData()
model:setName("shield_generator")
model:setRadius(150)
model:setScale(3)
model:setMesh("Shield bubble generator.obj")
model:setTexture("Shield bubble generator.jpg")
model:setSpecular("Shield bubble generator specular.jpg")

model = ModelData()
model:setName("small_frigate_1")
model:setMesh("small_frigate_1/small_frigate_1.model")
model:setTexture("small_frigate_1/small_frigate_1_color.png")
model:setSpecular("small_frigate_1/small_frigate_1_specular.png")
model:setIllumination("small_frigate_1/small_frigate_1_illumination.png")
model:setScale(1)
model:setRadius(100)

model:addEngineEmitter(-85, 33, 2,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-85, 33, 14,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-85,-33, 2,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-85,-33, 14,  0.2, 0.2, 1.0, 8.0)

model = ModelData()
model:setName("small_frigate_2")
model:setMesh("small_frigate_2/small_frigate_2.model")
model:setTexture("small_frigate_2/small_frigate_2_color.png")
model:setSpecular("small_frigate_2/small_frigate_2_specular.png")
model:setIllumination("small_frigate_2/small_frigate_2_illumination.png")
model:setScale(1)
model:setRadius(80)

model:addEngineEmitter(-75, 53,-27,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-75,-53,-27,  0.2, 0.2, 1.0, 8.0)

model = ModelData()
model:setName("small_frigate_3")
model:setMesh("small_frigate_3/small_frigate_3.model")
model:setTexture("small_frigate_3/small_frigate_3_color.png")
model:setSpecular("small_frigate_3/small_frigate_3_specular.png")
model:setIllumination("small_frigate_3/small_frigate_3_illumination.png")
model:setScale(0.8)
model:setRadius(80)

model:addEngineEmitter(-91, 32,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-95, 32,-17,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-91,-32,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-95,-32,-17,  0.2, 0.2, 1.0, 8.0)

model = ModelData()
model:setName("small_frigate_4")
model:setMesh("small_frigate_4/small_frigate_4.model")
model:setTexture("small_frigate_4/small_frigate_4_color.png")
model:setSpecular("small_frigate_4/small_frigate_4_specular.png")
model:setIllumination("small_frigate_4/small_frigate_4_illumination.png")
model:setScale(1)
model:setRadius(100)

model:addEngineEmitter(-81, 10,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-81,  0,-4,  0.2, 0.2, 1.0, 8.0)
model:addEngineEmitter(-81,-10,-4,  0.2, 0.2, 1.0, 8.0)

model = ModelData()
model:setName("small_frigate_5")
model:setMesh("small_frigate_5/small_frigate_5.model")
model:setTexture("small_frigate_5/small_frigate_5_color.png")
model:setSpecular("small_frigate_5/small_frigate_5_specular.png")
model:setIllumination("small_frigate_5/small_frigate_5_illumination.png")
model:setScale(1)
model:setRadius(80)

model:addEngineEmitter(-95, 30, 8,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95, 30, 0,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95, 30,-8,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95,-30, 8,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95,-30, 0,  0.2, 0.2, 1.0, 5.0)
model:addEngineEmitter(-95,-30,-8,  0.2, 0.2, 1.0, 5.0)

for _, color in ipairs({"Blue", "Green", "Grey", "Red", "White", "Yellow"}) do
    model = ModelData()
    model:setName("AdlerLongRangeScout" .. color)
    model:setMesh("AdlerLongRangeScout/AdlerLongRangeSoutHull.model")
    model:setTexture("AdlerLongRangeScout/AlbedoAO/AdlerLongRangeScout"..color.."AlbedoAO.png")
    model:setSpecular("AdlerLongRangeScout/AdlerLongRangeScoutPBRSpecular.png")
    model:setIllumination("AdlerLongRangeScout/AdlerLongRangeScoutIllumination.png")
    model:setScale(20)
    model:setRadius(30)
    -- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
    model:addBeamPosition(1.8, 0, 0.03)
    model:addBeamPosition(1.8, 0.13, 0.03)
    model:addBeamPosition(1.8,-0.13, 0.03)
    model:addTubePosition(1.8, 0, 0.03)
    model:addEngineEmitter(-1.5, 0.42, -0.13,  0.5, 0.5, 1.0, 0.5)
    model:addEngineEmitter(-1.5,-0.42, -0.13,  0.5, 0.5, 1.0, 0.5)
    model:addEngineEmitter(-1.5, 0.42, 0.33,  0.5, 0.5, 1.0, 0.5)
    model:addEngineEmitter(-1.5,-0.42, 0.33,  0.5, 0.5, 1.0, 0.5)

    model = ModelData()
    model:setName("AtlasHeavyFighter" .. color)
    model:setMesh("AtlasHeavyFighter/AtlasHeavyFighterHull.model")
    model:setTexture("AtlasHeavyFighter/AlbedoAO/AtlasHeavyFighter"..color.."AlbedoAO.png")
    model:setSpecular("AtlasHeavyFighter/AtlasHeavyFighterPBRSpecular.png")
    model:setIllumination("AtlasHeavyFighter/AtlasHeavyFighterIllumination.png")
    model:setScale(50)
    model:setRadius(80)

    -- Visual positions of the beams/missiletubes (blender: -X, Y, Z)
    model:addBeamPosition(2.4, 0.1, -0.25)
    model:addBeamPosition(2.4,-0.1, -0.25)
    model:addTubePosition(1, 0.4, 0)
    model:addTubePosition(1,-0.4, 0)
    model:addTubePosition(-1, 0, 0) --Mine tube
    model:addEngineEmitter(-1.1, 0.7, 0.0,  0.5, 0.5, 1.0, 0.4)
    model:addEngineEmitter(-1.1, 1.05, 0.0,  0.5, 0.5, 1.0, 0.4)
    model:addEngineEmitter(-1.1,-0.7, 0.0,  0.5, 0.5, 1.0, 0.4)
    model:addEngineEmitter(-1.1,-1.05, 0.0,  0.5, 0.5, 1.0, 0.4)

    model = ModelData()
    model:setName("LindwurmFighter" .. color)
    model:setMesh("LindwurmFighter/LindwurmFighterHull.model")
    model:setTexture("LindwurmFighter/AlbedoAO/LindwurmFighter"..color.."AlbedoAO.png")
    model:setSpecular("LindwurmFighter/LindwurmFighterPBRSpecular.png")
    model:setIllumination("LindwurmFighter/LindwurmFighterIllumination.png")
    model:setScale(20)
    model:setRadius(30)
    model:addTubePosition(1.4, 0, 0.06)
    model:addTubePosition(0.3, 0.5, 0.06)
    model:addTubePosition(0.3,-0.5, 0.06)
    model:addEngineEmitter(-1, 0.54, 0.0,  0.5, 0.5, 1.0, 0.4)
    model:addEngineEmitter(-1,-0.54, 0.0,  0.5, 0.5, 1.0, 0.4)

    model = ModelData()
    model:setName("WespeScout" .. color)
    model:setMesh("WespeScout/WespeScoutHull.model")
    model:setTexture("WespeScout/AlbedoAO/WespeScout"..color.."AlbedoAO.png")
    model:setSpecular("WespeScout/WespeScoutPBRSpecular.png")
    model:setIllumination("WespeScout/WespeScoutIllumination.png")
    model:setScale(20)
    model:setRadius(30)
    model:addBeamPosition(1.15, 0.13, -0.03)
    model:addBeamPosition(1.15,-0.13, -0.03)
    model:addEngineEmitter(-0.2, 0.44, -0.03,  0.5, 0.5, 1.0, 0.4)
    model:addEngineEmitter(-0.2,-0.44, -0.03,  0.5, 0.5, 1.0, 0.4)

    model = ModelData()
    model:setName("HeavyCorvette" .. color)
    model:setMesh("HeavyCorvette/HeavyCorvette.model")
    model:setTexture("HeavyCorvette/AlbedoAO/HeavyCorvette"..color.."AlbedoAO.png")
    model:setSpecular("HeavyCorvette/HeavyCorvettePBRSpecular.png")
    model:setIllumination("HeavyCorvette/HeavyCorvetteIllumination.png")
    model:setScale(50)
    model:setRadius(80)

    model:addEngineEmitter(-1.4, 0.4, 0.0,  0.5, 0.5, 1.0, 0.6)
    model:addEngineEmitter(-1.4, 0.0, 0.0,  0.5, 0.5, 1.0, 0.6)
    model:addEngineEmitter(-1.4,-0.4, 0.0,  0.5, 0.5, 1.0, 0.6)

    model = ModelData()
    model:setName("LaserCorvette" .. color)
    model:setMesh("LaserCorvette/LaserCorvette.model")
    model:setTexture("LaserCorvette/AlbedoAO/LaserCorvette"..color.."AlbedoAO.png")
    model:setSpecular("LaserCorvette/LaserCorvettePBRSpecular.png")
    model:setIllumination("LaserCorvette/LaserCorvetteIllumination.png")
    model:setScale(50)
    model:setRadius(80)

    model:addEngineEmitter(-1.67, 0.1, 0.0,  0.5, 0.5, 1.0, 0.2)
    model:addEngineEmitter(-1.67,-0.1, 0.0,  0.5, 0.5, 1.0, 0.2)

    model = ModelData()
    model:setName("LightCorvette" .. color)
    model:setMesh("LightCorvette/LightCorvette.model")
    model:setTexture("LightCorvette/AlbedoAO/LightCorvette"..color.."AlbedoAO.png")
    model:setSpecular("LightCorvette/LightCorvettePBRSpecular.png")
    model:setIllumination("LightCorvette/LightCorvetteIllumination.png")
    model:setScale(50)
    model:setRadius(80)

    model:addEngineEmitter(-1.3, 0.22, 0.15,  0.5, 0.5, 1.0, 0.3)
    model:addEngineEmitter(-1.3, 0.00, 0.15,  0.5, 0.5, 1.0, 0.3)
    model:addEngineEmitter(-1.3,-0.22, 0.15,  0.5, 0.5, 1.0, 0.3)

    model = ModelData()
    model:setName("MineLayerCorvette" .. color)
    model:setMesh("MineLayerCorvette/MineLayerCorvette.model")
    model:setTexture("MineLayerCorvette/AlbedoAO/MineLayerCorvette"..color.."AlbedoAO.png")
    model:setSpecular("MineLayerCorvette/MineLayerCorvettePBRSpecular.png")
    model:setIllumination("MineLayerCorvette/MineLayerCorvetteIllumination.png")
    model:setScale(50)
    model:setRadius(80)

    model:addEngineEmitter(-0.65, 0.70, 0.0,  0.5, 0.5, 1.0, 0.2)
    model:addEngineEmitter(-0.65,-0.70, 0.0,  0.5, 0.5, 1.0, 0.2)

    model = ModelData()
    model:setName("MissileCorvette" .. color)
    model:setMesh("MissileCorvette/MissileCorvette.model")
    model:setTexture("MissileCorvette/AlbedoAO/MissileCorvette"..color.."AlbedoAO.png")
    model:setSpecular("MissileCorvette/MissileCorvettePBRSpecular.png")
    model:setIllumination("MissileCorvette/MissileCorvetteIllumination.png")
    model:setScale(50)
    model:setRadius(80)

    model:addEngineEmitter(-0.75, 0.24,-0.1,  0.5, 0.5, 1.0, 0.2)
    model:addEngineEmitter(-0.75, 0.00,-0.1,  0.5, 0.5, 1.0, 0.2)
    model:addEngineEmitter(-0.75,-0.24,-0.1,  0.5, 0.5, 1.0, 0.2)

    model = ModelData()
    model:setName("MultiGunCorvette" .. color)
    model:setMesh("MultiGunCorvette/MultiGunCorvette.model")
    model:setTexture("MultiGunCorvette/AlbedoAO/MultiGunCorvette"..color.."AlbedoAO.png")
    model:setSpecular("MultiGunCorvette/MultiGunCorvettePBRSpecular.png")
    model:setIllumination("MultiGunCorvette/MultiGunCorvetteIllumination.png")
    model:setScale(50)
    model:setRadius(80)

    model:addEngineEmitter(-0.75, 0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
    model:addEngineEmitter(-0.75, 0.0,-0.03,  0.5, 0.5, 1.0, 0.2)
    model:addEngineEmitter(-0.75,-0.2,-0.03,  0.5, 0.5, 1.0, 0.2)
end

model = ModelData()
model:setName("SensorBuoyMKI")
model:setMesh("SensorBuoy/SensorBuoyMKI.model")
model:setTexture("SensorBuoy/SensorBuoyAlbedoAO.png")
model:setSpecular("SensorBuoy/SensorBuoyPBRSpecular.png")
model:setScale(300)
model:setRadius(15)

model = ModelData()
model:setName("SensorBuoyMKII")
model:setMesh("SensorBuoy/SensorBuoyMKII.model")
model:setTexture("SensorBuoy/SensorBuoyAlbedoAO.png")
model:setSpecular("SensorBuoy/SensorBuoyPBRSpecular.png")
model:setScale(300)
model:setRadius(15)

model = ModelData()
model:setName("SensorBuoyMKIII")
model:setMesh("SensorBuoy/SensorBuoyMKIII.model")
model:setTexture("SensorBuoy/SensorBuoyAlbedoAO.png")
model:setSpecular("SensorBuoy/SensorBuoyPBRSpecular.png")
model:setScale(300)
model:setRadius(15)

ModelData():setName("artifact1"):setScale(3):setRadius(50):setMesh("Artifact1.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact2"):setScale(3):setRadius(50):setMesh("Artifact2.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact3"):setScale(3):setRadius(50):setMesh("Artifact3.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact4"):setScale(3):setRadius(50):setMesh("Artifact4.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact5"):setScale(3):setRadius(50):setMesh("Artifact5.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact6"):setScale(3):setRadius(50):setMesh("Artifact6.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact7"):setScale(3):setRadius(50):setMesh("Artifact7.obj"):setTexture("electric_sphere_texture.png")
ModelData():setName("artifact8"):setScale(3):setRadius(50):setMesh("Artifact8.obj"):setTexture("electric_sphere_texture.png")

for type=1,5 do
    for cnt=1,5 do
        model = ModelData():setName("transport_" .. type .. "_" .. cnt)
        model:setScale(0.5)
        model:setRadius(100 + cnt * 50)
        model:setCollisionBox(200 + cnt * 100, 200)
        model:setMesh("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_cargo_" .. cnt .. ".model")
        model:setTexture("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_color.png")
        model:setSpecular("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_specular.png")
        model:setIllumination("transport_space_ship_" .. type .. "/transport_space_ship_" .. type .. "_illumination.png")
    end
end
