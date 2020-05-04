

import UIKit
import JGProgressHUD

class AlbumsController: UICollectionViewController, UICollectionViewDelegateFlowLayout , AlbumCellDelegate {
    
   

let cellId = "cellId"
let footerId = "footerId"
    
public var allAlbums: [
   Album
] = []
    


fileprivate let progressAnimator = JGProgressHUD(style: .dark)
    
override func viewDidLoad() {
        super.viewDidLoad()
    

    progressAnimator.show(in: self.view, animated: true)
    collectionViewSetup()
    AlamofireAsync()
    handleNotification()
    
    
    navigationItem.largeTitleDisplayMode = .always
   
    
    }
    
    
    



fileprivate func handleNotification() {
    
let notName = Notification.Name("uploadData")
NotificationCenter.default.addObserver(self, selector: #selector(handleReload), name: notName, object: nil)
        
   
}
    
    
@objc func handleReload() {
    
collectionView.reloadData()
    
        
}
    
    

    
func collectionViewSetup() {
    
self.navigationController?.navigationBar.titleTextAttributes = [
    NSAttributedString.Key.foregroundColor: UIColor.white,
    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)
    ]
    navigationController?.navigationBar.isTranslucent = true


    
collectionView.backgroundColor = UIColor.white
navigationItem.title = "Overview"
collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: cellId)
collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)

   
    
}

    
 
    
func didTapOnCell(button: UIButton, cell: AlbumCell) {
    
    
let notificationName = Notification.Name("Badge")
NotificationCenter.default.post(name: notificationName, object: nil)
  
let cell = self.collectionView.indexPath(for: cell)
    

let selectedAlbum = allAlbums[cell!.item]

ApiService.shared.fetchAlbumInfo(artistName: selectedAlbum.artist.name, album: selectedAlbum.name) {  (albumInfo) in
        
CoreDataManager.shared.saveAlbumInfo(artistName: selectedAlbum.artist.name, albumName: selectedAlbum.name, image: albumInfo.image[1].text, listeners: albumInfo.listeners, playCount: albumInfo.playcount, published: albumInfo.wiki?.published ?? "", tracks: albumInfo.tracks?.track ?? [Track]())
    
}
 

}
    
    

    
    
    
var limit: Int = 8
fileprivate func AlamofireAsync() {
    

ApiService.shared.fetchAlbums(with: ApiConstants.discoUrl, withParams: ["tag": "disco", "limit" : limit, "api_key" : "97e8cea6f85e3401e06c071dfc729909"] as [String : Any] ) { [weak self] (album: [Album]) in
            
self?.allAlbums = album
self?.collectionView.reloadData()
self?.progressAnimator.dismiss(animated: true)
}
    
}
    
override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
let lastItem = allAlbums.count - 1
if lastItem == indexPath.item {
loadMoreData()
   
}}
    
override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter , withReuseIdentifier: footerId, for: indexPath) as! FooterView
    
return footer
    

}
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    
return CGSize(width: 80, height: 80)
    
}
    
fileprivate func loadMoreData() {
    

DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
    
self.AlamofireAsync()
self.limit += 4
self.collectionView.reloadData()
    
if self.limit > 50 {
return
    
}
}




    
}
    

}

class FooterView: UICollectionReusableView {
    
let spinner = UIActivityIndicatorView(style: .whiteLarge)


    
override init(frame: CGRect) {
    super.init(frame: frame)
    
spinner.color = .gray
spinner.startAnimating()
addSubview(spinner)
spinner.setAnchors(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: 0)
        
    
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    

