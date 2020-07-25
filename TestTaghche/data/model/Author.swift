
import ObjectMapper
import Foundation
class Author: Mappable {
    var id = 0
    var firstName = ""
    var lastName = ""
    var type: Int = 1
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        type <- map["type"]
    }
    
}
