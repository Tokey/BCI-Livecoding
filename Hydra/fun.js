msg.setPort(5000)
b=4
hh=2
msg.on('/play', (args) => {
  if(args[0]=="bd"){
    if(b==4)b=8
    else b=4
  }

  if(args[0]=="hh"){
    if(hh==2)hh=4
    else hh=2
  }
})

shape(()=>b,0.8,0.1)
  .mult(gradient(1))
  .repeat(()=>hh*18,19)
  .modulateScale(osc(4,0.5,1).kaleid(4).scale(1))
  .out(o0)
