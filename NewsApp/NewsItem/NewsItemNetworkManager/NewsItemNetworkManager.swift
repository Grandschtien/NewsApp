//
//  NewsItemNetworkManager.swift
//  NewsApp
//
//  Created by Егор Шкарин on 20.08.2021.
//

import Foundation
import UIKit
class NewsItemNetworkManager {
    
    static func dowloadImage(url: String, completion: @escaping (_ image: UIImage?)->()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
    
    static func getNewsItem(completion: @escaping (News)->()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=\(apiKey)") else {
            return
        }
        NetworkService.shared.getData(url: url) { json in
                let response = Decoder.shared.decode(data: json)
                completion(response)
        }
    }
}
