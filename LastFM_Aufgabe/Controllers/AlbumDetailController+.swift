

import UIKit


extension AlbumDetailController {
    
    
func setupTopViews() {
        
let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        
navigationItem.leftBarButtonItem = backButton

view.addSubview(imageView)
view.addSubview(miniImageView)
view.addSubview(artistNameLabel)
view.addSubview(publishedLabel)
view.addSubview(listenersLabel)
view.addSubview(playCountLabel)
   
      
publishedLabel.numberOfLines = 0
publishedLabel.font = UIFont.init(name: "Helvetica-BoldOblique" , size: 16)
publishedLabel.textAlignment = .center
    
imageView.backgroundColor = .black
    
miniImageView.backgroundColor = .white
miniImageView.layer.cornerRadius = 60
miniImageView.clipsToBounds = true
miniImageView.contentMode = .scaleAspectFill
    
artistNameLabel.numberOfLines = 0
artistNameLabel.font = UIFont.boldSystemFont(ofSize: 26)
artistNameLabel.textColor = .white
    
    
    
playCountLabel.numberOfLines = 0
listenersLabel.numberOfLines = 0
    
    
publishedLabel.setAnchors(top: miniImageView.bottomAnchor, bottom: nil, left: view.leftAnchor, right: nil, constantTop: 8, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: view.frame.width )
    
publishedLabel.sizeThatFits(CGSize(width: view.frame.width, height: 300))
    
imageView.setAnchors(top: view.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 320, width: view.frame.width)
    

miniImageView.setAnchors(top: imageView.bottomAnchor, bottom: nil, left: imageView.leftAnchor, right: nil, constantTop: -54, constantBottom: 0, constantLeft: 20, constantRight: 0, height: 120, width: 120)
        
        
artistNameLabel.setAnchors(top: nil, bottom: imageView.bottomAnchor, left: miniImageView.rightAnchor, right: imageView.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 8, constantRight: 0, height: 40, width: 0)
        
listenersLabel.setAnchors(top: imageView.bottomAnchor, bottom: nil, left: miniImageView.rightAnchor, right: playCountLabel.leftAnchor, constantTop: 0, constantBottom: 0, constantLeft: 8, constantRight: 0, height: 50, width: 0)
    
        
playCountLabel.setAnchors(top: imageView.bottomAnchor, bottom: nil, left: nil, right: view.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 40, constantRight: 16, height: 50, width: 0)
        
        
        
    }
    
func headerView() -> UIView? {
    
let header = HeaderLabel()
header.text = "Top Tracks"
    
let headerView = UIView()
headerView.addSubview(header)
headerView.addSubview(expandButton)
    
headerView.backgroundColor = .white
header.layer.borderWidth = 4
header.layer.borderColor = UIColor.lightGray.cgColor
    
header.setAnchors(top: headerView.topAnchor, bottom: headerView.bottomAnchor, left: headerView.leftAnchor, right: headerView.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 0, height: 0, width: 0)
expandButton.setAnchors(top: headerView.topAnchor, bottom: headerView.bottomAnchor, left: nil, right: headerView.rightAnchor, constantTop: 0, constantBottom: 0, constantLeft: 0, constantRight: 12, height: 30, width: 0)
    
return headerView
    
}
    



    
func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
if viewModelArtist?.tracks.isEmpty ?? true {
    
return nil
} else {
            
return headerView()
}
        
        
        
}
    
func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
return 50
        
}
    
func numberOfSections(in tableView: UITableView) -> Int {
        
return tracksTwoDimensional.count
}
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
if tracksTwoDimensional[section].isCollapsed {
            
return tracksTwoDimensional[section].albums.count
    
} else {

return 0
}
}
    
    
    
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
let track = tracksTwoDimensional[0].albums[indexPath.row] as! Track
cell.textLabel?.text = track.name
cell.accessoryView = UIImageView(image: #imageLiteral(resourceName: "note"))
return cell
        
}
    
    

    
    

}
