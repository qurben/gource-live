var http = require('http');

var app = http.createServer(function(request, response) {
    response.writeHead(200, {"Content-Type": "text/plain"});
    response.end("Hello, world");

    console.log(request.headers);
    console.log(request.method);
});

app.listen(3000);

console.log("Server running at http://localhost:3000");
