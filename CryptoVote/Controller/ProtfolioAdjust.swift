//
//  protfolioAdjust.swift
//  CryptoVote
//
//  Created by ZAF on 8/12/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift




class ProtfolioAdjust: UIViewController {
    
    // MARK: - Properties
    
    
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.alwaysBounceVertical = true
        sv.alwaysBounceHorizontal = false
        sv.backgroundColor = .clear
        sv.translatesAutoresizingMaskIntoConstraints = false
        // sv.bounces = true
        return sv
    }()
    
    
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "How many do you onw?"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()
    
    
    lazy var fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "How much was it?"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()
    
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "colorTheme")
        button.layer.cornerRadius = 5
     //   button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    lazy var chooseCrypto: UIButton = {
        let button = UIButton(type: .system)
        //button.setTitle("Chose Crypto", for: .normal)
     //   button.setTitleColor(UIColor(named: "colorTheme"), for: .normal)
        button.setTitleColor(UIColor(named: "colorTheme"), for: .normal)
        //button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5
        
        
     
       // button.isEnabled = false
    //       button.addTarget(self, action: #selector(handleCryptoChoose), for: .touchUpInside)
        return button
    }()
    
    
    
      func config() {
          
         self.navigationController?.navigationBar.isTranslucent = true
        
        
          self.view.addSubview(scrollView)
          
       
          
          scrollView.backgroundColor = .clear
          
          let tap = UITapGestureRecognizer(target: self, action: #selector(disableKeyboard))
          self.scrollView.addGestureRecognizer(tap)
         
       //   scrollView.translatesAutoresizingMaskIntoConstraints = false
          
          self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
          self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
          self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
          self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
          
      
          
          
      
          
          
          
          let stackView = UIStackView(arrangedSubviews: [chooseCrypto, emailTextField, fullNameTextField, signUpButton])
          
          stackView.axis = .vertical
          stackView.spacing = 10
          stackView.distribution = .fillEqually
          stackView.translatesAutoresizingMaskIntoConstraints = false
          
          scrollView.addSubview(stackView)
          
          
          
          
          stackView.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 240))

          
    
          
          
          
          
      }
    
    
    
   
    
    
    var coin: cryptoCoinCapJson?
    var coinNested: CoinList?
    var crypto: cryptoCoinCapJsonPeriod?
    let realm = try! Realm()
    let myDog = Dog()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptoTitle()
        
        
        
        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
         //   view.backgroundColor = .clear
            view.backgroundColor = UIColor(named: "backgroundColor")
          //  tableView.backgroundColor = UIColor(named: "backgroundColor")
        } else {
    // view.backgroundColor = .clear
     view.backgroundColor = UIColor(named: "backgroundColor")
            
        }
        } else {
            view.backgroundColor = UIColor(named: "backgroundColor")
        }
        
        
        
        config()
        
        
        // background color
        
        
        
        
//        if let coin = coin {
//            setAsset(with: coin)
//            chooseButton.isEnabled = false
//        } else if let bitcoin = Storage.coins()?.first {
//            setAsset(with: bitcoin)
//            chooseButton.setTitleColor(Colors.controlHighlighted, for: .normal)
//        }
        
    }
    
    
    @objc func disableKeyboard() {
           self.scrollView.endEditing(true)
           
       }
    
    
    func cryptoTitle() {
        guard let titleName = crypto?.id else { return }
        guard let symbol = crypto?.symbol else {return}
        
        
        emailTextField.placeholder = "How many \(symbol) do you have?"
        chooseCrypto.setTitle("\(titleName.capitalized)" , for: .normal )
      //  chooseCrypto.titleLabel!.font = UIFont(name: "\(titleName.capitalized)", size: 20)
        chooseCrypto.titleLabel?.font = UIFont.boldSystemFont(ofSize: 33)
        fullNameTextField.placeholder = "How much was \(symbol) at purchase?"
        
    }
    
    
    
    
    @objc func handleCryptoChoose() {
        
        
        self.navigationController?.pushViewController(ChooseCryptoForProtfolio(), animated: true)
    }
    

    

    
    
    @objc func handleSignUp() {
        
        
        
        let realm = try! Realm()
        let distinctIDs = { [weak self] in self?.realm.objects(Dog.self).value(forKey: "symbol") as! [String] }
        
        if distinctIDs().contains((crypto?.symbol)!) {
            
            print("Found a copy")
       //     guard let symbol = crypto?.symbol else {return}
            guard let price = crypto?.priceUsd else {return}
      //      guard let name = crypto?.id else {return}
            
            guard let email = emailTextField.text else { return }
            guard let username = fullNameTextField.text else { return }
            
            guard let amount = Double(email) else {return}
            guard let atprice = Double(username) else {return}
            print(price)
            let pric = Double(price)!
            //Mark: might break down because price is forced Float
//            myDog.price = pric
//            myDog.symbol = symbol
//            myDog.name = name
//            myDog.amount = amount
            
 //           myDog.atPrice = Double(round(100 * atprice)/100)
            
            
            
            let realm = try! Realm()
            
            try! self.realm.write {
                
                
                if let repo = realm.object(ofType: Dog.self, forPrimaryKey: myDog.symbol) {
                    print(amount)
                    
                    
                    repo.amount = amount
                    
                    repo.atPrice = Double(round(100 * atprice)/100)
                    
                    repo.price = pric
                    
                  //  tableView.reloadData()
                }
            }
            
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: false)

            
        }
        else {
            
            do {
                
                
                guard let symbol = crypto?.symbol else {return}
                guard let price = crypto?.priceUsd else {return}
                guard let name = crypto?.id else {return}
                
                guard let email = emailTextField.text else { return }
                guard let username = fullNameTextField.text else { return }
                
                guard let amount = Double(email) else {return}
                guard let atprice = Double(username) else {return}
                print(price)
                let pric = Double(price)!
                //Mark: might break down because price is forced Float
                myDog.price = pric
                myDog.symbol = symbol
                myDog.name = name
                myDog.amount = amount
                
                myDog.atPrice = Double(round(100 * atprice)/100)
                
                
                try! realm.write {
                    realm.add(myDog)
                }
            } catch {
                
                print("error")
            }
            
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: false)
        }
        
        
        
        
        
        
//        
//        // properties
//        guard let email = emailTextField.text else { return }
//        guard let username = fullNameTextField.text else { return }
//        
//        guard let amount = Double(email) else {return}
//        guard let atprice = Double(username) else {return}
//        //    coin.amount = amount
//        print(amount)
//        print(atprice)
//        
//        
//        try! self.realm.write {
//            guard let primaryKey = crypto?.CoinInfo.Name else {return}
//            print(primaryKey)
//            if let repo = realm.object(ofType: Dog.self, forPrimaryKey: primaryKey) {
//                print(amount)
//                repo.amount = amount
//                
//                repo.atPrice = Double(round(100 * atprice)/100)
//              //  tableView.reloadData()
//            }
//        }
        
    }
    
    
    @objc func handleShowLogin() {
        let signUpVC = LoginVC()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    @objc func formValidation() {
        
        guard
            emailTextField.hasText,
            fullNameTextField.hasText else {
                signUpButton.isEnabled = false
                signUpButton.backgroundColor = UIColor(named: "colorThemeLowOpacity")
                  
                return
        }
        
        signUpButton.isEnabled = true
        signUpButton.backgroundColor = UIColor(named: "colorTheme")
    
    }
    

    
    
    
    
}
