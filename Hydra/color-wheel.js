bpm = 60

a=0
b=1

r1 = 1
g1 = 0
b1 = 0

r2 = 0
g2 = 0
b2 = 1

r3 = 1
g3 = 1
b3 = 0


scrollmax=0.4
t = 0.01

// update = () => t+=0.01
shape([3,4,5,4,3],1,0.1)
.color(r1,g1,b1)
.scale(0.3)
.rotate([30,60,90])
.blend((shape(50,1,0.1).scale([0.3,0.6]).color(r2,g2,b2).scrollX(()=>scrollmax*Math.sin(time))),0.5)
.repeatX(9)
.repeatY(6)
.out(o0)

shape([4,5,6,5,4].fast(1),0.4,0.01)
.color(r2,g2,b2)
.scale(0.8)
.scrollY(0.5)
.repeatX(6)
.repeatY(3)
.out(o1)

src(o0).blend(o1,[0.2,0.8]).mult(noise(0.1,0.1)).hue([0,0.4]).out(o2)

render(o2)
// [] array will

function Lerp (A,B,T){
  if(T=>0 && T<=1){
    return T*(B-A)+A
  }
}
