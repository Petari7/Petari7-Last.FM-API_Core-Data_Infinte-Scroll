


import UIKit
import CoreData

class CoreDataManager {

static let shared = CoreDataManager()
    

let persistentContainer: NSPersistentContainer = {
let container = NSPersistentContainer(name: "LastFM_Aufgabe")
container.loadPersistentStores(completionHandler: { (store, error) in
if let error = error {
  print(error)
}

})
return container
}()
    
func fetchArtists() -> [ArtistSaved] {
let context = persistentContainer.viewContext
        
let fetchRequest = NSFetchRequest<ArtistSaved>(entityName: "ArtistSaved")
    do {
let artists = try context.fetch(fetchRequest)
fetchRequest.includesSubentities = false
return artists

        
} catch let fetchErr {
print(fetchErr)
    return []
    }
    
}
    
    
func saveAlbumInfo(artistName: String, albumName: String, image: String, listeners: String, playCount: String, published: String, tracks: [Track]) {
    
let context = CoreDataManager.shared.persistentContainer.viewContext
    
let artist = NSEntityDescription.insertNewObject(forEntityName: "ArtistSaved", into: context) as! ArtistSaved
    
artist.setValue(artistName, forKey: "name")
artist.setValue(albumName, forKey: "albumName")
    
let albumSaved = NSEntityDescription.insertNewObject(forEntityName: "AlbumSaved", into: context) as! AlbumSaved
    

albumSaved.setValue(image, forKey: "image")
albumSaved.setValue(listeners, forKey: "listeners")
albumSaved.setValue(playCount, forKey: "playcount")
albumSaved.setValue(published, forKey: "published")
    
albumSaved.artist = artist
    
   
    
    

for (_, track) in tracks.enumerated()
    {
let trackSaved = NSEntityDescription.insertNewObject(forEntityName: "TracksSaved", into: context) as! TracksSaved
        
trackSaved.setValue(track.name, forKey: "name")
trackSaved.albumTracks = albumSaved
        
     
        
do {
    try context.save()
    } catch {
    print("Problem to save data...")
}
}
 
    do {
        try context.save()
    
    } catch let saveErr {
    print("Failed to save artists", saveErr)

}
    
}


    
    
    
    


    
    
    
    
    
    
    
    
    
    
}
