local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Hello = require(ReplicatedStorage.Shared.Hello)


Hello()

local bird = {
    Color = "red",
    Wings = 2,
    Fly = function()
        print("Flap flap")
    end,
}

type Bird = typeof(bird)
type BirdKeys = keyof<Bird>

local numberKeys:BirdKeys = "Wings"

-->> shows 
print(numberKeys)