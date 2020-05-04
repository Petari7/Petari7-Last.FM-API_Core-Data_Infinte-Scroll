
import UIKit
import CoreData


extension FavoritesController {
    
    
    
func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        @unknown default:
           print("Error")
    }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
            
        if let indexPath = indexPath
            {
                
        tableView.deleteRows(at: NSArray(object:indexPath) as! [NSIndexPath] as [IndexPath], with: UITableView.RowAnimation.fade)
                
            }
            
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        @unknown default:
            print("Error")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
   
    
func setupViews() {
        
    
    self.navigationController?.navigationBar.titleTextAttributes = [
    NSAttributedString.Key.foregroundColor: UIColor.white,
    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)
    ]
    navigationController?.navigationBar.isTranslucent = true

        
        tableView.tableFooterView = UIView()
        navigationItem.title = "Favorites"
        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "trash").withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(deleteAllItems))
        barButton.tintColor = .white
        navigationItem.rightBarButtonItem = barButton
        
        
        tableView.backgroundColor = UIColor.darkBlue
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: cellId)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refreshControl.tintColor = .white
        self.refreshControl = refreshControl
        
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let label = CustomLabel()
        label.text = fetchedResultsController.sectionIndexTitles[section]
        label.backgroundColor = UIColor.lightBlue
        return label
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
        return sectionName
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedResultsController.sections![section].numberOfObjects
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (row, indexPath) in
            
            let object = self.fetchedResultsController.object(at: indexPath as IndexPath)
            CoreDataManager.shared.persistentContainer.viewContext.delete(object)
            try! CoreDataManager.shared.persistentContainer.viewContext.save()
            
            
            let name = Notification.Name("uploadData")
            NotificationCenter.default.post(name: name, object: nil)
            
            
        }
        
        return [deleteAction]
        
        
        
        
        
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let albumDetailController = SavedAlbumController()
        albumDetailController.artistSaved = fetchedResultsController.object(at: indexPath)
        
        
        navigationController?.pushViewController(albumDetailController, animated: true)
        
        
    }

    
    
}
