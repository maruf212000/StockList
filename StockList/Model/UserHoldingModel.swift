//
//  UserHoldingModel.swift
//  StockList
//
//  Created by Maruf Memon on 06/03/24.
//

import Foundation


struct UserHolding: Codable, Identifiable {
    var id: String {
        return symbol
    }
    
    let symbol: String
    let quantity: Int
    let ltp: Double
    let avgPrice: Double
    let close: Double
    
    // MARK: -- Computed properties
    
    var currentValue: Double {
        return ltp * Double(quantity)
    }
    
    var investmentValue: Double {
        return avgPrice * Double(quantity)
    }
    
    var pandl: Double {
        return currentValue - investmentValue
    }
}
