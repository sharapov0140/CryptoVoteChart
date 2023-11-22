//
//  FavoriteCryptoListCell.swift
//  CryptoVote
//
//  Created by ZAF on 5/8/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit

class FavoriteCryptoListCell: UITableViewCell {
    

    
    var post: Dog? {
        
        didSet {
            
            
            guard let symbol = post?.symbol else {
                return
            }
            
            guard let name = post?.name else {
                return
            }
            
          //  guard let symbol = post?. else { return }
            guard let vote = post?.amount else {
                return
            }
            
            guard let price = post?.price else {
                return
            }
            
            
            //     guard let icon = crypto?.image else {return}
            
            
            let priceAmount = vote * price
            
            let priceCrypto = doubleToMoneyString(float: Float(priceAmount))
            symbolLabel.text = symbol
            
            nameLabel.text = name.capitalized
            
            priceLabel.text = "Net worth: \(priceCrypto)"
            
            
            
            
            if vote > 1 {
                youOwnLabel.text = "You own: \(vote) \(symbol)"
                
            } else {
                youOwnLabel.text = "You own: \(vote) \(symbol)"
            }
            
            
            iconImage.image =  UIImage(named: symbol)
            
            
            //    priceLabel.text = "300000"
   //         configureUpvoteButton()
        }
    }
    
    //    var crypto: (Post?, CryptoStats?) {
    //
    //        didSet {
    //
    //
    //            guard let name = crypto.0?.caption else {
    //                return
    //            }
    //            guard let upvote = crypto.0?.upvotes else {
    //                return
    //            }
    //            guard let price = crypto.1?.price_usd else {return}
    //            nameLabel.text = name
    //            upvoteLabel.text = "\(upvote)"
    //            priceLabel.text = "\(price)"
    //            configureUpvoteButton()
    //        }
    //    }
    
    
    
                func doubleToMoneyString(float: Float) -> String {
                    let formatter = NumberFormatter()
                  //  formatter.locale = Locale(identifier: "en_US")
                    formatter.numberStyle = .currency
                    if float < 1 {
                    formatter.minimumFractionDigits = 4
                    }
                    if let fancyPrice = formatter.string(from: NSNumber(floatLiteral: Double(float))) {
                        return fancyPrice
                    } else {
                        return "ERROR"
                    }
                    
                }

    
    
    lazy var iconImage: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
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
    
    lazy var symbolLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var youOwnLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: 12)

        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    
    lazy var upvoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "star_black-1"), for: .normal)
        button.tintColor = .black

        button.addTarget(self, action: #selector(handleUpvoteTapped) , for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    
    
    @objc func handleUpvoteTapped() {
  //      delegate?.handleUpvoteTapped(for: self, isDoubleTap: false)

    }
//
//    func configureUpvoteButton() {
//        delegate?.handleConfigureUpvoteButton(for: self)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear
        
        addSubview(iconImage)
        iconImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 8, left: 8, bottom: 8, right: 0), size: .init(width: 50, height: 50))
        iconImage.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor).isActive = true
        
        
        addSubview(symbolLabel)
        symbolLabel.anchor(top: iconImage.topAnchor, leading: iconImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 35))
        
        
        addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: iconImage.trailingAnchor, bottom: iconImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 15))
        //nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        
        
        //        addSubview(priceLabel)
        //        priceLabel.anchor(top: nil, leading: nameLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 8), size: .init(width: 0, height: 50))
        
        addSubview(priceLabel)
        priceLabel.anchor(top: iconImage.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 20), size: .init(width: 0, height: 0))
        
        addSubview(youOwnLabel)
        youOwnLabel.anchor(top: nil, leading: nil, bottom: iconImage.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 2, right: 20), size: .init(width: 0, height: 15))

        
        
    }
    
    
    
    
    
    
    
    
}
