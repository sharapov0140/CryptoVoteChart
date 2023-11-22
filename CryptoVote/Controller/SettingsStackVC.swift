//
//  SignUpVC.swift
//  CryptoVote
//
//  Created by ZAF on 3/31/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import UIKit
import Firebase
import MessageUI


class SettingsStackVC: UIViewController, UINavigationControllerDelegate {

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



    lazy var reportCell: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Report", for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor(named: "colorLetter"), for: .normal)
 //       button.backgroundColor = UIColor(named: "colorThemeLowOpacity")
        button.layer.cornerRadius = 5
      //  button.isEnabled = false
        button.addTarget(self, action: #selector(handleReportTapped), for: .touchUpInside)
        return button
    }()
    
    

    lazy var termsOfUsage: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Terms of Usage", for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor(named: "colorLetter"), for: .normal)
  //      button.backgroundColor = UIColor(named: "colorThemeLowOpacity")
        button.layer.cornerRadius = 5
     //   button.isEnabled = false
        button.addTarget(self, action: #selector(handleTermsOfServiceTapped), for: .touchUpInside)
        return button
    }()

    lazy var privacyPolicy: UIButton = {
        let button = UIButton(type: .system)
        button.contentHorizontalAlignment = .left
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(UIColor(named: "colorLetter"), for: .normal)
  //      button.backgroundColor = UIColor(named: "colorThemeLowOpacity")
        button.layer.cornerRadius = 5
   //     button.isEnabled = false
        button.addTarget(self, action: #selector(handlePrivacyTapped), for: .touchUpInside)
        return button
    }()


    lazy var logInOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor(named: "colorLetter"), for: .normal)
      //  button.backgroundColor = UIColor(named: "colorThemeLowOpacity")
        button.layer.cornerRadius = 5
   //     button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogInOutTapped), for: .touchUpInside)
        return button
    }()

    
    
    
    
   
   @objc func handleReportTapped() {
    
        
       if MFMailComposeViewController.canSendMail() == false {
                
                self.settingAlarms()
                
            } else {
            self.showMailComposer()
        }
    }
    
    
    
    
    func settingAlarms() {
        
          //  guard let crypto = crypto else {return}
        
              let alert = UIAlertController(title: "Please set up your email in your app mail.", message: nil, preferredStyle: .alert)
          
              
              alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            }))
              self.present(alert, animated: true, completion: nil)
}
    
    
    
    func showMailComposer() {
            
         
            let composer = MFMailComposeViewController()
            composer.mailComposeDelegate = self
            composer.setToRecipients(["cryptovotereport@gmail.com"])
            
            composer.setSubject("Report")
            composer.setMessageBody("We won't be able to reply but we'll see your report", isHTML: false)
            
            present(composer, animated: true)
        }


   @objc func handleTermsOfServiceTapped() {
       
       let signUpVC = TermsOfService()
       navigationController?.pushViewController(signUpVC, animated: true)
   }
    
    
    
    @objc func handlePrivacyTapped() {
        
        let signUpVC = PrivacyPolicy()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    
    @objc func handleLogInOutTapped() {
        
        if Auth.auth().currentUser == nil {
            
            self.handleLogIn()
            
            
        } else {
            self.handleLogout()
        }
    }
    

    
        func handleLogIn() {
            
            
            
            let alertController = UIAlertController(title: nil, message: "Press Log In to vote.", preferredStyle: .actionSheet)

             

            let deleteAction = UIAlertAction(title: "Log In", style: .default, handler: { (alert: UIAlertAction!) -> Void in
                 
               do {
                    try Auth.auth().signOut()
                    let loginVC = LoginVC()
                    let navController = UINavigationController(rootViewController: loginVC)
                    self.present(navController, animated: true, completion: nil)
                } catch {
                   print("Failed to sign out")
               }
             })

             let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction!) -> Void in
               //  Do something here upon cancellation.
             })

            
             alertController.addAction(deleteAction)
             alertController.addAction(cancelAction)
             
             if let popoverController = alertController.popoverPresentationController {
               popoverController.sourceView = self.view
               popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
               popoverController.permittedArrowDirections = []
             }

             self.present(alertController, animated: true, completion: nil)


        
    }


    
    
    func handleLogout() {
         
         
         let alertController = UIAlertController(title: nil, message: "You won't be able to vote if you press Log Out.", preferredStyle: .actionSheet)

         

         let deleteAction = UIAlertAction(title: "Log Out", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
             
           do {
               try Auth.auth().signOut()
               let loginVC = LoginVC()
               let navController = UINavigationController(rootViewController: loginVC)
               self.present(navController, animated: true, completion: nil)
           } catch {
               print("Failed to sign out")
           }
         })

         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction!) -> Void in
           //  Do something here upon cancellation.
         })

        
         alertController.addAction(deleteAction)
         alertController.addAction(cancelAction)
         
         if let popoverController = alertController.popoverPresentationController {
           popoverController.sourceView = self.view
           popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
           popoverController.permittedArrowDirections = []
         }

         self.present(alertController, animated: true, completion: nil)
         
         
     }
    
    
    

    @objc func disableKeyboard() {
        self.scrollView.endEditing(true)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser == nil {
            
            logInOutButton.setTitle("Log In", for: .normal)
            
            
        } else {
            logInOutButton.setTitle("Log Out", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Settings"
              
        self.navigationController?.navigationBar.isTranslucent = true
        
        if Auth.auth().currentUser == nil {
            
            logInOutButton.setTitle("Log In", for: .normal)
            
            
        } else {
            logInOutButton.setTitle("Log Out", for: .normal)
        }
        
        
        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
            
            view.backgroundColor = UIColor(named: "backgroundColor")
            
            
          //  tableView.backgroundColor = UIColor(named: "backgroundColor")
        } else {
            view.backgroundColor = UIColor(named: "backgroundColor")
        
        }
        } else {
            view.backgroundColor = UIColor(named: "backgroundColor")
        }

        

        



        configureViewComponents()

        
    }


    
    
    

    



    func configureViewComponents() {
        
        
        
        
        self.view.addSubview(scrollView)


        scrollView.backgroundColor = .clear

        let tap = UITapGestureRecognizer(target: self, action: #selector(disableKeyboard))
        self.scrollView.addGestureRecognizer(tap)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 500))
        
        

        let stackView = UIStackView(arrangedSubviews: [reportCell, termsOfUsage, privacyPolicy, logInOutButton])

        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually

        
        scrollView.addSubview(stackView)
        
        
        
        
        stackView.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 15, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 150))
        //stackView.anchor(top: plusPhotoBtn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 240)
               
    }
}



extension SettingsStackVC: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        }
        
        controller.dismiss(animated: true)
    }
}
