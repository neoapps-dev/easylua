EasyColor = {}

-- Convert RGB to HEX
function EasyColor.rgbToHex(r, g, b)
    return string.format("#%02X%02X%02X", r, g, b)
end

-- Generate a random color
function EasyColor.randomColor()
    return EasyColor.rgbToHex(math.random(0, 255), math.random(0, 255), math.random(0, 255))
end
