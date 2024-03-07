//
//  PortfolioModel.swift
//  StockList
//
//  Created by Maruf Memon on 06/03/24.
//

import Foundation

struct Portfolio: Codable {
    var userHolding: [UserHolding]
    
    var currentValue: Double {
        var curVal: Double = 0
        for userHold in userHolding {
            curVal += userHold.currentValue
        }
        return curVal
    }
    
    var totalInvestment: Double {
        var totInv: Double = 0
        for userHold in userHolding {
            totInv += userHold.investmentValue
        }
        return totInv
    }
    
    var currentPNL: Double {
        return currentValue - totalInvestment
    }
    
    var todayPNL: Double {
        var todPNL: Double = 0
        for userHold in userHolding {
            todPNL += (userHold.close - userHold.ltp) * Double(userHold.quantity)
        }
        return todPNL
    }
}
