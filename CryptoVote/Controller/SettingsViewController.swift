////
////  SettingsViewController.swift
////  CryptoVote
////
////  Created by ZAF on 9/13/19.
////  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
////
//
//import UIKit
//import Firebase
//import MessageUI
//
//private let reuseIdentifier = "SettingsCell"
//
//class SettingsViewController: UIViewController {
//    
//    // MARK: - Properties
//    
//    var tableView: UITableView!
//    
//    
//    // MARK: - Init
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//        if #available(iOS 13.0, *) {
//        if traitCollection.userInterfaceStyle == .dark {
//            view.backgroundColor = .clear
//            view.backgroundColor = UIColor(named: "backgroundColor")
//         //   tableView.backgroundColor = UIColor(named: "backgroundColor")
//        } else {
//            view.backgroundColor = .clear
//            view.backgroundColor = UIColor(named: "backgroundColor")
//        }
//        } else {
//            print("nochange")
//        }
//        
//        
//       
//        configureUI()
//        
//    }
//    
//    // MARK: - Helper Functions
//    
//    func configureTableView() {
//        tableView = UITableView()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.rowHeight = 60
//        
//        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
//        view.addSubview(tableView)
//        tableView.frame = view.frame
//        
//        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
//       
//        tableView.tableFooterView = UIView()
//    }
//    
//    func configureUI() {
//        configureTableView()
//        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.isTranslucent = true
//      //  navigationController?.navigationBar.barStyle = .black
//        navigationController?.navigationBar.barTintColor = UIColor(named: "backgroundColor")
//        navigationController?.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
//        
//        
//        navigationItem.title = "Settings"
//        
//    }
//    
//    
//    
//    
//    
//}
//
//extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return SettingsSection.allCases.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        self.tableView.backgroundColor = UIColor(named: "backgroundColor")
//
//        guard let section = SettingsSection(rawValue: section) else { return 0 }
//        
//        switch section {
//        case .Social: return SocialOptions.allCases.count
//      //  case .Communications: return CommunicationOptions.allCases.count
//        }
//    }
//    
////    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        let view = UIView()
//////        view.backgroundColor = UIColor(red: 0.2235, green: 0.5176, blue: 0.4588, alpha: 1.0)
////
////        print("Section is \(section)")
////
////        let title = UILabel()
////        title.font = UIFont.boldSystemFont(ofSize: 16)
////        title.textColor = .white
////        title.text = SettingsSection(rawValue: section)?.description
////        view.addSubview(title)
////        title.translatesAutoresizingMaskIntoConstraints = false
////        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
////        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
////
////        return view
////    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
//        
//        self.tableView.backgroundColor = UIColor(named: "backgroundColor")
//
//        
//        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
//        
//        switch section {
//        case .Social:
//            let social = SocialOptions(rawValue: indexPath.row)
//            cell.sectionType = social
////        case .Communications:
////            let communications = CommunicationOptions(rawValue: indexPath.row)
////            cell.sectionType = communications
//        }
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        guard let section = SettingsSection(rawValue: indexPath.section) else { return }
//        
//        
//        
////        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        self.tableView.deselectRow(at: indexPath, animated: true)
//        
//        self.tableView.backgroundColor = UIColor(named: "backgroundColor")
//            
//            
//            switch section {
//            case .Social:
//                
//                if SocialOptions(rawValue: indexPath.row)?.description == "Report" {
//                    if MFMailComposeViewController.canSendMail() == false {
//                        
//                        self.settingAlarms()
//                        
//                    } else {
//                    self.showMailComposer()
//                }}
//                
//                if SocialOptions(rawValue: indexPath.row)?.description == "Terms of Usage" {
//                    self.handleTermsOfServiceTapped()
//                }
//                
//                if SocialOptions(rawValue: indexPath.row)?.description == "Terms of Privacy"{
//                    
//                    self.handlePrivacyTapped()
//                }
//                if SocialOptions(rawValue: indexPath.row)?.description == "Log In" {
//                    self.handleLogIn()
//                }
//                if SocialOptions(rawValue: indexPath.row)?.description == "Log Out" {
//                    self.handleLogout()
//                }
//                
////            case .Communications:
////                print(CommunicationOptions(rawValue: indexPath.row)?.description)
//            }
//            
//            
//            
//            
////            DispatchQueue.main.async {
////                let loginVC = LoginVC()
////                let navController = UINavigationController(rootViewController: loginVC)
////                self.present(navController, animated: true, completion: nil)
////            }
////            return
//            
//            
//    }
//    
//    
//    
//    func settingAlarms() {
//        
//          //  guard let crypto = crypto else {return}
//        
//              let alert = UIAlertController(title: "Please set up your email in your app mail.", message: nil, preferredStyle: .alert)
//          
//              
//              alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
//
//                  
//                  
//                  
//                  
//              }))
//         
//              self.present(alert, animated: true, completion: nil)
//
//    }
//    
//    
//    func handleTermsOfServiceTapped() {
//           
//           let signUpVC = TermsOfService()
//           navigationController?.pushViewController(signUpVC, animated: true)
//       }
//       
//       
//       func handlePrivacyTapped() {
//           
//           let signUpVC = PrivacyPolicy()
//           navigationController?.pushViewController(signUpVC, animated: true)
//       }
//       
//    
//    
//    
//    
//    func showMailComposer() {
//        
//        
////        guard UIApplication.shared.isIdleTimerDisabled else {
////          print("time Idle is disabled")
////            return
////        }
//        
//        let composer = MFMailComposeViewController()
//        composer.mailComposeDelegate = self
//        composer.setToRecipients(["cryptovotereport@gmail.com"])
//        
//        composer.setSubject("Report")
//        composer.setMessageBody("We won't be able to reply but we'll see your report", isHTML: false)
//        
//        present(composer, animated: true)
//    }
//    
//    
//    
//    func showMailError() {
//        let alertController = UIAlertController(title: "Could not send report", message: "Your device was not able to send the report", preferredStyle: .actionSheet)
//        alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (_) in
//            
//           self.dismiss(animated: true, completion: nil)
//        }))
//        
//        
//    }
//    
//    
//    func handleLogout() {
//        
//        
//        let alertController = UIAlertController(title: nil, message: "Alert message.", preferredStyle: .actionSheet)
//
//        
//
//        let deleteAction = UIAlertAction(title: "Log Out", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
//            
//          do {
//              try Auth.auth().signOut()
//              let loginVC = LoginVC()
//              let navController = UINavigationController(rootViewController: loginVC)
//              self.present(navController, animated: true, completion: nil)
//          } catch {
//              print("Failed to sign out")
//          }
//        })
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction!) -> Void in
//          //  Do something here upon cancellation.
//        })
//
//       
//        alertController.addAction(deleteAction)
//        alertController.addAction(cancelAction)
//        
//        if let popoverController = alertController.popoverPresentationController {
//          popoverController.sourceView = self.view
//          popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
//          popoverController.permittedArrowDirections = []
//        }
//
//        self.present(alertController, animated: true, completion: nil)
//        
//        
//    }
//    
//    
////     func handleLogoutBroken() {
////        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
////        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
////
////            do {
////                try Auth.auth().signOut()
////                let loginVC = LoginVC()
////                let navController = UINavigationController(rootViewController: loginVC)
////                self.present(navController, animated: true, completion: nil)
////            } catch {
////                print("Failed to sign out")
////            }
////        }))
////
////        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
////
////
////
////
////        present(alertController, animated: true, completion: nil)
////    }
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
//    func handleLogIn() {
//        
//        
//        
//        let alertController = UIAlertController(title: nil, message: "Alert message.", preferredStyle: .actionSheet)
//
//         
//
//        let deleteAction = UIAlertAction(title: "Log In", style: .default, handler: { (alert: UIAlertAction!) -> Void in
//             
//           do {
//                try Auth.auth().signOut()
//                let loginVC = LoginVC()
//                let navController = UINavigationController(rootViewController: loginVC)
//                self.present(navController, animated: true, completion: nil)
//            } catch {
//               print("Failed to sign out")
//           }
//         })
//
//         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction!) -> Void in
//           //  Do something here upon cancellation.
//         })
//
//        
//         alertController.addAction(deleteAction)
//         alertController.addAction(cancelAction)
//         
//         if let popoverController = alertController.popoverPresentationController {
//           popoverController.sourceView = self.view
//           popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
//           popoverController.permittedArrowDirections = []
//         }
//
//         self.present(alertController, animated: true, completion: nil)
//
//
//    
//}
//
//
//
//extension SettingsViewController: MFMailComposeViewControllerDelegate {
//    
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        
//        if let _ = error {
//            //Show error alert
//            controller.dismiss(animated: true)
//            return
//        }
//        
//        switch result {
//        case .cancelled:
//            print("Cancelled")
//        case .failed:
//            print("Failed to send")
//        case .saved:
//            print("Saved")
//        case .sent:
//            print("Email Sent")
//        }
//        
//        controller.dismiss(animated: true)
//    }
//}
