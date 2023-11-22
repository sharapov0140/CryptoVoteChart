//
//  TermsOfService.swift
//  CryptoVote
//
//  Created by ZAF on 9/26/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit

class TermsOfService: UIViewController {
    
    
    // MARK: - Init
    
  
    
    
    lazy var termsOfServiceTextField: UITextView = {
        let tf = UITextView()
        
        tf.isEditable = false
    
     //   tf.editingInteractionConfiguration = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        //   tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        //  tf.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        return tf
    }()
    
    
    
    
    
    
    func htmlFunc() {
        
        
        let html = """
<html>
<h1>Terms of Use</h1>




<p>These Terms of Use ("Terms", "Terms of Use") govern your relationship with CryptoVote mobile application (the "Service") operated by CryptoVote ("us", "we", or "our").</p>

<p>Please read these Terms of Use carefully before using our CryptoVote mobile application (the "Service").</p>

<p>Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.</p>

<p>By accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.</p>








<h2>Accounts</h2>

<p>When you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.</p>

<p>You are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.</p>

<p>You agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>

<p>You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trade mark that is subject to any rights of another person or entity other than you without appropriate authorization, or a name that is otherwise offensive, vulgar or obscene.</p>






<h2>Links To Other Web Sites</h2>

<p>Our Service may contain links to third-party web sites or services that are not owned or controlled by CryptoVote.</p>

<p>CryptoVote has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that CryptoVote shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>

<p>We strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.</p>


<h2>Termination</h2>

<p>We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>

<p>Upon termination, your right to use the Service will immediately cease. If you wish to terminate your account, you may simply discontinue using the Service.</p>




<h2>Governing Law</h2>

<p>These Terms shall be governed and construed in accordance with the laws of United Arab Emirates, without regard to its conflict of law provisions.</p>

<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.</p>


<h2>Changes</h2>

<p>We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.</p>

<p>By continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.</p>


<h2>Contact Us</h2>

<p>If you have any questions about these Terms, please contact us.</p>

<ul>
<li>By email: cryptovotereport@gmail.com</li>
  
</ul>

</html>
"""
        
        let data = Data(html.utf8)
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            termsOfServiceTextField.attributedText = attributedString
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        htmlFunc()
        configureUI()
        
    }
    
    
    
    func configureUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //    navigationController?.navigationBar.barStyle = .black
        //  navigationController?.navigationBar.barTintColor = UIColor(red: 0.2235, green: 0.5176, blue: 0.4588, alpha: 1.0)
        navigationItem.title = "Terms Of Service"
        
        
        

        
        
        view.addSubview(termsOfServiceTextField)
        
        
        termsOfServiceTextField.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height:0))
        
        
    }
}


