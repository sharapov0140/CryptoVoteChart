//
//  FavoriteCryptoList.swift
//  CryptoVote
//
//  Created by ZAF on 2/12/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
import Alamofire


private let reuseIdentifier = "Cell"
private let headerHeight : CGFloat = 120.0
private let cellHeight : CGFloat = 66.0
private let netWorthHeight : CGFloat = 45.0

class FavoriteCryptoList: UITableViewController {
    
    
    var repos: Results<Dog>!
    let realm = try! Realm()
//    let gitHub = GitHubAPI()
    var coins = [Dog]()
    var coin: Dog?
    var crypto: CryptoStats?
    var currentKey: String?
    var refreshContrl = UIRefreshControl()
    var cryptoVoteFetchedDataPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Portfolio"
        
  self.navigationController?.navigationBar.isTranslucent = true
        
      //  self.view.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 13.0, *) {
               if traitCollection.userInterfaceStyle == .dark {
                   view.backgroundColor = .clear
             //     navigationItem.rightBarButtonItem?.tintColor = .white
                   view.backgroundColor = UIColor(named: "backgroundColor")
                   tableView.backgroundColor = UIColor(named: "backgroundColor")
               } else {
                view.backgroundColor = .clear
                view.backgroundColor = UIColor(named: "backgroundColor")
               }
               } else {
                   print("nochange")
               }
        
        
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        
        refreshContrl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView?.refreshControl = refreshControl
        
        self.tableView.separatorStyle = .none
        
        self.tableView!.register(FavoriteCryptoListCell.self, forCellReuseIdentifier: reuseIdentifier)
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.title = "Favorites"
        
        tableView.delegate = self
        tableView.dataSource = self
        loadCats()
        
    }
    
    
    @objc func addTapped() {
        
        
        
        self.navigationController?.pushViewController(ChooseCryptoForProtfolio(), animated: true)
    }
    
    @objc func handleRefresh() {
        coins.removeAll(keepingCapacity: false)
        self.currentKey = nil
        self.updatePrice()
        self.refreshContrl.endRefreshing()
        do {
            
            tableView?.reloadData()
            
            
        }
    }
    
    func updatePrice() {
        
  //      let realm = try! Realm()
        
        try! self.realm.write {
            
        
            for symbol in repos {
                guard let rank = symbol["symbol"] as? String else {break}
                print(rank)
                if rank != nil {
                self.fetchData(data: rank)
                }
            }
            
            
//            if let repo = realm.object(ofType: Dog.self, forPrimaryKey: crypto?.symbol) {
//
//                let price = crypto?.price_usd
//                guard price != nil else {return}
//                print(price)
//                repo.price = price!
//            }
        }

        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        loadCats()
        updatePrice()
    }
    
    
    
    
    
    
    
    
    
//    func downloadJSON(completed: @escaping () -> ()) {
//
//        let url = URL(string: "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=100&page=0&tsym=USD")
//        //     let url = URL(string: "https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&limit=100")
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//
//
//            if error == nil {
//                do {
//
//                    let cryptos = try JSONDecoder().decode(cryptoCompJSON.self, from: data!)
//
//
//                    DispatchQueue.main.async {
//
//
//                        self.cryptStat = cryptos
//
//
//                        completed()
//                        self.tableView.reloadData()
//
//                    }
//                }catch {
//                    print("JSON Error", error.localizedDescription)
//                }
//            }
//            }.resume()
//    }

    
    
    
    
    
    

    
    func fetchData(data: String) {
        
        let urlString = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=\(data)&tsyms=USD"

        AF.request(urlString).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let raw = json["RAW"] as? [String: Any],
                   let coinJSON = raw[data] as? [String: Any],
                   let usd = coinJSON["USD"] as? [String: Any],
                   let price = usd["PRICE"] as? Double {
                    
                    let realm = try! Realm()
                    try! realm.write {
                        if let repo = realm.object(ofType: Dog.self, forPrimaryKey: data) {
                            repo.price = price
                        }
                    }
                }
            case .failure(let error):
                print("Error while fetching data: \(error.localizedDescription)")
            }
        }
    }
    
    
    
//    func fetchData(data: String) {
//
//
//
//        Alamofire.Request("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=\(String(describing: data))&tsyms=USD").response { (response) in
//            if let json = response.result.value as? [String:Any] {
//                if let raw = json["RAW"] as? [String:Any] {
//                    if let coinJSON = raw[data] as? [String:Any] {
//                        if let usd = coinJSON["USD"] as? [String:Any] {
//                            if let price = usd["PRICE"] {
//                              //  self.cryptoVoteFetchedDataPrice = price as! Double
//
//
//                                let realm = try! Realm()
//                                try! realm.write {
//                                if let repo = self.realm.object(ofType: Dog.self, forPrimaryKey: data) {
//
//
//
//                                        print(price)
//                                    repo.price = price as! Double
//
//
//                                }
//                                }
//
//                            }
//
//                        }
//                    }
//                }
//
//         //       self.configureDataFromCryptoVote()
//                //          self.delegate?.newPrices?()
//            }
//        }
//
//    }

    
    
    
    func filterCryptoByVote() {
        
   //     let listCrypto =
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return cellHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createHeaderView()
    }
    
    
    
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 45.0)
        //   label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    let gainAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        //   label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        //   label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    func createHeaderView() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: headerHeight))
      //  headerView.backgroundColor = UIColor.white
        let networthLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: netWorthHeight))
        networthLabel.text = "My Crypto Net Worth"
        networthLabel.textAlignment = .center
        headerView.addSubview(networthLabel)
        
//        amountLabel.frame = CGRect(x: 0, y: netWorthHeight, width: view.frame.size.width, height: headerHeight - netWorthHeight)
        
        
        headerView.addSubview(amountLabel)
        amountLabel.anchor(top: networthLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 5, right: 0))
        amountLabel.centerXAnchor.constraint(equalTo: networthLabel.centerXAnchor).isActive = true

        headerView.addSubview(percentageLabel)
        percentageLabel.anchor(top: amountLabel.bottomAnchor, leading: networthLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 50, bottom: 15, right:0))
        
        percentageLabel.centerXAnchor.constraint(equalTo: networthLabel.centerXAnchor).isActive = true

        
        
//        headerView.addSubview(gainAmountLabel)
//        gainAmountLabel.anchor(top: amountLabel.bottomAnchor, leading: networthLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 240, bottom: 15, right:0))
        self.displayNetWorth()
        
        return headerView
    }
    
    
    func displayNetWorth() {
        amountLabel.text = gainNetWorth()
//        percentageLabel.text = "100%"
//
//        gainAmountLabel.text = "^3000"
        
        
    }
    
    
    func netWorthAsString() -> String {
        var netWorth = 0.0
    
        for coin in repos {
            netWorth += coin.amount * Double(coin.price)
            print(netWorth)
            
        }
        
        return doubleToMoneyString(double: netWorth)
    }
    
    func gainNetWorth() -> String {
        
        var netWorth = 0.0
        var gainWorthPercentage = 0.0
        var gainWorth = 0.0
        for coin in repos {
            netWorth += coin.amount * Double(coin.price)
            gainWorthPercentage += Double(round(100*(((coin.amount * Double(coin.price - coin.atPrice))/(coin.amount * coin.atPrice))*100))/100)
            gainWorth +=  Double(round(100*((coin.price - coin.atPrice)*coin.amount))/100)
            
            
            if gainWorth > 0 {
                
            percentageLabel.text = "↑ $\(round(100*gainWorth)/100) (\(round(100*gainWorthPercentage)/100)%)"
                percentageLabel.textColor = UIColor(red: 0.0824, green: 0.5098, blue: 0, alpha: 1.0)
            }
            else if gainWorth == 0 {
            percentageLabel.text = "↓ $0 (0)%"
                percentageLabel.textColor = .gray
            }
            else {
                percentageLabel.text = "↓ $\(gainWorth) (\(gainWorthPercentage)%)"
                percentageLabel.textColor = .red
            }
            
        //    gainAmountLabel.text = "\(gainWorth)"
        }
//
//        if absoluteProfit > 0 {
//            label.text = "↑ $\(profitText) (\(percentText)%)"
//            label.textColor = Colors.positiveGrow
//        } else if absoluteProfit < 0 {
//            label.text = "↓ $\(profitText) (\(percentText)%)"
//            label.textColor = Colors.negativeGrow
//        }
        
        return doubleToMoneyString(double: netWorth)
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
    
    func doubleToPercentageString(double: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .percent
        if double > 0 {
            
            
        }
        if let fancyPrice = formatter.string(from: NSNumber(floatLiteral: double)) {
            return fancyPrice
        } else {
            return "ERROR"
        }
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repos?.count ?? 1
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FavoriteCryptoListCell
        
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.post = repos[indexPath.row]
        
        
        
        return cell
        
        
//        let symbol = repos[indexPath.row].name
//        let price = repos[indexPath.row].price
//        let cryptoAmount = repos[indexPath.row].amount
//
//
//
//        cell.textLabel?.text = symbol
//        cell.detailTextLabel?.text = price
//        cell.imageView?.image = UIImage(named: symbol)
//
//
//
//
//
//        return cell
        
        

        
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        // action one
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            print("Delete tapped")
            self.deleteCrypto(at: indexPath)
            self.percentageLabel.text = " $0 (0)%"
            self.percentageLabel.textColor = .gray
            
            tableView.reloadData()
            
            
        })
        deleteAction.backgroundColor = UIColor.red
        
        
        
        // action two
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let coin = self.repos[indexPath.row]
            
            
            let alert = UIAlertController(title: "How many \(coin.name) do you own?", message: nil, preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "0.5"
                textField.keyboardType = .decimalPad
                //                if self.coin?.amount != 0.0 {
                //                    textField.text = String(coin.amount)
                //                }
            }
            alert.addTextField { (textField) in
                textField.placeholder = "at what price did you buy BTC"
                textField.keyboardType = .decimalPad
//                                if self.coin?.amount != 0.0 {
//                                    textField.text = String(coin.amount)
//                                }
            }
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                guard let text = alert.textFields?[0].text else {return}
                guard let atPrice = alert.textFields?[1].text else {return}
                guard let amount = Double(text) else {return}
                guard let atprice = Double(atPrice) else {return}
                        //    coin.amount = amount
                        let realm = try! Realm()
                        
                        try! self.realm.write {
                            
                            
                            if let repo = realm.object(ofType: Dog.self, forPrimaryKey: coin.symbol) {
                                print(amount)
                                repo.amount = amount
                                
                                repo.atPrice = Double(round(100 * atprice)/100)
                                tableView.reloadData()
                            }
                        }
                        //        UserDefaults.standard.set(amount, forKey: coin.name + "amount")
                        //      self.newPrices()
                    
                
            }))
            self.present(alert, animated: true, completion: nil)
    

            
        })
        editAction.backgroundColor = UIColor.blue
        

        
        return [deleteAction, editAction]
    }

    
    func deleteCrypto(at indexPath: IndexPath) {
        
        if let categoryForDeletion = self.repos?[indexPath.row] {
            
            print(self.repos?[indexPath.row] as Any)
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
    
    
//    func alertAmountCrypto(data: self.coin) {
//
//        //  guard let crypto = crypto else {return}
//
//
//            let alert = UIAlertController(title: "How much \(coin.name) do you own?", message: nil, preferredStyle: .alert)
//            alert.addTextField { (textField) in
//                textField.placeholder = "0.5"
//                textField.keyboardType = .decimalPad
//                //                if self.coin?.amount != 0.0 {
//                //                    textField.text = String(coin.amount)
//                //                }
//            }
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
//                if let text = alert.textFields?[0].text {
//                    if let amount = Double(text) {
//                        //    coin.amount = amount
//                        let realm = try! Realm()
//
//                        try! self.realm.write {
//
//
//                            if let repo = realm.object(ofType: Dog.self, forPrimaryKey: coin.name) {
//                                print(amount)
//                                repo.amount = amount
//                            }
//                        }
//                        //        UserDefaults.standard.set(amount, forKey: coin.name + "amount")
//                        //      self.newPrices()
//                    }
//                }
//            }))
//            self.present(alert, animated: true, completion: nil)
//
//
//    }
    
    func loadCats() {
        
        repos  = realm.objects(Dog.self)
        tableView.reloadData()
        
    }
    

    
    
    
}
