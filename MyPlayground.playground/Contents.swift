//Protocolos
enum FuelType{
    case gasoline, ethanol, diesel, flex
}

//Protocolo serve para forças a classe a declarar os metodos
protocol ACCapable{
    var hasAC : Bool {get set}
    func turnAcc(on: Bool)
}

class Vehicle{
    
    var brand : String
    var fuelType : FuelType
    
    init(brand : String, fuelType : FuelType) {
        self.brand = brand
        self.fuelType = fuelType
    }
}


class Car : Vehicle, ACCapable {
    var numberOfDoors : Int
    var hasAC: Bool = true
    
    func turnAcc(on: Bool) {
        if on {
            print("Ar condicionado on")
        } else {
            print("Ar condicionado off")
        }
    }
        
    init(brand: String, fuelType: FuelType, numberOfDoors: Int) {
        
        self.numberOfDoors = numberOfDoors
        super.init(brand: <#T##String#>, fuelType: <#T##FuelType#>)
        
    }
}

class Bike : Vehicle{
    var cc : Int
    init(brand:String, fuelType: FuelType, cc : Int) {
        self.cc = cc
        super.init(brand: <#T##String#>, fuelType: <#T##FuelType#>)
    }
}

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
