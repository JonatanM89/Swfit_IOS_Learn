import UIKit

var rg: Int = 34765
var driverLicense: Int? //Isso é um optional, vem com nil (null)

driverLicense = 787878787

//Para mostrar um optional vc pode precisa usar a exclamação, porém esse é um metodo arriscado pois a variavel pode estar null
print("A minha carteira de motorista é: ",driverLicense!)

//O método seguro para desembrulhar de forma segura é o Optinal binding
if let driverLicense = driverLicense{
    print("A minha carteira de motorista é: ",driverLicense)
}

//Exemplos de optionals
let adressNumber = Int("110A")
if let adressNumber = adressNumber{
    print("O seu número é ", adressNumber)
}

//Nil coaliscing operator (Operador de coalescencia nula)
let number = "7878"
//Caso o optinal seja null ele mostra o valor 0
let adressNumber2 = Int(number) ?? 0

print(adressNumber2)

//Impliscit Unwraped Optionals
var nome: String! // Isso significa que o sistema não vai encher o saco e vai deixar ser nil
nome = "Alice"
let nome2 = nome == nil ? "Sem nome" : nome
print(nome2)
