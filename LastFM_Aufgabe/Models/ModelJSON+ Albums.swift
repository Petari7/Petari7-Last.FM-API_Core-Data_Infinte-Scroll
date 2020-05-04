

import Foundation

struct Results: Decodable {

let albums: TopAlbums

}
struct TopAlbums: Decodable {

let album: [Album]
}

struct Album: Decodable {

let name: String
let url: String
let artist: Artist
let image: [Images]

}

struct Artist: Decodable {
let name: String
let url: String

}
class Images: Decodable {

let sizeofImage: String
let text: String

private enum CodingKeys: String, CodingKey {
    case text = "#text"
    case sizeofImage = "size"
    }
}




