
import ObjectMapper
import Foundation

class Book: Mappable {
    var title = ""
    var price: Double = 0
    var coverUri = ""
    var publisher = ""
    var authors = [Author]()
    var rating: Double = 0.0
    var beforeOffPrice: Double = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        price <- map["price"]
        coverUri <- map["coverUri"]
        publisher <- map["publisher"]
        authors <- map["authors"]
        rating <- map["rating"]
        beforeOffPrice <- map["beforeOffPrice"]
    }
    
}
