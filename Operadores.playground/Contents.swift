import UIKit

//Operadores lógicos [&&]
var boughtBanana = true
var boughtTomato = true
var boughtApple  = false
var isHappy = boughtApple && boughtBanana && boughtTomato

//Operador  ||
var likeMeat = true
var likeBeer = false
var canInviteBarbecue = likeBeer || likeMeat

//Operador negação
var knowSwift = false
var enrolSwiftCourse = !knowSwift

//Operador ternario
var grade = 7.98
var gradeResult = (grade >= 7.0) ? "Aprovado" : "Reprovado"

let number  = 11
var type = (11 % 2 == 0) ? "Par" : "Impar"
