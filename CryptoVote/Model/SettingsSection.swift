//
//  SettingsSection.swift
//  CryptoVote
//
//  Created by ZAF on 9/13/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import Firebase

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case Social
  //  case Communications
    
    var description: String {
        switch self {
        case .Social: return "Settings"
//        case .Communications: return "Communications"
        }
    }
}

enum SocialOptions: Int, CaseIterable, SectionType {
    
    
    case report
    case termsOfUsage
    case termsOfPrivacy
    case logout

    
    var containsSwitch: Bool { return false }
    
    
    var description: String {
        
        if Auth.auth().currentUser == nil {
        
        switch self {
            
            
        case .report: return "Report"
        case .termsOfUsage: return "Terms of Usage"
        case .termsOfPrivacy: return "Terms of Privacy"
        case .logout: return "Log In"
        }
        } else {
            
            
            switch self {
                
                
            case .report: return "Report"
            case .termsOfUsage: return "Terms of Usage"
            case .termsOfPrivacy: return "Terms of Privacy"
            case .logout: return "Log Out"
            }
            
        }
        
    }
}

//enum CommunicationOptions: Int, CaseIterable, SectionType {
//    case notifications
//    case email
//    case reportCrashes
//
//    var containsSwitch: Bool {
//        switch self {
//        case .notifications: return true
//        case .email: return true
//        case .reportCrashes: return true
//        }
//    }
//
//    var description: String {
//        switch self {
//        case .notifications: return "Notifications"
//        case .email: return "Email"
//        case .reportCrashes: return "Report Crashes"
//        }
//    }
//}
