turtle = {} --initialise la "tortue"

turtle.x = love.graphics.getWidth()/2 --affiche la tortue au milieu de l'écran (en largeur)
turtle.y = love.graphics.getHeight()/2 --affiche la tortue au milieu de l'écran (en hauteur)

turtle.image = love.graphics.newImage("img/pokeball.png")

turtle.speed = 400

sound = love.audio.newSource("sound/bing.mp3", "stream")



-- Initialisation des variables et objets :
function love.load()
  love.window.setMode(800, 600, {fullscreen=true})
  --sound:setLooping(true)
end


-- Interactions dynamique avec les éléments du programme :
function love.update(dt)
  
  --tentative de rotation *FOIREUX*
  if love.keyboard.isDown("r") then
    turtle.x = turtle.x + (math.cos(math.pi) * turtle.speed * dt)
    turtle.y = turtle.y + (math.sin(math.pi) * turtle.speed * dt)
  end
  
  --déplacement vers la droite
  if love.keyboard.isDown("right") then
    --collision sur le mur de droite
    if turtle.x < (love.graphics.getWidth() - turtle.image:getWidth()) then
      turtle.x = turtle.x + (turtle.speed * dt)
    else
      love.audio.play(sound)
    end
  end
  
  --déplacement vers la gauche
  if love.keyboard.isDown("left") then
    --collision sur le mur de gauche
    if turtle.x > 0 then
      turtle.x = turtle.x - (turtle.speed * dt)
    else
      love.audio.play(sound)
    end
  end
  
  --déplacement vers le haut
  if love.keyboard.isDown("up") then
    --collision sur le mur du haut
    if turtle.y > 0 then
      turtle.y = turtle.y - (turtle.speed * dt)
    else
      love.audio.play(sound)
    end
  end
  
  --déplacement vers le haut
  if love.keyboard.isDown("down") then
    --collision sur le mur du bas
    if turtle.y < (love.graphics.getHeight() - turtle.image:getHeight()) then
      turtle.y = turtle.y + (turtle.speed * dt)
    else
      love.audio.play(sound)
    end
  end
  
end

-- Affichage :
function love.draw()
  --love.graphics.translate(10,10)
  love.graphics.draw(turtle.image, turtle.x, turtle.y)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
