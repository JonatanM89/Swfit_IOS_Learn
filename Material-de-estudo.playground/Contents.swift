import UIKit
import Foundation

/***************************/
/* VARIAVEIS E CONSTANTES */
/***************************/
//Variáveis -> Permitem alterações
var nome = "Nome variável"
//Contantes -> Não permitem alterações
let nome_const = "Nome constante"

/*******************/
/*TIPOS**/
/*******************/

//Int, Float, Double, Character, String, Bool
//Bool
var isFirstTime: Bool = true
var isFirstTime2 = true

//Int -> Todos os tipos de inteiros
var temperature = 25
var newAge : Int = 29

//UInt -> aceita apenas valores positivos
var age: UInt = 39

//Float -> 32 bit de memória
var dolar : Float = 3.5

//Double -> 64 bit de memória, geralmente mais utilizada
let crazyNumber = 10000000.7800484444 // Quando vc não coloca o tipo, ele automaticamente seta para double para numeros

//Character
var gender: Character = "M"
var enter: Character = "\n" //Enter -> char especial

//String : Conjunto de caracteres
var newGender = "M" // Como não defini tipo ele vira String
var nomeComAspasDuplas = "\"Dra.\" Caroliny Einser " //Colocando aspas em um string
let firstName = "Carol"
let lastName = "Eisner"
let fullName = firstName + " " + lastName //Concatenado String
let fullName2 = "\(firstName) \(lastName)" //Interpolando String
let qtdLetras = fullName.count //Usa se o count para pegar a quantidade de strings

//Para escrever bloco de texto é possível usando 3 aspas duplas seguido de enter e
//fechando com enter + 3 aspas duplas, assim o bloco é mostrado conforme você escreve. Isso é muito bom
let escrevendoBlocoTexto = """
    Assim eu consigo escrever as coisas e já fazer quebra de
linha sem precisa o caracter especial
isso é muito bom mano!
"""

print(firstName.lowercased())
print(firstName.uppercased())

/*********************************/
//OPTIONALS
/*********************************/
//Em swift optionals são usados para tratar variáveis vazias, que não foram inicializadas,
//Em suma isso é um forma de previnir que você tente utilizar valores em varávies que ainda não foram
//inicializadas, nesse caso devemos trabalhar com optionals
let rg: Int = 1686877
var driverList: Int? //Optional -> inicializada com nil
driverList = 888700000
//Uma forma de contatenar
print("A minha licensa é:", driverList)
//Uma forma de desembrulhar optionals, porém é forma arriscada pois se não tiver valor nela, voce recebera um erro fatal
print("A minha licensa é:", driverList!)

//Forma segura de desembrular
if let driverList = driverList{
    print("A minha licença é:", driverList)
}

//Um exemplo pratico de uso. Vamos supor que seu sistema trabalhe com numeros de endereços de forma inteira, logo ao receber essa informação teremos que ter certeza de
//que teremos um intero
let adressNumber = Int("1000")
if let adressNumber = adressNumber{
    print(adressNumber)
}

//Nil coaliscin operator (operador de coalescencia nula)
let adressNumber2 = Int("255500A") ?? 0
print(adressNumber2)

//Implicit Unwrapped Optionals
var name : String! //Por padrão é nil, o swift não irá pertubar com let, porém cuidado, verificar se não é null
if name != nil{
    print(name)
}

/***************************/
//OPERADORES
/***************************/
//Operadores binários o Swift
// = -> operador de atribuição
let a = 20
var (name_2,age_2) = ("Erica", 31)

//Operadores aritimeticos
// + - * / %
var age_3 = 25 + 2

//Operadores compostos
// -= += /= %=
var prods = 20
var prodsBuy = 15
prods -= prodsBuy
print(prods)

//Operados de comparações, sempre retonando boolean, comparando string é CASE SENSITIVE
// > < >= <= == !=
let nota1 = 20
let nota2 = 89
let resultNota = nota1 > nota2 // returna true ou false

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


/**********************/
//COLEÇÕES
/**********************/
//Array
var names = ["Ana","Carol","Fernanda"]
var names_2 : [String] = ["Ana","Carol","Fernanda"]
var agesArr : [Int] = []
var agesArr_2: [Int]?
//Para retornar a quantidade de um array usa-se count ou isEmpty para saber se esta vazio ou não
//Para acessar um array usa-se nomeArray[2]
//Para modificar um array usa-se nomeArray[2] = "Teste"
//Para modificar um intervalo usa se assim nomeArray[0..2] que irá modificar de 0 a 2 colocando algo no lugar, podendo ser mais itens do que removidos
//Para retornar o primeiro vc pode usar o nomeArray.fist e para retornar o ultimo você pode usar o nomeArry.last
//Para add itens no array pode ser nomeArray += ["Leticia","Bia","Cassia"]
//Voce pode usar também o append, para adicionar apenas um, nomeArray.append("Clara")
//Você pode inserir em uma opção definida voce usa o nomeArray.insert("Claudia", at:2), lembrando que a posição deve existir.

//Modificando Array
names[2] = "Caroliny"
names[1...2] = ["Ana", "Carol", "Karina"]
names.first
names.last
names += ["Clara", "Luana"]
names.append("Lais")
names.insert("Pamela", at: 2)

//Remoção de itens
names.removeFirst()
names.removeLast()
names.remove(at: 2)
names.removeAll()

//Verifando se existe coisas no array
if names.contains("Carol"){
 print("Carol foi convidada")
}

//Dicionários
var states = [
    "MS" : "Mato Grosso do Sul",
    "SP" : "São Paulo",
    "MT" : "Mato Grosso"
]
var students : [String: Double] = [:]
states["GO"] = "Goias"
states["GO"] = "Goiás"
//Recuperando o valor antigo antes de ser atualizado
let oldGo = states.updateValue("Goiás", forKey: "GO") //Retorna um optional
let myState = states["MS"] // Retorna um optional
//Removendo
states["GO"] = nil
//Props
states.count
//Retornando um lista de chaves do dic.
let keys    = Array(states.keys)
let values  = Array(states.values)

//SET
//Coleção NÃO ORDENADA de objetos de mesmo tipo que não podem se repetir
var movies: Set<String> = [
    "Matrix",
    "De volta para o futuro"
]

var movies2 = Set<String>()
//Inserindo
movies.insert("Os Gatões")
//Set não deixa repetir, se eu inserir um item igual ele ira sobrescrever
let inserted = movies.insert("America Pie")
//Retorna o valor inserido e se foi ou não inserido
print(inserted.inserted, inserted.memberAfterInsert)
for movie in movies {
    print(movie)
}

movies.contains("Nome filme")
movies.union(movies2)
movies.subtract(movies2)

//TUPLAS
//Serva para agrupar multiplos tipo em coloeções
let address_sample = "Av. Paulista, 1578, São Paulo - SP, 79700-000"
let address_tupla  = ("Av.", "Paulista", "1578","São Paulo", "SP", "79700-00")
let address_tupla_tpyed: (type:String, name: String, number: Int, city: String, state: String, cep: String)  = ("Av.", "Paulista", 1578,"São Paulo", "SP", "79700-00")
print(address_tupla.2)
print(address_tupla.1)
print(address_tupla_tpyed.type)
//Separando em variáveis
let (type_, name_, number_, city_, state_, cep_) = address_tupla_tpyed

//Removendo
movies.removeFirst()
movies.remove("NOME FILME")
movies.removeAll()

/*****************/
//LAÇOS DE REPETIÇÕES
/*****************/
let students_ex = ["Jonatan", "Carol"]

for students in students_ex{
    print("O estudaten \(students) esta presente")
}

let meuNome = "Jonatan Medina"

for (index, letter) in meuNome.enumerated(){
    print(index, letter)
}

for letter in meuNome{
    print(letter)
}


/**********************/
//ORIENTAÇÃO A OBJETOS
/**********************/

/*********/
//Enum
/*********/
//Declara tipo pré definidos
enum FuelType{
    case gasoline, ethanol, diesel, flex
}

enum SeatPosition: String {
    case aisle = "Corredor", middle = "meio", window = "janela"
}
var passenger = SeatPosition.window
switch passenger {
case .aisle:
    print("O passageiro esta sentado na janela")
default:
    print("O passageiro esta na asa")
}
//Imprime o valor string definido no enun
print(passenger.rawValue)
//enum associate values
enum Measure {
    case weight(Double)
    case age(Int)
    case size(width:Double, height:Double)
}
let measuere : Measure = .age(39)
let sizes : Measure = .size(width: 1.75, height:80)


/*********/
//Structs
/*********/
//Em struct voce pode criar variaveis e funções dentro
//Em struct você pode criar variaveis optionals
struct Person2 {
    var name: String
    var age: Int
    
    //posso criar construtores mesmo tendo implicito pois ele sobrescreve o nativo
    /*init(name: String){
        self.name = name
    }*/
    
    func sayHello(){
        print("Olá")
    }
    
    //Quando uma função em struct muda o valor da variavel preciso utilizar a palavra mutatig na frente
    mutating func incAge(){
        age += 1
    }
}

//ele tem um constructor implicito
var person = Person2(name: "Eric", age: 39)
person.sayHello()
person.name = "João"

//Computeds Properties
struct Temp{
    var celsius : Double
    //computed
    var fahrenheint: Double{
        return celsius * 1.8 + 32
    }
}

var temp = Temp(celsius: 23)


/****************************/
//FUNÇÕES
/****************************/

/*func nomeFunc(parametro: Tipo) -> TipoRetorno{
    
}*/

//Simples
func sayYourName(){
    print("Hello")
}

func say(message:String){
    print(message)
}

//Função para não mostrar o nome do parametro ou com nome externo dif de nome interno
//Usando o underline eu omito o nome, ou seja quando chamar não preciso colocar o nome dele
func sum(_ a : Int, _ b : Int) -> Int{
    return a + b
}

//definindo o nome externo vc coloca antes do parametro o nome externo
func mult(_ number1: Int, by number2: Int) -> Int {
    return number1 * number2
}

//passa varios valores valores, como array usando o [...]
func sumVarios(_ initialValue: Int, with values: Int...) -> Int{
    var result = initialValue
    for value in values{
        result += value
    }
    
    return result
}

let studendData = "Erica Lima de Souza : 89"

//Retornado uma tuppla
func getStudentData(_ data : String) -> (name: String, age: Int){
    let info = data.components(separatedBy: ":")
    let studentName = info[0]
    let studentAge = Int(info[1])
    return (studentName, studentAge!)
}

func sumNew(_a : Int, _ b: Int) -> Int{
    return a + b
}

func subNew(_a : Int, _ b: Int) -> Int{
    return a - b
}

func multNew(_a : Int, _ b: Int) -> Int{
    return a * b
}

func divNew(_a : Int, _ b: Int) -> Int{
    return a / b
}

//Funcções que recebe funções
func applyOperation(_ a: Int, _ b :Int, operation: (Int, Int) -> Int) -> Int{
    return operation(a,b)
}

//Funções que recebe funções usando typealias

typealias op = (Int, Int) -> Int
func applyOperation2(_ a: Int, _ b :Int, operation: op) -> Int{
    return operation(a,b)
}
let result = applyOperation(10,20, operation: sum)

//retornando uma função
func getOperation (_ operation: String) -> op{
    switch  operation {
    case "soma":
        return sumNew
    case "subtração":
        return subNew
    case "multiplicação":
        return multNew
     default:
        return divNew
    }
}
let function = getOperation("soma")
function(10,20)


/*********************/
//Closures
/*********************/
//Funções anônimas
func calculate(_ a : Int, _ b : Int, operation : (Int, Int) -> Int ) -> Int{
    return operation(a, b)
}

calculate(10, 20, operation: {(a:Int, b:Int) -> Int in return a * b })
calculate(10, 20, operation: {a, b in return a * b })
calculate(10, 20, operation: {return $0 * $1})
calculate(10, 20, operation: {$0 * $1})
calculate(10, 20, operation: *)
calculate(10, 20) {$0 * $1}
//Protocolo serve para forças a classe a declarar os metodos
protocol ACCapable{
    var hasAC : Bool {get set}
    func turnAcc(on: Bool)
}


/********************************/
//TRATAMENTO DE ERROS
/********************************/
enum LoginError : Error{
    case wrongLogin
    case wrongPass
    case noInternetConnection
}


func login(userName: String, pass : String) throws -> Bool {
    
    if checkInternet() {
        if userName != "jonatan" {
            throw LoginError.wrongLogin
        }
        
        return true
    }
    else{
        throw LoginError.noInternetConnection
    }
    
}

func checkInternet() -> Bool {
    return false
}

do {
    let result = try login(userName: "jonatan", pass: "")
} catch {
    print(error)
}


//se der erro ele retorna nil assim
let loginResult = try? login(userName: "jonatan", pass: "123")


/***********************/
//CLASSES
/**********************/
class Vehicle{
    var brand : String
    var fuelType : FuelType
    
    init(brand : String, fuelType : FuelType) {
        self.brand = brand
        self.fuelType = fuelType
    }
}

//Declarando uma classe extendida de Vehicle e usando o protocolo ACCapable
class Car : Vehicle, ACCapable {
    var numberOfDoors : Int
    var hasAC: Bool = true
    
    //Implementando a func obrigatoria do protocolo ACCapable
    func turnAcc(on: Bool) {
        if on {
            print("Ar condicionado on")
        } else {
            print("Ar condicionado off")
        }
    }
        
    //Construtor
    init(brand: String, fuelType: FuelType, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(brand: <#T##String#>, fuelType: <#T##FuelType#>)
    }
}

//Classe Bike estendida de Vehicle
class Bike : Vehicle{
    var cc : Int
    init(brand:String, fuelType: FuelType, cc : Int) {
        self.cc = cc
        super.init(brand: <#T##String#>, fuelType: <#T##FuelType#>)
    }
}

//Classe AirPlane extendida de Vehicle e usando protocol ACCapable
class AirPlane: Vehicle, ACCapable{
    
    var numberOfEngines : Int
    
    var hasAC: Bool = true
    
    func turnAcc(on: Bool) {
        
        if numberOfEngines > 1 {
            if on {
                print("Avião, ar cc on")
            } else {
                print("Avião, ar cc off")
            }
        } else {
            print("Avião monomotor não podem ligar ar condicionados")
        }
        
        
    }
    
    init(brand: String, fuelType: FuelType, numberOfEngines : Int) {
        self.numberOfEngines = numberOfEngines
        super.init(brand: <#T##String#>, fuelType: <#T##FuelType#>)
    }
    
}

/************************/
///Classes e Structs
/************************/
struct Student {
    var name : String
    var age : Int
}

class Person {
    
    var name : String
    var age : Int
    
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
}

var student1 = Student(name: "Zeca", age:22)
var student2 = student1
//Structs, difernte de classes, quando atribuidas, elas geram uma cópia
//São Value Type
student1.name = "Alysson"
print(student2.name, student2.age)

//Classe fazem atribuições
//A passagem é feita por referencia, são Reference Type
var person1 = Person(name: "Zeca", age: 33)
var person2 = person1
person1.name = "Alysson"
print(person1.name)

var person3: Person? = Person(name: "Zeca", age: 33)
var person4: Person? = person2
person1.name = "Alysson"
print(person4!.name)


/*****************************/
/*SUBSCRIPT E GENERICS*******/
/****************************/

class Car2 {
    var licenscePlate : String
    subscript(index: Int) -> String {
        get{
            return String( Array(licenscePlate)[index] )
        }
        
        set{
            var array = Array(licenscePlate)
            array[index] = Character(newValue)
            self.licenscePlate = String(array)
        }
    }
    
    init(licensePlate : String) {
        self.licenscePlate = licensePlate
    }
    
    
}

let car = Car2(licensePlate: "QRV - 7870")

car[6] = "u"
print(car[6])

//Generics
func swapValues<T>(_ a : inout T, _ b: inout T){
    let tempA = a
    
    a = b
    b = tempA
}

var n1 = 10
var n2 = 20

swapValues(&n1, &n2)
print(n1)
print(n2)


var n3 = "TESte"
var n4 = "TESTE@"

swapValues(&n3, &n4)
print(n3)
print(n4)



///deinit -> Não é necessário que você implemente esse método, mas você pode usá-lo se precisar executar alguma ação ou limpeza antes de desalocar o objeto.










