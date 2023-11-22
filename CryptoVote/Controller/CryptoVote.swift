//
//  ViewController.swift
//  cryptoTest
//
//  Created by ZAF on 4/6/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import UIKit
import Firebase


typealias JSONObject = [String: AnyObject]
private let cellHeight : CGFloat = 60

private let reuseIdentifer = "CryptoListCell"

protocol FeedCellDelegate {
    
    
    
    

    
    
    
    
    func handleUpvoteTapped(for cell: CryptoVoteCell)
    
    func handleConfigureUpvoteButton(for cell: CryptoVoteCell)
    
 //    func handleShowUpvotes(for cell: CryptoVoteCell)
    
}

class CryptoVote: UITableViewController, UISearchBarDelegate, FeedCellDelegate  {
  

    
    

    
   
    
   // var refreshControl = UIRefreshControl()

    var searchBar = UISearchBar()
    var inSearchMode = false
    var currentKey: String?
    var post: Post?
    var posts = [Post]()
    var cryptos = [CryptoStats]()
    
  
    
    
    
    
    
    func handleUpvoteTapped(for cell: CryptoVoteCell) {
       
        let uid = Auth.auth().currentUser?.uid
        if uid != nil {
            self.reloadUser()
//            print(Auth.auth().currentUser?.isEmailVerified ?? <#default value#>)
            if Auth.auth().currentUser?.isEmailVerified == true {
                print("Congrats you succfesully signed up")
                
                //  self.dismiss(animated: true, completion: nil)
                
            
            
        guard let post = cell.crypto else { return }
        print(post)
        if post.didUpvote {
            // handle unupvote post
            cell.upvoteButton.isExclusiveTouch = true
           
                post.adjustUpvotes(addUpvote: false, completion: { (upvotes) in

                    if upvotes > 1 {
                        cell.upvoteLabel.text = "\(upvotes) upvotes"
                        
                    } else {
                        cell.upvoteLabel.text = "\(upvotes) upvote"
                    }

                    cell.upvoteButton.setImage(#imageLiteral(resourceName: "star_white-1"), for: .normal)
                    cell.upvoteButton.isUserInteractionEnabled = true
                })
                

            
        } else {
            // handle upvote post
            
            post.adjustUpvotes(addUpvote: true, completion: { (upvotes) in
                
                if upvotes > 1 {
                    cell.upvoteLabel.text = "\(upvotes) upvotes"
                    
                } else {
                    cell.upvoteLabel.text = "\(upvotes) upvote"
                }
                cell.upvoteButton.isExclusiveTouch = true
                cell.upvoteButton.setImage(#imageLiteral(resourceName: "star_black-1"), for: .normal)
                cell.upvoteButton.isUserInteractionEnabled = true
            })
        }
                
            } else  {
                self.conformEmailLink()
            }
            
        } else {
            signUpAlert()
        }
        
    }
    

    
    func handleConfigureUpvoteButton(for cell: CryptoVoteCell) {
        
        
        
        guard let post = cell.crypto else { return }
        guard let symbol = post.symbol else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        USER_UPVOTES_REF.child(currentUid).observeSingleEvent(of: .value) { (snapshot) in
            
            // check if post id exists in user-upvote structure
            if snapshot.hasChild(symbol) {
                post.didUpvote = true
                cell.upvoteButton.setImage(#imageLiteral(resourceName: "star_black-1"), for: .normal)
            } else {
                post.didUpvote = false
                cell.upvoteButton.setImage(#imageLiteral(resourceName: "star_white-1"), for: .normal)
            }
        }
        
        
    }

    
    
    func reloadUser(_ callback: ((Error?) -> ())? = nil){
        Auth.auth().currentUser?.reload(completion: { (error) in
            callback?(error)
            
        })
    }

    
    func conformEmailLink() {
        
        let alert = UIAlertController(title: "Please click the link that we sent to your email so we could confirm your email", message: nil, preferredStyle: .alert)
        
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            
            self.signUpAlert()
            
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

    
    
    
    override func viewWillAppear(_ animated: Bool) {
   //     refresh()
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let blurEffect = UIBlurEffect(style: .regular)
//        collectionView.collectionViewLayout = UIVisualEffectView(effect: blurEffect)
//        
   //     checkIfLoggedIn()
        
  
        
   self.tableView.separatorStyle = .none
        
        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
            
            view.backgroundColor = UIColor(named: "backgroundColor")
            tableView.backgroundColor = UIColor(named: "backgroundColor")
            
        } else {
view.backgroundColor = UIColor(named: "backgroundColor")
        }
        } else {
            print("nochange")
        }
        
        //TODO: google add below
//        let adRequest = GADRequest()
//        adRequest.testDevices = [ kGADSimulatorID, "2077ef9a63d2b398840261c8221a0c9b" ]
//        adBannerView.load(GADRequest())
        
        refresh()
        
        searchBars()
        fetchPosts()
        //        downloadJSON {
        //            self.collectionView.reloadData()
        //        }
        
        
        self.tableView!.register(CryptoVoteCell.self, forCellReuseIdentifier: reuseIdentifer)
        
        
       
        
    }
    
  
    
    func refresh() {
        
        self.refreshControl = UIRefreshControl()
        userConformationCheck()
         self.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
         tableView?.refreshControl = refreshControl
        
    }
    
    func userConformationCheck() {
        let user = Auth.auth().currentUser?.uid
        if user != nil {
            self.reloadUser()
            
            if Auth.auth().currentUser?.isEmailVerified == true {
                print("Congrats you succfesully signed up")
                
                //  self.dismiss(animated: true, completion: nil)
                
            } else  {
                self.conformEmailLink()
            }
        }
        else {
            self.tabBarItem.isEnabled = true
            signUpAlert()
        }
    }
    
    
    @objc func handleRefresh() {
        posts.removeAll(keepingCapacity: false)
        self.currentKey = nil
        fetchPosts()
        self.refreshControl?.endRefreshing()
        self.tableView?.reloadData()
      
    }
    
    
    func signUpAlert() {
        
        //  guard let crypto = crypto else {return}
      
            let alert = UIAlertController(title: "Do you want to upvote your favorite crypto?", message: nil, preferredStyle: .alert)
        
            
            alert.addAction(UIAlertAction(title: "Not now", style: .default, handler: { (action) in

                
                
                
                
            }))
        alert.addAction(UIAlertAction(title: "Log In", style: .default, handler: { (action) in
            
            
                        DispatchQueue.main.async {
                            let loginVC = LoginVC()
                            let navController = UINavigationController(rootViewController: loginVC)
                            self.present(navController, animated: true, completion: nil)
                        }
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Sign Up", style: .default, handler: { (action) in
            
            
                        DispatchQueue.main.async {
                            let signUpVC = SignUpVC()
                            let navController = UINavigationController(rootViewController: signUpVC)
                            self.present(navController, animated: true, completion: nil)
                        }
            
            
        }))
            self.present(alert, animated: true, completion: nil)
        
        
    }
    
//    func checkIfLoggedIn(style: UIBlurEffect.Style = .extraLight) -> UIVisualEffectView {
//            let blurEffect = UIBlurEffect(style: style)
//            collectionView.backgroundView = UIVisualEffectView(effect: blurEffect)
//
//          //  addSubview(blurBackground)
//
//            blurBackground.translatesAutoresizingMaskIntoConstraints = false
////            blurBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
////            blurBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
////            blurBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
////            blurBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//
//            return blurBackground
//        }
//    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true

    }


    func searchBars() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))

        //        searchBar.delegate = self as? UISearchBarDelegate
        //        searchBar.showsScopeBar = true
        //        searchBar.tintColor = UIColor.lightGray

        //  self.collectionView.tableHeaderView = searchBar
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
//            downloadJSON(completed: {
//                _ = ((String,String) -> ()).self
//                self.collectionView.reloadData()
//
//            })
            self.handleRefresh()
           
            
        }
        else{
            if searchBar.selectedScopeButtonIndex == 0 {
                posts = posts.filter({ (name) -> Bool in
                    return (name.symbol.lowercased().contains(searchText.lowercased()))

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

        self.handleRefresh()
        
        
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




        //        self.inSearchMode = false
        //     //   self.collectionView.endEditing(true)
        //        self.searchBar.endEditing(true)
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 75)
//        let dummyCell = CryptoVoteCell(frame: frame)
//        dummyCell.crypto = posts[indexPath.item]
//        dummyCell.layoutIfNeeded()
//
//        let targetSize = CGSize(width: view.frame.width, height: 75)
//        let estimatedSize = dummyCell.systemLayoutSizeFitting(targetSize)
//
//        let height = max(75, estimatedSize.height)
//        return CGSize(width: view.frame.width, height: height)
//    }
//
       

      
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return cellHeight
    }
    
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
             return posts.count
            
        }
        
        
        
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! CryptoVoteCell

            
            

            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cell.delegate = self
            
            self.posts.sort() { $0.upvotes > $1.upvotes }
            
            cell.crypto = posts[indexPath.item]
            
            return cell
        
        }
        
        
//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //    let selectedCrypto = SelectedCrypto()
//           let selectedCrypto = CoinDetailsViewController()
//            //     feedVC.viewSinglePost = true
//            selectedCrypto.votedCrypto = posts[indexPath.item]
//            navigationController?.pushViewController(selectedCrypto, animated: true)
//        }
    
    
    
    
    
    
    //    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! CommentCell
    //
    //        handleHashtagTapped(forCell: cell)
    //
    //        handleMentionTapped(forCell: cell)
    //
    //        cell.comment = comments[indexPath.item]
    //
    //        return cell
    //    }
    
    


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func  fetchPosts() {
//        guard let currentUid = Auth.auth().currentUser?.uid else { return }
//
//        if currentKey == nil {
//            USER_FEED_REF.queryLimited(toLast: 5).observeSingleEvent(of: .value, with: { (snapshot) in
//                self.collectionView?.refreshControl?.endRefreshing()
//
//                guard let first = snapshot.children.allObjects.first as? DataSnapshot else { return }
//                guard let allObjects = snapshot.children.allObjects as? [DataSnapshot] else { return }
//                print(allObjects)
//                allObjects.forEach({ (snapshot) in
//                    let postId = snapshot.key
//                    print(postId)
//                    self.fetchPost(withPostId: postId)
//                })
//                self.currentKey = first.key
//            })
//        } else {
//
//            USER_FEED_REF.child(currentUid).queryOrderedByKey().queryEnding(atValue: self.currentKey).queryLimited(toLast: 6).observeSingleEvent(of: .value, with: { (snapshot) in
//
//                guard let first = snapshot.children.allObjects.first as? DataSnapshot else { return }
//                guard let allObjects = snapshot.children.allObjects as? [DataSnapshot] else { return }
//
//                allObjects.forEach({ (snapshot) in
//                    let postId = snapshot.key
//                    if postId != self.currentKey {
//                        self.fetchPost(withPostId: postId)
//                    }
//                })
//                self.currentKey = first.key
//            })
//        }
//    }

    
    func fetchPost(withSymbol symbol: String) {
        Database.fetchPost(with: symbol) { (post) in
            
            
            self.posts.append(post)
            
//            self.posts.sort(by: { (post1, post2) -> Bool in
//                return post1.creationDate > post2.creationDate
//            })
            self.tableView?.reloadData()
        }
    }
    
    
    
    func handleConfigureLikeButton(for cell: CryptoVoteCell) {
        
        guard let post = cell.crypto else { return }
        guard let postId = post.postId else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        USER_UPVOTES_REF.child(currentUid).observeSingleEvent(of: .value) { (snapshot) in
            
            // check if post id exists in user-like structure
            if snapshot.hasChild(postId) {
                post.didUpvote = true
                cell.upvoteButton.setImage(#imageLiteral(resourceName: "like_selected"), for: .normal)
            } else {
                post.didUpvote = false
                cell.upvoteButton.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
            }
        }
    }
    
    
    
    
    func fetchPosts() {


   //     guard let uid = Auth.auth().currentUser?.uid else { return }

   //     print(uid)

        let ref = Database.database().reference().child("posts")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            //print(snapshot.value)


            let userID = Auth.auth().currentUser?.uid
   //         ref.child("posts").observeSingleEvent(of: .value, with: { (snapshot) in

            print(snapshot)
            guard let dictionaries = snapshot.value as? [String: Any] else { return }

            dictionaries.forEach({ (key, value) in
                //print("Key \(key), Value: \(value)")

                guard let dictionary = value as? [String: Any] else { return }
                let symbol = key
                print(symbol)
              
                let post = Post(symbol: symbol, dictionary: dictionary as Dictionary<String, AnyObject>)
                self.posts.append(post)
                print(post)

            })
                
 //           })

            self.tableView?.reloadData()

        }) { (err) in
            print("Failed to fetch posts:", err)
        }
    }

//
//
//
//
    
//        ref = Database.database().reference()
//   //     let userID = Auth.auth().currentUser?.uid
//        ref.child("crypto-list").observeSingleEvent(of: .value, with: { (snapshot) in
//
//
//            guard let value = snapshot.value as? [String : AnyObject] else {return}
//
        //    let username = value["BTC"] as? String ?? ""
         //   let user = User(username: username)
//
//            value.forEach({ (key, value) in
//                let cryptos = key
//
//                    self.crypto.append(cryptos)
//
//                self.tableView.reloadData()
//                print(self.crypto)
//            })
            
       //     print(username)
//            guard let allObjects = snapshot.children.allObjects as? [DataSnapshot] else { return }
//            allObjects.forEach({ (snapshot) in
//                self.crypto = [snapshot.key]
//                print(self.crypto)
//                tableView.reloadData()
//            })
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//    }
    
    
}
    
    


extension Database {
    
    static func fetchUser(with uid: String, completion: @escaping(User) -> ()) {
        
        USER_REF.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? Dictionary<String, AnyObject> else { return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
    
    static func fetchPost(with symbol: String, completion: @escaping(Post) -> ()) {
        
        POSTS_REF.child(symbol).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? Dictionary<String, AnyObject> else { return }
            guard let ownerUid = dictionary["ownerUid"] as? String else { return }
            
            Database.fetchUser(with: ownerUid, completion: { (user) in
                let post = Post(symbol: symbol, dictionary: dictionary)
                completion(post)
            })
        }
    }
}




