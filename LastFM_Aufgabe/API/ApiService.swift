
import Alamofire
import UIKit


class ApiService {
    
static let shared = ApiService()
    
    
    func alamofireFetch(completionHandler: @escaping (DataResponse<Data>) -> ()) {
    
Alamofire.request(ApiConstants.discoUrl, method: .get, parameters: ApiConstants.discoParams, encoding: URLEncoding.default, headers: nil).responseData { (responseData) in
completionHandler(responseData)
}
        }
    

    
    
    

    
func fetchAlbums(with url: String, withParams: [String: Any],  completionHandler: @escaping ([Album]) -> ()) {
    
Alamofire.request(url, method: .get, parameters: withParams, encoding: URLEncoding.default, headers: nil).responseData { (responseData) in
    

    
    if let err = responseData.error {
        print(err)
      }
            
    if responseData.response?.statusCode == 200 {
                
    print("Succesfully parsed")
        
    }

    guard let data = responseData.data else { return }
    
    do {
    let searchResult = try JSONDecoder().decode(Results.self, from: data)
        
    completionHandler(searchResult.albums.album)
        
        
    }
        
    catch let decodeEerr {
    print(decodeEerr)
                
            }
            
        }
        
    }
    
    
func fetchAlbumInfo(artistName: String, album: String,  completionHandler: @escaping (AlbumInfo) -> ()) {
    
let albumInfoParams = ["artist": artistName , "album": album, "api_key" : "0c3681cf107c0fb1733698660b07fcb1"]
    
let albumInfoUrl = "https://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=0c3681cf107c0fb1733698660b07fcb1&artist=\(artistName)&album=\(album)&format=json"
    
guard let url = albumInfoUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }

        
Alamofire.request(url, method: .get, parameters: albumInfoParams, encoding: URLEncoding.default, headers: nil).responseData { (responseData) in
            
            if let err = responseData.error {
                print(err)
            }
            
            if responseData.response?.statusCode == 200 {
                
                print("Succesfully parsed")
                
            }
            
            guard let data = responseData.data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(AlbumResult.self, from: data)
                
                completionHandler(searchResult.album)
                
                
            }
                
            catch let decodeEerr {
                print(decodeEerr)
                
            }
            
        }
        
    }

    


    
func searchArtist(searchText: String, completionHandler: @escaping ([ArtistInfos]) -> ()) {


let infoUrl = "https://ws.audioscrobbler.com/2.0/?method=artist.search&artist=\(searchText)&api_key=0c3681cf107c0fb1733698660b07fcb1&format=json"

let params = ["artist": searchText, "api_key" : "0c3681cf107c0fb1733698660b07fcb1" ]
    
guard let url = infoUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }

Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { (responseData) in

    if let err = responseData.error {
        print(err)
    }
    
   guard let data = responseData.data else { return }


    do {
    let searchResult = try JSONDecoder().decode(ArtistResults.self, from: data)

    completionHandler(searchResult.results.artistmatches.artist)
        
        print(url)


    }  catch let decodeEerr {
            print(decodeEerr)

    }





}
    
}
   
    
func getArtistInfo(with name: String, completionHandler: @escaping (ArtistGetInfo) -> ()) {
        
        
let infoUrl = "https://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=\(name)&api_key=0c3681cf107c0fb1733698660b07fcb1&format=json"
        
let params = ["artist": name, "api_key" : "0c3681cf107c0fb1733698660b07fcb1" ]
        
guard let url = infoUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
    
Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { (responseData) in
    
            if let err = responseData.error {
                print(err)
            }
            
            guard let data = responseData.data else { return }
            
            
            do {
                let searchResult = try JSONDecoder().decode(ArtistGetInfo.self, from: data)
                
                completionHandler(searchResult)
                
                print(url)
                
                
            }  catch let decodeEerr {
                print(decodeEerr)
                
            }
            
            
            
            
            
        }
        
    }

    
func getTopAlbums(with name: String, limit: Int, completionHandler: @escaping ([Album]) -> ()) {
    
    
    
    
let infoUrl = "https://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=\(name)&api_key=0c3681cf107c0fb1733698660b07fcb1&format=json"
        
let params = ["artist": name, "limit" : limit, "api_key" : "0c3681cf107c0fb1733698660b07fcb1" ] as [String : Any]
        
guard let url = infoUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { (responseData) in
            
            if let err = responseData.error {
                print(err)
            }
            
            guard let data = responseData.data else { return }
            
            
            do {
                let searchResult = try JSONDecoder().decode(GetTopAlbum.self, from: data)
                
                completionHandler(searchResult.topalbums.album)
                
                print(url)
                
                
            }  catch let decodeEerr {
                print(decodeEerr)
                
            }
            
            
            
            
            
        }
        
    }
    
    
   
    





}
