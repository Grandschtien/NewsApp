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
    
    init() {
        status = nil
        totalResults = nil
        articles = nil
    }
}

