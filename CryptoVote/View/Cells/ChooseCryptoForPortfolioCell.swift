//
//  CryptoListCell.swift
//  cryptoTest
//
//  Created by ZAF on 4/7/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit





class ChooseCryptoForPortfolioCell: UITableViewCell {
    
    
    
    
    
    
    
    
    var crypto: cryptoCoinCapJsonPeriod? {
        
didSet {
    
    if let name = crypto?.id{

        nameLabel.text = name.capitalized
    }
    
    if let symbol = crypto?.symbol {
        
        symbolLabel.text = symbol
        
    }
    
    if let price = crypto?.priceUsd {
        
   
        let priceToDouble = Double(price)!
       // let pric = Double(doubleToMoneyString(double: Double(price)))
            priceLabel.text = "$\(round(100*priceToDouble)/100)"
        
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
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
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
    
    
    lazy var symbolLabel: UILabel = {
           let label = UILabel()
           
           label.font = UIFont.systemFont(ofSize: 24)
           label.numberOfLines = 0
           label.translatesAutoresizingMaskIntoConstraints = false
           
           return label
       }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        addSubview(iconImage)
        iconImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: 50, height: 50))
        
        addSubview(symbolLabel)
        symbolLabel.anchor(top: iconImage.topAnchor, leading: iconImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 35))
        
        
        addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: iconImage.trailingAnchor, bottom: iconImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 15))
        
        
        addSubview(priceLabel)
        priceLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8), size: .init(width: 0, height: 50))
        priceLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor).isActive = true
        
        
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
