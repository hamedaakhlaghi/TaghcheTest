
import ObjectMapper
import Foundation

class BookListNestedResponse: Mappable {
    
    
    var bookList: [Book]?
    var currentSpinnerPosition: Int = 0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.bookList <- map["booksList"]
        self.currentSpinnerPosition <- map["currentSpinnerPosition"]
    }
    
}
