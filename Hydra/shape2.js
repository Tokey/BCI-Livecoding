msg.setPort(5000)
shapeN=3
bdArr = [3,4]
hhArr = [7,6]
previousValue=3
key=1;

msg.on('/play', (args) => {
 if(args[0]=="bd"){
   if(shapeN == bdArr[0])
   shapeN = bdArr[1];
   else {
     shapeN = bdArr[0];
   }
 }
 if(args[0]=="hh"){
   if(shapeN == hhArr[0])
   shapeN = hhArr[1];
   else {
     shapeN = hhArr[0];
   }
 }
 if(args[0]=="superpiano"){
   key=2;
 }

})

shape(()=> previousValue = Lerp(previousValue,shapeN,0.2),0.4,0.01)
//.scale(0.8)
.color(1,1,0.3)
.hue(()=>previousValue/8)
.repeatX(4)
.repeatY(3)
.scrollY(0.1,0.1)
.modulate(osc(1,1,1))
.out(o0)

shape(4,0.5,0.01)
//.scale(0.8)
.scale(()=> key = Lerp(key,0,0.02))
.rotate(()=>Math.PI/2)
.color(1,1,0.3)
.hue(()=>previousValue/2)
.repeatX(4)
.repeatY(3)
.out(o1)

s0.initVideo("https://media.giphy.com/media/AS9LIFttYzkc0/giphy.mp4")
src(s0).modulate(noise(3)).out(o0)

src(o0).blend(src(o1),0.5).out(o2)

render(o2)


function Lerp (A,B,T){
  if(T=>0 && T<=1){
    return T*(B-A)+A
  }
}
