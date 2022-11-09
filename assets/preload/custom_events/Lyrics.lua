function onEvent(name, value1, value2)
    local string = tostring(value1)
    local color = tostring(value2)
    if name == "Lyrics" then
    makeLuaText('captions', '', 1000, 150, 620)
    setTextString('captions', string)
    setTextFont('captions', 'fnf.ttf')
    setTextColor('captions', color)
    setTextSize('captions', 35);
    addLuaText('captions')
	setObjectCamera('captions', 'other');
    setTextAlignment('captions', 'center')
    --removeLuaText('captions', true)
    end
end

