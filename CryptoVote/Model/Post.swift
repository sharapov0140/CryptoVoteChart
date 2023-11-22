//
//  Post.swift
//  CryptoVote
//
//  Created by ZAF on 4/3/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//


import Firebase
import Foundation




//struct Post {
//    var symbol: String!
//    init(dictionary: [String: Any]) {
//        self.symbol = dictionary["symbol"] as? String ?? ""
//
//
//    }
//}



class Post {

    var caption: String!
    var symbol: String!
    var upvotes: Int!
    var price: Double!
    var image = UIImage()
//  var creationDate: Date!
    
    var postId: String!
    var price_usd: String!
    var didUpvote = false

    init(symbol: String!, dictionary: Dictionary<String, AnyObject>) {

        self.symbol = symbol
        
         
        
        if let caption = dictionary["c"] as? String {
            self.caption = caption
        }

        if let symbol = dictionary["s"] as? String {
            self.symbol = symbol
        }

        if let upvotes = dictionary["v"] as? Int {
            self.upvotes = upvotes
        }
        
        
        
        if let price_usd = dictionary["price_usd"] as? String {
            self.price_usd = price_usd
        }
        if let price = dictionary["price"] as? Double {
            self.price = price
        }
            }
//
    func adjustUpvotes(addUpvote: Bool, completion: @escaping(Int) -> ()) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        // UPDATE: Unwrap post id to work with firebase
        
        guard let postId = self.symbol else { return }
        
        if addUpvote {
            USER_UPVOTES_REF.child(currentUid).updateChildValues([postId: 1], withCompletionBlock: { (err, ref) in
          //      self.sendUpvoteNotificationToServer()
                
                POST_UPVOTES_REF.child(postId).updateChildValues([currentUid: 1], withCompletionBlock: { (err, ref) in
                    self.upvotes = self.upvotes + 1
                    self.didUpvote = true
                    POSTS_REF.child(postId).child("v").setValue(self.upvotes)
                    completion(self.upvotes)
                })
            })
        }
        else {
    USER_UPVOTES_REF.child(currentUid).child(postId).observeSingleEvent(of: .value, with: { (snapshot) in
        if snapshot.value is String {
                   //NOTIFICATIONS_REF.child(self.ownerUid).child(notificationID).removeValue(completionBlock: { (err, ref) in
                    
                        self.removeUpvote(withCompletion: { (upvotes) in
                            completion(upvotes)
                        })
             //       })
                } else {
                    self.removeUpvote(withCompletion: { (upvotes) in
                        completion(upvotes)
                    })
                }
            })
        }
    }

    
    
    func removeUpvote(withCompletion completion: @escaping (Int) -> ()) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        USER_UPVOTES_REF.child(currentUid).child(self.symbol).removeValue(completionBlock: { (err, ref) in

            POST_UPVOTES_REF.child(self.symbol).child(currentUid).removeValue(completionBlock: { (err, ref) in
                guard self.upvotes > 0 else { return }
                self.upvotes = self.upvotes - 1
                self.didUpvote = false
                POSTS_REF.child(self.symbol).child("v").setValue(self.upvotes)
                completion(self.upvotes)
            })
        })
    }
}
//
////    func deletePost() {
////        guard let currentUid = Auth.auth().currentUser?.uid else { return }
////        
////        Storage.storage().reference(forURL: self.imageUrl ?? "").delete(completion: nil)
////        
////        USER_FOLLOWER_REF.child(currentUid).observe(.childAdded) { (snapshot) in
////            let followerUid = snapshot.key
////            USER_FEED_REF.child(followerUid).child(self.postId).removeValue()
////        }
////        
////        USER_FEED_REF.child(currentUid).child(postId).removeValue()
////        
////        USER_POSTS_REF.child(currentUid).child(postId).removeValue()
////        
////        POST_LIKES_REF.child(postId).observe(.childAdded) { (snapshot) in
////            let uid = snapshot.key
////            
////            USER_LIKES_REF.child(uid).child(self.postId).observeSingleEvent(of: .value, with: { (snapshot) in
////                guard let notificationId = snapshot.value as? String else { return }
////                
////                NOTIFICATIONS_REF.child(self.ownerUid).child(notificationId).removeValue(completionBlock: { (err, ref) in
////                    
////                    POST_LIKES_REF.child(self.postId).removeValue()
////                    
////                    USER_LIKES_REF.child(uid).child(self.postId).removeValue()
////                })
////            })
////        }
////        
////        let words = caption.components(separatedBy: .whitespacesAndNewlines)
////        for var word in words {
////            if word.hasPrefix("#") {
////                
////                word = word.trimmingCharacters(in: .punctuationCharacters)
////                word = word.trimmingCharacters(in: .symbols)
////                
////                HASHTAG_POST_REF.child(word).child(postId).removeValue()
////            }
////        }
////        
////        COMMENT_REF.child(postId).removeValue()
////        POSTS_REF.child(postId).removeValue()
////    }
//    
////    func sendLikeNotificationToServer() {
////        guard let currentUid = Auth.auth().currentUser?.uid else { return }
////        let creationDate = Int(NSDate().timeIntervalSince1970)
////
////        if currentUid != self.ownerUid {
////            let values = ["checked": 0,
////                          "creationDate": creationDate,
////                          "uid": currentUid,
////                          "type": LIKE_INT_VALUE,
////                          "postId": postId] as [String : Any]
////
////            let notificationRef = NOTIFICATIONS_REF.child(self.ownerUid).childByAutoId()
////            notificationRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
////                USER_LIKES_REF.child(currentUid).child(self.postId).setValue(notificationRef.key)
////            })
////        }
////    }
//}
