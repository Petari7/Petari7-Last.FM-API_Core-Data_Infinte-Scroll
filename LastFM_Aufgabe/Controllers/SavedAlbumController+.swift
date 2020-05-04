

import UIKit

extension SavedAlbumController {
    
    
func loadData() {
    
    
    artistNameLabel.text = artistSaved.name
    let allAlbums = artistSaved.albums?.allObjects as? [AlbumSaved]
    
    allAlbums?.forEach({ (album) in
        
        publishedLabel.text = "Published: \(album.published ?? "")"
        
        if album.published?.isEmpty ?? true {
            publishedLabel.text = ""
        }
        
        let attributedText = listenersLabel.setAttributedMutable(string: "Listeners", textColor: nil, textAlignment: .center, atrributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        
        attributedText.appendAttributed(string: "\n\(album.listeners?.convertWithComma() ?? "")", atrributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        listenersLabel.attributedText = attributedText
        
        let playCountAttribute = playCountLabel.setAttributedMutable(string: "Playcount", textColor: nil, textAlignment: .center, atrributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        
        playCountAttribute.appendAttributed(string: "\n\(album.playcount?.convertWithComma() ?? "")", atrributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        playCountLabel.attributedText = playCountAttribute
        playCountLabel.attributedText = playCountAttribute
        
        guard let url = URL(string: album.image ?? "") else { return }
        miniImageView.af_setImage(withURL: url)
        
        
    })
    }
    
  
    
    
    
    
    
    
    
    
    
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    

