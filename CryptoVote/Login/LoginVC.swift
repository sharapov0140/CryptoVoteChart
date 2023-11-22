//
//  LoginVC.swift
//  CryptoVote
//
//  Created by ZAF on 3/31/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import UIKit
import Firebase
import RecaptchaEnterprise



class LoginVC: UIViewController {
    
    // MARK: - Properties
    
    lazy var logoContainerView: UIView = {
        let view = UIView()
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "CryptoVoteIcon"))
        logoImageView.contentMode = .scaleAspectFill
        
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        logoImageView.layer.cornerRadius = 100 / 2
//        logoImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.backgroundColor = UIColor(red: 0.223, green: 0.518, blue: 0.459, alpha: 1)
        return view
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
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "colorThemeLowOpacity")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.isEnabled = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 0.223, green: 0.518, blue: 0.459, alpha: 1)]))
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    
    lazy var resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        //        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        //        button.layer.cornerRadius = 5
        button.isEnabled = true
        button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        return button
    }()
    
    
    
    
    lazy var signUpLaterButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Log In later", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor:  UIColor(red: 0.223, green: 0.518, blue: 0.459, alpha: 1)]))
        button.addTarget(self, action: #selector(handleSignUpLater), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    
    
    @objc func handleSignUpLater() {
    
    self.dismiss(animated: true, completion: nil)
    
    }
    
    
    
    @objc func handleResetPassword() {
        
        
        let alert = UIAlertController(title: "Put your email", message: "Type your email and we will send you a link to your email to reset your password", preferredStyle: .alert)
        
        
        alert.addTextField { (textField) in
            textField.placeholder = "example@mail.com"
        }
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0]
            
            guard let email = textField.text else {return}
            self.sendPasswordReset(withEmail: email)
            //   print("Text field: \(String(describing: textField.text))")
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        forgotPasswordAlarm()
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    
    
    
    func forgotPasswordAlarm() {
        
          //  guard let crypto = crypto else {return}
        
              let alert = UIAlertController(title: "Check your email.It might take some time for you to receive the link.", message: nil, preferredStyle: .alert)
          
              
              alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in

                  
                  
                  
                  
              }))
         
              self.present(alert, animated: true, completion: nil)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background color
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
        
        
        
        // hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoContainerView)
        
        logoContainerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 150))
        //logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
        
        configureViewComponents()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(disableKeyboard))
        self.view.addGestureRecognizer(tap)
        
        
    }
    
    @objc func disableKeyboard() {
        self.view.endEditing(true)

    }
    
    
    // MARK: - Handlers
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func handleShowSignUp() {
        let signUpVC = SignUpVC()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    
    
    var failedLoginAttempts = 0

       // Other properties and methods

    @IBAction func handleLogin() {
        // Safely unwrap the email and password text fields
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }

        // Attempt to sign in the user with the provided credentials
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error as NSError? {
                // Uncomment this print statement for debugging purposes
                // print("Unable to sign user in with error: \(error.localizedDescription)")
                
                if error.code == AuthErrorCode.wrongPassword.rawValue {
                    // Increment the failed login attempts counter
                    self.failedLoginAttempts += 1
                    
                    if self.failedLoginAttempts >= 10 {
                        // If 10 or more failed attempts, lock the account and suggest password reset
                        let alert = UIAlertController(title: "Account Locked", message: "You've entered the wrong password too many times. Please reset your password to continue.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { _ in
                            self.handleResetPassword()
                        }))
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        // If fewer than 10 attempts, inform the user of remaining attempts
                        let remainingAttempts = 5 - self.failedLoginAttempts
                        let alert = UIAlertController(title: "Incorrect Password", message: "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else if error.code == AuthErrorCode.userNotFound.rawValue {
                    // If the user is not found, inform the user that the username or password is incorrect
                    let alert = UIAlertController(title: "Sign In Failed", message: "Username or password is not correct. Please try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    // Handle other types of errors
                    let alert = UIAlertController(title: "Sign In Failed", message: "Incorrect password or email. Would you like to restore your password?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { _ in
                        self.handleResetPassword()
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                // If sign in is successful, reset the failed login attempts and proceed to the main tab
                self.failedLoginAttempts = 0
                guard let mainTabVC = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
                mainTabVC.setupTabBar()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
//    @objc func handleLogin() {
//        
//        // properties
//        guard
//            let email = emailTextField.text,
//            let password = passwordTextField.text else { return }
//        
//        // sign user in with email and password
//        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//            
//            // handle error
//            if let error = error {
//                print("Unable to sign user in with error", error.localizedDescription)
//                return
//            }
//            
//            guard let mainTabVC = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
//            
//            mainTabVC.setupTabBar()
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
    
    
    
    @objc func formValidation() {
        
        // ensures that email and password text fields have text
        guard
            emailTextField.hasText,
            passwordTextField.hasText else {
                
                // handle case for above conditions not met
                loginButton.isEnabled = false
                loginButton.backgroundColor = UIColor(named: "colorThemeLowOpacity")
                
                return
        }
        
        // handle case for conditions were met
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor(named: "colorTheme")
            
    }
    
    func configureViewComponents() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.anchor(top: logoContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 140))

        
        view.addSubview(resetPasswordButton)

        resetPasswordButton.anchor(top: stackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))
       
        
        view.addSubview(dontHaveAccountButton)
        
        dontHaveAccountButton.anchor(top: resetPasswordButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 15, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))
        
        
        view.addSubview(signUpLaterButton)
        
        
        signUpLaterButton.anchor(top: dontHaveAccountButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 15, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))
        

   
        
    }
}

