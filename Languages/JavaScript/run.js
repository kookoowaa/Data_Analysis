var fs = require('fs');
var _file = ''
var _n = 1

fs.readFile('D:/Git/Data_Analysis/Languages/node.js/web1_html/1.html', 'utf8', (err, data) => {
    if (err) throw err;
    _file = data;
    console.log(_file);
}
)
