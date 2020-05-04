
import UIKit
import CoreData


class FavoritesController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    
lazy var fetchedResultsController: NSFetchedResultsController<ArtistSaved> = {
let context = CoreDataManager.shared.persistentContainer.viewContext
let request: NSFetchRequest<ArtistSaved> = ArtistSaved.fetchRequest()
    request.sortDescriptors = [
NSSortDescriptor(key: "name", ascending: true)
]
    
let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: "name", cacheName: nil)
        
    frc.delegate = self
        do {
            try frc.performFetch()
        } catch let err {
            print(err)
        }
        
        return frc
    }()

 public let cellId = "cellId"
 fileprivate let favoritesLabel = UILabel()
 
    
override func viewDidLoad() {
        super.viewDidLoad()
    
 
    
    setupFavoritesLabel()
    setupViews()
    
    
}
    
fileprivate func setupFavoritesLabel() {
    
    view.addSubview(favoritesLabel)
    favoritesLabel.isHidden = false
    favoritesLabel.translatesAutoresizingMaskIntoConstraints = false
    favoritesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    favoritesLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    favoritesLabel.textAlignment = .center
    favoritesLabel.text = "You don't have any favorites yet"
    favoritesLabel.font = UIFont.boldSystemFont(ofSize: 18)
    favoritesLabel.textColor = .white
    
   
}
    


override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    
    
    if CoreDataManager.shared.fetchArtists().isEmpty {
        
    navigationItem.rightBarButtonItem?.isEnabled = false
    favoritesLabel.isHidden = false
    
    
    } else {

    favoritesLabel.isHidden = true
    navigationItem.rightBarButtonItem?.isEnabled = true
    }
   
    
}
    
    
@objc func handleRefresh() {
    
self.refreshControl?.endRefreshing()
  
}
    
@objc func deleteAllItems() {
        
let request: NSFetchRequest<ArtistSaved> = ArtistSaved.fetchRequest()
let context = CoreDataManager.shared.persistentContainer.viewContext
    
do {

let deletedObjects = try context.fetch(request)
deletedObjects.forEach { (object) in
context.delete(object)
    
let notName = Notification.Name(rawValue: "uploadData")
NotificationCenter.default.post(name: notName, object: nil)
navigationItem.rightBarButtonItem?.isEnabled = false
favoritesLabel.isHidden = false
}
} catch let delErr {
  print(delErr)
}
        
    do {
        
          try context.save()
        }catch let err {
            print(err)
        }
}
    
   
    
    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavoriteCell
    
let artistSaved = fetchedResultsController.object(at: indexPath)
cell.artistSaved = artistSaved
        
return cell
}
    
  
 
    
    
}











