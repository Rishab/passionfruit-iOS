//
//  APIClient.swift
//  passionfruit
//
//  Created by Rishab Chawla on 3/12/19.
//  Copyright © 2019 Rishab Chawla. All rights reserved.
//

import Foundation


class APIClient {
    
    let urlString = "https://api.myjson.com/bins/1fllw2"
    
    static let sharedInstance: APIClient = APIClient()
    
    private init() {
        
    }
    
    func getUsers(completion: @escaping (FeedData) -> ()) {
        guard let url = URL(string: urlString)
            else { return }
        
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error)  in
            if let jsonData = data {
                let decoder = JSONDecoder()
                do {
                    let parsedData = try decoder.decode(FeedData.self, from: jsonData)
                    completion(parsedData)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

