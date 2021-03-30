// html 구성요소들에 대한 함수 정의
var template = {
    html: function(title, list, body){
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
    },

    list: function(fileList){
        let _tester = /[A-z]+\./   // 확장자 있는 파일 제외, data 폴더의 파일 리스트 반환
        let _subtitle = ''
        for(i=0;i<fileList.length;i++){
            if((!_tester.test(fileList[i])) && (fileList[i]!='Web')){
                _subtitle = _subtitle+ `<li><a href="/?id=${fileList[i]}">${fileList[i]}</a></li>` + '\n'
            }
        }
        return _subtitle
    }
}

module.exports = template;