//
//  NetworkSevice.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import Foundation

class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Data) ->()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Data else { throw NetworkError.noInternetConnection }
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
