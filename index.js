var express = require('express');

var app = express();

app.get('/', function(req, res){
      res.send('Hello from inside a container!');
});

app.get('/lol', function(req, res){
      res.send('OMG DOUBLE RAINBOW');
});

app.listen(8080);
