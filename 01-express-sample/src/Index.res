let app = Express.expressCjs()
let router = Express.Router.make()

router->Express.Router.use((req, _res, next) => {
  Js.log(req)
  next()
})

router->Express.Router.useWithError((err, _req, res, _next) => {
  Js.Console.error(err)
  let _ = res->Express.status(500)->Express.endWithData("An error occured")
})

app->Express.useRouterWithPath("/someRoute", router)

app->Express.use(Express.jsonMiddleware())

app->Express.get("/", (_req, res) => {
  let _ = res->Express.status(200)->Express.json({"ok": true})
})

app->Express.post("/ping", (req, res) => {
  let body = req->Express.body
  let _ = switch body["name"]->Js.Nullable.toOption {
  | Some(name) => res->Express.status(200)->Express.json({"message": `Hello ${name}`})
  | None => res->Express.status(400)->Express.json({"error": `Missing name`})
  }
})

app->Express.all("/allRoute", (_req, res) => {
  res->Express.status(200)->Express.json({"ok": true})->ignore
})

app->Express.useWithError((err, _req, res, _next) => {
  Js.Console.error(err)
  let _ = res->Express.status(500)->Express.endWithData("An error occured")
})

let port = 3000
let _ = app->Express.listenWithCallback(port, _ => {
  Js.Console.log(`Listening on http://localhost:${port->Belt.Int.toString}`)
})
