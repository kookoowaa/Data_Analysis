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