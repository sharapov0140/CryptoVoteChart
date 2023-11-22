//
//  SignUpVC.swift
//  CryptoVote
//
//  Created by ZAF on 3/31/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController, UINavigationControllerDelegate {

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



    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()

    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()

    lazy var fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()

    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()

    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "colorThemeLowOpacity")
        button.layer.cornerRadius = 5
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()

    
    
    
    
    lazy var termsAndPrivacyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "By using this app you agree with our "
        return label
    }()
    
    
    
    
    lazy var termsOfServiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleTermsOfServiceTapped) , for: .touchUpInside)
        return button
    }()
    
    
    
    
//    lazy var termsAndPrivacyAndLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .lightGray
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.textAlignment = .center
//        label.text = " and "
//        return label
//    }()
    
    
    lazy var termsAndPrivacyAndLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(" and ", for: .normal)
        button.isEnabled = false
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.addTarget(self, action: #selector(handlePrivacyTapped) , for: .touchUpInside)
        return button
    }()
    
    
    lazy var privacyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Privacy Policy", for: .normal)
       // button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePrivacyTapped) , for: .touchUpInside)
        return button
    }()
    
    
    
//    let termsOfSerButton: UIButton = {
//        let button = UIButton(type: .system)
//
//        let attributedTitle = NSMutableAttributedString(string: "By using this app you agree with our ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
//        attributedTitle.append(NSAttributedString(string: "Terms of Service", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
//        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
//        button.setAttributedTitle(attributedTitle, for: .normal)
//
//        return button
//    }()
//
//
//
//
//    let privacyPolicyButton: UIButton = {
//        let button = UIButton(type: .system)
//
//        let attributedTitle = NSMutableAttributedString(string: "and ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
//        attributedTitle.append(NSAttributedString(string: "Privacy Policy", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
//        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
//        button.setAttributedTitle(attributedTitle, for: .normal)
//
//        return button
//    }()
//
    
    
    lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)

        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 0.223, green: 0.518, blue: 0.459, alpha: 1)]))
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)

        return button
    }()
    
    
    
    
    lazy var signUpLaterButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up later", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 0.223, green: 0.518, blue: 0.459, alpha: 1)]))
        button.addTarget(self, action: #selector(handleSignUpLater), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    

    
    @objc func handleSignUpLater() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func handleTermsOfServiceTapped() {
        
        let signUpVC = TermsOfService()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    @objc func handlePrivacyTapped() {
        
        let signUpVC = PrivacyPolicy()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    

    @objc func disableKeyboard() {
        self.scrollView.endEditing(true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
            
            view.backgroundColor = UIColor(named: "backgroundColor")
            termsOfServiceButton.setTitleColor(.gray, for: .normal)
            privacyButton.setTitleColor(.gray, for: .normal)
            
          //  tableView.backgroundColor = UIColor(named: "backgroundColor")
        } else {
            view.backgroundColor = UIColor(named: "backgroundColor")
            termsOfServiceButton.setTitleColor(.black, for: .normal)
            privacyButton.setTitleColor(.black, for: .normal)
        }
        } else {
            view.backgroundColor = UIColor(named: "backgroundColor")
        }

        

        



        configureViewComponents()

        
    }


    // MARK: - Handlers

    
    
    func sendEmailVerification(_ callback: ((Error?) -> ())? = nil){
        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
            callback?(error)
        })
    }
    
    func reloadUser(_ callback: ((Error?) -> ())? = nil){
        Auth.auth().currentUser?.reload(completion: { (error) in
            callback?(error)
            
        })
    }



    @objc func handleShowLogin() {
        let signUpVC = LoginVC()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    
    func signUpAlert() {
        
        //  guard let crypto = crypto else {return}
        
        if let email = emailTextField.text {
            
            
            let alert = UIAlertController(title: "We have sent you a confirmation link to your email \(email), Please click the link to confirm your email.", message: nil, preferredStyle: .alert)
            
            
            
            alert.addAction(UIAlertAction(title: "Return to sign up", style: .default, handler: { (action) in
                
                
                
                
            }))
            
            alert.addAction(UIAlertAction(title: "Confirmed", style: .default, handler: { (action) in
                
                self.reloadUser()
                
                if Auth.auth().currentUser?.isEmailVerified == true {
                    print("Congrats, you successfully signed up.")
                    self.handleSignUp()
                    self.dismiss(animated: true, completion: nil)
                    
                } else  {
                    self.checkYourEmailAgain()
                }
                
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            self.provideEmail()
        }
    }
    
    
    
    
    func checkYourEmailAgain() {
        
        let alert = UIAlertController(title: "Please click the link we sent to your email to confirm your address. If your internet is slow, it might take a longer time to receive the link.", message: nil, preferredStyle: .alert)
        
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            
            self.signUpAlert()
            
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

    
    
    
    func provideEmail() {
        let alert = UIAlertController(title: "Please provide the email", message: nil, preferredStyle: .alert)
        
        
        
        
        
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            
            self.signUpAlert()
            
        }))
        self.present(alert, animated: true, completion: nil)
    }

    
    
    
    

    @objc func handleSignUp() {

        // properties
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let username = usernameTextField.text?.lowercased() else { return }

        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in

            // handle error
            if let error = error {
                
                print("DEBUG: Failed to create user with error: ", error.localizedDescription)
                
                
                let alert = UIAlertController(title: "\(error.localizedDescription), You can restore password in Login page", message: nil, preferredStyle: .alert)
                
                
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    
                    //    self.signUpAlert()
                    
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
                
                
                return
            }

            self.sendEmailVerification()
            self.signUpAlert()
           
            
            Auth.auth().fetchSignInMethods(forEmail: email, completion: {
                (providers, error) in

                if let error = error {
                    print(error.localizedDescription)
                } else if let providers = providers {
                    print(providers)
                }
        
//            Auth.auth().fetchProviders(forEmail: email, completion: {
//                (providers, error) in
//
//                if let error = error {
//                    print(error.localizedDescription)
//                } else if let providers = providers {
//                    print(providers)
//                }
//


                    // user id
                    guard let uid = authResult?.user.uid else { return }
                    guard let fcmToken = Messaging.messaging().fcmToken else { return }

                    let dictionaryValues = ["name": fullName,
                                            "fcmToken": fcmToken,
                                            "username": username]

                    let values = [uid: dictionaryValues]

                    // save user info to database
                    Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (error, ref) in

                        guard let mainTabVC = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }

                        // configure view controllers in maintabvc
                        mainTabVC.setupTabBar()
               //         mainTabVC.isInitialLoad = true

                        // dismiss login controller
              //          self.dismiss(animated: true, completion: nil)
                    })
                })
            
        }
    }

    @objc func formValidation() {

        guard
            emailTextField.hasText,
            passwordTextField.hasText,
            fullNameTextField.hasText,
            usernameTextField.hasText else {
                signUpButton.isEnabled = false
                signUpButton.backgroundColor = UIColor(named: "colorThemeLowOpacity")
                return
        }

        signUpButton.isEnabled = true
        signUpButton.backgroundColor = UIColor(named: "colorTheme")
            
    }

    func configureViewComponents() {
        
        
        
        
        self.view.addSubview(scrollView)


        scrollView.backgroundColor = .clear

        let tap = UITapGestureRecognizer(target: self, action: #selector(disableKeyboard))
        self.scrollView.addGestureRecognizer(tap)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 500))
        
        

        let stackView = UIStackView(arrangedSubviews: [emailTextField, fullNameTextField, usernameTextField, passwordTextField, signUpButton])

        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        
        scrollView.addSubview(stackView)
        
        
        
        
        stackView.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 240))
        //stackView.anchor(top: plusPhotoBtn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 240)
        
        
        scrollView.addSubview(alreadyHaveAccountButton)
        scrollView.addSubview(termsAndPrivacyLabel)
        
        
        termsAndPrivacyLabel.anchor(top: signUpButton.bottomAnchor, leading: scrollView.leadingAnchor, bottom: nil, trailing: scrollView.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
       termsAndPrivacyLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//     termsAndPrivacyLabel.center.x = self.scrollView.center.x
        

        
        
        let stackHorView = UIStackView(arrangedSubviews: [termsOfServiceButton, termsAndPrivacyAndLabel, privacyButton])
        stackHorView.axis = .horizontal
        stackHorView.spacing = 2
      //  stackHorView.distribution = .fillEqually
        scrollView.addSubview(stackHorView)
        stackHorView.anchor(top: termsAndPrivacyLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        stackHorView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        
        
        
        alreadyHaveAccountButton.anchor(top: stackHorView.bottomAnchor, leading: scrollView.leadingAnchor, bottom: nil, trailing: scrollView.trailingAnchor, padding: .init(top: 40, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))

//
        scrollView.addSubview(signUpLaterButton)
        signUpLaterButton.anchor(top: alreadyHaveAccountButton.bottomAnchor, leading: scrollView.leadingAnchor, bottom: nil, trailing: scrollView.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        
        
    }
}



