//
//  CoinList.swift
//  CryptoVote
//
//  Created by ZAF on 5/24/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import UIKit
import Foundation

final class Formatter {
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static func format(_ number: Double, maximumFractionDigits: Int = 2) -> String? {
        numberFormatter.maximumFractionDigits = maximumFractionDigits
        return numberFormatter.string(from: abs(number) as NSNumber)
    }
    
    static func formatAmount(label: UILabel, value: Double, symbol: String, maximumFractionDigits: Int = 10) {
        if let amount = Formatter.format(value, maximumFractionDigits: maximumFractionDigits) {
            label.text = "\(amount) \(symbol)"
        }
    }
    
    static func formatCost(label: UILabel, value: Double, maximumFractionDigits: Int = 2) {
        if let cost = Formatter.format(value, maximumFractionDigits: maximumFractionDigits) { label.text = "$\(cost)" }
    }
    
    static func formatProfit(label: UILabel, firstValue: Double?, lastValue: Double?, maximumFractionDigits: Int = 2) {
        guard let firstValue = firstValue, let lastValue = lastValue, firstValue != 0 || lastValue != 0 else {
            label.text = ""
            return
        }
        
        let absoluteProfit = lastValue - firstValue
        let relativeProfit = absoluteProfit / firstValue * 100
        
        guard let profitText = Formatter.format(absoluteProfit, maximumFractionDigits: maximumFractionDigits),
            let percentText = Formatter.format(relativeProfit) else {
                label.text = ""
                return
        }
        
        if absoluteProfit > 0 {
            label.text = "↑ $\(profitText) (\(percentText)%)"
            label.textColor = Colors.positiveGrow
        } else if absoluteProfit < 0 {
            label.text = "↓ $\(profitText) (\(percentText)%)"
            label.textColor = Colors.negativeGrow
        }
    }
    
    static func days(for number: Int) -> String {
        return localizedNumber(for: number, keys: ("day", "severalDays", "manyDays"))
    }
    
    static func hours(for number: Int) -> String {
        return localizedNumber(for: number, keys: ("hour", "severalHours", "manyHours"))
    }
    
    static func minutes(for number: Int) -> String {
        return localizedNumber(for: number, keys: ("minute", "severalMinutes", "manyMinutes"))
    }
    
    static func localizedNumber(for number: Int, keys: (one: String, several: String, many: String)) -> String {
        
        if (11...14).contains(number) { return NSLocalizedString(keys.many, comment: "") }
        
        switch number % 10 {
        case 1: return NSLocalizedString(keys.one, comment: "")
        case 2, 3, 4: return NSLocalizedString(keys.several, comment: "")
        default: return NSLocalizedString(keys.many, comment: "")
        }
    }
    
}

struct Colors {
    static let controlHighlighted = UIColor(red: 0/255, green: 145/255, blue: 130/255, alpha: 1.0)
    static let controlEnabled = UIColor(red: 0/255, green: 125/255, blue: 110/255, alpha: 1.0)
    static let controlDisabled = UIColor(red: 0/255, green: 105/255, blue: 90/255, alpha: 1.0)
    static let controlTextEnabled = UIColor.white
    static let controlTextDisabled = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
    
    static let positiveGrow = UIColor(red: 0.0824, green: 0.5098, blue: 0, alpha: 1.0)
    static let negativeGrow = UIColor(red: 210/255, green: 80/255, blue: 78/255, alpha: 1.0)
    static let bubbleBackground = UIColor(red: 51/255, green: 55/255, blue: 68/255, alpha: 1.0)
    static let actionButtonBackground = UIColor(red: 51/255, green: 55/255, blue: 68/255, alpha: 1.0)
}


