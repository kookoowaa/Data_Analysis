var arr = new Array('seoul','new york','ladarkh','pusan', 'Tsukuba');

function getRandomValueFromArray(arr){
    var index = Math.floor(Math.random()*arr.length);
    result = arr[index]
    return result
}

console.log(getRandomValueFromArray(arr));