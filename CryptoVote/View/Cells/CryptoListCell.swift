//
//  CryptoListCell.swift
//  cryptoTest
//
//  Created by ZAF on 4/7/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit





class CryptoListCell: UITableViewCell {
    
 
    
    var crypto: cryptoCoinCapJsonPeriod? {
        
        didSet {
            
            if let name = crypto?.id{
       
                nameLabel.text = name.capitalized
            }
            
            
            if let percantageGain = crypto?.changePercent24Hr {
                let percent = Double(percantageGain)!
                if percent > 0.001 {
                    percetnChng24hLbJSON.textColor = UIColor(red: 0.0824, green: 0.5098, blue: 0, alpha: 1.0)
                    percetnChng24hLbJSON.text = "\(round(100*percent)/100)%"
                } else {
                    percetnChng24hLbJSON.textColor = .red
                    percetnChng24hLbJSON.text = "\(round(100*percent)/100)%"
                }
                
            }
            
            if let symobl = crypto?.symbol {
                symbolLabel.text = symobl
            }
            
            if let price = crypto?.priceUsd {
                
               
                let priceToDouble = Double(price)!
               // let pric = Double(doubleToMoneyString(double: Double(price)))
                if priceToDouble < 1 {
                    priceLabel.text = "$\(round(100000000*priceToDouble)/100000000)"
                } else {
                    priceLabel.text = "$\(round(100*priceToDouble)/100)" }
            }
            if let icon = crypto?.symbol {
                
                  let iconIm = UIImage(named: icon)
                  if iconIm == nil {
                  iconImage.image = UIImage(named: "Default")
            
                
                } else {
                   iconImage.image = UIImage(named: icon)
                }}
        }
        }
    
    
    func doubleToMoneyString(double: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
      
        if let fancyPrice = formatter.string(from: NSNumber(floatLiteral: double)) {
            return fancyPrice
        } else {
            return "ERROR"
        }
    }
    
    
    
    func commaInNumber(double: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
        if let formattedNumber = numberFormatter.string(from: NSNumber(value:double)) {
            return formattedNumber
        } else {
            return "ERROR"
        }
    
    }
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    lazy var symbolLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var iconImage: UIImageView = {
        let iv = UIImageView()
        iv.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 50, height: 50))
     //   iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    
    lazy var percetnChng24hLbJSON: UILabel = {
        let label = UILabel()
     //   label.backgroundColor = .purple
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
        
        if #available(iOS 13.0, *) {
           if traitCollection.userInterfaceStyle == .dark {
               self.backgroundColor = .clear
               self.backgroundColor = UIColor(named: "backgroundColor")
             //  tableView.backgroundColor = UIColor(named: "backgroundColor")
           } else {
        self.backgroundColor = .clear
        self.backgroundColor = UIColor(named: "backgroundColor")
               
           }
           } else {
               self.backgroundColor = UIColor(named: "backgroundColor")
           }
        
        
        addSubview(iconImage)
        iconImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: 0, height: 50))
        iconImage.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor).isActive = true
        
        
        
        addSubview(symbolLabel)
        symbolLabel.anchor(top: iconImage.topAnchor, leading: iconImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 35))
        
        
        addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: iconImage.trailingAnchor, bottom: iconImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 15))
        
        
        
        
        
        addSubview(priceLabel)
        priceLabel.anchor(top: iconImage.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 20), size: .init(width: 0, height: 0))
        
        addSubview(percetnChng24hLbJSON)
        percetnChng24hLbJSON.anchor(top: nil, leading: nil, bottom: iconImage.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 2, right: 20), size: .init(width: 0, height: 15))
        
        
        
    }
    
    
 
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
