

import UIKit


class SearchController: UICollectionViewController, UISearchBarDelegate, UISearchControllerDelegate, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating {
   
var searchController: UISearchController! = nil
fileprivate var timer: Timer?
let cellIdentifier = "cellId"
let footerId = "headerId"


var viewModels = [ModelView]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
setupCollectionView()
        
   
    
}

 

    
  func updateSearchResults(for searchController: UISearchController) {
    
    
    
    timer?.invalidate()
    timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false, block: {[weak self]  (timer)  in
    ApiService.shared.searchArtist(searchText: searchController.searchBar.text ?? "") { (artist) in
    self?.viewModels = artist.map({return ModelView(artist: $0)})
    self?.collectionView.reloadData()
    }

    
    })
}
    

    
override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    
let artist = viewModels[indexPath.item]
    
 
ApiService.shared.getArtistInfo(with: artist.name) { (artistInfo) in
DispatchQueue.main.async { [weak self] in
let controller = ArtistController()
controller.artistGetInfo = artistInfo
self?.present(controller, animated: true)
  
}

}}
    

    
    
}
