
import UIKit

class SavedAlbumController: AlbumDetailController {
    
public var artistSaved: ArtistSaved! {
        didSet {
            
loadData()
}
}
    
lazy var allTracks = self.artistSaved.albums?.allObjects as? [AlbumSaved]
   
    
override func viewDidLoad() {
        super.viewDidLoad()
        
setupTableView()
navigationItem.title = artistSaved.albumName
        
allTracks?.forEach({ (a) in
let allTracks = a.tracks?.allObjects
            
tracksTwoDimensional = [
Collapsed(isCollapsed: true, albums: allTracks!)
]
        
            
})
}
    
override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
if tracksTwoDimensional[0].albums.isEmpty {
return UIView()
} else {
    
return headerView()
}

        
}
    
    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
let track = tracksTwoDimensional[0].albums[indexPath.row] as! TracksSaved
cell.textLabel?.text = track.name
cell.accessoryView = UIImageView(image: #imageLiteral(resourceName: "note"))
        
return cell
        
}
    
override func setupTableView() {
        
if allTracks!.isEmpty == true {

return
    
} else {
    
view.addSubview(addIntableView)
addIntableView.setAnchors(top: publishedLabel.bottomAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, constantTop: 8, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: 0)
addIntableView.delegate = self
addIntableView.dataSource = self
addIntableView.tableFooterView = UIView()
}
        
}

    

    
}
