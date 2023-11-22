//
//  RealmModel.swift
//  CryptoVote
//
//  Created by ZAF on 7/16/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var symbol = ""
    @objc dynamic var price = 0.0
    @objc dynamic var amount = 0.0
    @objc dynamic var atPrice = 0.0
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
}
