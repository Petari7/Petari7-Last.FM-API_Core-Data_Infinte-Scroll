
import Foundation

struct AlbumResult: Decodable {

let album: AlbumInfo
    
}

struct AlbumInfo: Decodable {
    
let name: String
let artist: String
let image: [Images]
let listeners: String
let playcount: String
var tracks: Tracks?
let wiki: Wiki?
    
    
}

struct Tracks: Decodable {

var track: [Track]?
    
}

struct Track: Decodable {

var name: String
let url: String
let artist: Artist

}

struct Wiki: Decodable {
    
let published: String?
let summary: String?
let content: String?
    
    
}
