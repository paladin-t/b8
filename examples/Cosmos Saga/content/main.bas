REM Cosmos Saga - Entry program
REM Shoot'em up, survive as long as you can.
REM
REM Press Ctrl+R to run.
REM Control:
REM   Up/Down: move spaceship
REM         A: shoot

REM Initializes the driver.

drv = driver()
print drv, ", detail type is: ", typeof(drv);
use_sound_font("soundfonts/pixels.sf2")

REM Constants.

' Colors.
WHITE = rgba(255, 255, 255)
' Game stages.
INTRO = 0
PLAYING = 1
LOSE = 2
OVER = 3
' Enemy types.
LETTER = 1
INVADER = 2
' Gameplay.
OWN_BULLETS_MAX_COUNT = 3

REM Classes.

class point
	var x = 0
	var y = 0
endclass
class bullet(point)
	var vx = 0
endclass
class explosion(point)
	var res = nil
	var elapsed = 0
endclass

REM Resources.

title_bg = load_resource("title_bg.quantized")
title_txt = load_resource("title_txt.quantized")
over_txt = load_resource("over_txt.quantized")
galaxy_scroll = load_resource("galaxy_scroll.map")
galaxy1 = galaxy_scroll(1)
galaxy2 = galaxy_scroll(2)
galaxy3 = galaxy_scroll(3)
explosion_bank = load_resource("explosion_bank.sprite")
enemy_bank = load_resource("enemy_bank.sprite")
spaceship = load_resource("spaceship.sprite")
spaceship.play()

REM Variables.

' Bullets and explosions.
own_bullets = list()
enemy_bullets = list()
explosion_fxs = list()
' Enemies.
spawning = nil
alive_enemies = dict()
dead_enemies = list()
' Gameplay.
stage = INTRO
score = 0
highscore = 0
persist highscore
gx1 = 0
gx2 = 0
gx3 = 0
sx = 8
sy = 48
t = 0

REM Functions.

' Spawns an enemy.
def spawn(t)
	' Initializes variables.
	x = 160
	y = 0
	dy = 0
	mov = nil
	emt = nil
	' Chooses behaviours according to enemy type.
	if t = LETTER then
		y = 48
		mov = lambda (delta)
		(
			x = x - delta * 24
			dy = sin(x / 4) * 20
		)
	elseif t = INVADER then
		y = rnd(0, 96)
		vx = 28
		vy = 0
		if rnd > 0.25 then
			vy = (sy - y) / (160 - sx) * vx
		endif
		mov = lambda (delta)
		(
			x = x - delta * vx
			dy = dy + vy * delta
		)
		emt = lambda (ty)
		(
			if rnd < 0.6 then
				b = new(bullet)
				b.x = x - 7
				b.y = ty + 8
				b.vx = -60
				push(enemy_bullets, b)
				sfx 4096+1,860,0.2, 1,380,0.01
				emt = nil
			endif
		)
	endif
	' Returns an enemy closure.
	return lambda (e, delta)
	(
		mov(delta)
		ty = y + dy
		if x < 143 and emt then emt(ty)
		if x < -16 then
			push(dead_enemies, e)
		else
			for b in own_bullets
				if abs(ty + 8 - b.y) < 12 and x >= b.x and x <= b.x + 10 then ' The bullet has hit an enemy.
					b.x = 999 ' Moves it far away.
					if not exists(dead_enemies, e) then
						push(dead_enemies, e)
						score = score + 1
						if score > highscore then highscore = score
					endif
					ex = new(explosion)
					ex.x = x
					ex.y = ty
					ex.res = clone(explosion_bank)
					ex.res.play(-1, -1, false)
					push(explosion_fxs, ex)
					sfx 4096+5,260,0.8, 5,80,0.1
				endif
			next
		endif
		if stage < LOSE then
			if abs(x - sx) < 10 and abs(ty - sy) < 10 then stage = LOSE
		endif
		spr e, x, ty
	)
enddef

' Initializes states, starts an enemy spawner, etc.
def setup()
	' Initializes variables.
	score = 0
	sx = 8
	sy = 48
	' Clears collections.
	clear(alive_enemies)
	clear(dead_enemies)
	' Starts an enemy spawner.
	if spawning then
		abort(spawning)
		spawning = nil
	endif
	spawning = coroutine
	(
		lambda ()
		(
			yield wait_for(1.0)
			' "W".
			e = clone(enemy_bank)
			e.play("W", "WE")
			set(alive_enemies, e, spawn(LETTER))
			yield wait_for(0.8)
			' "E".
			e = clone(enemy_bank)
			e.play("E", "EE")
			set(alive_enemies, e, spawn(LETTER))
			yield wait_for(0.8)
			' "L".
			e = clone(enemy_bank)
			e.play("L", "LE")
			set(alive_enemies, e, spawn(LETTER))
			yield wait_for(0.8)
			' "C".
			e = clone(enemy_bank)
			e.play("C", "CE")
			set(alive_enemies, e, spawn(LETTER))
			yield wait_for(0.8)
			' "O".
			e = clone(enemy_bank)
			e.play("O", "OE")
			set(alive_enemies, e, spawn(LETTER))
			yield wait_for(0.8)
			' "M".
			e = clone(enemy_bank)
			e.play("M", "ME")
			set(alive_enemies, e, spawn(LETTER))
			yield wait_for(0.8)
			' "E".
			e = clone(enemy_bank)
			e.play("E", "EE")
			set(alive_enemies, e, spawn(LETTER))
			yield wait_for(2.8)
			' Invaders.
			while true
				e = clone(enemy_bank)
				e.play("E1", "E1E")
				set(alive_enemies, e, spawn(INVADER))
				yield wait_for(rnd(700, 1800) / 1000)
			wend
		)
	)
	start(spawning)
enddef

' Updates bullets.
def pelter(delta)
	' Updates own bullets.
	for b in own_bullets
		b.x = b.x + b.vx * delta
		line b.x, b.y, b.x + 10, b.y, 2, WHITE
	next
	if len(own_bullets) then
		b = get(own_bullets, 0)
		if b.x > 160 then
			remove(own_bullets, 0)
		endif
	endif
	' Updates enemies' bullets.
	for b in enemy_bullets
		b.x = b.x + b.vx * delta
		line b.x, b.y, b.x + 10, b.y, 2, WHITE
		if stage < LOSE then
			if abs(sy + 8 - b.y) < 10 and sx + 16 >= b.x and sx + 16 <= b.x + 10 then stage = LOSE
		endif
	next
	if len(enemy_bullets) then
		b = get(enemy_bullets, 0)
		if b.x < -10 then
			remove(enemy_bullets, 0)
		endif
	endif
enddef

' Updates all explosion effects.
def boom(delta)
	for e in explosion_fxs
		e.elapsed = e.elapsed + delta
		spr e.res, e.x, e.y
	next
	if len(explosion_fxs) then
		e = get(explosion_fxs, 0)
		if e.elapsed > 1 then
			remove(explosion_fxs, 0)
		endif
	endif
enddef

' Common routine of a galaxy scene.
def galaxy(delta, sp)
	' Updates scrolling variables.
	gx1 = gx1 - delta * 120
	if gx1 < -160 then gx1 = gx1 + 160
	gx2 = gx2 - delta * 150
	if gx2 < -160 then gx2 = gx2 + 160
	gx3 = gx3 - delta * 170
	if gx3 < -160 then gx3 = gx3 + 160
	' Shows the two background layers.
	map galaxy1, gx1, 0
	map galaxy1, gx1 + 160, 0
	map galaxy2, gx2, 0
	map galaxy2, gx2 + 160, 0
	' Shows the spaceship.
	if sp then spr spaceship, sx, sy
	' Updates and shows all enemies.
	for i in alive_enemies
		ctrl = alive_enemies(i)
		ctrl(i, delta)
	next
	' Shows the forground layer.
	map galaxy3, gx3, 0
	map galaxy3, gx3 + 160, 0
	' Processes bullets and explosions.
	pelter(delta)
	boom(delta)
	' Processes dead enemies.
	if len(dead_enemies) then
		for i in dead_enemies
			if exists(alive_enemies, i) then
				remove(alive_enemies, i)
			endif
		next
		clear(dead_enemies)
	endif
	' Shows scores.
	text 0, 1, "SCORE:", WHITE
	text 47, 1, score, WHITE
	text 80, 1, "HI:", WHITE
	text 104, 1, highscore
enddef

' Game over stage.
def gameover(delta)
	' If just lost.
	if stage = LOSE then
		t = 0
		stage = OVER
		if spawning then
			abort(spawning)
			spawning = nil
		endif
		clear(own_bullets)
		sfx 4,120,0.2, 4,0,0.2, 4,120,0.3, 4,140,0.3, 4,100,0.2, 4,0,0.2, 4,100,0.3
		ex = new(explosion)
		ex.x = sx
		ex.y = sy
		ex.res = clone(explosion_bank)
		ex.res.play(-1, -1, false)
		push(explosion_fxs, ex)
		sfx 4096+5,260,0.8, 5,80,0.1
	endif
	' Updates the galaxy.
	galaxy(delta, false)
	' Shows the "GAME OVER" text.
	img over_txt, 0, 128 * (3 - t) / 3
	' Ticks.
	if t < 3 then
		t = t + delta
		if t > 3 then t = 3
	else
		if btnp() or keyp() then
			t = 0
			stage = INTRO
		endif
	endif
enddef

' Battle stage.
def battle(delta)
	' Ticks.
	t = t + delta
	' Processes input.
	if btn(2) then
		sy = sy - delta * 50
		if sy < 0 then sy = 0
	elseif btn(3) then
		sy = sy + delta * 50
		if sy >= 112 then sy = 111
	endif
	if btnp(4) then
		if len(own_bullets) < OWN_BULLETS_MAX_COUNT then
			b = new(bullet)
			b.x = sx + 16
			b.y = sy + 8
			b.vx = 60
			push(own_bullets, b)
			sfx 4096+2,860,0.2, 2,380,0.01
		endif
	endif
	' Updates the galaxy.
	galaxy(delta, true)
enddef

' Title stage.
def title(delta)
	' Plays music.
	if not bgm then
		bgm = true
		play "T128  F8G8A8B8 >C <A >F D C2  F8G8A8B8 >C <A >F D C2 <<", 0, 5, true
		play "T128  F A >C <C D E F2  <F A >C <C D E F2 >", 1, 14, true
	endif
	' Ticks.
	t = t + delta
	if not shown then
		d = t * 2
		if d > 1 then
			shown = true
			d = 1
		endif
		by = -59
		ey = (128 - 59) / 2 - 20
		y = by + (ey - by) * d
	endif
	' Shows visuals.
	img title_bg, 0, 0
	img title_txt, (160 - 138) / 2, y
	' Shows tips and accepts input.
	if shown then
		if t * 2 mod 2 then text 16, 100, "PRESS ANY BUTTON", WHITE
		if btnp() or keyp() then
			play "P", 0, 0, false
			play "P", 1, 0, false
			bgm = false
			shown = false
			setup()
			stage = PLAYING
		endif
	endif
enddef

' Enters the main loop.
update_with
(
	drv,
	lambda (delta)
	(
		if stage = INTRO then
			title(delta)
		elseif stage = PLAYING then
			battle(delta)
		elseif stage = LOSE or stage = OVER then
			gameover(delta)
		endif
	)
)
