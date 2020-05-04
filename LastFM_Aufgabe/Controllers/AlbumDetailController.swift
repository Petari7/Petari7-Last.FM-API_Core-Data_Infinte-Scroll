

import UIKit
import AlamofireImage

class AlbumDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
let imageView = UIImageView()
let miniImageView = UIImageView()
let artistNameLabel = UILabel()
let listenersLabel = UILabel()
let playCountLabel = UILabel()
let infoLabel = UILabel()
let tagLabel = UILabel()
let separatorLine = UIView()
let artistInfoLabel = UILabel()
let publishedLabel = UILabel()


    
let addIntableView: UITableView = {
let tv = UITableView(frame: .zero)
return tv
}()
    


    
var viewModelArtist: ViewModelArtist? {
    
didSet {
    

   
infoLabel.text = viewModelArtist?.info
navigationItem.title = viewModelArtist?.name
artistNameLabel.text = viewModelArtist?.artistName
publishedLabel.text = "Published: \(viewModelArtist?.published ?? "")"
listenersLabel.attributedText = viewModelArtist?.listenersMutable
playCountLabel.attributedText = viewModelArtist?.playCountMutable
imageView.image = nil
guard let url = URL(string: viewModelArtist?.image ?? "") else { return }
miniImageView.af_setImage(withURL: url)
if viewModelArtist?.published.isEmpty ?? true {
publishedLabel.text = ""
}
 
}
        
    
    
}
    

    
lazy var tracksTwoDimensional = [
    Collapsed(isCollapsed: true, albums: self.viewModelArtist?.tracks ?? [Track]())
]
    
override func viewDidLoad() {
    super.viewDidLoad()
    
   

   
    
    view.backgroundColor = .white
    self.extendedLayoutIncludesOpaqueBars = true
   
    setupTopViews()
    setupTableView()
    addIntableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    
    
}
  
    
  

    
func setupTableView() {
    
if viewModelArtist?.tracks.isEmpty ?? true  {
    
return
} else {
    
    
view.addSubview(addIntableView)
addIntableView.setAnchors(top: publishedLabel.bottomAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, constantTop: 8, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: 0)
addIntableView.delegate = self
addIntableView.dataSource = self
addIntableView.tableFooterView = UIView()
}


}
let expandButton: UIButton = {
let btn = UIButton(type: .system)
btn.setImage(#imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysOriginal), for: .normal)
btn.addTarget(self, action: #selector(expandCell), for: .touchUpInside)
return btn
}()
    

@objc func expandCell() {
  
var indexPaths = [IndexPath]()
    
for row in tracksTwoDimensional[0].albums.indices {
let indexPath = IndexPath(row: row, section: 0)
indexPaths.append(indexPath)
}

let isCollapsed = tracksTwoDimensional[0].isCollapsed
tracksTwoDimensional[0].isCollapsed = !isCollapsed

    
let degrees: CGFloat = 180
let angle = degrees * .pi / 180
    
if isCollapsed {
    
addIntableView.deleteRows(at: indexPaths, with: .fade)
UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
    
self.expandButton.transform = CGAffineTransform(rotationAngle: angle)
    })
    
        
} else if !isCollapsed {

UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
    
    

self.expandButton.transform = .identity
})
    
addIntableView.insertRows(at: indexPaths, with: .fade)
}

  
    
    
}

    

}
