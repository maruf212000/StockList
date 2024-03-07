//
//  UserHoldingsViewModel.swift
//  StockList
//
//  Created by Maruf Memon on 06/03/24.
//

import Foundation

enum ViewState {
    case empty
    case loading
    case loaded
}

class UserHoldingsViewModel: ObservableObject {
    @Published var portfolio: Portfolio?
    @Published var viewState = ViewState.empty
    
    let userHoldingService: UserHoldingService
    
    init(userHoldingService: UserHoldingService = UserHoldingService()) {
        self.userHoldingService = userHoldingService
        loadResources()
    }

    func loadResources() {
        viewState = .loading
        fetchUserHoldings()
    }
    
    func fetchUserHoldings() {
        userHoldingService.fetchHoldings("bde7230e-bc91-43bc-901d-c79d008bddc8") { result in
            switch result {
            case .success(let portfolio):
                DispatchQueue.main.async {
                    self.portfolio = portfolio
                    self.viewState = .loaded
                }
            case .failure(let err):
                print("error \(err.description)")
            }
        }
    }
}
