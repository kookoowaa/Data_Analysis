var http = require('http');

 
var app = http.createServer(  function(request,response){
    console.log(request.url);
    response.end(`
    <!doctype html>
    <html>
    <img src="http://blogpfthumb.phinf.naver.net/20140903_237/atmyhome_1409737138722n69cD_JPEG/little+langdale+tarn.jpg?type=w161" width="100%">
    </html>
    `)

});

app.listen(5000);