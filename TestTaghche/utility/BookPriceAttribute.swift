

import Foundation
import UIKit

class BookPriceAttribute {
    static func cretePriceAttribute(book: Book) -> NSAttributedString {
        var attributeString: NSMutableAttributedString!
        if  book.beforeOffPrice > 0 {
            let priceText =  "\(book.beforeOffPrice.clean) تومان \n \("\(book.price.clean) تومان")"
            attributeString = NSMutableAttributedString(string: priceText)
            let beforeOfPriceStringRange = (priceText as NSString).range(of: "\(book.beforeOffPrice.clean) تومان")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: beforeOfPriceStringRange)
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor: R.color.discountPrice()!], range: beforeOfPriceStringRange)
            let priceStringRange = (priceText as NSString).range(of: "\(book.price.clean) تومان")
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor: R.color.price()!], range: priceStringRange)
            attributeString.addAttribute(.font, value: R.font.iranSansFaNumLight(size: 14)!, range: beforeOfPriceStringRange)
            attributeString.addAttribute(.font, value: R.font.iranSansFaNumBold(size: 14)!, range: priceStringRange)
        }
        else {
            let priceText =  "\("\(book.price.clean) تومان")"
            attributeString = NSMutableAttributedString(string: priceText)
            let priceStringRange = (priceText as NSString).range(of: "\(book.price.clean) تومان")
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor: R.color.price()], range: priceStringRange)
            attributeString.addAttribute(.font, value: R.font.iranSansFaNumBold(size: 14)!, range: priceStringRange)
        }
        
        return attributeString
    }
}

extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
