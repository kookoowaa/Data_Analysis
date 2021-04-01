package com.example.kotline_practice

fun main(){
    stringFunction()
}

fun helloworld(): Unit {
    println("helloworld!!!!")
}

fun add(a: Int, b: Int): Int {
    return a + b
}

fun testVal(){
    val val1 = 10
    var val2 = 20

    println(val1)
    println(val2)

    var val3 : String = "welcome"
    println(val3)

    val2 = 400
    println(val2)
}

fun stringFunction(){
    val strFirstN = "PABLO"
    val strLastN = " Park"

    println("This is $strFirstN")
    println("This is ${strFirstN + strLastN}")
}