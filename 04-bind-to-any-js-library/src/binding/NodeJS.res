open Belt
module Process = {
  module Env: {
    type error
    let port: Result.t<int, error>
  } = {
    type error =
      | NotDefined(string)
      | FailedToInt(string)
    @val @scope(("process", "env")) external _port: Js.Nullable.t<string> = "PORT"
    let port = switch _port->Js.Nullable.toOption {
    | None => Result.Error(NotDefined("env PORT is not defined"))
    | Some(port) =>
      switch Int.fromString(port) {
      | None => Result.Error(FailedToInt(`Failed to conversion for env ${port} to int type`))
      | Some(port) => Result.Ok(port)
      }
    }
  }
}
