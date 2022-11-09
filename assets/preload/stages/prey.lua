ok = 'stardustBg'
ok2 = 'stardustFloor'
bgPath = 'starved/stardustBg'
bgPath2 = 'starved/stardustFloor'
size = 4608
startX = -1400
startY = -1300
startY2 = -1470
duration = 5
duration2 = 1.5

function newFlxSprite(name, x, y, scrollFactorX, scrollFactorY, scaleOX, scaleOY, camera, alpha, visible, width, height, color, add, front)
makeLuaSprite(name, '', x, y);
makeGraphic(name, width, height, color)
setScrollFactor(name, scrollFactorX, scrollFactorY);
scaleObject(name, scaleOX, scaleOY);
setProperty(name..'.visible', visible);
setObjectCamera(name, camera);
setProperty(name..'.alpha', alpha);
if add == true then
addLuaSprite(name, front);
end
end

function newSprite(name, path, x, y, scrollFactorX, scrollFactorY, scaleOX, scaleOY, camera, alpha, visible, add, front)
makeLuaSprite(name, path, x, y);
setScrollFactor(name, scrollFactorX, scrollFactorY);
scaleObject(name, scaleOX, scaleOY);
setProperty(name..'.visible', visible);
setObjectCamera(name, camera);
setProperty(name..'.alpha', alpha);
if add == true then
addLuaSprite(name, front);
end
end

function onCreate()
addCharacterToList('furnace', 'dad');
addCharacterToList('starved', 'dad');
newSprite(ok, bgPath, startX, startY, 0.7, 0.7, 2, 2, 'game', 1, true, false)
newSprite(ok..'2', bgPath, startX + size, startY, 0.7, 0.7, 2, 2, 'game', 1, true, false)
newSprite(ok..'1speed', bgPath, startX, startY, 0.7, 0.7, 2, 2, 'game', 1, true, false)
newSprite(ok..'2speed', bgPath, startX + size, startY, 0.7, 0.7, 2, 2, 'game', 1, true, false)
newSprite('furnacegotcha', 'starved/furnace_gotcha', 2500, 490, 1, 1, 5, 5, 'game', 1, false, false)
newSprite(ok2, bgPath2, startX, startY2, 1, 1, 2, 2, 'game', 1, true, false)
newSprite(ok2..'2', bgPath2, startX + size, startY2, 1, 1, 2, 2, 'game', 1, true, false)
newSprite(ok2..'1speed', bgPath2, startX, startY2, 1, 1, 2, 2, 'game', 1, true, false)
newSprite(ok2..'2speed', bgPath2, startX + size, startY2, 1, 1, 2, 2, 'game', 1, true, false)
newFlxSprite('oyeamrkrab', 0, 0, 0, 0, 1, 1, 'other', 1, false, 1280, 720, '000000', true, true);
newFlxSprite('readthefiletitlelol', 0, 0, 0, 0, 1, 1, 'other', 1, true, 1280, 720, '000000', true, true);
newSprite('introcircle', 'StartScreens/Circle-prey', 777, 0, 0, 0, 1, 1, 'other', 1, true, true, true)
newSprite('introtext', 'StartScreens/Text-prey', -1200, 0, 0, 0, 1, 1, 'other', 1, true, true, true)
newFlxSprite('red', -500, -400, 0, 0, 2, 2, 'other', 1, false, 1280, 720, 'FF0000', true, true);
end

function onCreatePost()
setPropertyFromClass('GameOverSubstate', 'characterName', 'sonic-gameover')
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'prey-death')
setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'prey-loop')
setPropertyFromClass('GameOverSubstate', 'endSoundName', 'prey-retry')
doTweenAlpha('GUItween', 'camHUD', 0, 0.5, 'linear');
setProperty('introSoundsSuffix', '-ok')
setProperty('scoreTxt.visible', false)
setProperty('botplayTxt.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false);
setProperty('timeBar.visible', false)
setProperty('healthBar.x', 530)
setProperty('dad.visible', false)
setProperty('gf.visible', false)

for i = 0, getProperty('unspawnNotes.length')-1 do
 if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
  setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
 end
end
end

function opponentNoteHit(id, dir, noteType, isSustainNote)
  if isSustainNote then
     if (getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing') then
        setProperty('gf.holdTimer', 0);
     else
        setProperty('dad.holdTimer', 0);
     end
  end
end

function goodNoteHit(id, dir, noteType, isSustainNote)
  if isSustainNote then
   if (getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing') then
    setProperty('gf.holdTimer', 0);
   else
    setProperty('boyfriend.holdTimer', 0);
   end
  end
end

function onEvent(name,value1,value2)
if name == 'esotilin' then
 if value1 == 'jeje' then
  setProperty('defaultCamZoom', 1.18);
  setProperty('camGame.zoom', 1.18);
  runTimer('cam', 0.3);
  tween1()
  tween2()
  tweenA1()
  tweenA2()
  addLuaSprite(ok, false);
  addLuaSprite(ok..'2', false);
  addLuaSprite('furnacegotcha', false);
  addLuaSprite(ok2, true);
  addLuaSprite(ok2..'2', true);
 end
elseif name == 'sped' then
 if value1 == 'nor2' then
addLuaSprite(ok..'1speed', false);
addLuaSprite(ok..'2speed', false);
addLuaSprite(ok2..'1speed', true);
addLuaSprite(ok2..'2speed', true);
removeLuaSprite(ok, false);
removeLuaSprite(ok..'2', false);
removeLuaSprite(ok2, true);
removeLuaSprite(ok2..'2', true);
 end
end
end

function onTimerCompleted(tag)
if (tag == 'cam') then
setProperty('defaultCamZoom', 0.58)
setProperty('camGame.zoom', 0.58)
end
end

function tween1()
doTweenX(ok..'1move', ok, startX - size, duration)
doTweenX(ok..'2move', ok ..'2', startX, duration)
end
function tween2()
doTweenX(ok2..'1move', ok2, startX - size, duration2)
doTweenX(ok2..'2move', ok2 ..'2', startX, duration2)
end
function tweenA1()
doTweenX(ok..'1moveSpeed', ok..'1speed', startX - size, 2)
doTweenX(ok..'2moveSpeed', ok..'2speed', startX, 2)
end
function tweenA2()
doTweenX(ok2..'1moveSpeed', ok2..'1speed', startX - size, 0.75)
doTweenX(ok2..'2moveSpeed', ok2..'2speed', startX, 0.75)
end

function onTweenCompleted(tag)
if (tag == 'graphicAlpha') then
doTweenAlpha('ola', 'oyeamrkrab', 0, 12, 'linear');
end
if (tag == 'ola') then
removeLuaSprite('oyeamrkrab', true);
end
if (tag == ok..'2move') then
tween3()
end
if (tag == ok2..'2move') then
tween4()
end
if (tag == ok..'2move2') then
tween1()
end
if (tag == ok2..'2move2') then
tween2()
end 
if (tag == ok..'2moveSpeed') then
tweenB1()
end
if (tag == ok2..'2moveSpeed') then
tweenB2()
end
if (tag == ok..'2move2Speed') then
tweenA1()
end
if (tag == ok2..'2move2Speed') then
tweenA2()
end
end

function tween3()
doTweenX(ok..'1move2', ok, startX, 0.001)
doTweenX(ok..'2move2', ok ..'2', startX + size, 0.001)
end
function tween4()
doTweenX(ok2..'1move2', ok2, startX, 0.001)
doTweenX(ok2..'2move2', ok2 ..'2', startX + size, 0.001)
end

function tweenB1()
doTweenX(ok..'1move2Speed', ok..'1speed', startX, 0.001)
doTweenX(ok..'2move2Speed', ok..'2speed', startX + size, 0.001)
end
function tweenB2()
doTweenX(ok2..'1move2Speed', ok2..'1speed', startX, 0.001)
doTweenX(ok2..'2move2Speed', ok2..'2speed', startX + size, 0.001)
end

function onStartCountdown()
doTweenX('circleTween', 'introcircle', 0, 2, 'quintOut')
doTweenX('textTween', 'introtext', 0, 2, 'quintOut')
return Function_Continue
end

function onSongStart()
setProperty('oyeamrkrab.visible', true);
doTweenAlpha('graphicAlpha', 'readthefiletitlelol', 0, 1.5, 'quintOut');
doTweenAlpha('circleAlpha', 'introcircle', 0, 1.5, 'quintOut');
doTweenAlpha('textAlpha', 'introtext', 0, 1.5, 'quintOut');
end

beatHitFuncs = { 
	[1] = function()
	doTweenX('he flying', 'dad', -570, 1, 'quadInOut')
	end,
	[60] = function()
	setProperty('dad.visible', true)
	doTweenX('reset', 'dad', 300, 1, 'quadInOut')
	end,
	[377] = function()
	doTweenAngle('losingpower', 'dad', -250, 2.5, 'quadInOut')
    doTweenX('gone', 'dad', -700, 2.5, 'quadInOut')
	end,
	[395] = function()
    doTweenX('enter', 'dad', 150, 1.5, 'quadInOut')
	end,
	[613] = function()
	setProperty('gf.visible', true)
    doTweenX('immagetthatsnussy', 'gf', 2550, 5.5, 'quadInOut')
	end,
	[833] = function()
    doTweenX('obamaout', 'dad', -2550, 3.5, 'quadInOut')
	end,
	[842] = function()
	setProperty('red.visible', true)
	end,
	}

function onBeatHit()
	if beatHitFuncs[curBeat] then 
		beatHitFuncs[curBeat]()
	end
end

function onUpdate(elapsed)
if curStep == 3365 then
setProperty('furnacegotcha.visible', true)
doTweenX('gotcha', 'furnacegotcha', 1130, 0.3, 'linear');
end
end