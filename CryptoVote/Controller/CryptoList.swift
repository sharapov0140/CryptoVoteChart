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


private let reuseIdentifer = "CryptoListCell"

class CryptoList: UITableViewController, UISearchBarDelegate  {
    
    
    
 //   var refreshControl = UIRefreshControl()
    var searchBar = UISearchBar()
    var inSearchMode = false
    var currentKey: String?
    var repos: Results<Dog>!
    let realm = try! Realm()
  //  let gitHub = GitHubAPI()
    var coins = [Dog]()
    var coin: Dog?
    var cryptStat: cryptoCoinCapJson?
    var crypto: [cryptoCoinCapJsonPeriod]?
    var cryptos = [cryptoCoinCapJson]()
    let myDog = Dog()
    var arraySymbol = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.searchController = UISearchController(searchResultsController: CryptoList())
//
//
//        navigationItem.title = "Portfolio"
               
         
        
        self.navigationController?.navigationBar.isTranslucent = true 
        
        self.tableView.separatorStyle = .none
//        view.backgroundColor = .clear
//        view.backgroundColor = UIColor(named: "backgroundColor")
//        tableView.backgroundColor = UIColor(named: "backgroundColor")
        
        view.backgroundColor = .white
        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .clear
            view.backgroundColor = UIColor(named: "backgroundColor")
            tableView.backgroundColor = UIColor(named: "backgroundColor")
        } else {
            view.backgroundColor = .clear
            view.backgroundColor = UIColor(named: "backgroundColor")
        }
        } else {
            print("nochange")
        }
            
            
            

        
    //    interstitial = createAndLoadInterstitial()
        
   //     let adRequest = GADRequest()

        
        
        
        downloadJSON {
            self.tableView.reloadData()
            }

        self.refreshControl = UIRefreshControl()
        
        self.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.tableView?.refreshControl = refreshControl
        
        self.tableView!.register(CryptoListCell.self, forCellReuseIdentifier: reuseIdentifer)
        
        searchBars()
     
        

    }
    
    

    
    
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

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true


    }


    
    
    
    func searchBars()
    {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        

       
        searchBar.placeholder = "Search"
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
          //  searchBar.placeholder = "Search"
            
            
            
            inSearchMode = false
    
        //    collectionViewLayout = true
            tableView.isHidden = false
    
        //    collectionView.separatorColor = .clear
            tableView.reloadData()
        }
    
    

    
    
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




    }
    
    

    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cryptStat?.data.count ?? 0
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! CryptoListCell

        

        
         cell.crypto = cryptStat?.data[indexPath.row]
        
        
        return cell
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    let selectedCrypto = SelectedCrypto()
        let selectedCrypto = CoinDetailsViewController()
        //     feedVC.viewSinglePost = true\
        let cryptos = self.cryptStat?.data[indexPath.row]
        
        
        selectedCrypto.crypto = cryptos
        
        navigationController?.pushViewController(selectedCrypto, animated: true)
    }
    
    
    

    
    
    
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


struct cryptoCoinCapJson: Decodable {
    
    var data: [cryptoCoinCapJsonPeriod]
    
}


struct cryptoCoinCapJsonPeriod: Decodable {
    
    let id: String?
    let priceUsd: String?
    let symbol: String?
    let marketCapUsd: String?
    let supply: String?
    let maxSupply: String?
    let volumeUsd24Hr: String?
    let changePercent24Hr: String?
    init(id: String, priceUsd: String, symbol: String, marketCapUsd: String, supply: String, maxSupply: String, volumeUsd24Hr: String, changePercent24Hr: String){
        
        self.id = id
        self.priceUsd = priceUsd
        self.symbol = symbol
        self.marketCapUsd = marketCapUsd
        self.supply = supply
        self.maxSupply = maxSupply
        self.volumeUsd24Hr = volumeUsd24Hr
        self.changePercent24Hr = changePercent24Hr
    }
    
}




struct cryptoCoinCapSingleJson: Decodable {
    
    var data: cryptoCoinCapJsonSinglePeriod
    
}


struct cryptoCoinCapJsonSinglePeriod: Decodable {
    
    let id: String?
    let priceUsd: String?
    let symbol: String?
    let marketCapUsd: String?
    let supply: String?
    let maxSupply: String?
    let volumeUsd24Hr: String?
    let changePercent24Hr: String?
   
    
    init(id: String, priceUsd: String, symbol: String, marketCapUsd: String, supply: String, maxSupply: String, volumeUsd24Hr: String, changePercent24Hr: String){
        
        self.id = id
        self.priceUsd = priceUsd
        self.symbol = symbol
        self.marketCapUsd = marketCapUsd
        self.supply = supply
        self.maxSupply = maxSupply
        self.volumeUsd24Hr = volumeUsd24Hr
        self.changePercent24Hr = changePercent24Hr
    }
    
}






