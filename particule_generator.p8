pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
p = {
 x=64,
 y=64,
 sprite=1
}

particles = {}

// gestion des controles
function _update()

	if (btn(0)) p.x -= 1
	if (btn(1)) p.x += 1
	if (btn(2)) p.y -= 1
	if (btn(3)) p.y += 1
 if (btn(5)) make_particules(5)
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
 	part.x = p.x+4
 	part.y = p.y+4
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

function _draw()
	cls()
	draw_particles()
	spr(p.sprite,p.x,p.y)
	
	print("press ❎ for generate particules",0,0,7)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000007117000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000007117000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
