var http = require('http');
var fs = require('fs');
var url = require('url');
 
var app = http.createServer(function(request,response){
    let _url = `${request.headers.host}${request.url}`;
    let objUrl = new URL(_url);
    let _id = objUrl.searchParams.get('id');

    if(request.url == '/'){
      _id = 'Web';
    }
    if(request.url == '/favicon.ico'){
      return response.writeHead(404);
    }
    response.writeHead(200);
    fs.readFile(`d:/Git/Data_Analysis/Languages/node.js/web1_html/data/${_id}`, 'utf8', function(err,data){

      var template = `
      <!doctype html>
      <html>
      <head>
        <title>WEB1 - ${_id}</title>
        <meta charset="utf-8">
      </head>
      <body>
        <h1><a href="/">WEB</a></h1>
        <ul>
          <li><a href="/?id=HTML">HTML</a></li>
          <li><a href="/?id=CSS">CSS</a></li>
          <li><a href="/?id=JavaScript">JavaScript</a></li>
        </ul>
        <h2>${_id}</h2>
        ${data}
      </body>
      </html>
      `;
      response.end(template);
    })
 
});
app.listen(3000);