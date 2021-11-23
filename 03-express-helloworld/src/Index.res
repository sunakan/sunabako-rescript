//------------------------------------------------------------------------------
// Hello world example
//
// see
// https://expressjs.com/en/starter/hello-world.html
//
//------------------------------------------------------------------------------
open Belt
let app = Express.expressCjs()

Express.get(app, "/", (_, res) => {
  // Express.send
  //   @send external send: (res, 'a) => res = "send"
  // Return res, because use `let xxx = Express.send`
  let _ = Express.send(res, "HelloWorld")
})

let port = 3000
let _ = Express.listenWithCallback(app, port, _ => {
  Js.log(`Example app listening at http://localhost:${port->Int.toString}`)
})
