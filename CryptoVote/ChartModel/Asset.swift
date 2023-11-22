//
//  CoinList.swift
//  CryptoVote
//
//  Created by ZAF on 5/29/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation



struct Asset: Codable {
    
    var name: String
    var symbol: String
    var volume: [Volume]
    var currentPrice: Double?
    
    var totalAmount: Double {
        return volume.reduce(0.0) { $0 + $1.amount }
    }
    
    var totalCost: Double {
        return volume.reduce(0.0) { $0 + $1.amount * $1.price }
    }
    
    var currentTotalCost: Double {
        return volume.reduce(0.0) { $0 + $1.amount * (currentPrice ?? 0) }
    }
    
}

struct Volume: Codable {
    
    var amount: Double
    var price: Double
}
