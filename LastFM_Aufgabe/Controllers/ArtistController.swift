

import UIKit

class ArtistController: AlbumDetailController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    
var artistGetInfo: ArtistGetInfo? {
    
    didSet {

setupData()
}
    

}
    
 


    
    
let blurredEfect = UIBlurEffect(style: .regular)
var visualEffect: UIVisualEffectView!
let dismissButton = UIButton(type: .system)
let tagsLabel = UILabel()
var scrollView = UIScrollView()
let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
let cellId = "cellId"

    
var topAlbumsLimited = [Album]()


    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    visualEffect = UIVisualEffectView(effect: blurredEfect)
    setupViews()
    setupColectionView()
    alamofireFetch()
        
        
 
        

    
}
    
override var preferredStatusBarStyle: UIStatusBarStyle {
        
return .lightContent
   
}
    
fileprivate func alamofireFetch() {

ApiService.shared.getTopAlbums(with: artistNameLabel.text ?? "", limit: 4, completionHandler: { (album) in
        
self.topAlbumsLimited = album
self.collectionView.reloadData()
})
        
   
}
    
@objc func loadMoreAlbums() {
   
let topAlbumsController = TopAlbumsController(collectionViewLayout: UICollectionViewFlowLayout())
let controller = CustomNavController(rootViewController: topAlbumsController)
    
topAlbumsController.artistName = artistGetInfo?.artist?.name
    
self.present(controller, animated: true, completion: nil)
        
    
}
    
    
@objc func handleDismiss() {
        
dismiss(animated: true, completion: nil)
    

}
    

}
