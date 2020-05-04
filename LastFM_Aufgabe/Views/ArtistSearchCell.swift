
import UIKit
import AlamofireImage

class ArtistSearchCell: UICollectionViewCell {
    
    
var viewModel: ModelView! {

didSet {
nameLabel.text = viewModel.name
listenersLabel.text = viewModel.listeners
guard let url = URL(string: viewModel.images[1].text ) else { return }
imageView.af_setImage(withURL: url)
        
}
    
}

    
fileprivate let imageView = UIImageView()
fileprivate let nameLabel = UILabel()
fileprivate let listenersLabel = UILabel()
fileprivate let separatorLine = UIView()

    
override init(frame: CGRect) {
    super.init(frame: frame)
    
setupViews()
    
}
    
override var isSelected: Bool {
  
    didSet {
        
backgroundColor = isSelected ? UIColor.lightGray : UIColor.white

 }
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
func setupViews() {
    
imageView.contentMode = .scaleAspectFill
imageView.layer.cornerRadius = 50
imageView.clipsToBounds = true
    
nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
nameLabel.textColor = UIColor.darkBlue
nameLabel.numberOfLines = 0
    
    
separatorLine.backgroundColor = .lightGray

    
addSubview(imageView)
addSubview(separatorLine)
addSubview(nameLabel)

imageView.setAnchors(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: nameLabel.leftAnchor, constantTop: 8, constantBottom: 8, constantLeft: 16, constantRight: 8, height: 100, width: 100)


separatorLine.setAnchors(top: nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0.5, width: 0)

nameLabel.setAnchors(top: nil, bottom: nil, left: imageView.rightAnchor, right: rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 50, width: 0)
nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
   
    
    
}
    
    

    
}
