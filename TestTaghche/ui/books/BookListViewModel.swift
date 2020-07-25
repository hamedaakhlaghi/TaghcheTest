
import Foundation
import RxSwift
import RxCocoa

class BookListViewModel{
    
    var bookListResponse = BehaviorSubject<[Book]>(value:[])
    var dataError = PublishSubject<Error>()
    
    var noMoreData = false
    var isLoading = BehaviorSubject<Bool>(value: true)
    init() {
        
    }
}

extension BookListViewModel: BookListProtocol  {
    func getBooks(start:Int? = 0, size:Int? = 20, order: Int? = 5) {
        let bookRepository = BookRepository()
        let dataResponse: ((RepositoryResponse<BookListResponse>) -> ()) = { [weak self] restRepoResponse in
            self?.isLoading.onNext(false)
            if let error = restRepoResponse.error {
                self?.dataError.onNext(error)
            } else if let value = restRepoResponse.value{
                self?.noMoreData = value.noMoreData
                if let newBooks = value.bookList.bookList {
                    let presntedBook = try! self?.bookListResponse.value()
                    let books = presntedBook! + newBooks
                    self?.bookListResponse.onNext(books)
                }
            }
        }
        
        var queryItems: [URLQueryItem] = []
        let sizeQuery = URLQueryItem(name: "size", value: "\(size!)")
        queryItems.append(sizeQuery)
        let startQuery = URLQueryItem(name: "start", value: "\(start!)")
        queryItems.append(startQuery)
        let orderQuery = URLQueryItem(name: "order", value: "\(order!)")
        queryItems.append(orderQuery)
        bookRepository.get(query: queryItems, onDone: dataResponse)
    }
    
    func tableReceivedToLastCell() {
        let noOfPresentedBook = try? self.bookListResponse.value()
        if try! isLoading.value() == false, noMoreData == false {
            isLoading.onNext(true)
            getBooks(start: noOfPresentedBook?.count ?? 0, size: 20, order: 5)
        }
    }
}
