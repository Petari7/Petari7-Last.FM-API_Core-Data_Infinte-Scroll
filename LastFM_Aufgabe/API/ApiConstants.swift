import UIKit

struct ApiConstants {
   
static let discoUrl = "https://ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=disco&api_key=97e8cea6f85e3401e06c071dfc729909&format=json"
    
static let indieUrl = "https://ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=indie&api_key=97e8cea6f85e3401e06c071dfc729909&format=json"
    
static let rockUrl = "https://ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=rock&api_key=97e8cea6f85e3401e06c071dfc729909&format=json"
    

static let discoParams = ["tag": "indie", "api_key" : "97e8cea6f85e3401e06c071dfc729909"] as [String : Any]

static let indieParams = ["tag": "disco","api_key" : "97e8cea6f85e3401e06c071dfc729909"] as [String : Any]
    
static let rockParams = ["tag": "rock","api_key" : "97e8cea6f85e3401e06c071dfc729909"] as [String : Any]
    
    
    
    


    
    

    
    
}
