var fs = require('fs')


//readFileSync
console.log('A')
var results = fs.readFileSync(`${__dirname}/sample.txt`, 'utf8')
console.log(results)
console.log('C')

console.log('=====')

//readFile
console.log('A')
fs.readFile(`${__dirname}/sample.txt`, 'utf8', function(err, data){
    console.log(data)
});
console.log('C')