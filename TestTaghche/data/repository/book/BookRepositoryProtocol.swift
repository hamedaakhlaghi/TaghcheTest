
import Foundation

protocol BookRepositoryProtocol: Repository where Model == BookListResponse, Identifier == Int {
    func get(query: [URLQueryItem], onDone: ((RepositoryResponse<BookListResponse>) -> ())?) 
}
