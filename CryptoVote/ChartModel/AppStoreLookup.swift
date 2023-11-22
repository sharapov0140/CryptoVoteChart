//
//  CoinList.swift
//  CryptoVote
//
//  Created by ZAF on 5/29/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation

struct AppStoreLookup: Decodable {
    
    struct Results: Decodable {
        let appID: Int
        let currentVersionReleaseDate: String
        let minimumOSVersion: String
        let version: String
        
        private enum CodingKeys: String, CodingKey {
            case currentVersionReleaseDate
            case minimumOSVersion           = "minimumOsVersion"
            case appID                      = "trackId"
            case version
        }
    }
    
    let resultCount: Int
    let results: [Results]
}
