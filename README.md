## json-grpc-server

Get a full fake GRPC API with zero coding in less than 30 seconds 🤡 

### ⭐️ Running as node app

```bash
# Install dependences
npm install

# Put your proto and json into `./data`
# See `./data/test.proto ` and `./data/test.json`

# Run
npm start
```

### ⭐️ Running via docker

```bash
docker pull devxiaolan/json-grpc-server
docker tag devxiaolan/json-grpc-server json-grpc-server:latest
```
Or build it yourself

```bash
docker build -t json-grpc-server:latest .
docker run -p 3001:3001 -v /your/proto/and/json_path:/app/data json-grpc-server
```

### 🤔 what json file looks like ?

The json file defines all information about the mock server.

Inside `$.mock` object will be defined all method names to a given service.

Here we define a mock to `Hello` method and the response object to it. Here the reponse object contains a `message` field with the value `Hello`.

```json
{
  "port": 3000,
  "mock": {
    "Hello": {
      "message": "Hello"
    }
  }
}
```

The above mock responds to the following proto service definition:

```proto
syntax="proto3";
 
package greeter;
 
service Greeter {
  rpc Hello (RequestGreet) returns (ResponseGreet) {}
}
 
message RequestGreet {
  string message = 1;
}
 
message ResponseGreet {
  string message = 1;
}
```

#### Suported data types

The system suports responses of types:
- string
- int
- float
- boolean
- object
- array of objects
- array of primitives

Todo:
- []bytes. The idea is add a cli to return do bytes representation of a given content to be added to mock json.