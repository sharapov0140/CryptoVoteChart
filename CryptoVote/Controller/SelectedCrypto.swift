////
////  SelectedCrypto.swift
////  cryptoTest
////
////  Created by ZAF on 4/7/19.
////  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import UIKit
//import Firebase
//import Realm
//import RealmSwift
//
//
//
//
//
//class SelectedCrypto: UIViewController {
//    
//    
//
//       lazy var activityIndicator: UIActivityIndicatorView = {
//            let label = UIActivityIndicatorView(style: .whiteLarge)
//         //   label.backgroundColor = .yellow
//            label.startAnimating()
//            
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        
//        
//        lazy var changeLabel: UILabel = {
//            let label = UILabel()
//          //  label.backgroundColor = .green
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            
//           
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        lazy var changeLabelFake: UILabel = {
//            let label = UILabel()
//          //  label.text = "fake"
//            label.backgroundColor = .white
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            
//            
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        lazy var noDataLabel: UILabel = {
//            let label = UILabel()
//          //  label.backgroundColor = .red
//
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        lazy var scrollView: UIScrollView = {
//            let view = UIScrollView()
//            view.translatesAutoresizingMaskIntoConstraints = false
//            view.contentSize.height = 500
//            view.backgroundColor = UIColor.white
//            
//            return view
//        }()
//        
//        
//        lazy var priceLabel: UILabel = {
//            let label = UILabel()
//          
//            label.textColor = .gray
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "Price:"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var priceLabelJSON: UILabel = {
//            let label = UILabel()
//        //    label.backgroundColor = .purple
//
//            label.font = UIFont.boldSystemFont(ofSize: 17)
//            label.numberOfLines = 0
//            label.text = "1234"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        lazy var marketCapLabel: UILabel = {
//            let label = UILabel()
//       //     label.backgroundColor = .purple
//            label.textColor = .gray
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "Mkt:"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        lazy var marketCapLabelJSON: UILabel = {
//            let label = UILabel()
//        //    label.backgroundColor = .purple
//            
//           label.font = UIFont.boldSystemFont(ofSize: 17)
//            label.numberOfLines = 0
//            label.text = "1234"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//
//        lazy var percetnChng24hLb: UILabel = {
//            let label = UILabel()
//         //   label.backgroundColor = .purple
//            label.textColor = .gray
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "% Change(24h):"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        lazy var percetnChng24hLbJSON: UILabel = {
//            let label = UILabel()
//         //   label.backgroundColor = .purple
//            
//            label.font = UIFont.boldSystemFont(ofSize: 17)
//            label.numberOfLines = 0
//            label.text = "1234"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var volumeLb: UILabel = {
//            let label = UILabel()
//       //     label.backgroundColor = .purple
//            label.textColor = .gray
//           label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "Vlm(24h):"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var volumeLbJSON: UILabel = {
//            let label = UILabel()
//         //   label.backgroundColor = .purple
//            
//            label.font = UIFont.boldSystemFont(ofSize: 17)
//            label.numberOfLines = 0
//            label.text = "123"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var maxSupplyLb: UILabel = {
//            let label = UILabel()
//        //    label.backgroundColor = .purple
//            label.textColor = .gray
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "Max Supply:"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var maxSupplyLbJSON: UILabel = {
//            let label = UILabel()
//         //   label.backgroundColor = .purple
//            
//            label.font = UIFont.boldSystemFont(ofSize: 17)
//            label.numberOfLines = 0
//            label.text = "123"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var changePercent24HrStringLb: UILabel = {
//            let label = UILabel()
//       //     label.backgroundColor = .purple
//            label.textColor = .gray
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "Change price % (24h):"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var changePercent24HrStringLbJSON: UILabel = {
//            let label = UILabel()
//        //    label.backgroundColor = .purple
//            
//            label.font = UIFont.boldSystemFont(ofSize: 17)
//            label.numberOfLines = 0
//            label.text = "123"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        lazy var supplyLb: UILabel = {
//            let label = UILabel()
//       //     label.backgroundColor = .purple
//            label.textColor = .gray
//            label.font = UIFont.boldSystemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "Supply:"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        lazy var supplyLbJSON: UILabel = {
//            let label = UILabel()
//       //     label.backgroundColor = .purple
//            label.font = UIFont.boldSystemFont(ofSize: 17)
//         //   label.font = UIFont.systemFont(ofSize: 15)
//            label.numberOfLines = 0
//            label.text = "123"
//            label.translatesAutoresizingMaskIntoConstraints = false
//            
//            return label
//        }()
//        
//        
//        func configureViewComponents() {
//            
//            view.addSubview(scrollView)
//            view.addSubview(changeLabelFake)
//            view.addSubview(changeLabel)
//            
//            view.addSubview(chartView)
//            chartView.addSubview(activityIndicator)
//            //noDataView.addSubview(noDataLabel)
//            chartView.addSubview(noDataView)
//            view.backgroundColor = .white
//            
//            //     chartView.delegate = self
//            
//            animation.duration = 0.2
//            animation.type = CATransitionType.fade
//            
//            
//            
//            navigationController?.navigationBar.isTranslucent = false
//            chartView.translatesAutoresizingMaskIntoConstraints = false
//            noDataView.translatesAutoresizingMaskIntoConstraints = false
//            
//            
//            
//            changeLabelFake.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: changeLabel.topAnchor, trailing: view.trailingAnchor, padding: .init(top: -13, left: 0, bottom: 0, right: 0), size: .init(width: (view.frame.width-32), height: 13))
//            
//            changeLabel.anchor(top: changeLabelFake.bottomAnchor, leading: changeLabelFake.leadingAnchor, bottom: chartView.topAnchor, trailing: changeLabelFake.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: (view.frame.width-32), height: 30))
//            
//            chartView.anchor(top: changeLabel.bottomAnchor, leading: changeLabel.leadingAnchor, bottom: nil, trailing: changeLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: (view.frame.height)/2) )
//            
//            
//    //        noDataView.anchor(top: chartView.topAnchor, leading: chartView.leadingAnchor, bottom: chartView.bottomAnchor, trailing: chartView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 25, height: 5))
//    //
//    //        noDataLabel.anchor(top: noDataView.topAnchor, leading: noDataView.leadingAnchor, bottom: noDataView.bottomAnchor, trailing: noDataView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 20, height: 4))
//            
//            activityIndicator.anchor(top: chartView.topAnchor, leading: chartView.leadingAnchor, bottom: chartView.bottomAnchor, trailing: chartView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 10, height: 0))
//            
//            view.addSubview(segmentedControl)
//            segmentedControl.anchor(top: chartView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 1, left: 2, bottom: 0, right: 2), size: .init(width: view.frame.width, height: 30))
//            
//            scrollView.anchor(top: segmentedControl.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: 500))
//            
//            
//            scrollView.addSubview(priceLabel)
//            priceLabel.anchor(top: scrollView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 30, left: 40, bottom: 0, right: 40))
//            scrollView.addSubview(priceLabelJSON)
//            priceLabelJSON.anchor(top: scrollView.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding:  .init(top: 30, left: 0, bottom: 0, right: 40))
//            scrollView.addSubview(volumeLb)
//            volumeLb.anchor(top: priceLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
//            scrollView.addSubview(volumeLbJSON)
//            volumeLbJSON.anchor(top: priceLabelJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 40))
//            
//            
//            
//            scrollView.addSubview(changePercent24HrStringLb)
//            changePercent24HrStringLb.anchor(top: volumeLb.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
//            scrollView.addSubview(changePercent24HrStringLbJSON)
//            changePercent24HrStringLbJSON.anchor(top: volumeLbJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 40))
//            
//            
//            scrollView.addSubview(marketCapLabel)
//            marketCapLabel.anchor(top: changePercent24HrStringLb.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
//            scrollView.addSubview(marketCapLabelJSON)
//            marketCapLabelJSON.anchor(top: changePercent24HrStringLbJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding:  .init(top: 10, left: 0, bottom: 0, right: 40))
//            
//            
//            scrollView.addSubview(maxSupplyLb)
//            maxSupplyLb.anchor(top: marketCapLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
//            scrollView.addSubview(maxSupplyLbJSON)
//            maxSupplyLbJSON.anchor(top: marketCapLabelJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding:  .init(top: 10, left: 0, bottom: 0, right: 40))
//            
//            
//            scrollView.addSubview(supplyLb)
//            supplyLb.anchor(top: maxSupplyLb.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
//            scrollView.addSubview(supplyLbJSON)
//            supplyLbJSON.anchor(top: maxSupplyLbJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 40))
//            
//            
//            
//        }
//    
//    
//    
//    
//    
//    let chartView = ChartView()
//    let segmentedControl = SegmentedControl()
//    let noDataView = NoDataView()
//    
//    let mainView = MainView()
//    var pricesArray = [String]()
//    var beatsPerMinute = [String]()
//    var workoutDuration = [String]()
//    var cryptoVoteFetchedDataPrice = ""
//    var cryptoVolumeDayNight = 0.0
//    var cryptoSymbol = ""
//    var cryptoChangePercentage = 0.0
//    var cryptoMarketCap = 0.0
//    var cryptoHighPrice = 0.0
//    var cryptoLowPrice = 0.0
//    var cryptoSupply = 0.0
//    var coin: Dog?
//    var votedCrypto: Post?
//    var crypto: cryptoCoinCapJsonPeriod?
//    
//    
//    
//    private var asset: Asset?
//    private let animation = CATransition()
//      private let feedBackGenerator = UIImpactFeedbackGenerator()
//      var originFrame = CGRect.zero
//    //  var crypto: cryptoCompJSONPeriod?
//      var symbol: String?
//      
//
//      
//      let realm = try! Realm()
//      let myDog = Dog()
//    
//    
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // scrollViewData()
//        
//        
//        view.backgroundColor = .white
//        getSymbol()
//        
//        // Do any additional setup after loading the view, typically from a nib.
//        //       requestData(for: .day)
//        view.backgroundColor = .white
//        //        segmentedControl.addTarget(self, action: #selector(CoinDetailsViewController.changeChartType(_:)), for: .valueChanged)
//        //        segmentedControl.selectedIndex = 0
//        configureViewComponents()
//     //   scrollViewData()
//        //      transitioningDelegate = self
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    func populateChartData() {
//        //      fetchData()
//        
//        
//        //      workoutDuration = ["1","2","3","4","5","6","7","8","9","10","11"]
//        
//        workoutDuration = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
//        
//        self.configureViewComponents()
//        self.configureDataFromCryptoList()
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//   
//    
//    
//
//    
//    
////    func scrollViewData() {
////
////        //        func withCommas() -> String {
////        //            let numberFormatter = NumberFormatter()
////        //            numberFormatter.numberStyle = NumberFormatter.Style.decimal
////        //            return numberFormatter.string(from: NSNumber(value:self))!
////        //        }
////
////
////        guard let marketCap = crypto?.marketCapUsd else {return}
////        guard let price = crypto?.priceUsd else {return}
////        guard let volume = crypto?.volumeUsd24Hr else {return}
////        guard let supply = crypto?.supply else {return}
////        guard let high24 = crypto?.maxSupply else {return}
////        guard let low24 = crypto?.changePercent24Hr else {return}
////        guard let symbol = crypto?.symbol else {return}
////
////        let volum = Double(volume)!
//////        priceLabelJSON.text = "$\(price)"
//////        marketCapLabelJSON.text = "$\(Int(marketCap))"
//////        volumeLbJSON.text = "$\(Double(round(10 * volume)/10))"
//////        supplyLbJSON.text = "\(Int(supply)) \(symbol)"
//////        high24LbJSON.text = "$\(high24)"
//////        low24LbJSON.text = "$\(low24)"
////
////
////
////        priceLabelJSON.text = "$\(price)"
////        marketCapLabelJSON.text = "$\(Int(marketCap))"
////        volumeLbJSON.text = "$\(Double(round(10 * volum)/10))"
////        supplyLbJSON.text = "\(Int(supply)) \(symbol)"
////        high24LbJSON.text = "$\(high24)"
////        low24LbJSON.text = "$\(low24)"
////
////
////
////
////    }
//    
//    
////    var cryptoVoteFetchedDataPrice = 0.0
////    var cryptoVolumeDayNight = 0.0
////    var cryptoSymbol = ""
////    var cryptoChangePercentage = 0.0
////    var cryptoMarketCap = 0.0
////    var cryptoHighPrice = 0.0
////    var cryptoLowPrice = 0.0
////    var cryptoSupply = 0.0
////
//    func configureDataFromCryptoVote() {
//        
//        
//        let symbol = votedCrypto?.caption
//        symbolLabel.text = symbol
//        
//        let price = cryptoVoteFetchedDataPrice
//        print(price)
//        priceLabelJSON.text = "$\(price)"
//        let volumeDayNight = cryptoVolumeDayNight
//        
//        volumeLbJSON.text = "$\(Double(round(10 * volumeDayNight)/10))"
//        
//        supplyLbJSON.text = "\(Int(cryptoSupply)) \(cryptoSymbol)"
//        high24LbJSON.text = "$\(cryptoHighPrice)"
//        low24LbJSON.text = "$\(cryptoLowPrice)"
//        marketCapLabelJSON.text = "$\(Int(cryptoMarketCap))"
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    @objc func handleChat() {
//        
//        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=Y4A_y29cy7Q")! as URL, options: [:], completionHandler: nil)
//        
//    }
//    
//    @objc func handleAddAmountCrypto() {
//      //  guard let crypto = crypto else {return}
//        if let coin = crypto {
//            let alert = UIAlertController(title: "How much \(coin.id) do you own?", message: nil, preferredStyle: .alert)
//            alert.addTextField { (textField) in
//                textField.placeholder = "0.5"
//                textField.keyboardType = .decimalPad
////                if self.coin?.amount != 0.0 {
////                    textField.text = String(coin.amount)
////                }
//            }
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
//                if let text = alert.textFields?[0].text {
//                    if let amount = Double(text) {
//                    //    coin.amount = amount
//                        let realm = try! Realm()
//
//                        try! self.realm.write {
//
//
//                            if let repo = realm.object(ofType: Dog.self, forPrimaryKey: coin.symbol) {
//            print(amount)
//                            repo.amount = amount
//                        }
//                        }
//                //        UserDefaults.standard.set(amount, forKey: coin.name + "amount")
//                        //      self.newPrices()
//                    }
//                }
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//
//    @objc func handleFavoriteCrypto() {
//        print("Added")
//        
//        
//        
//        let distinctIDs = { [weak self] in self?.realm.objects(Dog.self).value(forKey: "symbol") as! [String] }
//        
//        if distinctIDs().contains((crypto?.symbol)!) {
//            
//            print("Found a copy")
//            }
//        else {
//            
//            do {
//                
//                
//                guard let symbol = crypto?.symbol else {return}
//                guard let price = crypto?.priceUsd else {return}
//                guard let name = crypto?.id else {return}
//                print(price)
//                
//                //Mark: might break down because price is forced Float
//                myDog.price = Double(price)!
//                myDog.symbol = symbol
//                myDog.name = name
//                
//                try! realm.write {
//                    realm.add(myDog)
//                }
//            } catch {
//                print("error")
//            }
//
//            
//        }
//    }
//    
//    
//    func getChartData(with dataPoints: [String], values: [String]) {
//        self.workoutDuration = dataPoints
//        print(dataPoints)
//        
//        self.beatsPerMinute = values
//        print(values)
//        
//        configureViewComponents()
//    }
//    
//    
//   
//    
//    func configureDataFromCryptoList() {
//        
//        
//        
//        if let name = crypto?.id {
//        volumeLabel.text = name
//        }
//        if let price = crypto?.priceUsd {
//            priceLabel.text = String(price)
//        }
//        
//    }
//    
//    
//
//    
//    func getSymbol() {
//        
//        
//        
//        if crypto?.symbol != nil {
//            guard let fullName = crypto?.id else { return }
//            guard let symbol = crypto?.symbol else { return }
//            print(symbol)
//            fetchData(data: fullName)
//            fetchHistoricData(data:  symbol)
//        }
//            
//        else {
//            guard let fullName = votedCrypto?.caption else {return}
//            guard let symbol = votedCrypto?.symbol else { return }
//            print(symbol)
//            fetchHistoricData(data: symbol)
//            fetchData(data: fullName)
//        }
//        
//    }
//    
//    
//
//    
//    
//    
//    
//    
//    
//    
//    
////    func fetchData(data: String) {
////
////        Alamofire.request("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=\(String(describing: data))&tsyms=USD").responseJSON { (response) in
////            if let json = response.result.value as? [String:Any] {
////                if let raw = json["RAW"] as? [String:Any] {
////                    if let coinJSON = raw[data] as? [String:Any] {
////                        if let usd = coinJSON["USD"] as? [String:Any] {
////                            if let price = usd["PRICE"] {
////                                self.cryptoVoteFetchedDataPrice = [price as! String]
////
////                        //        self.nameLabel.text = price as? String
////
//// //                           UserDefaults.standard.set(price, forKey: symbol)
////                            }
////                            if let volumeDay = usd["VOLUME24HOURTO"] {
////                            self.cryptoVolumeDayNight = volumeDay as! Double
////
////                            }
////                            if let symbol = usd["FROMSYMBOL"] {
////                                self.cryptoSymbol = symbol as! String
////                            }
////                            if let symbol = usd["MKTCAP"] {
////                                self.cryptoMarketCap = symbol as! Double
////                            }
////                            if let symbol = usd["HIGH24HOUR"] {
////                                self.cryptoHighPrice = symbol as! Double
////                            }
////                            if let symbol = usd["LOW24HOUR"] {
////                                self.cryptoLowPrice = symbol as! Double
////                            }
////
////                            if let symbol = usd["SUPPLY"] {
////                                self.cryptoSupply = symbol as! Double
////                            }
////
////
////
////
////                        }
////                    }
////                    }
////
////                self.configureDataFromCryptoVote()
////      //          self.delegate?.newPrices?()
////            }
////        }
////
////    }
//    
//    
//    
//    
//    
//    
//    
//    
//    func fetchData(data: String) {
//
//
//
//        let jsonUrlStrin = "https://api.coincap.io/v2/assets/\(String(describing: data.lowercased()))"
//            guard let url = URL(string: jsonUrlStrin) else { return }
//            print(url)
//            URLSession.shared.dataTask(with: url) { (data, response, err) in
//                //perhaps check err
//                //also perhaps check response status 200 OK
//
//                guard let data = data else { return }
//                print(data)
//
//                if err == nil {
//                    do {
//
//
//
//                        let cryptos = try JSONDecoder().decode(cryptoCoinCapSingleJson.self, from: data)
//
//
//
//
//
//                        DispatchQueue.main.async {
// 
//                              
// 
//                            let pricesString = cryptos.data.priceUsd
//                            
//                            guard let prices = pricesString else { return }
//                           
//                              self.cryptoVoteFetchedDataPrice = prices
//                            
//                          
//                            
//                            
//                          //  guard let pricesString == "" else {return}
//
//                    //        self.cryptoVoteFetchedDataPrice = [pricesString]
//                            
////                            self.cryptStat = cryptos
////
////
////
////
////                            completed()
////                            self.tableView.reloadData()
//                            self.configureDataFromCryptoVote()
//                        }
//                    }catch {
//                        print("JSON Error", error.localizedDescription)
//                    }
//                }
//
//
//
////                do {
////
////
////                    let courses = try JSONDecoder().decode(cryptoCompJSON.self, from: data)
////                    print(courses)
////
////
////
////                    DispatchQueue.main.async {
////
////                        let prices = courses.Data.compactMap { String($0.RAW.USD.PRICE) }
////
////                        print(prices)
////                        self.cryptoVoteFetchedDataPrice = prices
////
////
////                      //  let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
//////                        let filename = "chartData.txt"
//////    //                    do {
//////    //                        try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
//////    //                    } catch {
//////    //                        // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
//////    //                    }
//////
//////
//////
//////                        do {
//////                            let data = data
//////                            let string = String(data: data, encoding: String.Encoding.utf8)
//////
//////                            if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//////                                let filepath = path.appendingPathComponent(filename)
//////                                print(filepath)
//////                                do {
//////                                    try string?.write(to: filepath, atomically: true, encoding: String.Encoding.utf8)
//////                                } catch {
//////                                    print(error)
//////                                }
//////                            }
//////                        } catch {
//////                            print(error)
//////                        }
//////
//////
//////
//////
//////
//////
//////
//////                        self.populateChartData()
////                    }
////
////
////                } catch let jsonErr {
////                    print("Error serializing json:", jsonErr)
////                }
//                }.resume()
//
//        }
//    
//    
//    
//    
//    
//    
//    
////    {
////        
////        let url = URL(string: "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=100&page=0&tsym=USD")
////        //     let url = URL(string: "https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&limit=100")
////        URLSession.shared.dataTask(with: url!) { (data, response, error) in
////            
////            
////            if error == nil {
////                do {
////                    
////                    let cryptos = try JSONDecoder().decode(cryptoCompJSON.self, from: data!)
////                    
////                    
////                    DispatchQueue.main.async {
////                        
////                        
////                        self.cryptStat = cryptos
////                        
////                        
////                        
////                        
////                        completed()
////                        self.tableView.reloadData()
////                        
////                    }
////                }catch {
////                    print("JSON Error", error.localizedDescription)
////                }
////            }
////            }.resume()
////    }
//    
//    
//    func fetchHistoricData(data: String) {
//        
//
//        
//        let jsonUrlString = "https://min-api.cryptocompare.com/data/histoday?fsym=\(String(describing: data))&tsym=USD&limit=100"
//        guard let url = URL(string: jsonUrlString) else { return }
//      
//        print(url)
//        
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            //perhaps check err
//            //also perhaps check response status 200 OK
//            
//            guard let data = data else { return }
//          //  print(data)
//            
//            
//            do {
//                
//                
//                let courses = try JSONDecoder().decode(ForecastDay.self, from: data)
//                print(courses)
//                
//                
//                
//                DispatchQueue.main.async {
//                    
//                    let prices = courses.Data.compactMap { String($0.low) }
//                    
////                    print(prices)
//                    self.beatsPerMinute = prices
//               //     let str = prices
//                    
//                  //  let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
//                //    let filename = "chartData.txt"
////                    do {
////                        try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
////                    } catch {
////                        // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
////                    }
//                    
//                    
//                    
////                    do {
////                        let data = data
////                        let string = String(data: data, encoding: String.Encoding.utf8)
////
////                        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
////                            let filepath = path.appendingPathComponent(filename)
////                            print(filepath)
////                            do {
////                                try string?.write(to: filepath, atomically: true, encoding: String.Encoding.utf8)
////                            } catch {
////                                print(error)
////                            }
////                        }
////                    } catch {
////                        print(error)
////                    }
//
//                    
//                    
//                    
//                    
//                   
//                    
//                    self.populateChartData()
//                }
//                
//                
//            } catch let jsonErr {
//                print("Error serializing json:", jsonErr)
//            }
//            }.resume()
//        
//    }
//    
//    
//    
//}
//
//
//
//public class ChartFormatter: NSObject, IAxisValueFormatter {
//    
//    var workoutDuration = [String]()
//    
//    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//        print(workoutDuration)
//        return workoutDuration[Int(value)]
//    }
//    public func setValue(values: [String]) {
//        self.workoutDuration = values
//    }
//}
//
//
//
//protocol GetChartData {
//    
//    func getChartData(with dataPoints: [String], values: [String])
//    
//    var workoutDuration : [String] {get set}
//    
//    var beatsPerMinute : [String] {get set}
//    
//}
//
//
////struct ForecastDay: Decodable {
////
////    let periods: [ForecastDayPeriod]
////
////    enum CodingKeys: String, CodingKey {
////        case Data
////    }
////
////    init(from decoder: Decoder) throws {
////        let values = try decoder.container(keyedBy: CodingKeys.self)
////
////        periods = try values.decode([ForecastDayPeriod].self, forKey: .Data)
////    }
////
////}
////
////
////
////struct ForecastDayPeriod: Decodable {
////
////    let low: Double
////}
//
//
//
//
//class MainView: UIView {
//    
//    
//    override init(frame: CGRect) {
//        
//        
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        setupViews()
//        setupConstraints()
//        cubicLineChartSetup()
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupViews() {
//        self.addSubview(contentView)
//        //    self.addSubview(priceLbl)
//        //        self.addSubview(likeButton)
//    }
//    
//    func setupConstraints() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        setupContentViewConstraints()
//        
//    }
//    
//    
//    
//    fileprivate func setupContentViewConstraints() {
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
//        contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        
//        
//    }
//    
//    let contentView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.borderWidth = 1.0
//        view.layer.borderColor = UIColor.green.cgColor
//        return view
//    }()
//    
//    
//    let lineChartView = LineChartView()
//    
//    var lineDataEntry : [ChartDataEntry] = []
//    
//    var workoutDuration = [String]()
//    
//    var beatsPerMinute = [String]()
//    
//    
//    var delegate : GetChartData! {
//        
//        didSet {
//            
//            populateData()
//            
//            cubicLineChartSetup()
//            
//        }
//        
//    }
//    
//    fileprivate func populateData() {
//        
//        workoutDuration = delegate.workoutDuration
//        
//        beatsPerMinute = delegate.beatsPerMinute
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    func cubicLineChartSetup() {
//        
//        self.backgroundColor = UIColor.white
//        
//        self.addSubview(lineChartView)
//        
//        lineChartView.translatesAutoresizingMaskIntoConstraints = false
//        
//        lineChartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        
//        lineChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        
//        lineChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        
//        lineChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        
//        lineChartView.animate(xAxisDuration: 2.0,yAxisDuration: 2.0,easingOption: .easeInSine)
//        
//        setCubicLineChart(dataPoints:workoutDuration, values:beatsPerMinute)
//        
//    }
//    
//    func setCubicLineChart(dataPoints: [String], values: [String]) {
//        
//        lineChartView.noDataTextColor = UIColor.white
//        
//        lineChartView.noDataText = "No data for this chart"
//        
//        lineChartView.backgroundColor = UIColor.white
//        
//        print(dataPoints)
//        
//        for i in 0..<dataPoints.count {
//            
//            let dataPoint = ChartDataEntry(x: Double(i), y: Double(values[i])!)
//            
//            
//            lineDataEntry.append(dataPoint)
//            print(dataPoints)
//        }
//        
//        let chartDataSet = LineChartDataSet(values: lineDataEntry, label:"BPM")
//        
//        let chartData = LineChartData()
//        
//        chartData.addDataSet(chartDataSet)
//        
//        chartData.setDrawValues(true)
//        
//        chartDataSet.colors = [UIColor.blue]
//        
//        chartDataSet.setCircleColor(UIColor.blue)
//        
//        chartDataSet.setCircleColors(UIColor.red)
//        
//        chartDataSet.circleRadius = 8.0
//        
//        chartDataSet.mode = .cubicBezier
//        
//        chartDataSet.cubicIntensity = 0.1
//        
//        chartDataSet.drawCirclesEnabled = false
//        
//        chartDataSet.valueFont = UIFont(name: "Helvetica", size: 0)!
//        
//        //let gradientColors =
//        
//        //let colorLocations =
//        
//        //guard let gradient =
//        
//        let formatter: ChartFormatter = ChartFormatter()
//        
//        formatter.setValue(values: dataPoints)
//        
//        let xAxis:XAxis = XAxis()
//        
//        xAxis.valueFormatter = formatter
//        
//        lineChartView.xAxis.labelPosition = .bottom
//        
//        lineChartView.xAxis.drawLabelsEnabled = false
//        
//        lineChartView.xAxis.valueFormatter = xAxis.valueFormatter
//        
//        lineChartView.chartDescription?.enabled = true
//        
//        lineChartView.legend.enabled = true
//        
//        lineChartView.rightAxis.enabled = true
//        
//        lineChartView.leftAxis.drawGridLinesEnabled = false
//        
//        lineChartView.leftAxis.drawLabelsEnabled = true
//        
//        lineChartView.data = chartData
//        
//        
//    }
//    
//    var viewColor: UIColor {
//        return UIColor.red.withAlphaComponent(0.5)
//    }
//    
//}
//
//
//
