//
//  MainNetworkService.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import Foundation
class MainNetworkService {
    private init() {}
    
    static func getNews(completion: @escaping (News)->()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=\(apiKey)") else {
            return
        }
        NetworkService.shared.getData(url: url) { json in
                let response = Decoder.shared.decode(data: json)
                completion(response)
        }
    }
}
