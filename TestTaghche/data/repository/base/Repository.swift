
import Foundation

protocol Repository {
    
    associatedtype Model
    associatedtype Identifier
    
    func get(onDone: ((RepositoryResponse<Model>) -> ())?)
}
