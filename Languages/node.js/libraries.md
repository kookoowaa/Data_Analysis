# Libraries

> - **node.js**의 라이브러리는 `require()`를 통해서 호출 할 수 있으며, 이를 변수에 할당하여 사용:
>    ```javascript
>    var http = require('http');
>    http.createServer()
>    ```
>
> - 구체적인 사례는 [Reference](https://nodejs.org/dist/latest-v14.x/docs/api/documentation.html)에서 확인할 수 있음

## HTTP
### `http.createServer()`

- `.createServer()`는 node.js로 웹서버를 구축해 줌
- 일반적인 사용 방법은 다음과 같음:
    ```javascript
    var http = require('http');

    var app = http.createServer(function(request,response){
            response.end('contents');
        });

    app.listen(3000)
    ```
- 여기서 `app` 변수는 서버객체를 만들고 주기적으로 `request`를 받고 `response`를 전송하도록 설계됨
- `request`에는 요청한 url, 접속기기, 사용언어 등 다양한 정보가 담겨져 있음
- 위의 정보를 토대로 전달할 내용을 `response`객체에 담아서 전달
- 이 과정을`3000` 포트에서 진행하도록 `app.listen(3000)`명령을 전달

## fs (File system)
> - JS에서 시스템 파일 시스템을 컨트롤하는 라이브러리
### `fs.readFile()`
- `.readFile()`은 말 그대로 시스템의 파일을 읽는 라이브러리임
- 사용 방법은 다음과 같음:
    ```javascript
    var fs = require('fs');

    fs.readFile(<파일경로>, 'utf8', function(err, data){
        console.log(data)
    })
    ```
- 중간의 'utf8'은 옵션으로, 생략할 시 컴퓨터언어로 값을 반환
