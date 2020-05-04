
import UIKit
import CoreData


extension AlbumsController {
    
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allAlbums.count
    }
    
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId , for: indexPath) as! AlbumCell
    
    cell.delegate = self
    let album = allAlbums[indexPath.item]
    cell.album = album
    
    
   let isFavorited = CoreDataManager.shared.fetchArtists().firstIndex(where: { $0.albumName == album.name }) != nil
    
    if isFavorited {
    cell.favoriteButton.isUserInteractionEnabled = false
    cell.favoriteButton.setImage(#imageLiteral(resourceName: "heartFav-1"), for: .normal)
    } else {
    cell.favoriteButton.setImage(#imageLiteral(resourceName: "favorites copy"), for: .normal)
    cell.favoriteButton.isUserInteractionEnabled = true
    
    }
   
        
    return cell
    }
    
override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

let selectedAlbum = allAlbums[indexPath.item]

ApiService.shared.fetchAlbumInfo(artistName: selectedAlbum.artist.name, album: selectedAlbum.name) { [weak self] (albumInfo) in

let detailController = AlbumDetailController()
    detailController.viewModelArtist = ViewModelArtist(albumInfo: albumInfo)

self?.navigationController?.pushViewController(detailController, animated: true)
    

}
    
        
}

    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (view.frame.width - 3)  / 2
        
        return CGSize(width: size, height: size + 28)
        
    }
    
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }

}
