v = 0.5
a=0.1
b=1
t=0
update = () => t+=0.01

//shape(4,0.8,0.1)
//  .repeat(20,19)
//  .modulateScale(osc(4,0.5,1).kaleid(4).scale(()=>v))
//  .out(o0)

shape(4,0.8,0.1)
  .scale(()=>Lerp(a,b,t))
  .out(o0)


function Lerp (A,B,T){
  if(T=>0 && T<=1){
    return T*(B-A)+A
  }
}
