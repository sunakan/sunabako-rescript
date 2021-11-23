switch NodeJS.Process.Env.port {
| Ok(port) => Js.log2("port is ", port)
| Error(a) => Js.log(a)
}
