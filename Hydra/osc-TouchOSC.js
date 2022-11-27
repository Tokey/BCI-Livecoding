msg.setPort(5000)
currentValue = 0.5
shapeV=4
b=0.5
msg.on('/fader1', (args) => {
  b=args[0]
})


shape(()=>shapeV,0.8,0.01)
  .color(1,1,0)
  .blend(shape(3,0.8,0.01).color(1,0,1).scale(0.3),0.5)
  .hue(()=> currentValue = Lerp(currentValue,b,0.01))
  .scale(()=>currentValue = Lerp(currentValue,b,0.01))
  .out(o0)


render(o0)


// [] array will

function Lerp (A,B,T){
  if(T=>0 && T<=1){
    return T*(B-A)+A
  }}
