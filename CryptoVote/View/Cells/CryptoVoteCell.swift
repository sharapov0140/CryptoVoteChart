//
//  CryptoListCell.swift
//  cryptoTest
//
//  Created by ZAF on 4/7/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit





class CryptoVoteCell: UITableViewCell {
    
    
    var delegate: FeedCellDelegate?
    
    
    
    var crypto: Post? {
        
        didSet {
            
            
            guard let name = crypto?.caption else {
                return
            }
            guard let symbol = crypto?.symbol else { return }
            
            
       //     guard let icon = crypto?.image else {return}
            
            
            symbolLabel.text = symbol
            
            nameLabel.text = name
            
          
            configureUpvoteButton()
            
            
            if #available(iOS 13.0, *) {
                   if traitCollection.userInterfaceStyle == .dark {
                       self.backgroundColor = UIColor(named: "backgroundColor")
                       upvoteButton.tintColor = .white
                     
                   } else {
                       self.backgroundColor = UIColor(named: "backgroundColor")
                        upvoteButton.tintColor = .black
                   }
                    
                   } else {
                       upvoteButton.tintColor = .black
                       
                   }
            
            
            guard let vote = crypto?.upvotes else {
                return
            }
            
            if vote > 1 {
                upvoteLabel.text = "\(vote) upvotes"
                
            } else {
                upvoteLabel.text = "\(vote) upvote"
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
    
    
    lazy var symbolLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var upvoteLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12)
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
//    let priceLabel: UILabel = {
//        let label = UILabel()
//        
//        label.font = UIFont.systemFont(ofSize: 12)
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
    
    
    lazy var upvoteButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(#imageLiteral(resourceName: "star_white-1"), for: .normal)
        button.isMultipleTouchEnabled = false
        button.addTarget(self, action: #selector(handleUpvoteTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func handleUpvoteTapped() {
        
        
        // Moved the interaction disabling line to later
        DispatchQueue.global(qos: .background).sync {
            
            configureUpvoteButton()
            
            // Only disable user interaction after you're done with the function
            DispatchQueue.main.async {
                self.upvoteButton.isUserInteractionEnabled = false
            }
            
            delegate?.handleUpvoteTapped(for: self)
        }
    }
    
    
//    lazy var upvoteButton: UIButton = {
//        let button = UIButton(type: .system)
//    //    button.frame = CGRect(width: 100, height: 50)
//        button.setImage(#imageLiteral(resourceName: "star_white-1"), for: .normal)
//        
//     //   button.isExclusiveTouch = true
//        button.isMultipleTouchEnabled = false
//        button.addTarget(self, action: #selector(handleUpvoteTapped) , for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    @objc func handleUpvoteTapped() {
//        print("Upvote button pressed")
//        upvoteButton.isUserInteractionEnabled = false
//        DispatchQueue.global(qos: .background).sync {
//            configureUpvoteButton()
//            delegate?.handleUpvoteTapped(for: self)
//            
//        }
//        
//    }
    
    
    
    
    @objc func configureUpvoteButton() {
        
        delegate?.handleConfigureUpvoteButton(for: self)
        
    }
    
    
    override func prepareForReuse() {
        
        upvoteButton.isExclusiveTouch = true
        
        guard let vote = crypto?.upvotes else {
            return
        }
        
        if vote > 1 {
            upvoteLabel.text = "\(vote) upvotes"
            
        } else {
            upvoteLabel.text = "\(vote) upvote"
        }

        
        
        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
            self.backgroundColor = UIColor(named: "backgroundColor")
            upvoteButton.tintColor = .white
          
        } else {
            self.backgroundColor = UIColor(named: "backgroundColor")
             upvoteButton.tintColor = .black
        }
         
        } else {
            upvoteButton.tintColor = .black
            
        }
        
        
    }
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
               // Enable user interaction on the cell's content view
        self.contentView.isUserInteractionEnabled = true
        upvoteButton.isExclusiveTouch = true
    
        
        addSubview(iconImage)
        iconImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        iconImage.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor).isActive = true
        
        
        addSubview(symbolLabel)
        symbolLabel.anchor(top: iconImage.topAnchor, leading: iconImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 35))
        
        
        addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: iconImage.trailingAnchor, bottom: iconImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 15))
        //nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        addSubview(upvoteButton)
        upvoteButton.anchor(top: iconImage.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 3, left: 0, bottom: 0, right: 30), size: .init(width: 30, height: 30))
        
        addSubview(upvoteLabel)
        upvoteLabel.anchor(top: nil, leading: nil, bottom: iconImage.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 1, right: 16), size: .init(width: 0, height: 15))
//        
//        
        
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}






