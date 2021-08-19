//
//  News.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import Foundation
struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    
    init?(dictionary: [String: AnyObject]) {
        guard let status = dictionary["status"] as? String,
              let totalResults = dictionary["totalResults"] as? Int,
              let articles = dictionary["articles"] as? [Article] else {
            return nil
        }
        print(articles)
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}

