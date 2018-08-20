pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
p = {
 x=64,
 y=64,
 sprite=1
}

particles = {}
explosions = {}

// gestion des controles
function _update()

	if (btn(0)) p.x -= 1
	if (btn(1)) p.x += 1
	if (btn(2)) p.y -= 1
	if (btn(3)) p.y += 1
 if (btn(5)) make_particules(5)
 if (btnp(4)) make_explosion(p.x+4,p.y+4,6)
end

function make_explosion(x,y,nb)
	while (nb > 0) do
	
		explo = {}
		explo.x = x+(rnd(2)-1)*10
		explo.y = y+(rnd(2)-1)*10
		explo.r = 4 + rnd(4)
		explo.c = 10
		add(explosions,explo)
		nb -= 1
	
	end

end

// generateur de particuke
// saisie du nombre de particule
// generer par appel de fonction

// position
// couleur
// vitesse
// duree de vie (temps avant del)
// ajout de la particule au tableau
function make_particules(nb)
 while (nb > 0) do
 	part = {}
 	part.x = p.x
 	part.y = p.y
 	part.col = rnd(16)
 	part.dx = (rnd(2)-1)
 	part.dy = (rnd(2)-1)
 	part.f = 0
 	part.maxf = 30
 	add(particles,part)
 	nb =- 1
 end
end


// affichage des particules

// gestion du deplacement
function draw_particles()
	for part in all(particles)do
	 pset(part.x,part.y,part.col)
	 part.x += part.dx
	 part.y += part.dy
	 part.f += 1
	 if (part.f > part.maxf) then
	 	del(particles,part)
	 end
	end
end


function draw_explosions()
	for e in all(explosions) do
		circfill(e.x,e.y,e.r,e.c)
		e.r -= 1
		
		if (e.r < 5) e.c = 9
		if (e.r < 2) e.c = 4
		if (e.r <= 0) del(explosions,e)
		
	end

end

function _draw()
	cls()
	draw_particles()
	draw_explosions()
	spr(p.sprite,p.x,p.y)
	
	print("press ❎ for generate particules",0,0,7)
	print("press 🅾️ for generate explosions",0,8,7)
end

__gfx__
00000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000177771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700177110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
