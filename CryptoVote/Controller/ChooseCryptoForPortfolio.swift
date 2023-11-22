//
//  ViewController.swift
//  cryptoTest
//
//  Created by ZAF on 4/6/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import UIKit
import RealmSwift
import Realm





private let reuseIdentifer = "ChooseCryptoForPortfolioCell"

protocol CoinsCatalogViewControllerDelegate: AnyObject {
    func coinsCatalogViewController(controller: ChooseCryptoForProtfolio, didSelect coin: cryptoCoinCapJson)
}

class ChooseCryptoForProtfolio: UITableViewController, UISearchBarDelegate  {
    
    
    //   var refreshControl = UIRefreshControl()
    weak var delegate: CoinsCatalogViewControllerDelegate?
    var searchBar = UISearchBar()
    var inSearchMode = false
    var currentKey: String?
    var repos: Results<Dog>!
    let realm = try! Realm()
 //   let gitHub = GitHubAPI()
    var coins = [Dog]()
    var coin: Dog?
    var cryptStat: cryptoCoinCapJson?
    var crypto: [cryptoCoinCapJsonPeriod]? = []
    
//    private var filteredItems: [cryptoCompJSON] = [] {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
//    private var items: [CoinList] = []
//    private var filteredItems: [CoinList] = [] {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    private var asetes = CoinList(id:"", name: "", symbol: "", priceUSD: "")
    
    var cryptos = [cryptoCoinCapJson]()
    
    
    let myDog = Dog()
    
    var arraySymbol = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
         self.navigationController?.navigationBar.isTranslucent = true
        
       // self.view.translatesAutoresizingMaskIntoConstraints = false
        downloadJSON {
            self.tableView.reloadData()
        }
        //   self.updatePrice()
        // Do any additional setup after loading the view, typically from a nib.
        //    self.delegate = self
        
      //  self.tableView.register(ChooseCryptoForProtfolio.self, forCellWithReuseIdentifier: reuseIdentifer)
        self.tableView!.register(ChooseCryptoForPortfolioCell.self, forCellReuseIdentifier: reuseIdentifer)
        self.refreshControl = UIRefreshControl()
        
        self.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.tableView?.refreshControl = refreshControl
        
        
        
        searchBars()
        
        
        //     createToolbar()
        //        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CryptoList.dismissKeyboard))
        //        self.collectionView.addGestureRecognizer(tap)
    }
    
    
    //    func updatePrice() {
    //
    //        let realm = try! Realm()
    //
    //        try! self.realm.write {
    //
    //
    //            let symbol = cryptStat?.symbol
    //            print(symbol)
    //
    //            if let repo = realm.object(ofType: Dog.self, forPrimaryKey: cryptStat?.symbol) {
    //
    //                let price = cryptStat?.price_usd
    //                guard price != nil else {return}
    //                print(price)
    //                repo.price = price!
    //            }
    //        }
    //
    //
    //    }
    
    
    
    
    
    //    func configureSearchBar() {
    //        searchBar.sizeToFit()
    //        searchBar.delegate = self
    //        navigationItem.titleView = searchBar
    //        searchBar.barTintColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    //        searchBar.tintColor = .black
    //    }
    
    
    @objc func handleRefresh() {
        cryptos.removeAll(keepingCapacity: false)
        self.currentKey = nil
        self.downloadJSON {
            self.tableView.reloadData()
        }
        self.refreshControl?.endRefreshing()
        do {
            
            self.tableView?.reloadData()
            
            
        }
    }
    //
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        
        //    fetchUsers()
        
        //    collectionView.isHidden = true
        //    collectionViewEnabled = false
        
        //   tableView.separatorColor = .lightGray
    }
    //
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //
    //        let searchText = searchText.lowercased()
    //
    //        if searchText.isEmpty || searchText == " " {
    //            inSearchMode = false
    //            collectionView.reloadData()
    //        } else {
    //            inSearchMode = true
    //       //     filteredUsers = users.filter({ (user) -> Bool in
    //                return // user.username.contains(searchText)
    //            }
    //            collectionView.reloadData()
    //        }
    //
    //
    //    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //        searchBar.endEditing(true)
    //        searchBar.showsCancelButton = false
    //        searchBar.text = nil
    //        inSearchMode = false
    //
    //    //    collectionViewLayout = true
    //        collectionView.isHidden = false
    //
    //    //    collectionView.separatorColor = .clear
    //        collectionView.reloadData()
    //    }
    
    
    
    
    func searchBars()
    {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        
        //        searchBar.delegate = self as? UISearchBarDelegate
        //        searchBar.showsScopeBar = true
        //        searchBar.tintColor = UIColor.lightGray
        
        //  self.collectionView.tableHeaderView = searchBar
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        searchBar.barTintColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        searchBar.tintColor = UIColor(named: "colorLetter")
        searchBar.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchText.isEmpty {
            inSearchMode = false
            downloadJSON(completed: {
                _ = ((String,String) -> ()).self
                self.tableView.reloadData()
                //  self.textField.tintColor = .clear
                
                
                //    searchBar.tintColor = .clear
                
            })
        }
        else{
            if searchBar.selectedScopeButtonIndex == 0 {
                cryptStat!.data = cryptStat!.data.filter({ (name) -> Bool in
                    let name = name
                    
                    return (name.symbol?.lowercased().contains(searchText.lowercased()) ?? false)
                    
                })
            }
        }
        self.tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        searchBar.text = nil
        inSearchMode = false
        
        //    collectionViewLayout = true
        tableView.isHidden = false
        
        //    collectionView.separatorColor = .clear
        tableView.reloadData()
    }
    
    
    //    func createToolbar() {
    //
    ////     //   let toolBar = UIToolbar()
    ////        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    ////        toolBar.sizeToFit()
    ////
    ////
    ////        let cancle = UIBarButtonItem(title: "Cancle", style: UIBarButtonItem.Style.done, target: self, action: #selector(CryptoList.dismissKeyboard))
    ////
    ////        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    ////
    ////        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(CryptoList.dismissKeyboard))
    ////
    ////
    ////
    ////        toolBar.setItems([cancle, flexButton, doneButton], animated: true)
    ////        toolBar.sizeToFit()
    ////
    ////
    ////
    ////
    ////        //Customizations
    ////        toolBar.barTintColor = .gray
    ////
    ////        toolBar.tintColor = .white
    ////
    ////
    ////
    ////
    ////        toolBar.isUserInteractionEnabled = true
    ////
    ////        searchBar.inputAccessoryView = toolBar
    //
    //        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    //        numberToolbar.barStyle = .default
    //        numberToolbar.items = [
    //            UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelNumberPad)),
    //            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
    //            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneWithNumberPad))]
    //        numberToolbar.sizeToFit()
    //        searchBar.inputAccessoryView = numberToolbar
    //
    //
    //    }
    
    
    @objc func cancelNumberPad() {
        searchBar.endEditing(true)
        //    searchBar.showsCancelButton = false
        searchBar.text = nil
        //    inSearchMode = false
        
        //    collectionViewLayout = true
        tableView.isHidden = false
        
        //    collectionView.separatorColor = .clear
        tableView.reloadData()
    }
    @objc func doneWithNumberPad() {
        //Done with number pad
    }
    
    @objc func dismissKeyboard() {
        
        searchBar.endEditing(true)
        //    searchBar.showsCancelButton = false
        searchBar.text = nil
        //    inSearchMode = false
        
        //    collectionViewLayout = true
        tableView.isHidden = false
        
        //    collectionView.separatorColor = .clear
        tableView.reloadData()
        
        
        
        
        //        self.inSearchMode = false
        //     //   self.collectionView.endEditing(true)
        //        self.searchBar.endEditing(true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        let dummyCell = ChooseCryptoForPortfolioCell(frame: frame)
        dummyCell.crypto = cryptStat?.data[indexPath.item]
        dummyCell.layoutIfNeeded()
        
        let targetSize = CGSize(width: view.frame.width, height: 50)
        let estimatedSize = dummyCell.systemLayoutSizeFitting(targetSize)
        
        let height = max(40, estimatedSize.height)
        return CGSize(width: view.frame.width, height: height)
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cryptStat?.data.count ?? 0
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! ChooseCryptoForPortfolioCell
        
        
        
        
        cell.crypto = cryptStat?.data[indexPath.row]
        
        let indexPath = IndexPath(row: 4, section: 0)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        
        //   cryptStat?.Data.remove(at: 4)
        
        
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //    let selectedCrypto = SelectedCrypto()
      //  let selectedCrypto = SelectedCrypto()
        //     feedVC.viewSinglePost = true\
       // view.endEditing(true)
      //  guard let cryptos = self.cryptStat?.Data[indexPath.row] else {return}
        
        
//        asetes.name = cryptos.CoinInfo.FullName
//        print(cryptos.CoinInfo.FullName)
//        print(asetes.name)
        
        
        
        
        // Save data in another struct
        
        
      //  delegate?.coinsCatalogViewController(controller: self, didSelect: cryptos)
        dismiss(animated: true, completion: nil)
     //   selectedCrypto.crypto = cryptos
        
    //    navigationController?.pushViewController(selectedCrypto, animated: true)
        
        
        
        let selectedCrypto = ProtfolioAdjust()
        //     feedVC.viewSinglePost = true\
        let cryptos = self.cryptStat?.data[indexPath.row]
        
        
        selectedCrypto.crypto = cryptos
        
        navigationController?.pushViewController(selectedCrypto, animated: true)
        
        
        
        
    }
    
    
    
    //    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    //
    //
    //
    //
    //
    //        // action one
    //        let deleteAction = UITableViewRowAction(style: .default, title: "Add to watchlist", handler: { (action, indexPath) in
    //            print("Add tapped")
    //            self.addFavCrypto(at: indexPath)
    //            tableView.reloadData()
    //
    //
    //        })
    //        deleteAction.backgroundColor = UIColor.green
    //
    //        return [deleteAction]
    //    }
    
    
    
    
    //    func addFavCrypto(at indexPath: IndexPath) {
    //
    //
    //        print(cryptStat?.Data[indexPath.item].CoinInfo.Name ?? "")
    //
    //      //  let distinctJSON = cryptStat?.Data.first?.CoinInfo.Name
    //        let distinctIDs = { [weak self] in self?.realm.objects(Dog.self).value(forKey: "symbol") as! [String] }
    //
    //            if distinctIDs().contains((cryptStat?.Data[indexPath.item].CoinInfo.Name ?? "") ) {
    //
    //            print("Found a copy")
    //        }
    //        else {
    //
    //                guard let symbol = cryptStat?.Data[indexPath.item].CoinInfo.Name else {return}
    //                guard let price = cryptStat?.Data[indexPath.item].RAW.USD.PRICE else {return}
    //                guard let name = cryptStat?.Data[indexPath.item].CoinInfo.FullName else {return}
    //                print(price)
    //
    //
    //                //Mark: might break down because price is forced Float
    //                myDog.price = Double(price)
    //                myDog.symbol = symbol
    //                myDog.name = name
    //
    //                print(price)
    //                print(symbol)
    //                print(name)
    //            do {
    //
    //
    //
    //
    //                try! realm.write {
    //                    realm.add(myDog)
    //                    self.tableView.reloadData()
    //                }
    //            } catch {
    //                print("error")
    //            }
    //
    //
    //        }
    //
    //
    //
    //    }
    
    
    
  func downloadJSON(completed: @escaping () -> ()) {
            
            let url = URL(string: "https://api.coincap.io/v2/assets")
            //     let url = URL(string: "https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&limit=100")
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
                guard let data = data else {return}
                
                if error == nil {
                    do {
                        
                        let cryptos = try JSONDecoder().decode(cryptoCoinCapJson.self, from: data)
                        
                        
                        DispatchQueue.main.async {
                            
                            
                            self.cryptStat = cryptos
                            
                            
                            
                            
                            completed()
                            self.tableView.reloadData()
                            
                        }
                    }catch {
                        print("JSON Error", error.localizedDescription)
                    }
                }
                }.resume()
        }
        
    }


//struct cryptoCompJSON: Decodable {
//
//    var Data: [cryptoCompJSONPeriod]
//
//}
//
//struct cryptoCompJSONPeriod: Decodable {
//
//    let CoinInfo: NameCrypto
//    let RAW: Usd
//
//
//
//}
//
//
//struct NameCrypto: Decodable {
//    let FullName: String
//    let Name: String
//
//    init(FullName: String, Name: String){
//        self.FullName = FullName
//        self.Name = Name
//    }
//}
//
//
//struct Usd: Decodable {
//    let USD: Price
//
//
//}
//
//struct Price: Decodable {
//    let MKTCAP: Double
//    let TOTALVOLUME24H: Double
//    let PRICE: Double
//    let HIGH24HOUR: Double
//    let LOW24HOUR: Double
//    let SUPPLY: Double
//
//
//    init(PRICE:Double, MKTCAP: Double, TOTALVOLUME24H: Double, HIGH24HOUR: Double, LOW24HOUR: Double, SUPPLY: Double)
//    {
//        self.TOTALVOLUME24H = TOTALVOLUME24H
//        self.PRICE = PRICE
//        self.MKTCAP = MKTCAP
//        self.HIGH24HOUR = HIGH24HOUR
//        self.LOW24HOUR = LOW24HOUR
//        self.SUPPLY = SUPPLY
//    }
//
//}




