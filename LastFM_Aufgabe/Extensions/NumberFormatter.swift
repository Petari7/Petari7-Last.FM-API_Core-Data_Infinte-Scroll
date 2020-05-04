
import UIKit

extension String {
    
func convertWithComma() -> String {
    
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let formattedNumber = numberFormatter.string(from: NSNumber(value:Int(self) ?? 0))
    
    return formattedNumber ?? ""
}
   
}
