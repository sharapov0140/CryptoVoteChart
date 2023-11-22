//
//  CoinList.swift
//  CryptoVote
//
//  Created by ZAF on 5/29/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation

//struct ChartData: Codable {
//
//    var marketCap: [[Double]]
//    var price: [[Double]]
//    var volume: [[Double]]
//
//    private enum CodingKeys: String, CodingKey {
//        case marketCap = "market_cap"
//        case price
//        case volume
//    }
//}




func convertUnixTimeToDateString(unixTime: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE dd MMM yyyy, HH:mm:ss" // Sun 01 Oct 2023, 07:30:50
    return dateFormatter.string(from: date)
}

struct ForecastDay: Codable {
    var Data: [dat]
    var dates: [String]  // Not optional, but we'll populate it manually
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Data = try container.decode([dat].self, forKey: .Data)
        
        // Manually populate dates from Data if needed
        dates = Data.map { dat in
            // Convert dat.time to a date string
            return convertUnixTimeToDateString(unixTime: dat.time)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case Data
    }
}

struct dat: Codable {
    var low: Double
    var time: Int
}


// Add your convertUnixTimeToDateString function here.







//struct ForecastDay: Codable {
//    
//    var Data: [dat]
//
//
//}
//
//struct dat: Codable {
//    var low : Double
//    var time : Int
//    
//}




