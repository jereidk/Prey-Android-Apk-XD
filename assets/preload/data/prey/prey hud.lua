function onCreatePost()
	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Elapsed')
	setPropertyFromClass('ClientPrefs', 'songScoreType', 'Score Elapsed') 

    if not downscroll then
    makeLuaText('score', 'SCORE', 0, 30, 635)
    makeLuaText('scorecount', '', 0, 30, 635)
    makeLuaText('time', 'TIME', 0, 30, 595)
    makeLuaText('timecount', '', 0, 30, 595)
    makeLuaText('misses', 'MISSES', 0, 30, 555)
    makeLuaText('missescount', '', 0, 100, 555)
    else
    makeLuaText('score', 'SCORE', 0, 30, 105)
    makeLuaText('scorecount', '', 0, 30, 105)
    makeLuaText('time', 'TIME', 0, 30, 65)
    makeLuaText('timecount', '', 0, 30, 65)
    makeLuaText('misses', 'MISSES', 0, 30, 25)
    makeLuaText('missescount', '', 0, 100, 25)
    end
    
    setTextColor('score', 'FFFF00')
    setTextColor('time', 'FFFF00')
    setTextColor('misses', 'FFFF00')
    
    addLuaText('score')
    addLuaText('scorecount')
    addLuaText('time')
	addLuaText('timecount')
	addLuaText('misses')
	addLuaText('missescount')
	
	setTextSize('missescount', 45)
	setTextSize('misses', 45)
	setTextSize('time', 45)
    setTextSize('score', 45)
    setTextSize('scorecount', 45)
    setTextSize('timecount', 45) 
end

function onUpdate(elapsed)
setTextString('missescount', '     ' .. getProperty('songMisses'))
setTextString('scorecount', '        ' .. getProperty('songScore'))
setTextString('timecount', '      ' .. getTextString('timeTxt'))
end 

function onDestroy()
setPropertyFromClass('Main', 'fpsVar.visible', true)
setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Left') 
clearUnusedMemory()
end