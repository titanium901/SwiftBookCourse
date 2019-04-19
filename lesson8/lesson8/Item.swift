//
//  Item.swift
//  lesson8
//
//  Created by Yury Popov on 18/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture = "todo"
    @objc dynamic var date = Date()
    
}
