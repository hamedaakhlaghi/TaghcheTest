
import Foundation

class BookRepository: BookRepositoryProtocol {
   
    let restRepositopry = BookRestRepository()
    
    
    func get(query: [URLQueryItem], onDone: ((RepositoryResponse<BookListResponse>) -> ())?) {
        restRepositopry.get(query: query, onDone: onDone)
       }
       
       
    func get(onDone: ((RepositoryResponse<BookListResponse>) -> ())?) {
        restRepositopry.get(onDone: onDone)
    }
    
    
}
