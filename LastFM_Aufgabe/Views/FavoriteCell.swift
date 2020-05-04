
import UIKit
import AlamofireImage



class FavoriteCell: UITableViewCell {
    
var artistSaved: ArtistSaved? {
    
didSet {
let allAlbums =  artistSaved?.albums?.allObjects as? [AlbumSaved]
allAlbums?.forEach({ (album) in
    
albumName.text =  artistSaved?.albumName
guard let url = URL(string: album.image ?? "") else { return }
    
albumImageView.af_setImage(withURL: url )
    
})
    
}
}
    
fileprivate let albumImageView: UIImageView = {
let imageView = UIImageView()
imageView.contentMode = .scaleAspectFill
imageView.translatesAutoresizingMaskIntoConstraints = false
imageView.layer.cornerRadius = 20
imageView.clipsToBounds = true
imageView.layer.borderColor = UIColor.darkBlue.cgColor
imageView.layer.borderWidth = 1
return imageView
}()
    
fileprivate let albumName: UILabel = {
let label = UILabel()
label.font = UIFont.boldSystemFont(ofSize: 16)
label.textColor = .white
label.translatesAutoresizingMaskIntoConstraints = false
return label
}()
  
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        backgroundColor = UIColor.tealColor
        addSubview(albumImageView)
        
        albumImageView.setAnchors(top: nil, bottom: nil, left: leftAnchor, right: nil, constantTop: 0, constantBottom: 0, constantLeft: 16, constantRight: 0, height: 40, width: 40)
        albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        addSubview(albumName)
        albumName.setAnchors(top: topAnchor, bottom: bottomAnchor, left: albumImageView.rightAnchor, right: rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 8, constantRight: 0, height: 0, width: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
