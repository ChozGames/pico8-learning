pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
// comment creer des particules
// de fumee


// methode d'initialisation

// x et y position ou la particule
// va apparaitre

// col pour la couleur de la particule

// width taille de la particule

// witdh taille max particule

// t pour le temps initiale

// max_t pour definir quand
// detruire la particule

// dx et dy pour la vitesse

function make_smoke(x,y,init_size,col)
 
 local s = {}
 
 s.x=x
 s.y=y
 s.col=col
 s.width = init_size
 s.width_final = init_size + rnd(3)+1
 s.t=0
 s.max_t = 30+rnd(10)
 s.dx = rnd(.8)
 s.dy = rnd(2)
 s.ddy = .025
 add(smoke,s)
 
 return s
end


function move_smoke(sp)

 if (sp.t > sp.max_t) then
  del(smoke,sp)
 end
 
 if (sp.t > sp.max_t - 5) then
  sp.width = sp.width +  1
  sp.width = min(sp.width,sp.width_final)
 end
 
 sp.x = sp.x + sp.dx
 sp.y = sp.y + sp.dy
 sp.dy = sp.dy+ sp.ddy
 sp.t = sp.t + 1
 
end

function draw_smoke(s)
 //rectfill(s.x, s.y, s.x+2, s.y+2,s.col)
	circfill(s.x, s.y,s.width, s.col)
end


-->8
function _init()
 smoke = {}
 cursorx = 50
 cursory = 50
 color = 7
end

function _update ()

 foreach(smoke, move_smoke)
 if btn(0,0) then cursorx-=1 end
 if btn(1,0) then cursorx+=1 end
 if btn(2,0) then cursory-=1 end
 if btn(3,0) then cursory+=1 end
 if btn(4,0) then color = flr(rnd(16)) end
 
 cursorx = cursorx % 128
 cursory = cursory % 128
 
	make_smoke(cursorx,cursory,rnd(4),color)

end

function _draw()
 cls()
 foreach(smoke, draw_smoke)
 
 //print(cursorx)
 //print(cursory)
end
