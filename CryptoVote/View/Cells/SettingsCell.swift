//
//  SettingsCell.swift
//  CryptoVote
//
//  Created by ZAF on 9/13/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit

class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else { return }
            textLabel?.text = sectionType.description
            switchControl.isHidden = !sectionType.containsSwitch
        }
    }
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.onTintColor = UIColor(red: 0.2235, green: 0.5176, blue: 0.4588, alpha: 1.0)
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return  switchControl
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        if #available(iOS 13.0, *) {
           if traitCollection.userInterfaceStyle == .dark {
               self.backgroundColor = .clear
               self.backgroundColor = UIColor(named: "backgroundColor")
             //  tableView.backgroundColor = UIColor(named: "backgroundColor")
           } else {
        self.backgroundColor = .clear
        self.backgroundColor = UIColor(named: "backgroundColor")
               
           }
           } else {
               self.backgroundColor = UIColor(named: "backgroundColor")
           }
        
        
        addSubview(switchControl)
        switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleSwitchAction(sender: UISwitch) {
        if sender.isOn {
            print("Turned on")
        } else {
            print("Turned off")
        }
    }
    
}
