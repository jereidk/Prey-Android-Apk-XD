local splashCount = 0;
local splashCount2 = 0;
local enabled = false;
local splashThing = 'Squirt';
local sickTrack = 0;
local enableNewSystem = true;

function onCreatePost()
   if enableNewSystem then
		enabled = getPropertyFromClass('ClientPrefs', 'noteSplashes');
	else
		enabled = false;
	end

	makeAnimatedLuaSprite('noteSplashp', 'BloodSplashes', 100, 100);
	addLuaSprite('noteSplashp');
	runTimer('precacheshit', 0.3, 1)
	setObjectCamera('noteSplashp', 'hud')
end

function onUpdatePost()
  if enabled then
		for i = 0, splashCount do
			if getProperty('noteSplash' .. i .. '.animation.curAnim.finished') then
				removeLuaSprite('noteSplash' .. i);
			end
		end

		for i = 0, getProperty('grpNoteSplashes.length')-1 do
			setPropertyFromGroup('grpNoteSplashes', i, 'visible', false);
		end
  end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
  if sickTrack < getProperty('sicks') then
	sickTrack = sickTrack + 1;
	spawnCustomSplash(note, direction, type, sus);
  end
end

function spawnCustomSplash(note, direction, type, sus)
  if enabled then
    splashCount = splashCount + 1;

  makeAnimatedLuaSprite('noteSplash' .. splashCount, 'BloodSplashes', getPropertyFromGroup('playerStrums', direction, 'x') - 65, getPropertyFromGroup('playerStrums', direction, 'y') - 40);
		
    if direction == 0 then
	  splashThing = 'Splash';
	elseif direction == 1 then
	  splashThing = 'Splash';
	elseif direction == 2 then
	  splashThing = 'Splash';
	else
	  splashThing = 'Splash';
	end
		
		addAnimationByPrefix('noteSplash' .. splashCount, 'anim', splashThing, 24, false);
		addLuaSprite('noteSplash' .. splashCount);
		-- objectPlayAnimation('noteSplash' .. splashCount, 'anim')
		
		setProperty('noteSplash' .. splashCount .. '.offset.x', 60);
		setProperty('noteSplash' .. splashCount .. '.offset.y', 40);
		setProperty('noteSplash' .. splashCount .. '.alpha', 1);
		scaleObject('noteSplash' .. splashCount, 1, 1)

		setObjectCamera('noteSplash' .. splashCount, 'hud');
		setObjectOrder('noteSplash' .. splashCount, getObjectOrder('grpNoteSplashes'))
	end
end

function onTimerCompleted(tag)
if (tag == 'precacheshit') then
	setProperty('noteSplashp.alpha', 0.0)
  end
end