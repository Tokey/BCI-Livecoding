// to do: add more examples

// to try this example, run the processing sketch in the folder processing.
// clicking on the sketch window sends the mouse x and y position to hydra via osc
// set port to listen to osc messages. default port is 57101

msg.setPort(5000)

// do something when a message is received at address '/test'
msg.on('/muse/acc', (args) => {
// log osc results to console
 log(args)
})

// uses argument as variables in hydra
freq = 1
rot = 0.2
vol3 = 1
alpha = 0.5
pixelateValue = 40
msg.on('/muse/acc', (args) => {
 freq=args[0]*5
 vol3 = args[1]
})
msg.on('/muse/eeg', (args) => {
 alpha = args[3]/args[4]
})

msg.on('/play', (args) => {

  rot += 10
})

pattern = () => osc(10,1)
.color(()=>freq,()=>vol3,0.5)
.mult(osc().rotate(()=>rot))

pattern()
  .mult(pattern())
  .out()
