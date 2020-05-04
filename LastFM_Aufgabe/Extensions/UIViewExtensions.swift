
import UIKit

extension UIView {
    
    
func setAnchors(top: NSLayoutYAxisAnchor? , bottom: NSLayoutYAxisAnchor? , left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor? , constantTop: CGFloat, constantBottom: CGFloat, constantLeft: CGFloat , constantRight: CGFloat , height: CGFloat , width: CGFloat ) {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
        topAnchor.constraint(equalTo: top, constant: constantTop).isActive = true
    }
    if let bottom = bottom {
        bottomAnchor.constraint(equalTo: bottom, constant: -constantBottom).isActive = true
        
    }
    if let left = left {
        leftAnchor.constraint(equalTo: left, constant: constantLeft).isActive = true
    }
    if let right = right {
        rightAnchor.constraint(equalTo: right, constant: -constantRight).isActive = true
        
    }
    if width != 0 {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        
    }
    if height != 0 {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    
}
    
func addGradient () {
let gradient = CAGradientLayer()
gradient.colors = [UIColor.black.cgColor, UIColor.cyan.cgColor]
gradient.locations =  [0.0, 1.0]
gradient.frame = self.bounds
gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
gradient.endPoint = CGPoint(x: 0, y: 0)
self.layer.insertSublayer(gradient, at: 0)
}
    

}


extension UILabel {
    
func setAttributedMutable(string: String, textColor: UIColor?, textAlignment: NSTextAlignment?, atrributes: [NSAttributedString.Key : Any]?) -> NSMutableAttributedString {
        
let attributedText = NSMutableAttributedString(string: string, attributes: atrributes)
        
    
self.textColor = textColor

self.textAlignment = textAlignment ?? .center
     
        
return attributedText

}
    
}

extension NSMutableAttributedString {
    
    
    func appendAttributed(string: String, atrributes: [NSAttributedString.Key : Any]?)  {
        
        let attributedText = NSAttributedString(string: string, attributes: atrributes)
        
        self.append(attributedText)
        
    }
    
    
}
