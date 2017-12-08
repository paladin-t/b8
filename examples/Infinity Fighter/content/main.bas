REM Infinity Fighter - Entry program
REM FTG, you can compete with BASIC8.
REM   1. You are always playing the one in white, your opponent is in red.
REM   2. Both fighters get up to 3 HP, one will die when all HP losts.
REM   3. You will enter next level and get 1 more HP, if the opponent is defeated.
REM   4. The computer will repeat your actions at previous level.
REM   5. Defeat your challengers, and survive as long as you can.
REM
REM Press Ctrl+R to run.
REM Control:
REM   Left/Right: move fighter
REM           Up: jump
REM            A: kick
REM            B: shoudouken (aka. bullet in code)

REM Initializes the driver.

drv = driver()
print drv, ", detail type is: ", typeof(drv);

REM Constants.

' Colors.
BLACK = rgba(50, 30, 30) ' Um, nearly...
' Game stages.
INTRO = 0
READY = 1
PLAYING = 2
WIN = 3
LOSE = 4
OVER = 5
' Actions.
ACT_IDLE = 0
ACT_LEFT = 1
ACT_RIGHT = 2
ACT_HURT = 3
ACT_SHOOT = 4
ACT_KICK = 5
ACT_JUMP = 6
ACT_WIN = 7
ACT_COUNT = 8
' Animation data; begin frame, end frame, action duration...
ANIMS = list
(
	' Own fighter.
	"IDLE1", "IDLE1E", 0,
	"WALK1", "WALK1E", 0,
	"WALK1", "WALK1E", 0,
	"HURT1", "HURT1", 0.2,
	"P1", "P1", 0.7,
	"K1", "K1E", 0.5,
	"WALK1", "WALK1E", 0.0,
	"WIN1", "WIN1E", 0,
	' Opposite fighter.
	"IDLE2", "IDLE2E", 0,
	"WALK2", "WALK2E", 0,
	"WALK2", "WALK2E", 0,
	"HURT2", "HURT2", 0.2,
	"P2", "P2", 0.7,
	"K2", "K2E", 0.5,
	"WALK2", "WALK2E", 0.0,
	"WIN2", "WIN2E", 0
)
assert(len(ANIMS) = ACT_COUNT * 3 * 2, "Unmatched animation data.")
' Gameplay.
JUMP_DURATION = 0.95
HURT_COOLDOWN = 600
BULLET_LIFE = 0.699

REM Classes.

class record
	var leadtime = 0
	var action = ACT_IDLE
endclass
class fighter
	var res = nil
	var elapsed = 0.0
	var hp = 3
	var mirror = false
	var dir = 0
	var x = 0
	var y = 0
	var action = ACT_IDLE
	var last_action = ACT_IDLE
	var action_remain = 0.0
	var jump_remain = 0.0
	var hurt_timestamp = -HURT_COOLDOWN
	var bdir = 0
	var bx = 0
	var by = 0
	var bullet_remain = 0.0
endclass

REM Resources.

title_txt = load_resource("title_txt.quantized")
battle_bg = load_resource("battle_bg.map")
battle_fg = load_resource("battle_fg.map")
hp_bank = load_resource("hp_bank.sprite")
hp0 = list(clone(hp_bank), clone(hp_bank), clone(hp_bank))
hp1 = list(clone(hp_bank), clone(hp_bank), clone(hp_bank))
fighter_bank = load_resource("fighter_bank.sprite")

REM Variables.

' Fighters.
f0 = new(fighter)
f0.res = clone(fighter_bank)
f0.res.set_flip_condition(-1, 0)
f1 = new(fighter)
f1.res = clone(fighter_bank)
f1.res.set_flip_condition(-1, 0)
' Gameplay.
stage = INTRO
lv = 1
best = 1
persist best
recording = list()
recorded = list()
ppos = 0
t = 0

REM Functions.

' Tells whether two AABBes intersect with each other.
def aabb_hit(l0, t0, r0, b0, l1, t1, r1, b1)
	r0x = (r0 - l0) / 2
	c0x = l0 + r0x
	r1x = (r1 - l1) / 2
	c1x = l1 + r1x
	if abs(c0x - c1x) > (r0x + r1x) then return false
	r0y = (b0 - t0) / 2
	c0y = t0 + r0y
	r1y = (b1 - t1) / 2
	c1y = t1 + r1y
	if abs(c0y - c1y) > (r0y + r1y) then return false
	return true
enddef

' Plays specific animation of a fighter.
def anim(f, act, self)
	b = act * 3
	e = b + 1
	if not self then
		b = b + ACT_COUNT * 3
		e = e + ACT_COUNT * 3
	endif
	f.res.play(ANIMS(b), ANIMS(e))
	f.action_remain = ANIMS(b + 2)
enddef

' Initializes states, starts recording, etc.
def setup()
	' Initializes variables.
	t = 0
	' Decides sides for both fighters.
	if lv mod 2 then
		fleft = f0
		fright = f1
	else
		fleft = f1
		fright = f0
	endif
	' Initializes fighters.
	anim(f0, ACT_IDLE, true)
	anim(f1, ACT_IDLE, false)
	f0.elapsed = 0
	f1.elapsed = 0
	f0.hp = f0.hp + 1 ' Adds 1 more HP.
	if f0.hp > 3 then f0.hp = 3 ' Up to 3.
	f1.hp = 3
	for i = 0 to f0.hp - 1
		play(hp0(i), "HP", "HP")
	next
	for i = 0 to 2
		play(hp1(i), "HP", "HP")
	next
	f1.mirror = false
	f0.action = ACT_IDLE
	f1.action = ACT_IDLE
	f0.last_action = ACT_IDLE
	f1.last_action = ACT_IDLE
	f0.action_remain = 0
	f1.action_remain = 0
	f0.jump_remain = 0
	f1.jump_remain = 0
	f0.hurt_timestamp = HURT_COOLDOWN
	f1.hurt_timestamp = HURT_COOLDOWN
	f0.bullet_remain = 0
	f1.bullet_remain = 0
	fleft.res.flip_x(false)
	fright.res.flip_x(true)
	fleft.dir = 1
	fright.dir = -1
	fleft.x = 10 : fleft.y = 108
	fright.x = 118 : fright.y = 108
	spr fleft.res, -999, 0 ' Commits drawing with the fighter on the left once, for automatic flipping with next committing.
	spr fright.res, 999, 0 ' Similar to above.
	' Processes records.
	clear(recording)
	ppos = 0
enddef

' Updates jumping of a fighter.
def jumping(fm, fo, delta)
	fm.jump_remain = fm.jump_remain - delta
	if fm.jump_remain < 0 then fm.jump_remain = 0
	jy = sin(fm.jump_remain / JUMP_DURATION * PI) * 50
	fm.y = 108 - jy
enddef

' Updates a bullet.
def shoudouken(fm, fo, delta)
	fm.bullet_remain = fm.bullet_remain - delta
	fm.bx = fm.bx + fm.bdir * delta * 40
	rm = fm.bullet_remain / BULLET_LIFE * PI
	f = sin(rm * 3) + 1
	g = cos(rm * 3) + 1
	circfill fm.bx, fm.by, 10 - f * 2, rgba(f * 100 + 20, 120, g * 100 + 20, f * 64 + 120)
	circfill fm.bx, fm.by, 10 - g * 2, rgba(g * 100 + 20, f * 100 + 20, 120, g * 64 + 120)
enddef

' Common routine of a battle yard.
def yard(delta, r0, r1)
	' Shows the background and foreground.
	map battle_bg, 0, 0
	map battle_fg, 0, 0
	' Shows the HUD.
	text 9, 1, "LV."
	text 33, 1, lv
	text 65, 1, "BEST"
	text 101, 1, best
	for i = 1 to 3
		if lv mod 2 then
			spr hp0(i - 1), i * 9, 10
		else
			spr hp1(i - 1), i * 9, 10
		endif
	next
	for i = 1 to 3
		if lv mod 2 then
			spr hp1(i - 1), 144 - i * 9, 10
		else
			spr hp0(i - 1), 144 - i * 9, 10
		endif
	next
	' Shows the fighters.
	if r1 then
		spr f1.res, f1.x, step_on(120), r1
		spr f0.res, f0.x, step_on(f0.y)
	elseif r0 then
		spr f0.res, f0.x, step_on(120), r0
		spr f1.res, f1.x, step_on(f1.y)
	else
		spr f1.res, f1.x, step_on(f1.y)
		spr f0.res, f0.x, step_on(f0.y)
	endif
	' Processes jumping and bullets.
	if f0.jump_remain > 0 then jumping(f0, f1, delta)
	if f1.jump_remain > 0 then jumping(f1, f0, delta)
	if f0.bullet_remain > 0 then shoudouken(f0, f1, delta)
	if f1.bullet_remain > 0 then shoudouken(f1, f0, delta)
enddef

' Game over stage.
def gameover(delta)
	' Ticks.
	t = t + delta
	' Shows the scene.
	if t < 0.5 then
		yard(delta, 0, 0)
	else
		if f0.dir = 1 then
			f0.res.flip_x(true)
			yard(delta, -90, 0)
		else
			f0.res.flip_x(false)
			yard(delta, 90, 0)
		endif
		text 48, 30, "You Lose"
	endif
	if t >= 2.5 then
		if t * 2 mod 2 then
			text 16, 110, "PRESS ANY BUTTON", BLACK
		else
			text 16, 110, "PRESS ANY BUTTON", rgba(255, 255, 255)
		endif
		if btnp() or keyp() then
			lv = 1
			clear(recording)
			clear(recorded)
			t = 0
			stage = INTRO
		endif
	endif
enddef

' Next level state.
def nextlv(delta)
	' Ticks.
	t = t + delta
	' Shows the scene.
	if t < 0.5 then
		yard(delta, 0, 0)
	elseif t < 3 then
		if f1.dir = 1 then
			f1.res.flip_x(true)
			yard(delta, 0, -90)
		else
			f1.res.flip_x(false)
			yard(delta, 0, 90)
		endif
		text 52, 30, "You Win"
	else
		lv = lv + 1
		if lv > best then best = lv
		tmp = recording
		recording = recorded
		recorded = tmp
		tmp = nil
		setup()
		stage = READY
	endif
enddef

' Controls a fighter.
def ctrl(fm, fo, delta, act, self)
	' Detects collision.
	n = ticks()
	def_fol = fo.x + 8
	def_fot = fo.y - 28
	def_for = fo.x + 24
	def_fob = fo.y - 2
	if fo.action <> ACT_HURT and n - fo.hurt_timestamp > HURT_COOLDOWN and fm.bullet_remain > 0 then
		blt_fml = fm.bx - 6
		blt_fmt = fm.by - 6
		blt_fmr = fm.bx + 7
		blt_fmb = fm.by + 7
		if aabb_hit(blt_fml,blt_fmt,blt_fmr,blt_fmb, def_fol,def_fot,def_for,def_fob) then
			fm.bullet_remain = 0
			fo.hurt_timestamp = n
			fo.hp = fo.hp - 1
			if fo.hp < 0 then
				fo.hp = 0
			else
				if self then
					play(hp1(fo.hp), "HPL", "HPLE", false, true)
				else
					play(hp0(fo.hp), "HPL", "HPLE", false, true)
				endif
			endif
			if fo.action <> ACT_HURT then
				fo.action = ACT_HURT
				anim(fo, ACT_HURT, not self)
			endif
		endif
	endif
	if fo.action <> ACT_HURT and n - fo.hurt_timestamp > HURT_COOLDOWN and fm.action = ACT_KICK then
		atk_fml = fm.x + 8 + fm.dir * 8
		atk_fmt = fm.y - 25
		atk_fmr = fm.x + 24 + fm.dir * 8
		atk_fmb = fm.y - 8
		if aabb_hit(atk_fml,atk_fmt,atk_fmr,atk_fmb, def_fol,def_fot,def_for,def_fob) then
			fo.hurt_timestamp = n
			fo.hp = fo.hp - 1
			if fo.hp < 0 then
				fo.hp = 0
			else
				if self then
					play(hp1(fo.hp), "HPL", "HPLE", false, true)
				else
					play(hp0(fo.hp), "HPL", "HPLE", false, true)
				endif
			endif
			if fo.action <> ACT_HURT then
				fo.action = ACT_HURT
				anim(fo, ACT_HURT, not self)
			endif
		endif
	endif
	' Ticks.
	fm.elapsed = fm.elapsed + delta
	if fm.action_remain > 0 then
		fm.action_remain = fm.action_remain - delta
		return
	endif
	' Processes mirrored actions.
	if act = ACT_LEFT and fm.mirror then
		aact = ACT_RIGHT
	elseif act = ACT_RIGHT and fm.mirror then
		aact = ACT_LEFT
	else
		aact = act
		if act = ACT_KICK then
			sfx 5,1860,0.1
		elseif act = ACT_SHOOT then
			sfx 5,1860,0.1, 5,1060,0.1, 5,1860,0.1, 5,1060,0.1, 5,1860,0.1
		elseif act = ACT_JUMP then
			sfx 4096+2,660,0.1, 4,860,0.01
		endif
	endif
	' Plays proper animation.
	if fm.action <> aact then
		fm.action = aact
		anim(fm, aact, self)
	endif
	' Makes movement.
	d = 0
	if aact = ACT_LEFT then
		d = -1
		fm.dir = -1
	elseif aact = ACT_RIGHT then
		d = 1
		fm.dir = 1
	elseif aact = ACT_SHOOT then
		if fm.bullet_remain <= 0 then
			fm.bullet_remain = BULLET_LIFE
			fm.bdir = fm.dir
			fm.bx = fm.x + 16 + fm.dir * 20
			fm.by = fm.y - 16
		endif
	elseif aact = ACT_JUMP then
		if fm.jump_remain <= 0 then
			fm.jump_remain = JUMP_DURATION
		endif
	endif
	if d then
		fm.x = fm.x + fm.dir * delta * 50
		if fm.x < -12 then
			fm.x = -12
			if not self then
				if act = ACT_LEFT and not fm.mirror then
					fm.mirror = not fm.mirror
				elseif act = ACT_RIGHT and fm.mirror then
					fm.mirror = not fm.mirror
				endif
			endif
		elseif fm.x > 140 then
			fm.x = 140
			if not self then
				if act = ACT_RIGHT and not fm.mirror then
					fm.mirror = not fm.mirror
				elseif act = ACT_LEFT and fm.mirror then
					fm.mirror = not fm.mirror
				endif
			endif
		endif
	endif
enddef

' Battle stage.
def battle(delta)
	' Shows the scene.
	yard(delta, 0, 0)
	' Processes input.
	act = ACT_IDLE
	if btn(2) and f0.jump_remain <= 0 then ' Up.
		act = ACT_JUMP
	elseif btn(0) then ' Left.
		act = ACT_LEFT
	elseif btn(1) then ' Right.
		act = ACT_RIGHT
	endif
	if btnp(4) then ' A.
		act = ACT_KICK
	elseif btnp(5) then ' B.
		act = ACT_SHOOT
	endif
	' Controls own fighter, records actions.
	ctrl(f0, f1, delta, act, true)
	if act <> f0.last_action then
		rec = new(record)
		rec.action = act
		if len(recording) then
			rec.leadtime = f0.elapsed
		else
			rec.leadtime = 0.1
		endif
		push(recording, rec)
		f0.elapsed = 0
		f0.last_action = act
	endif
	' Controls opposite fighter, plays recorded actions.
	act = f1.last_action
	l = len(recorded)
	if l then
		rec = recorded(ppos)
		if f1.elapsed >= rec.leadtime then
			act = rec.action
			if act = ACT_LEFT or act = ACT_RIGHT then
				f1.last_action = act
			else
				f1.last_action = ACT_IDLE
			endif
			f1.elapsed = 0
			ppos = ppos + 1
			if ppos >= l then ppos = 0
		endif
	endif
	ctrl(f1, f0, delta, act, false)
	' Checks win or lose.
	if f1.hp = 0 and f1.action_remain <= 0 then
		t = 0
		anim(f0, ACT_WIN, true)
		stage = WIN
		play "<E8G8>DP", 1, 0, false
	elseif f0.hp = 0 and f0.action_remain <= 0 then
		t = 0
		anim(f1, ACT_WIN, false)
		stage = LOSE
		play "D8C8<GP", 1, 0, false
	endif
enddef

' Countdown stage, before battle.
def countdown(delta)
	' Plays SFX.
	if not sf then
		sf = true
		sfx 2,0,0.6, 2,440,0.4, 2,0,0.6, 2,440,0.4, 2,0,0.6, 2,440,0.4, 2,0,0.6, 2,523,0.4
	endif
	' Ticks.
	t = t + delta
	col BLACK
	if t >= 0.3 and t <= 1 then
		text 76, 30, 3
	elseif t >= 1.3 and t <= 2 then
		text 76, 30, 2
	elseif t >= 2.3 and t <= 3 then
		text 76, 30, 1
	elseif t > 3 and t <= 4 then
		text 56, 30, "Fight!"
	elseif t > 4 then
		sf = false
		stage = PLAYING
	endif
	' Shows the scene.
	yard(delta, 0, 0)
enddef

' Title stage.
def title(delta)
	' Runs once.
	if not ran then
		ran = true
		set_orderby(drv, "nil")
		f0.res.play("WIN1", "WIN1E", true, true)
		spr f0.res, -999, 0
		f1.res.play("WIN2", "WIN2E", true, true)
		spr f1.res, 999, 0
		play "T128  G8 >C8<G8 >C8 <C8G8>C8<G8 >C8  <C16G16>C16<G16 >C16<G16>C16<G16 >C16<G16>C16<G16 B16G16B16G16  >C16<G16>C16<G16 >C16<G16>C16<G16 >C16<G16>C16<G16 >C16<G16>C16<G16", 0, 0, true
	endif
	' Ticks.
	t = t + delta
	if not shown then
		d = t * 2
		if d > 1 then
			shown = true
			d = 1
		endif
		bx = -138
		ex = (160 - 138) / 2
		x = bx + (ex - bx) * d
	endif
	' Shows visuals.
	map battle_bg, 0, 0
	map battle_fg, 0, 0
	spr f0.res, 10, step_on(108)
	spr f1.res, 118, step_on(108)
	img title_txt, x, 10
	' Shows tips and accepts input.
	if shown then
		if t * 2 mod 2 then text 16, 110, "PRESS ANY BUTTON", BLACK
		if btnp() or keyp() then
			play "P", 0, 0, false
			ran = false
			shown = false
			f0.hp = 3
			set_orderby(drv, "map")
			setup()
			stage = READY
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
		elseif stage = READY then
			countdown(delta)
		elseif stage = PLAYING then
			battle(delta)
		elseif stage = WIN then
			nextlv(delta)
		elseif stage = LOSE or stage = OVER then
			gameover(delta)
		endif
	)
)
