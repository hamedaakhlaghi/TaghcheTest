
import Foundation

protocol BookListProtocol {
    func getBooks(start:Int?, size:Int?, order: Int?)
    func tableReceivedToLastCell()
}
