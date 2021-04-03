# 고급문법

## Lamda

```kotlin
val 람다이름: 변수타입 = {argumentList -> codeBody}

val square : (Int) -> (Int) = {number -> number*number}
// 타입추론이 가능하기 때문에 아래와 같은 코드도 위와 동일하게 작동
val square = {number: Int -> number*number}
```

- Lamda 함수는 value 처럼 다룰 수 있는 익명 함수이며 다음 두가지 장점을 갖음:

  1) 파라미터로 사용할 수 있음

  2) `return` 값으로 사용할 수 있음

```kotlin
val nameAge: (String, Int) -> String = {name, age ->
    "my name is ${name}, and I am ${age} years old"
}
```

- 복수의 파라미터를 입력값으로 받는 것도 가능하며, 이때는 입력과 출력의 변수 타입을 잘 정의 내려주면 됨 (혹은 잘 추론할 수 있도록)

## 확장함수

```kotlin
fun main(){
    val a = "Pablo said"
    println(a.saidWhat())
}

val saidWhat : String.() -> String = {
	this + " Pizza is great!"
}
```

- Javascript에서 클래스에 메서드를 추가하듯이, lamda 기법을 활용하여 클래스의 메서드를 확장하는 것도 가능

## 람다의 파라미터화

```kotlin
fun main(){

    val lamda:(Double) -> Boolean = {
        number: Double -> number === 1.0
    }

    println(invokeLamda(lamda))
    println(invokeLamda{it>3})
}


fun invokeLamda(_lamda: (Double) -> Boolean) : Boolean {
    return _lamda(5.234)
}
```

- `invokeLamda()`함수를 호출하되, 내부에서는 Double을 받아 Boolean을 출력하는 함수를 파라미터로 받음
- `lamda` 함수는 Double을 받아 1.0과 일치하는지 확인하는 함수이며, 이를 `invokeLamda()`에서 처리
- `invokeLamda()` 내부에 Boolean을 출력하는 다른 함수가 들어가도 정상 적으로 작동함

## 데이터 클래스

