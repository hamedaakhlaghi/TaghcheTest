
import Foundation
import UIKit
import Kingfisher
import Cosmos

class BookTableViewCell: UITableViewCell {
   
    @IBOutlet weak var cvBookRate: CosmosView!
    @IBOutlet weak var imageViewBook: UIImageView!
    @IBOutlet weak var labelBookTitle: UILabel!
    @IBOutlet weak var labelBookPrice: UILabel!
    @IBOutlet weak var labelWriter: UILabel!
    @IBOutlet weak var labelPublisher: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cvBookRate.isUserInteractionEnabled = false
        labelBookTitle.textColor = R.color.bookTitle()
        labelWriter.textColor = R.color.wirter()
        labelPublisher.textColor = R.color.publisher()
    }
    
    func setData(book: Book) {
        
        labelBookTitle.text = book.title
        let coverUrl = URL(string:book.coverUri)
        imageViewBook.kf.setImage(with: coverUrl)
        labelPublisher.text = book.publisher
        let authors = book.authors.map{
            "\($0.firstName) \($0.lastName)"
        }
        
        let joinedAuthors = authors.joined(separator: " | ")
        labelWriter.text = joinedAuthors
        cvBookRate.rating = book.rating
        labelBookPrice.attributedText = BookPriceAttribute.cretePriceAttribute(book: book)
    }
}
