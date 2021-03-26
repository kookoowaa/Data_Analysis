var http = require('http');
var fs = require('fs');
 
var app = http.createServer(  function(request,response){
  let _url = `${__dirname}${request.url}`;
  let _objUrl = new URL(_url);
  // URL()의 구성은 다음과 같음
  // URL {
  //   href: 'c:\\Users\\chpar10\\3D Objects\\Data_Analysis\\Languages\\node.js\\web1_html/?id=HTML',
  //   origin: 'null',
  //   protocol: 'c:',
  //   username: '',
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
        var _template = templateHTML(_id, _subtitle, `<h2>${_id}</h2>${data}`);
        
        response.end(_template);
      });
    });
  };

});
app.listen(3000);