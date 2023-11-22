//
//  CryptoStats.swift
//  CryptoVote
//
//  Created by ZAF on 4/16/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit

struct CryptoStats:Decodable {
    
    var name: String = ""
    var symbol: String? = ""
    var price_usd: String = ""
    
    
    init(name: String, symbol: String, price_usd: String){
        self.name = name
        self.symbol = symbol
        self.price_usd = price_usd
        

        
    }
    
//    deinit {
//        print("delocatted")
//    }
    
    
}
