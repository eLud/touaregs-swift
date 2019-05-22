import UIKit

// Constantes : Sécu et performances
let firstName = "Ludovic"

//Variables
var age = 32
age = 33

//Typage
//age = "34" // -> Cannot assign value of type 'String' to type 'Int'
//age = 32.75 // -> Cannot assign value of type 'Double' to type 'Int'

//Type annotation
var height: Float = 1
var initial: Character = "L"

let isTall: Bool
if height > 1.90 {
    isTall = true
} else {
    isTall = false
}


let a = 5
let b = 2
let c = a / b

//Fonctions

func sayHello() {
    print("Hello")
}
sayHello()

func say(_ something: String) {
    print(something)
}
say("Hello")

func say(_ something: String, to recipient: String) {
    print(something, recipient)
}
say("Hello", to: "Ludovic")

func say(something: String, to: Int) {
    print(something, to)
}
say(something: "Hello", to: 5)

func add(_ firstNumber: Int, to secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}

func add(_ firstNumber: Double, to secondNumber: Double) -> Double {
    return firstNumber + secondNumber
}

//Swift propose de la généricité
func add<X, Y, Z>(_ firstNumber: X, to secondNumber: Y, other: Z) -> String {
    return "firstNumber"
}

let resultat = add(5, to: 10)
let resultat2: Double = add(5, to: 10)

//Strings
let greetings = "Je m'appelle " + firstName + " et j'ai \(age) ans"
greetings.count

// Collections

var villes: [String] = ["Paris","Bordeaux","Lyon","Marseille"] // Array<String>
villes.append("Lille")
villes
//villes.removeAll()
//villes.remove(at: 0)
//villes.popLast()
//villes.removeLast()

let city = villes.first
villes.last

villes[2] = "Toulouse"
let city2 = Array(villes[2...4])
villes
let toulouseToulouse = Array(repeating: "Toulouse", count: 20)
print(Array(villes.sorted().reversed()))

//Dictionnaires
var nbHabitants: Dictionary<String, Int> = ["Paris" : 2250000, "Bordeaux" : 239000, "Lyon" : 491268, "Marseille" : 850636]

let habParis = nbHabitants["Paris"]
nbHabitants["Toulouse"] = 447340
nbHabitants["Toulouse"] = 447341
Array(nbHabitants.values).contains(447341)

//Boucles
for ville in villes {
    print(ville)
}

for _ in 0...100 {

}

for truc in nbHabitants {
    truc.key
    truc.value
}


// Structures & classes

struct Person {
    let firstName: String
    let lastName: String
    var age: Int

    func sayHello(firstName: String) {
        print("Hello, \(firstName) ! My name is \(self.firstName)")
    }
}

var me = Person(firstName: "Ludovic", lastName: "Ollagnier", age: 33)
me.age = 34
me.sayHello(firstName: "Machin")
//me.lastName = "sdfghj"

print(me.lastName)

class Animal {
    let name: String
    var age: Int

    convenience init(name: String) {
        self.init(name: name, age: 0)
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func move() {
        print("Je bouge")
    }

    func makeNoise() {}
}

class Dog: Animal {

    var owner: Person

    init(name: String, age: Int, owner: Person) {
        self.owner = owner
        super.init(name: name, age: 0)
    }
}

//référence
let myDog = Dog(name: "Médor", age: 0, owner: me)
let myDog2 = myDog
myDog.age = 2
print(myDog2.age)

//copie
let me2 = me
me.age = 25
print(me2.age)
