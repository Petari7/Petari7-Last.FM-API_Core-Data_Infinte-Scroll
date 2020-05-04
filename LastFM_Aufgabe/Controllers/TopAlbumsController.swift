
import UIKit
import JGProgressHUD

class TopAlbumsController: UICollectionViewController, UICollectionViewDelegateFlowLayout, AlbumCellDelegate {
    
var artistName: String!
    
fileprivate let spinner = JGProgressHUD(style: .dark)
    
var topAlbums = [Album]()

 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        fetchAlbums()
        
        
        

}
    

    
func reloadRows() {
    
var indexPaths = [IndexPath]()
for row in topAlbums.indices {
let indexPathToReload = IndexPath(row: row, section: 0)
indexPaths.append(indexPathToReload)

}

collectionView.reloadItems(at: indexPaths)
    
    
}
    

    
        
        
        
        
   

    
fileprivate func fetchAlbums() {
    

spinner.textLabel.text = "Loading"
spinner.show(in: self.view)
   
ApiService.shared.getTopAlbums(with: artistName, limit: 50) { (album) in
    
self.spinner.dismiss(animated: true)
self.topAlbums = album
self.collectionView.reloadData()
        
        
}
}
        
        
fileprivate func setupViews() {
    
collectionView.register(TopAlbumCell.self, forCellWithReuseIdentifier: "cellid")
collectionView.backgroundColor = .white
navigationController?.navigationBar.prefersLargeTitles = false
navigationItem.title = "Top Albums"
let barButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "dismiss").withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(handleDismiss))
barButtonItem.tintColor = .white
navigationItem.rightBarButtonItem = barButtonItem
}
    
@objc func handleDismiss() {
self.dismiss(animated: true, completion: nil)
   
}
  
    
    
func didTapOnCell(button: UIButton, cell: AlbumCell) {
    
let cell = self.collectionView.indexPath(for: cell)
let selectedAlbum = topAlbums[cell!.item]
      
ApiService.shared.fetchAlbumInfo(artistName: selectedAlbum.artist.name, album: selectedAlbum.name) { (albumInfo) in
            
CoreDataManager.shared.saveAlbumInfo(artistName: selectedAlbum.artist.name, albumName: selectedAlbum.name, image: albumInfo.image[1].text, listeners: albumInfo.listeners, playCount: albumInfo.playcount, published: albumInfo.wiki?.published ?? "", tracks: albumInfo.tracks?.track ?? [Track]())
            
    }
        
        
}
    

    

override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topAlbums.count
    }
    
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! TopAlbumCell
        
        let album = topAlbums[indexPath.item]
        cell.album = topAlbums[indexPath.item]
        cell.delegate = self
        
        
let isFavorited = CoreDataManager.shared.fetchArtists().firstIndex(where: { $0.albumName == album.name }) != nil
        
if isFavorited {
            cell.favoriteButton.isUserInteractionEnabled = false
            cell.favoriteButton.setImage(#imageLiteral(resourceName: "heartFav-1"), for: .normal)
        } else {
            cell.favoriteButton.setImage(#imageLiteral(resourceName: "add"), for: .normal)
            cell.favoriteButton.isUserInteractionEnabled = true
            
        }

        
        
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    let size = (view.frame.width - 48) / 2
        
    return CGSize(width: size, height: size + 100)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    let selectedAlbum = topAlbums[indexPath.item]
        
    ApiService.shared.fetchAlbumInfo(artistName: selectedAlbum.artist.name, album: selectedAlbum.name) { (albumInfo) in
            
    let detailController = AlbumDetailController()
    detailController.viewModelArtist = ViewModelArtist(albumInfo: albumInfo)
            
    self.navigationController?.pushViewController(detailController, animated: true)
        
    }
    }
     
}
