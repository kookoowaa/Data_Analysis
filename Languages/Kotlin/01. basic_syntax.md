# KOTLIN

> - JVM에서 동작하는 프로그래밍 언어로 안드로이드 앱 개발 선호 언어로 유명세를 얻게 됨
> - JAVA, Android와 100% 호환되는 구조임

## 기본 구조

```kotlin
//sample.kt

fun main(){
    val strTmp = tmpInput()
    println(strTmp)
}

fun tmpInput(): String {
	return "KOTLIN"   
}
```

- 코틀린 실행파일의 기본 구조는 `main()` 함수를 실행시킴

```kotlin
fun add(a: Int, b: Int): Int {
    return a + b
}
```

- 변수 타입은 변수 선언 뒤쪽에 콜론과 함께 따라옴

```kotlin
fun testVal(){
    val val1 = 10
    var val2 : Int = 20

    println(val1)
    // 10
    println(val2)
    // 20

    //val1 = 30 재사용 불가
    
    var2 = 400
    println(val2)
    // 400
}
```

- `val`은 javascript의 `cont`와 동일한 기능을 수행하며, 한번 선언한 값의 갱신을 지원하지 않음
  `var`은 얼마든지 값을 갱신할 수 있으나, 변수 타입은 변경할 수 없음
- 변수 선언 시 변수 타입을 꼭 지정해 줄 필요는 없지만, `fun`의 `return`값이 있을 경우에는 필히 지정해 주어야 함

```kotlin
fun StringFormat(){
    val strFirstN = "PABLO"
    val strLastN = " Park"
    
    println("This is $strFirstN")
    //This is PABLO
    println("This is ${strFirstN + strLastN}")    
    //This is PABLO Park
}
```

- StringFormat은 $표시 사용을 원칙으로 하며, Javascript 처럼 `${변수명}`을 사용하여 수식을 가져갈 수도 있음

## If/Else와 When

```kotlin
fun greater(a: Int, b: Int): Int {
    if(a>b){
        return a
    }else{
        return b
    }
}

fun shortIF(a: Int, b: Int): Int = if(a>b) a else b
```

- Kotlin에서의 `if/else` 구문은 Javascript의 해당 구문 문법과 크게 다르지 않음 (변수 선언정도 차이)
- 짧은 형태의 `if/else` 구문은 아래 `shortIF()`처럼  `if(조건문) 참값 else 거짓값`으로 구현할 수도 있음

```kotlin
fun checkWhen(a: Int): String{
    when(a){
        0 -> return "this is 0"
        1,2 -> return "this is 1,2"
        else -> return "greater than 2"
    }
}

fun declairWhen(a: String): Int{
    var outV: int = when(a){
        "일" -> 1
        "이" -> 2
        else -> 0
    }
    return outV
}

fun whenWithRange(score: Int): String{
    when(score){
        in 90..100 -> return "Genius"
        in 80..90 -> return "Not bad"
        else -> return "umm..."
    }
}

```

- `When` 문법은 위처럼(`checkWhen`) 사용되며, `when(값) {옵션 -> 결과}` 형태로 사용하게 됨
- 또한 중간처럼(`declairWhen`) 변수 선언 시 사용할 수 있다는 특징도 있음
- 아래처럼 (`whenWithRange`) 범위와 결합하여 (`in 범위시작..범위끝`)  활용하기에도 용이함

## Array와 List와 MutableList

- Array은 크기를 지정하여 할당하게 되며, MutableList의 경우 길이 수정이 가능
- Array는 인덱싱을 통해 값 수정이 가능하지만, List의 경우는 불가능
- List는 기본적으로 인터페이스의 성격을 갖고 있으며, 값을 인덱싱 할 수도 있지만 `.get()` 메소드를 사용

```kotlin
fun array(){
    val array = arrayOf(1,2,3)
    val list = listOf(1,2,3)

    array[0] = 4
    //list[0] = 4

    println(array[0])
    //4
    println(list.get(0))
    //1
    println(list[0])
    //1

    //array[3] = 5
    //추가는 불가능

    val arraylist = arrayListOf<Any>(1, "b", 3)
    println(arraylist[1])
    //b

    arraylist.add(4)
    println(arraylist[3])
    //4

    arraylist[1] = "c"
    println(arraylist)
    //[1,c,3,4]
}
```

## For와 While

```kotlin
fun forAndWhile(){
    val students = arrayListOf("Joyce", "Jame","Jenny", "Sam")

    for (name in students){
        println(name)
    }

    var sum = 0
    for (i in 1..10 step 2){
        sum += 1
        println(sum)
    }

    var index = 0
    while (index < 10){
        index ++
        println(index)
    }

    for ((index, name) in students.withIndex()){
        println("the student${index} is ${name}")
    }
}
```

- For/while의 경우 파이썬과 유사항 형태를 띔
- 특이점이라면, `List`에 `.withIndex()`메소드를 추가하여 파이썬의 `.enumerate()`와 비슷한 기능을 수행할 수 있음

## Nullable vs. nonNull

```kotlin
fun nullcheck(){
    var name :String = "joyce"
    var name2 :String? = null

    var toUpperCase = name.toUpperCase()
    var nullToUpperCase = name2?.toUpperCase()

    println(nullToUpperCase)
}
```

- 변수에 Null을 허용할 경우, 변수타입을 설정할 때 뒤에 물음표(?)만 붙이면 Null을 허용함
- 메서드 사용 시에도 `null`을 허용할 경우에는 변수 뒤에 물음표를 붙여서 메서드를 사용하면 됨

```kotlin
// ?:
fun nullcheck(){
    var name :String = "joyce"
    val lastName : String? = null
    val fullName = name + (lastName?: " without last name")

    println(fullName)
}
```

- `?:`는 Elvis operator라고도 불리는데, `null`일 경우 default 값을  지정하는 방법으로 사용됨

```kotlin
// !!
fun ignoreNulls(str: String?){
    val mNotNull = str!!
    val upper = mNotNull.toUpperCase()
}
```

- `!!`의 경우는 Null이 확실하게 아닌 경우에만 사용하며, 그렇게 권장되는 용법은 아님

```kotlin
// 변수?let{}
fun ignoreNulls(email: String?){
    var _email = email
    _email?.let{
        println("email is ${email}")
    }
}
```

- `변수?.let{}`의 경우는 변수가 `null`이 아닐 경우 `let{}` 람다함수를 수행하라고 명령

## CLASS

```kotlin
class 이름 {
    val 변수 ...
    fun 함수 ...
}

fun main(){
    val human = Human()
    human.eatCake()
    // Yum Cake
    println(human.name)
    // PABLO
}

class Human {
    val name = "PABLO"
    fun eatCake(){
        println("Yum Cake")
    }
}
```

- 위와 같은 양식이 기본적인 Class의 모습을 나타냄

```kotlin
class Human2 constructor(name: String?){
    val name = name
}

// 혹은 아래 코드도 동일하게 동작하며, contructor 내에서 정의내리는 것도 가능 (혹은 default 값)
class Human2 constructor(val name: String? = "PABLO"){
}

class Human2(val name: String? = "PABLO"){
}
```

- Class 초기화 떄 값을 전달받을 경우에는 `contructor(초기값)`를 사용함
- 이때 contructor 내에 default 값을 정의내릴 수 있음
- 혹은 constructor 구분은 생략할 수도 있음

```kotlin
class Human3 constructor(val name: String? = "PABLO"){
    init {
        println("this is ${name}")
    }
}
```

- Class 내에서 `init{}`은 class를 불러올 때 실행하는 기능을 정의 내릴 수 있음
- 이 때 `main()`에서 `Human3()`를 불러온다면 `this is PABLO`를 우선적으로 실행함

```kotlin
class Human4(val name: String? = "PABLO"){
    constructor(name: String, age: Int) : this(name){
        println("Hello new user ${name}, aged at ${age}")
    }
}
```

- `constructor()`는 class 내에서 정의할 수도 있음
- 이때 내부에서 정의내린 contructor는 secondary 성격을 갖게되며, `this()`를 통해 위임을 받음

## Class - 상속

```kotlin
class Korean: Human(){   
}

open class Human {
    val name = "PABLO"
    fun eatCake(){
        println("Yum Cake")
    }
}
```

- class의 상속은 `class <클래스명>: <상속할 클래스>{}`로 이루어짐
- 단 이때, 상속할 클래스는 선언할 당시에 `open class <상속할 클래스>`라고 명기를 해 두어야 함

```kotlin
class Korean: Human(){   
    override fun eatCake(){
        super.eatCake()
        // Yum Cake
        println("맛있어")
        // 맛있어
    }
}

open class Human {
    val name = "PABLO"
    open fun eatCake(){
        println("Yum Cake")
    }
}

```

- 상속 시 function을 override 할 경우에도 상위 class에서 function 앞에 `open`을 명기해야 함
- 이때 상위 class의 function을 사용하려면 `super.<function>()`으로 접근할 수는 있음

