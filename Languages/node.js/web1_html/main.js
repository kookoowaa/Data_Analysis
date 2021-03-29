var http = require('http');
var fs = require('fs');
var qs = require('querystring');
 
var app = http.createServer(  function(request,response){
  let _url = `${__dirname}${request.url}`;
  let _objUrl = new URL(_url);
  // URL()의 구성은 다음과 같음
  // URL {
  //   href: 'c:\\Users\\chpar10\\3D Objects\\Data_Analysis\\Languages\\node.js\\web1_html/?id=HTML',
  //   origin: 'null',
  //   protocol: 'c:',
  //   username: '',request.on('data', fuction(data){
      
    
  //   password: '',
  //   host: '',
  //   hostname: '',
  //   port: '',
  //   pathname: '\\Users\\chpar10\\3D Objects\\Data_Analysis\\Languages\\node.js\\web1_html/',
  //   search: '?id=HTML',
  //   searchParams: URLSearchParams { 'id' => 'HTML' },
  //   hash: ''
  // }
  let _path = _objUrl.pathname;
  // URL().pathname과 __dirname은 유사하나 일부 차이가 있음
  // .pathname은 리눅스처럼 path를 반환하며 "\Users\...." __dirname은 윈도우 path를 반환 "C:\Users\..."
  // localhost 환경에서의 차이일 수도 있음

  let _id = _objUrl.searchParams.get('id');
  if(request.url == '/'){
    _id = 'Web';
  }
  
  // html 구성요소들에 대한 함수 정의
  var templateHTML = function(title, list, body){
    return `
    <!doctype html>
    <html>
    <head>
      <title>WEB1 - ${title}</title>
      <meta charset="utf-8">
    </head>
    <body>
      <h1><a href="/">WEB</a></h1>
      <ul>
        ${list}
      </ul>
      <a href='/create'>Create</a>
      ${body}
    </body>
    </html>
    `;
  }

  var templateList = function(fileList){
    let _tester = /[A-z]+\./   // 확장자 있는 파일 제외, data 폴더의 파일 리스트 반환
    let _subtitle = ''
    for(i=0;i<fileList.length;i++){
      if((!_tester.test(fileList[i])) && (fileList[i]!='Web')){
        _subtitle = _subtitle+ `<li><a href="/?id=${fileList[i]}">${fileList[i]}</a></li>` + '\n'
      }
    }
    return _subtitle
  }


  
  var _tester = /web1_html\/$/;
  if (_tester.test(_path)){
    // 동적 subtitle 할당을 위해 중복으로 fs 사용
    // global 변수 변경을 어떻게 할지 고민해 보아야 할 듯
    fs.readdir(`${_path}/data`, function(err,_flist){
      var _subtitle = templateList(_flist)

      // request에서 요청받은 `id` 이름의 파일에서 contents 읽어오기
      fs.readFile(`${_path}/data/${_id}`, 'utf8', function(err,data){
        var _template = templateHTML(_id, _subtitle, 
          `<a href="/update/?id=${_id}">Update</a>
          <form action="delete_process" method="post">
            <input type="hidden" name="id" value="${_id}">
            <input type="submit" value="delete">
          </form>
          <h2>${_id}</h2>${data}`
          );
        response.end(_template);
      });
    });


  } else if (request.url==='/create') {
    // 데이터 생성용 웹페이지 추가
    
    fs.readdir(`${__dirname}/data`, function(err,_flist){
      var _subtitle = templateList(_flist)

      fs.readFile(`${__dirname}/data/web`, 'utf8', function(err,data){
        // Header를 "Web - create"로 수정하고, 글 목록은 유지
        // 그 외 아래 body에 내용 추가를 위한 <form> ui를 추가
        // <form>은 "Post" 방식으로 process_create에 데이터를 전달
        var _template = templateHTML('Web - create', _subtitle, `
        <form action="http://localhost:3000/process_create" method="post">
        <p><input type="text" name="title" placeholder="title"></p>
        <p>
          <textarea name="description" placeholder="description"></textarea>
        </p>
        <p>
          <input type="submit">
        </p>
      </form>
      `);
        
      response.end(_template);
      })
    })


  } else if (request.url ==='/process_create') {
    // /process_create로 데이터가 전달되어 왔을 때 처리
    // 전달되어온 데이터를 string으로 받은 후에 parse 처리
    // parse된 데이터로 신규 파일을 생성

    // var qs = require('querystring');
    var body = ''

    request.on('data', function(data){
      body = body + data;
    });

    request.on('end', function(){
      let post = qs.parse(body);
      let title = post.title;
      let desc = post.description
      fs.writeFile(`${__dirname}/data/${title}`, desc, 'utf8', function(err){
        response.writeHead(302, {Location: `/?id=${title}`});
        response.end()
      })
    });
  

  } else if (request.url === `/update/?id=${_id}`) {
    fs.readdir(`${__dirname}/data`, function(err,_flist){
      fs.readFile(`${__dirname}/data/${_id}`, 'utf8', function(err,data){
        var _template = templateHTML('Web - Update', templateList(_flist), `

        <form action="http://localhost:3000/process_create" method="post">
        <p>Update <b>${_id}</b></p>
        <input type="hidden" name="title" value=${_id}>
        <p>Description</p>
        <p>
          <textarea name="description">${data}</textarea>
        </p>
        <p>
          <input type="submit">
        </p>
      </form>
      `);
      response.end(_template);
      });
    });


  } else if (request.url === `/delete_process`) {
    var body = ''

    request.on('data', function(data){
      body = body + data;
      console.log(body)
    });

    request.on('end', function(){
      let post = qs.parse(body);
      let id = post.id;
      fs.unlink(`${__dirname}/data/${id}`, function(error){
        response.writeHead(302, {Location: '/'});
        response.end();
      })
    });

  } else {
    response.writeHead(404);
    response.end('Not found')
  }
  ;

});
app.listen(3000);