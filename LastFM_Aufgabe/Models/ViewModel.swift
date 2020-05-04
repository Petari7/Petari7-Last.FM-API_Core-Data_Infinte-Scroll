
import UIKit

protocol ModelViewDelegate {

func toModelView() -> ModelView
    
    
    
}



class ModelView {
    
let name: String
let listeners: String
let images: [Images]
    
init(artist: ArtistInfos) {
    
self.name = artist.name
self.listeners = artist.listeners
self.images = artist.image
    
}
}


protocol VieModelArtistProtocol {
 
    var info: String { get }
    var artistName: String { get }
    var name: String { get }
    var published: String { get }
    var listenersMutable: NSMutableAttributedString { get }
    var playCountMutable: NSMutableAttributedString { get }
    var image: String { get }
    var tracks: [Track] { get }
}


class ViewModelArtist: VieModelArtistProtocol {
    
    
 
    let info: String
    let artistName: String
    let name: String
    let published: String
    let listenersMutable: NSMutableAttributedString
    let playCountMutable: NSMutableAttributedString
    let image: String
    let tracks: [Track]
    
 
    init(albumInfo: AlbumInfo) {
        
    self.tracks = albumInfo.tracks?.track ?? [Track]()
    self.info = albumInfo.wiki?.summary ?? ""
    self.artistName = albumInfo.artist
    self.name = albumInfo.name
    self.published = albumInfo.wiki?.published ?? ""
        
    self.listenersMutable = NSMutableAttributedString(attributedString: NSAttributedString(string: "Listeners", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]))
        
    self.listenersMutable.append(NSAttributedString(string: "\n\(albumInfo.listeners.convertWithComma() )", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]))
        
    self.playCountMutable = NSMutableAttributedString(string: "Playcount", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        
    self.playCountMutable.append(NSAttributedString(string: "\n\(albumInfo.playcount.convertWithComma() )", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]))
        
    self.image = albumInfo.image[2].text
        
 
        
    }
    
}








