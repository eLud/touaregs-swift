import Foundation

struct Person {
    let firstName: String
    let lastName: String
}

struct Restaurant {
    let name: String
    let adress: String
    var nbTables: Int
    let phone: String
    var website: URL?
    let images: [URL]
    var owner: Person
    var type: Set<RestaurantType>

    func book() {

    }
}

enum RestaurantType: String {
    case italian = "Italien"
    case french
    case american
    case indian
    case japanese
    case chinese
    case fastFood
    case lebanese
    case vegan
}

enum HotelRankink: Int {
    case oneStar
    case twoStars
    case threeStars
    case fourStars
    case fiveStars
}

struct Hotel {
    let name: String
    let adress: String
    var nbRooms: Int
    let phone: String
    var website: URL?
    let images: [URL]
    var owner: Person
    var ranking: HotelRankink
    var haveSwimmingPool: Bool

    var restaurant: Restaurant?

    func book() -> Reservation? {

        //if roomIsAvailable
        // then return Resevation
        // else return nil

        return nil
    }
}
struct Reservation {}

let url = URL(string: "http://www.prod.monserver.com")!


//Optional<String>
// -> some<String>
// -> none


//Restos
    //nom
    //adresse
    //nbTables
    //tel
    //website
    //image
    //owner
    //types -> collection d'enum

    //book()
//Hotels
    //haveSwimmingPool
    //rankink -> enum
    //nom
    //adresse
    //nbRooms
    //tel
    //website
    //image
    //owner
    //restaurant?

    //book()


// Personnes

let capitales = ["France" : "Paris", "USA" : "Washington", "Canada" : "Ottawa"]

let capFrance: String? = capitales["France"]
if capFrance != nil {
    print(capFrance!)
} else {
    print("Je ne connais pas la capitale de ce pays")
}

//if let teste déballe et assigne
if let capIrlande = capitales["Irlande"] {
    print(capIrlande)
} else {
    print("Je ne connais pas la capitale de ce pays")
}


