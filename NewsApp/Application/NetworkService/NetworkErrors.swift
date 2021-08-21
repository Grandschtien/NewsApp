//
//  NetworkErrors.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import Foundation

enum NetworkError: Error {
    case failInternetError
    case invalidUrl
    case noInternetConnection
    case invalidJson
}
