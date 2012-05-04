local physics = require "physics"
physics.start()
physics.setGravity( 0, 0 )
physics.pause()

local W = display.contentWidth
local H = display.contentHeight

local background = display.newImageRect("background.png", W, H)
background.x = W/2
background.y = H/2

local jollibee = nil
local mcdonalds = nil
local burgerking = nil
local manginasal = nil

local function logoTouched( event )
  if event.phase == "ended" then
    physics.pause()
    jollibee.isVisible = false
    mcdonalds.isVisible = false
    burgerking.isVisible = false
    manginasal.isVisible = false
    event.target.isVisible = true
    transition.to( event.target, {
      time=1500,
      width=event.target.width*3,
      height=event.target.height*3
    })
  end
end

local logoMaterial = {
  density = 2.0,
	friction = 5.0,
	bounce = 1.2
}

jollibee = display.newImageRect(
  "jollibee.png", 100, 100)
jollibee.x = 200
jollibee.y = 300
physics.addBody( jollibee, logoMaterial )
jollibee:setLinearVelocity( math.random(-W,W), math.random(-H,H) )
jollibee:addEventListener( "touch", logoTouched )

mcdonalds = display.newImageRect(
  "mcdonalds.png", 75, 56)
mcdonalds.x = 500
mcdonalds.y = 300
physics.addBody( mcdonalds, logoMaterial )
mcdonalds:setLinearVelocity( math.random(-W,W), math.random(-H,H) )
mcdonalds:addEventListener( "touch", logoTouched )

burgerking = display.newImageRect(
  "burgerking.png", 100, 100)
burgerking.x = 200
burgerking.y = 500
physics.addBody( burgerking, logoMaterial )
burgerking:setLinearVelocity( math.random(-W,W), math.random(-H,H) )
burgerking:addEventListener( "touch", logoTouched )

manginasal = display.newImageRect(
  "manginasal.png", 150, 79)
manginasal.x = 500
manginasal.y = 500
physics.addBody( manginasal, logoMaterial )
manginasal:setLinearVelocity( math.random(-W,W), math.random(-H,H) )
manginasal:addEventListener( "touch", logoTouched )

local wallMaterial = {
  density = 2.0,
	friction = 5.0,
	bounce = 1.2
}

local topWall = display.newRect( 0, 0, W, 10 )
physics.addBody( topWall, "static", wallMaterial )

local bottomWall = display.newRect( 0, H-10, W, 10 )
physics.addBody( bottomWall, "static", wallMaterial )

local leftWall = display.newRect( 0, 0, 10, H )
physics.addBody( leftWall, "static", wallMaterial )

local rightWall = display.newRect( W-10, 0, 10, H )
physics.addBody( rightWall, "static", wallMaterial )

physics.start()
