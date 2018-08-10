pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _draw()
	cls()
	
	print(time())
	print(time()*time()*time()*time())
	
	// le module pour 2 donne soit 0 soit 1
	// on affiche le sprite selon le temps donne
	spr(1 + (time())%2,60,60)

end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700088b88b00888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700008888880088b88b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000088888800888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700002220000888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000002220000022200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004040000040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
