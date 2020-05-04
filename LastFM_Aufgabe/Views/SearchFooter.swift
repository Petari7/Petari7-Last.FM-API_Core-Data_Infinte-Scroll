
import UIKit

class SearchFooter: UICollectionReusableView {
    
fileprivate let infoLabel = UILabel()

override init(frame: CGRect) {
    super.init(frame: frame)
  
    
    setupInfoLabel()
        
        
    }
    
    fileprivate func setupInfoLabel() {
        
    addSubview(infoLabel)
    infoLabel.setAnchors(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: 0 )
    
 let attributedText = infoLabel.setAttributedMutable(string: "Who is your favorite artist?", textColor: UIColor.darkBlue, textAlignment: .center, atrributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        
    infoLabel.attributedText = attributedText
        

     
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
