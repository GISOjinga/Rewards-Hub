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
print(workspace.Part3)
type Bird = typeof(bird)
type BirdKeys = keyof<Bird>
-- type function: collects only the keys whose value type is number
type function GetKeysWithNumberVariables(ty)
    -- will hold our union of singleton key types
    local union = nil

    -- iterate all properties on the table type
    for property, propInfo in ty:properties() do
        local readType = propInfo.read
        -- if the property's read type is exactly number, include its key
        if readType and readType:is("number") then
            union = union and types.unionof(union, property) or property
        end
    end

    -- if we found no number-typed keys, this yields an empty (never) type
    return union or types.never
end

local numberKeys:GetKeysWithNumberVariables<Bird> = ""

-->> shows 
print(numberKeys)