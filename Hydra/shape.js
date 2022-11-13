// licensed with CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// by Zach Krall
// http://zachkrall.online/
osc(10, 0.1, 300)
	.color(0.9, 0, 0.8)
	.diff(osc(45, 0.1, 100)
         .color(0.5,0,0.5)
		.rotate(0.18)
		.pixelate(12)
		.kaleid())
	.scale(()=>Math.abs(Math.sin(time))+0.5)
	.out()
