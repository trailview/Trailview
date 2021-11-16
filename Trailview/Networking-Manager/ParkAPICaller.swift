//
//  ParkAPICaller.swift
//  Trailview
//
//  Created by Reid Strange on 11/12/21.
//

import Foundation
import AlamofireImage

enum getParksError:Error {
    case noDataAvailable
    case cannotProcessData
}

class ParksAPICall {
    var decodedParkList = [Park]()
    let resourceURL: URL
    let resourceURLString: String
    let API_KEY = "bKgVTk0gaN9OrJwdbDTp9AOoAOa0kvcaUUBUfXjC"
    
    init(stateCode:String) {
        
        let parksURLString = "https://developer.nps.gov/api/v1/parks?stateCode=\(stateCode)&api_key=\(API_KEY)"
        guard let parksURL = URL(string: parksURLString) else {fatalError()}
        
        resourceURL = parksURL
        resourceURLString = parksURLString
    }
    
    func getParks(completion: @escaping (ParksAPIResponse) -> ()) {
        if let url = URL(string: resourceURLString) {
            URLSession.shared.dataTask(with: url) { data, res, err in
                if let data = data {
                    
                    let decoder = JSONDecoder()
                    do {
                        let jsonAPIResponse: ParksAPIResponse = try! decoder.decode(ParksAPIResponse.self, from: data)
                        completion(jsonAPIResponse)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}
