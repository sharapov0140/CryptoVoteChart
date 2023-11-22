//
//  CoinList.swift
//  CryptoVote
//
//  Created by ZAF on 5/29/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation

struct Coin: Codable {
    
    var id: String
    var name: String
    var symbol: String
    var priceUSD: String?
    
}
