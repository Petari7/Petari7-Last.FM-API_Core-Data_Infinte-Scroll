
protocol ViewModel {

func toViewModel() -> ModelView
    
}


import Foundation

struct ArtistResults: Decodable {
    
let results: ArtistMatches

    
}

struct ArtistMatches: Decodable {

let artistmatches: ArtistInfo
    
    
}

struct ArtistInfo: Decodable {
    
let artist: [ArtistInfos]
  
}

struct ArtistInfos: Decodable {
    
let name: String
let listeners: String
let image: [Images]




    
    
}






