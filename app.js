var express = require('express');
var app = express();
var listenPort = 3003;

// set the static files location /public/img will be /img for users
app.use(express.static(__dirname + '/public'));
app.set('views', './views');
app.set('view engine', 'ejs');

app.listen(listenPort);
app.get('/', function(req, res) {
  res.render('index');
});

console.log('Listen on the port', listenPort);
