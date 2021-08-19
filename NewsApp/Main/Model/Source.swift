//
//  Source.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import Foundation

struct Source: Codable {
    let id: ID?
    let name: Name?
}

enum ID: String, Codable {
    case techcrunch = "techcrunch"
}

enum Name: String, Codable {
    case techCrunch = "TechCrunch"
}
