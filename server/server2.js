//EXAMPLE server without any outside frameworks ie. "Express"

//Require modules
var http = require('http'); //heart of node, handles http requests and responses
var fs = require('fs'); //read and write to file system
var path = require('path'); // used to extract extension from url path

var server = http.createServer(function (request, response) {  //creating the server
    console.log('request ', request.url); //logs the requested url

    var filePath = './public' + request.url; // adds default path plus requested path
    if (filePath == './public/')
        filePath = './public/index.html'; //if path is left blank, returns homepage

    //The HTTP 'Content Type' header field must be correct to return css, image, and other static files
    //the following takes care of that
    var extname = String(path.extname(filePath)).toLowerCase(); //extract extension convert to lower case string
    var contentType = 'text/html'; //default contentType to be sent back
    var mimeTypes = { //maps extention to type
        '.html': 'text/html',
        '.js': 'text/javascript',
        '.css': 'text/css',
        '.json': 'application/json',
        '.png': 'image/png',
        '.jpg': 'image/jpg',
        '.gif': 'image/gif',
        '.wav': 'audio/wav',
        '.mp4': 'video/mp4',
        '.woff': 'application/font-woff',
        '.ttf': 'application/font-ttf',
        '.eot': 'application/vnd.ms-fontobject',
        '.otf': 'application/font-otf',
        '.svg': 'application/image/svg+xml'
    };

    contentType = mimeTypes[extname] || 'application/octet-stream'; //set contentType to corresponding value
    //Content Type is now defined based on request
    //Now we serve the file
    fs.readFile(filePath, function(error, content) { //invokes fs module to read file at filepath
        if (error) {                                 //calls funtion to throw errors or send content as a response
            if(error.code == 'ENOENT'){
                fs.readFile('./404.html', function(error, content) {
                    response.writeHead(200, { 'Content-Type': contentType });
                    response.end(content, 'utf-8');
                });
            }
            else {
                response.writeHead(500);
                response.end('Sorry, check with the site admin for error: '+error.code+' ..\n');
                response.end();
            }
        }
        else {
            response.writeHead(200, { 'Content-Type': contentType }); //here's where the contentType comes into play
            response.end(content, 'utf-8');
        }
    });

}).listen(8000); //activates server
console.log('Server running port 8000');

var io = require('socket.io')(server);
var newShotCount = 0;
//var myfile = fs.readFileSync('./shotStats.json', 'utf8');

io.on('connection', function(socket){
  console.log('a user connected');
  /*setInterval (function() {
    io.emit('count changed', newShotCount.toString());
    console.log(newShotCount.toString());
    newShotCount += 1;
  },4000);*/
  socket.on('count control', function(ctrl){
    switch (ctrl) {
      case "decr":
        newShotCount -= 1;
        io.emit('count changed', newShotCount.toString());
        console.log(newShotCount.toString());
        console.log('shot decreased');
        break;
      case "incr":
        newShotCount += 1;
        io.emit('count changed', newShotCount.toString());
        console.log(newShotCount.toString());
        console.log('shot increased');
        break;

    }
    //console.log('count was changed: ' + ctrl);
  });

/*  var shots = fs.watchFile('./shotStats.json', {interval:200}, (curr, prev) => {
    if (curr.mtime > prev.mtime) {
      var obj = JSON.parse(myfile);
      newShotCount = obj.shotCount;
      io.emit('count changed', newShotCount.toString());
      console.log('json file change');
    };
  }); */

});
