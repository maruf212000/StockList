//
//  UserHoldingService.swift
//  StockList
//
//  Created by Maruf Memon on 06/03/24.
//

import Foundation

class UserHoldingService {
    private enum Constants {
        static let userHoldingBaseUrl = "https://run.mocky.io/v3/"
    }
    
    let service: APIServiceProtocol
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func fetchHoldings(_ id: String, completion: @escaping (Result<Portfolio, APIError>) -> Void) {
        let url = URL(string: "\(Constants.userHoldingBaseUrl)\(id)")
        service.fetch(Portfolio.self, url: url) { result in
            switch result {
            case .success(let portfolio):
                completion(Result.success(portfolio))
            case .failure(let err):
                completion(Result.failure(err))
                print("error \(err.description)")
            }
        }
    }
}
