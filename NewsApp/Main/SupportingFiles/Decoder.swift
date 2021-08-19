//
//  Decoder.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import Foundation

class Decoder {
    private init() {}
    static let shared = Decoder()
    func decode(data: Data) -> News {
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode(News.self, from: data) else {
            fatalError("Can't decode json")
        }
     
        return decoded
    }
}


