////
////  CryptoSettingVC.swift
////  CryptoVote
////
////  Created by ZAF on 4/19/19.
////  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Firebase
//
//
//class CryptoSettingVC: UIViewController {
//    
//    
//    override func viewDidLoad() {
//        configureNavigationBar()
//        view.backgroundColor = .white
//    }
//    
//    
//    func configureNavigationBar() {
//        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
//        //     self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "send2"), style: .plain, target: self, action: #selector(handleShowMessages))
//        
//        
//        self.navigationItem.title = "Feed"
//    }
//    
//    @objc func handleLogout() {
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
//            
//            do {
//                try Auth.auth().signOut()
//                let loginVC = LoginVC()
//                let navController = UINavigationController(rootViewController: loginVC)
//                self.present(navController, animated: true, completion: nil)
//            } catch {
//                print("Failed to sign out")
//            }
//        }))
//        
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        present(alertController, animated: true, completion: nil)
//    }
//}
