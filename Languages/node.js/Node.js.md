# Node.js

## 콘솔 환경에서의 입출력

- 콘솔 환경에서 `node` 커맨드는 `node <실행파일> <입력1> <입력2> .... <입력n>`으로 구성됨
- 위에서 전달받은 인자는 `process.argv`에 리스트 형태로 저장되어 있음
- `process.argv`는 기본적으로 2개의 값이 예약되어 있는데, 첫번째는 `node.exe`의 위치, 두번째는 `<실행파일>`의 위치 정보를 담고 있음:
  ```shell
  > node run.js arg1 test_val1 12345
  'console.log(process.argv)'
  
  [
    '/node-v14.16.0-win-x64/node.exe',
    '/node.js/web1/run.js',
    'arg1',
    'test_val1',
    '12345'
  ]
  ```

- 이때 입력 값은 문자열 형태로 저장됨

## QueryString 인식

- node.js를 활용한 웹서버의 기본 구조는 다음과 같으며, `http.createServer().listen(포트번호)` 의 포트번호로 접근할 수 있음:

  ```javascript
  var http = require('http');
  
  var app = http.createServer(function(request,response){
      response.end(`${내용}`);
  });
  
  app.listen(3000);
  ```

- 이때 `request` 안에는 다양한 정보들이 담겨 있는데, url 주소 정보 또한 여기에(`request.url`) 담겨 있음

- Query 정보도 `request.url`을 가공하여 사용 가능:

  ```javascript
  // localhost:3000/?id=html
  
  var app = http.createServer(function(request,response){
    var _url = request.url;
    var queryData = url.parse(_url, true).query;
    console.log(queryData.id);
  });
  // html
  
  var app = http.createServer(function(request,response){
    let _url = `${__dirname}${request.url}`;
    let _objUrl = new URL(_url);
    let _id = _objUrl.searchParams.get('id');
    console.log(_id)
  });
  //html
  ```

- 과거에는 `url.parse()`로 querystring을 정제하여 사용하였으나 현재는 deprecated되어 legacy로 사용되고 있고, 대신 `URL(주소).searchParams.get(쿼리)`로 원하는 값을 추출할 수 있음

## Javascript 에서의 string format()

- 파이썬에서 string format을 활용하는 방법은 `'this is {}'.format('값')` 처럼 사용할 수 있음

- Javascript에서는 string format이 조금 더 유연하게 작동되는 것처럼 보여짐:

  ```javascript
  var _tmp1 = 'this'
  var _tmp2 = 'string'
  
  console.log(`
  ${_tmp1}
  is
  ${_tmp2}
  format
  `)
  
  // this
  // is
  // string
  // format
  ```

- Javascript에서는 '(작은따옴표) 대신 '(~) 로 string을 감싸고, 중간중간 변수가 들어갈 자리를 `${변수}`로 대체하기만 하면 보이는 대로 출력이 됨

## 동기화와 비동기화 (콜백함수)

- Javasciprt에서 parameter가 함수인 콜백함수를 사용하는 이유는 **어플리케이션의 비동기 처리를 위해서 (리소스 활용을 위해서)** 필요

- Javascript의 API 중에는 유사한 기능을 수행하지만, 일반적인`<API>`와 `<API>Sync()`방식이 존재 하는 경우도 있음

- 이때 `<API>`는 비동기 처리를 하며 콜백함수를 가져가고, `<API>Sync()`는 동기 처리를 하며 일반적으로 결과 값을 반환함

- 아래 두개의 코드 처리 순서를 비교하면, 콜백함수를 사용하는 비동기화 처리 방식은 예상과는 다른 결과  값을 반환하기도 함:

  ```javascript
  // syntax/sample.txt에는 "B"라는 값만 있음
  var fs = require('fs');
  
  //readFileSync (동기화)
  console.log('A');
  var result = fs.readFileSync('syntax/sample.txt', 'utf8');
  console.log(result);
  console.log('C');
  // A
  // B
  // C
   
  //readFile (비동기화//콜백함수)
  console.log('A');
  fs.readFile('syntax/sample.txt', 'utf8', function(err, result){
      console.log(result);
  });
  console.log('C');
  // A
  // C
  // B
  ```

- Javasciprt는 기본적으로 비동기 처리를 권장하지만, 다루는 데이터 양이 많지 않은 경우는 동기화 방식을 고려해 보는 것도 나쁘지 않음

## 모듈화

- 기타 언어에서도 지원하는 것처럼, 특정 사용자 함수를 모듈화 하여 별도로 관리하는 것은 많은 양의 코딩에서 필수적인 조치임

- Javasciprt에서는 이를 모듈 파일에서 **export**하는 과정과, 실행파일에서 **require()**하는 과정을 통해 구현 가능

- 먼저 모듈 파일을 설정하는 방법은 다음과 같으며, 파이썬과는 다르게 제공할 기능을 정의해야만 함:

  ```javascript
  // sample.js
  
  const {PI} = Math; //3.1415926535 8979323846 2643383279...
  
  // 1. exports
  exports.area = (r) => PI * r * r;
  exports.circumference = (r) => 2 * PI * r;
  
  // 2. module.exports
  module.exports = function (r) {
    return {
      area() { return PI * r * r; },
      circumference() { return 2 * PI * r}
    };
  ```

  > - `exports` 메서드를 사용하는 경우는 모듈 파일에서 여러 기능들을 낱개로 제공할 때 유리
  > - `module.exports` 메서드를 사용하는 경우는 정리된 하나의 혹은 한 세트의 기능을 제공할 때 관리하기 용이함

- 실행파일에서 모듈을 호출하는 방식은 다음과 같음:

  ```javascript
  const circle = require('./sample.js');
  
  console.log(circle.area(4))
  // 50.26548245743669
  console.log(circle.circumference(4))
  // 25.132741228718345
  ```

참조. https://velog.io/@shin6403/NodeJs-requireexportsmodule.exports-Part.2

## PM2

- **PM2**는 node.js 앱을 관리하는 가장 대표적인 프로세스 매니저임

- PM2는 Javascript의 패키지 매니저는 NPM을 통해서 설치 및 관리를 할 수 있음

- (설치 후) 대표적인 사용 커맨드는 다음과 같음:

  ``` shell
  > pm2 start <httpServer 파일명.js> --watch
  # 서버를 구동시키고, 변경사항을 실시간으로 반영시킴
  
  > pm2 log
  # 각종 로그 및 console 출력 값을 실시간으로 확인할 수 있음
  ```

  

