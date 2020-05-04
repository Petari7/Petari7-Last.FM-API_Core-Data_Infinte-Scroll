

import UIKit
class CustomLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.offsetBy(dx: 8, dy: 8))
    }
    
}
