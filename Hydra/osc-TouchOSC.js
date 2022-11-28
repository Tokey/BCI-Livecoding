msg.setPort(5000)
currentValue = 0.5
shapeV=4
b=0.5

s0.initImage("https://www.freepnglogos.com/uploads/heart-png/emoji-heart-33.png")


msg.on('/fader1', (args) => {
  b=args[0]
})


shape(()=>shapeV,0.8,0.01)
  .color(1,1,0)
//  .add(shape(20,0.8,0.01).color(1,0,1).scale(0.3).scroll(-1,1),0.5)
//  .add(shape(3,0.8,0.01).color(1,0,1).scale(0.3),0.8)
  .blend(src(s0).scale(1))
  .hue(()=> currentValue = Lerp(currentValue,b,0.01))
  .scale(()=>currentValue = Lerp(currentValue,b,0.01))
  .repeatX(9)
  .repeatY(5)
  .out(o0)


render(o0)


// [] array will

function Lerp (A,B,T){
  if(T=>0 && T<=1){
    return T*(B-A)+A
  }}
