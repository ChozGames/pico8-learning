pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
// -- mini pong --
// made by choz ˇ

function _init()

 start = false
 b = {}
 raquette_init(56,100)

end

function _update()

	move_raquette()
	ball_generate()
	if(start) move_ball()
	if(start) bounce_raquette()

end

function _draw()

 cls()
	draw_raquette()
	if(start) draw_ball()

end
-->8
function raquette_init(x,y)

	r = {}
	r.x = x
 r.y = y
 r.w = 16
 r.h = 2
 r.dx = 0.5
 r.spd = 0.3
 r.spd_max = 2

end

// deplacement de la raquette
function move_raquette()
 
	if btn(0) then
		r.dx -= r.spd
	elseif btn(1) then
	 r.dx += r.spd
	else
	 if abs(r.dx) < 0.1 then
	  r.dx = 0
	 elseif r.dx < 0 then
	  r.dx += r.spd
	 else
	  r.dx -= r.spd
	 end
	end
	

	if abs(r.dx) > r.spd_max then
	 if r.dx < 0 then
	  r.dx = -r.spd_max
	 else
	  r.dx = r.spd_max
	 end
	end
	
	r.x += r.dx
	
end

function draw_raquette()

	rectfill(r.x,r.y,r.x+r.w,r.y+r.h)

end

function bounce_raquette()

 if b.x >= r.x and
  b.x <= r.x+r.w and
  b.y > r.y then
  
   b.ydir = -b.ydir
  
 end
 
end
-->8
function ball_generate()

 if btnp(5) and not start then
 
 	start = true
 	
 	b.x = 60
 	b.y = 60
 	b.w = 3
 	b.col = 7
 	b.xdir = 0
 	b.ydir = 1
 	
 end

end


function move_ball()

	b.x += b.xdir
	b.y += b.ydir
	
	bounceball()

end

function draw_ball()

	circfill(b.x, b.y, b.w, b.col)

end

function bounceball()
 -- left
 if b.x < b.w then
  b.xdir = -b.xdir
 end

 -- right
 if b.x > 128-b.w then
  b.xdir = -b.xdir
 end

 -- top
 if b.y < b.w then
  b.ydir = -b.ydir
 end

 
end
