#!/bin/bash

curl --request GET    --write-out '\n' --header "Content-Type: application/json" http://localhost:3000/
curl --request POST   --write-out '\n' --header "Content-Type: application/json" http://localhost:3000/ping
curl --request POST   --write-out '\n' --header "Content-Type: application/json" http://localhost:3000/ping --data '{"name": "Alice"}'
curl --request GET    --write-out '\n' --header "Content-Type: application/json" http://localhost:3000/allRoute
curl --request DELETE --write-out '\n' --header "Content-Type: application/json" http://localhost:3000/allRoute
curl --request PATCH  --write-out '\n' --header "Content-Type: application/json" http://localhost:3000/allRoute
