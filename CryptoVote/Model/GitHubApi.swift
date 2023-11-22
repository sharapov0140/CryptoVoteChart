////
////  GitHubApi.swift
////  CryptoVote
////
////  Created by ZAF on 4/25/19.
////  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
////
//
//import Foundation
//import RealmSwift
//
//
//
//let username = "realm"
//
//class GitHubAPI {
//    
//    
//    
//    let repoUrl = URL(string: "https://api.coinmarketcap.com/v1/ticker/")!
//    
//    func startFetching() {
//        DispatchQueue.global(qos: .background).async {[weak self] in
//            guard let this = self else { return }
//            
//            URLSession.shared.dataTask(with: this.repoUrl, completionHandler: { data, response, error in
//                print("updated")
//                if let data = data, let json = try! JSONSerialization.jsonObject(with: data, options: []) as? Array<JSONObject> {
//                    this.persistRepos(json)
//                    
//                }
//                //  delay(seconds: 10, completion: this.startFetching)
//            }).resume()
//        }
//    }
//    
//    func persistRepos(_ json: Array<[String: AnyObject]>) {
//        let realm = try! Realm()
//        try! realm.write {
//            for jsonRepo in json {
//                
//                print(json)
//                guard let rank = (jsonRepo["rank"] as? NSString)?.intValue,
//                    let price_usd = jsonRepo["price_usd"] as? String,
//                    let name = jsonRepo["name"] as? String
//                    
//                    else {
//                        break
//                }
//                if let repo = realm.object(ofType: Dog.self, forPrimaryKey: rank) {
//                    print(repo)
//                    //update
//                    
//                    
////                    if repo.price != price_usd {
////                        repo.price = price_usd
////                    }
//                } else {
//                    //insert
//                    //                    let repo = Repo()
//                    //                    repo.name = name
//                    //                    repo.price_usd = price_usd
//                    //                    repo.rank = Int(rank)
//                    //
//                    //                    realm.add(repo)
//                }
//            }
//        }
//    }
//}
//
