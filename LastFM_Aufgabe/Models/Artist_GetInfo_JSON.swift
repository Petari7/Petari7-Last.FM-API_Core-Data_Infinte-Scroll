

import Foundation

struct ArtistGetInfo: Decodable {
    
    
let artist: ArtistDescription?
    
    
    
    
}
struct ArtistDescription: Decodable {
    
    let name: String
    let image: [Images]
    let tags: Tags
    let stats: Stats
    let bio: Bio
    
}

struct Tags: Decodable {
    
    let tag: [Tag]
    
}

struct Tag: Decodable {
    
    let name: String
    let url: String
    
}

struct Stats: Decodable {
    let listeners: String
    let playcount: String
}

struct Bio: Decodable {
    
    let published: String
    let summary: String
    let content: String
    
}

