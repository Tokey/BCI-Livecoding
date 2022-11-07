b = 0.5
update = () => b += 0.003 * Math.sin(time)
shape(4,0.8,0.1)
  .repeat(35,19)
  .modulateScale(osc(4,0.5,1).kaleid(4).scale(1))
  .out(o0)
