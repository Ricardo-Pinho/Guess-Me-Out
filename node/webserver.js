/**
 * Node WebSocket Server
 * http://static.brandedcode.com/nws-docs/
 */

var ws = require("websocket-server");
var http = require('http');
var server = ws.createServer();

newGame = {
    'active':false,
    'player1':null,
    'player2':null
}


var games = [];
var players = [];
var host = "http://localhost:8080/get.json"

//var semaphore = 0; //TODO: actually use this
var sessionID = 0;


server.addListener("connection", connection);



function connection(client){
    client.addListener("message", function(msg){
        message(client, msg);
    });
}

function message(client, msg){
    msgJSON = JSON.parse(msg);
    client['playerID'] = msgJSON['id'];
    players[msgJSON['id']] = client;
    console.log("Connected: " + client['playerID']);

    http.get(host, function(res){
        res.setEncoding('utf8');
        res.on('data', function (chunk) {
            chkJSON = JSON.parse(chunk);
            if(chkJSON["status"]=="true"){
                // Found a partner
                g = newGame; // copies the template of a newGame
                g.player2 = client;
                g.player1 = players[chkJSON['playerID']];
                client.send("OK");
                console.log("Connected " + g.player1 + " to " + g.player2);
            } else {
                // Didn't find a partner yet (try again later!)
                client.send("Didn't find a partner.");
            }
        });
    });
}

server.addListener("close", function(client){
    console.log("Disconnected" + client);
});

server.listen(3800);