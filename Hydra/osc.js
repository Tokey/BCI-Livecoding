// to do: add more examples

// to try this example, run the processing sketch in the folder processing.
// clicking on the sketch window sends the mouse x and y position to hydra via osc
// set port to listen to osc messages. default port is 57101

msg.setPort(5000)

// do something when a message is received at address '/test'

// uses argument as variables in hydra
//accelerometer argument
xAcc = 1
yAcc = 0.2
zAcc = 1

//EEG
alpha = 0.5
beta = 0.5
state = 1

pixelateValue = 40

msg.on('/muse/acc', (args) => {
 xAcc=args[0]*5
 yAcc = args[1]
})
msg.on('/muse/elements/alpha_absolute', (args) => {
 alpha = args[0]
})

msg.on('/muse/elements/beta_absolute', (args) => {
 beta = args[0]
})

msg.on('/play', (args) => {
  rot += 10
})

pattern = () => osc(10,1)
.color(()=>xAcc,()=>yAcc,0.5)
.mult(osc().rotate(()=>rot))

pattern()
  .mult(pattern())
  .out(o0)

osc(20, 0.5, 9)
.kaleid(10)
.color(0, ()=>beta, 0).out(o1)
render(o0)
