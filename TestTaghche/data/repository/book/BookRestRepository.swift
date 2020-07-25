
import Foundation
import Alamofire

class BookRestRepository: BookRepositoryProtocol {
    func get(query: [URLQueryItem], onDone: ((RepositoryResponse<BookListResponse>) -> ())?) {
        let urlComponent = ApiHelper.instance.newUrlComponentsInstance(path: ApiHelper.BOOK_PATH)
        urlComponent.queryItems = query
        let filtersQueryDic = ["list":[["id":-169,"type":1],["type":13,"id":0]]]
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(filtersQueryDic) {
            if let jsonString = String(data: jsonData, encoding: . utf8) {
                let filterQuery = URLQueryItem(name: "filters", value: jsonString)
                urlComponent.queryItems?.append(filterQuery)
            }
        }
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = ApiHelper.GET_VERB
        ApiHelper.instance.alamofire
            .request(request).intercept().responseObject { (dataResponse:DataResponse<BookListResponse>) in
                if let error = dataResponse.error {
                    onDone?(RepositoryResponse(error:error))
                    return
                }
                onDone?(RepositoryResponse(value: dataResponse.value, restDataResponse: dataResponse))
            }
        
        
    }
    
    func get(onDone: ((RepositoryResponse<BookListResponse>) -> ())?) {
        
    }
}
