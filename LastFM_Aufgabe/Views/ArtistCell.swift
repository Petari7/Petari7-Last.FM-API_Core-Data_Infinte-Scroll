
import UIKit


class ArtistCell: UICollectionViewCell {
    
    
var album: Album! {
        
didSet {
prepareForReuse()
guard let url =  URL(string: album.image[2].text) else { return }
imageView.af_setImage(withURL: url)
}
}
    
    
    
fileprivate let imageView = UIImageView()
    
override func prepareForReuse() {
    
imageView.image = nil
    
}

    
    override init(frame: CGRect) {
    super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
fileprivate func setupImageView() {
    
addSubview(imageView)
imageView.contentMode = .scaleAspectFill
imageView.setAnchors(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: 0)
}
    
    
    
}

