
import ObjectMapper
import Foundation
class BookListResponse: Mappable {
    
    var bookList: BookListNestedResponse!
    var noMoreData: Bool = false
    var title: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.bookList <- map["booksList"]
        self.noMoreData <- map["noMoreData"]
        self.title <- map["title"]
    }    
}
