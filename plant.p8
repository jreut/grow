pico-8 cartridge // http://www.pico-8.com
version 16
__lua__


function resetpal()
	cols = {}
	for i = 0, 16 do
	 add(cols,i)
	end
	del(cols,3)
	del(cols,5)
	del(cols,11)
	
end


function _init()
	l_k = 1
	r_k = 2
 u_k = 3
	d_k = 4
 z_k = 5
	x_k = 6
	debug = {}
 
	resetpal()
	
	bg = 7
		cls(bg)
	activekeys ={}

	buttond =
	{
	 false,
	 false,
  false,
  false,
	 false
	}
	
	activelimbs = 0
	limbs = {}
	
	
	
	limb = makelimb(rnd(50)+50,100,-1,-1,0)

	add(limbs,limb)

end

musicstarted = false
function startmusic()
	if not musicstarted then
		music(0, 200)
		musicstarted = true
	end
end

function _update()

	getactivekeys()
	
	if activekeys[z_k] then
		startmusic()
		growalllimbs()
	end
	if activekeys[x_k] then
		bg = cols[ceil(rnd(#cols))]
		cls(bg)
		//resetpal()
		
		activelimbs =0
	end
	
	if activelimbs <=0 then
		
		limbs = {}
		
		limb = makelimb(rnd(128),rnd(100),rnd(2)-1,rnd(1)-2,0)

		add(limbs,limb)
	end
end


function _draw()

	drawalllimbs()
	draw_debug()
	
	rectfill(0,0,10,10,7)
	print(activelimbs,0,0,0)

end

function draw_debug()


	for i = 1, #debug do
	
		print(debug[i],10,10*i,0)
		
	end
//	debug = {}

end
-->8
function btnd(id) 
	if (btn(id)==false) then
		buttond[id] = false
	else
		if buttond[id] then
			return false
		else
		 buttond[id] = true
		 return true
		end
	end
end


function wait(a) for i = 1,a do flip() end end


function copy(o)
  local c
  if type(o) == 'table' then
    c = {}
    for k, v in pairs(o) do
      c[k] = copy(v)
    end
  else
    c = o
  end
  return c
end

-->8

function getactivekeys()
	activekeys[l_k] = btn(l_k-1)
	activekeys[r_k] = btn(r_k-1)
	activekeys[u_k] = btn(u_k-1)
	activekeys[d_k] = btn(d_k-1)
	activekeys[z_k] = btn(z_k-1)
	activekeys[x_k] = btn(x_k-1)
end
-->8




function drawalllimbs()
	for i = 1, #limbs do
		drawlimb(limbs[i])
		
	end

end


function drawlimb(l)
	line(l.x1,l.y1,l.x2,l.y2,l.col)
end


function makelimb(sx,sy,dx,dy,depth)

	local cols = {3,4,11}
	l = 
 	{
 			x1 = sx,
 			y1 = sy,
 			x2 = sx,
 			y2 = sy,
 	
 			dx = dx,
 			dy = dy,
 			
 			depth = depth,
			 col = cols[ceil(rnd(#cols))],
 			terminal = false

 			
 	}
 			activelimbs +=1
	return l

end

function growalllimbs()

	for i =1,#limbs do
	
		growlimb(limbs[i])
	end

end

function growlimb(l)
	if not l.terminal then
  if dist(l.x1,l.x2,l.y1,l.y2) >=(rnd(10)) then

  	//for j = 0, flr(rnd(3)) do 
  	l.terminal = true
  	activelimbs-=1
  	made = 0
  	while ( chance(made,l.depth)  ) do
  		t = makelimb(l.x2,l.y2,rnd(6)-3,rnd(5)-5,l.depth+1)
  		add(limbs,t)
  		made+=1
  	end
  
  else
  	l.x2 += l.dx
			l.y2 += l.dy
		end
 end


end

function chance(made,depth)
 
 local x = (5 - rnd(made))
 local y = 8-rnd(depth)

	return (x+y)>11
	
end 




function dist (x1,x2,y1,y2)
 return sqrt
 	(
 		((x2-x1)^2) 
 		+
 	 ((y2 - y1)^2)
 	) 	
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa0000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00aaa0000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaaa0a0000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0a00aa0000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaa0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0000000000000000
__sfx__
002000200e7140e7200e7200e7300e7300e7300e7400e74512714127201272012730127301273012740127450e7140e7200e7200e7300e7300e7300e7400e7451271412720127201273012730127301275012765
011000000e5301051013510155101a52013510125100e5301251015510175101a5101e5201a51017510125100e5301051013510155101a52013510125100e5301251015510175101a5101e5201a5101751012510
00100000157020070216202007020e0230c0020000200002000020000000000000000e023000000000000000157020070216202007020e0230c0020000200002000020000000000000000e023000001a0231a023
011010203f600366000000000000366250000000000000000e023000000000000000366250000000000000000e023000000000000000366250000000000000000e02300000000000000036625000000000000000
011010200e023366000000000000366250000000000000000e023000000000000000366250000000000000000e023000000000000000366250000000000000000e02300000000000000036625000000000000000
011000000e5351051513515155151a52513515125150e5351251515515175151a5151e5251a51517515125150e5351051513515155151a52513515125150e5351251515515175151a5151e5251a5151751512515
011000100e5321051213512155121a52213512125120e5321251215512175121a5121e5221a51217512125321050013500155001a50013500125000e5001250015500175001a5001e5001a500175001250012500
011000000e5351051513515155151a52513515125150e5351251515515175151a5151e5251a51517515125151a5221a5221a5221a5221a5221a5221a5221a5221a5221a5221a5221a5221a5221a5221a5221a525
011000000e5351051513515155151a52513515125150e5351251515515175151a5151e5251a51517515125150e5351051513515155151a52513515125150e5351251515515175151a5151e5251a5151751512515
__music__
01 00014344
00 00010244
00 00010244
00 00010344
00 00010444
00 00010444
00 05444344
00 06404344
00 01034344
00 01040044
00 01040044
00 08424344
00 07424344
02 3f424344
