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
    let website: URL
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
    let website: URL
    let images: [URL]
    var owner: Person
    var ranking: HotelRankink
    var haveSwimmingPool: Bool

    func book() {

    }
}

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
