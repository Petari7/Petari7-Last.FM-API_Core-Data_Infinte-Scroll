

import UIKit
import AlamofireImage
import Alamofire



class AlbumCell: UICollectionViewCell {
    
var delegate: AlbumCellDelegate?
    

var album: Album! {
    
didSet {
guard let url = URL(string: album.image[2].text ) else { return }
imageView.af_setImage(withURL: url)
albumNameLabel.text = album.name
}
}
    
    

    
fileprivate let imageView = UIImageView()
let favoriteButton = UIButton(type: .system)
fileprivate let albumNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    setupViews()
    setupGradientLayer()
        
 
        
        
    }
    
override func prepareForReuse() {
   
imageView.image = nil
}
    
    
    
@objc fileprivate func handleTapped(sender: UIButton) {
    
self.delegate?.didTapOnCell(button: sender, cell: self)
    
UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
    
self.favoriteButton.transform = CGAffineTransform(scaleX: 1.4, y: 1.7)
    
    }) { (true) in
UIView.animate(withDuration: 0.5, animations: {

self.favoriteButton.transform = .identity


})}
    
favoriteButton.setImage(#imageLiteral(resourceName: "heartFav"), for: .normal)
favoriteButton.isUserInteractionEnabled = false
        
}
    
fileprivate func setupGradientLayer() {
let gradientLayer = CAGradientLayer()
gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
gradientLayer.locations = [0.5, 1.1]
        
        
layer.addSublayer(gradientLayer)
}
    
required init?(coder aDecoder: NSCoder) {
  fatalError("init(coder:) has not been implemented")
}
    
    
    
func setupViews() {
    
addSubview(imageView)
addSubview(favoriteButton)
addSubview(albumNameLabel)
    
    
imageView.setAnchors(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, constantTop: 0, constantBottom: 38, constantLeft: 0, constantRight: 0, height: 0, width: 0)


favoriteButton.setAnchors(top: imageView.bottomAnchor, bottom: bottomAnchor, left: albumNameLabel.rightAnchor, right: rightAnchor, constantTop: 4, constantBottom: 4, constantLeft: 12, constantRight: 2, height: 34, width: 0)
    
albumNameLabel.setAnchors(top: imageView.bottomAnchor, bottom: bottomAnchor, left: leftAnchor , right: rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 4, constantRight: 48, height: 40, width: 0)

    
    
    
albumNameLabel.textAlignment = .left
albumNameLabel.numberOfLines = 0
albumNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
albumNameLabel.textColor = .gray
    
imageView.contentMode = .scaleToFill
layer.borderColor = UIColor.darkBlue.cgColor
    
  
favoriteButton.tintColor = UIColor.black
favoriteButton.setImage(#imageLiteral(resourceName: "add"), for: .normal)
favoriteButton.addTarget(self, action: #selector(handleTapped), for: .touchUpInside)
    
}
    
}
