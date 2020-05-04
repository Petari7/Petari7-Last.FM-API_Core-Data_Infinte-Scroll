

import UIKit

extension SearchController {
    
func setupSearchController() {
        
        searchController = UISearchController(searchResultsController:  nil)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.becomeFirstResponder()
        navigationController?.navigationBar.prefersLargeTitles = false
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barStyle = .blackTranslucent
        navigationItem.titleView = searchController.searchBar
        searchController.searchBar.placeholder = "Search"
        self.definesPresentationContext = true
        
    }
    

func setupCollectionView() {
    
collectionView.backgroundColor = .white
collectionView.register(ArtistSearchCell.self, forCellWithReuseIdentifier: cellIdentifier)
collectionView.register(SearchFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
setupSearchController()
self.definesPresentationContext = true
    }
    
    
    
override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! SearchFooter
        
return footer
        
}
    
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
return viewModels.isEmpty && searchController.searchBar.text?.isEmpty == true ? CGSize(width: 150, height: 350) : CGSize(width: 0, height: 0
)
}
    
    
override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return viewModels.count
        
}
    
    
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ArtistSearchCell
cell.viewModel = viewModels[indexPath.item]

return cell
}
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width, height: 120)
        return size
}
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
}
    
  
    
}
