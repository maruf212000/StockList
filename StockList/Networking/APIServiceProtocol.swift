//
//  APIServiceProtocol.swift
//  StockList
//
//  Created by Maruf Memon on 06/03/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void)
}
