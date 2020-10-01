import UIKit

var str = "Hello, playground"

let str2 = "Teste"

print(str)
print(str2)

var teste : String?

teste = "HOJE O DIA ESTA TRASH"

if let tst = teste{
    print("O valor de teste é", tst)
} else {
    print("Teste não tem valor")
}

var banana : Bool = true
var tomatoes = true
var apples = false

var isHappy = banana && tomatoes && apples

print(isHappy)
